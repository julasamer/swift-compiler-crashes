#!/bin/bash
# Style guide: https://google-styleguide.googlecode.com/svn/trunk/shell.xml
# Shell lint: http://www.shellcheck.net/

swiftc_version=$(xcrun swiftc -version | cut -f2 -d"(" | cut -f1 -d")" | head -1)
xcode_path=$(xcode-select -p)
echo
echo "Running tests against: ${swiftc_version}"
echo "Using Xcode found at path: ${xcode_path}"
echo "Usage: $0 [-v] [-c<columns>] [file ...]"
echo

columns=$(tput cols)
verbose=0
while getopts ":c:v" o; do
  case "${o}" in
    c)
      columns=${OPTARG}
      ;;
    v)
      verbose=1
      ;;
  esac
done

shift $((OPTIND - 1))

color_red="\e[31m"
color_green="\e[32m"
color_bold="\e[1m"
color_normal_display="\e[0m"

argument_files=$*
name_size=$((columns - 27))
crash_error_message="error: unable to execute command: Segmentation fault:|LLVM ERROR:"
num_tests=0
num_crashed=0
seen_checksums=""

test_file() {
  path="$1"
  if [[ ! -f "${path}" ]]; then
    return
  fi
  files_to_compile="${path}"
  if [[ ${path} =~ part1.swift ]]; then
    files_to_compile=${path//.part1.swift/.part[1-9].swift}
  elif [[ ${path} =~ (part|library)[2-9].swift ]]; then
    return
  fi
  num_tests=$((num_tests + 1))
  test_name=$(basename -s ".swift" "${path}")
  test_name=${test_name//-/ }
  test_name=${test_name//.part1/}
  test_name=${test_name//.library1/}
  test_name=${test_name//.script/}
  # Tip: Want to see details of the type checker's reasoning? Compile with "xcrun swiftc -Xfrontend -debug-constraints"
  # NOTE: Compile under the three modes -Onone, -O and -Ounchecked until we hit a crash.
  output=$(xcrun swiftc -Onone -o /dev/null ${files_to_compile} 2>&1)
  compilation_comment=""
  if ! egrep -q "${crash_error_message}" <<< "${output}"; then
    output=$(xcrun swiftc -O -o /dev/null ${files_to_compile} 2>&1)
    compilation_comment="-O"
  fi
  if ! egrep -q "${crash_error_message}" <<< "${output}"; then
    if [[ ${files_to_compile} =~ \.library1\. ]] && [[ -f "${files_to_compile//.library1./.library2.}" ]]; then
      source_file_using_library=${files_to_compile//.library1./.library2.}
      compilation_comment=""
      rm -f DummyModule.swiftdoc DummyModule.swiftmodule libDummyModule.dylib
      output=$(xcrun -sdk macosx swiftc -emit-library -o libDummyModule.dylib -Xlinker -install_name -Xlinker @rpath/libDummyModule.dylib -emit-module -emit-module-path DummyModule.swiftmodule -module-name DummyModule -module-link-name DummyModule "${files_to_compile}" 2>&1)
      if [[ $? == 0 ]]; then
        crash_error_message="${crash_error_message}|error: linker command failed with exit code 1"
        output=$(xcrun -sdk macosx swiftc "${source_file_using_library}" -o /dev/null -I . -L . -Xlinker -rpath -Xlinker @executable_path/ 2>&1)
        compilation_comment="lib"
      fi
      rm -f DummyModule.swiftdoc DummyModule.swiftmodule libDummyModule.dylib
    elif [[ ${files_to_compile} =~ \.script\. ]]; then
      output_1=$(xcrun swift ${files_to_compile} 2>&1)
      err_1=$?
      output_2=$(xcrun swift -O ${files_to_compile} 2>&1)
      err_2=$?
      output="${output_1}${output_2}"
      if [[ ${err_1} != ${err_2} ]]; then
        crash_error_message="${crash_error_message}|Stack dump:"
        compilation_comment="script"
      fi
    fi
  fi
  normalized_stacktrace=$(egrep "0x[0-9a-f]" <<< "${output}" | sed 's/0x[0-9a-f]*//g' | sed 's/\+ [0-9]*$//g' | awk '{ print $3 }' | cut -f1 -d"(" | cut -f1 -d"<" | uniq)
  checksum=$(shasum <<< "${normalized_stacktrace}" | head -c10)
  is_dupe=0
  if [[ "${normalized_stacktrace}" == "" ]]; then
    checksum="        "
  else
    if egrep -q "${checksum}" <<< "${seen_checksums}"; then
      is_dupe=1
    fi
    seen_checksums="${seen_checksums}:${checksum}"
  fi
  if egrep -q "${crash_error_message}" <<< "${output}"; then
    if [[ "${compilation_comment}" != "" ]]; then
      test_name="${test_name} (${compilation_comment})"
    fi
    num_crashed=$((num_crashed + 1))
    dupe_text="      "
    if [[ ${is_dupe} == 1 ]]; then
      dupe_text="*DUPE*"
    fi
    printf "  %b  %-${name_size}.${name_size}b %-6.6b (%-10.10b)\n" "${color_red}✘${color_normal_display}" "${test_name}" "${dupe_text}" "${checksum}"
  else
    printf "  %b  %-${name_size}.${name_size}b\n" "${color_green}✓${color_normal_display}" "${test_name}"
  fi
  if [[ ${verbose} == 1 ]]; then
    echo
    echo "Compilation output:"
    echo "${output}"
    echo
  fi
}

run_tests_in_directory() {
  header="$1"
  path="$2"
  printf "%b" "== ${color_bold}${header}${color_normal_display} ==\n"
  echo
  found_tests=0
  for test_path in "${path}"/*.swift; do
    if [[ -f "${test_path}" ]]; then
      found_tests=1
      test_file "${test_path}"
    fi
  done
  if [[ ${found_tests} == 0 ]]; then
      printf "  %b  %-${name_size}.${name_size}b\n" "${color_green}✓${color_normal_display}" "No tests found."
  fi
  echo
}

main() {
  if [[ "${argument_files}" == "" ]]; then
    run_tests_in_directory "Currently known crashes" "./crashes"
    run_tests_in_directory "Crashes marked as fixed in previous releases" "./fixed"
  else
    for test_path in ${argument_files}; do
      if [[ -f "${test_path}" ]]; then
        found_tests=1
        test_file "${test_path}"
      fi
    done
    echo
  fi
  echo "** Results: ${num_crashed} of ${num_tests} tests crashed the compiler **"
  echo
}

main
