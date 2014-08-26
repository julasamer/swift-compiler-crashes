#!/bin/bash
# Style guide: https://google-styleguide.googlecode.com/svn/trunk/shell.xml
# Shell lint: http://www.shellcheck.net/

crash_error_message="error: unable to execute command: Segmentation fault:"

swiftc_version=$(xcrun swiftc -version | cut -f2 -d"(" | cut -f1 -d")" | head -1)
xcode_path=$(xcode-select -p)
echo
echo "Running tests against: ${swiftc_version}"
echo "Using Xcode found at path: ${xcode_path}"
echo

columns=$(tput cols)
if [[ $(cut -f1 -d= <<< "$1") == "--columns" ]]; then
  columns=$(cut -f2 -d= <<< "$1")
fi
name_size=$((columns-27))

color_red="\e[31m"
color_green="\e[32m"
color_bold="\e[1m"
color_stop="\e[00m"

num_tests=0
num_crashed=0
seen_checksums=""
do_test() {
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
  # Tip: Want to see details of the type checker's reasoning? Compile with "xcrun swiftc -Xfrontend -debug-constraints"
  # NOTE: Compile under the three modes -Onone, -O and -Ounchecked until we hit a crash.
  output=$(xcrun swiftc -Onone -o /dev/null ${files_to_compile} 2>&1)
  compilation_comment=""
  if ! egrep -q "${crash_error_message}" <<< "${output}"; then
    output=$(xcrun swiftc -O -o /dev/null ${files_to_compile} 2>&1)
    compilation_comment="-O"
    if ! egrep -q "${crash_error_message}" <<< "${output}"; then
      output=$(xcrun swiftc -Ounchecked -o /dev/null ${files_to_compile} 2>&1)
      compilation_comment="-Ounchecked"
      if ! egrep -q "${crash_error_message}" <<< "${output}" && [[ ${files_to_compile} =~ ".library1" ]] && [[ -f "${files_to_compile//.library1/.library2}" ]]; then
          source_file_using_library=${files_to_compile//.library1/.library2}
          compilation_comment=""
          rm -f DummyModule.swiftdoc DummyModule.swiftmodule libDummyModule.dylib
          output=$(xcrun -sdk macosx swiftc -emit-library -o libDummyModule.dylib -Xlinker -install_name -Xlinker @rpath/libDummyModule.dylib -emit-module -emit-module-path DummyModule.swiftmodule -module-name DummyModule -module-link-name DummyModule "${files_to_compile}" 2>&1)
          if [[ $? == 0 ]]; then
              crash_error_message="(${crash_error_message}|error: linker command failed with exit code 1)"
              output=$(xcrun -sdk macosx swiftc "${source_file_using_library}" -o /dev/null -I . -L . -Xlinker -rpath -Xlinker @executable_path/ 2>&1)
              compilation_comment="lib"
          fi
          rm -f DummyModule.swiftdoc DummyModule.swiftmodule libDummyModule.dylib
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
    printf "  %b  %-${name_size}.${name_size}b %-6.6b (%-10.10b)\n" "${color_red}✘${color_stop}" "${test_name}" "${dupe_text}" "${checksum}"
  else
    printf "  %b  %-${name_size}.${name_size}b\n" "${color_green}✓${color_stop}" "${test_name}"
  fi
}

run_tests() {
  header="$1"
  path="$2"
  printf "== ${color_bold}${header}${color_stop} ==\n"
  echo
  found_tests=0
  for test_path in "${path}"/*.swift; do
    if [[ -f "${test_path}" ]]; then
      found_tests=1
      do_test "${test_path}"
    fi
  done
  if [[ ${found_tests} == 0 ]]; then
      printf "  %b  %-${name_size}.${name_size}b\n" "${color_green}✓${color_stop}" "No tests found."
  fi
  echo
}

run_tests "Currently known crashes" "./crashes"
run_tests "Crashes marked as fixed in previous releases" "./fixed"

echo "** Results: ${num_crashed} of ${num_tests} tests crashed the compiler **"
echo
