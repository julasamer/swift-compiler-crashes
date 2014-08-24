#!/bin/bash

swiftc_version=$(xcrun swiftc -version | cut -f2 -d"(" | cut -f1 -d")" | head -1)
xcode_path=$(xcode-select -p)
echo
echo "Running tests against: ${swiftc_version}"
echo "Using Xcode found at path: ${xcode_path}"

columns=$(tput cols)
if [ "$(cut -f1 -d= <<< $1)" == "--columns" ]; then
    columns="$(cut -f2 -d= <<< $1)"
fi
name_size=$((columns-27))

num_tests=0
num_crashed=0
seen_checksums=""
do_test() {
  path="$1"
  if [ -f "${path}" ]; then
    num_tests=$((num_tests + 1))
    test_name=$(basename -s ".swift" "${path}")
    test_name=${test_name//-/ }
    # Tip: Want to see details of the type checker's reasoning? Compile with "xcrun swiftc -Xfrontend -debug-constraints"
    output=$(xcrun swiftc -o /dev/null "${path}" 2>&1)
    normalized_stacktrace=$(egrep "0x[0-9a-f]" <<< "${output}" | sed 's/0x[0-9a-f]*//g' | sed 's/\+ [0-9]*$//g' | awk '{ print $3 }' | cut -f1 -d"(" | cut -f1 -d"<" | uniq)
    checksum=$(md5 <<< "${normalized_stacktrace}")
    is_dupe=0
    if [ "${normalized_stacktrace}" == "" ]; then
        checksum="        "
    else
        if egrep -q "${checksum}" <<< "${seen_checksums}"; then
            is_dupe=1
        fi
        seen_checksums="${seen_checksums}:${checksum}"
    fi
    color_red="\e[01;31m"
    color_green="\e[32m"
    color_stop="\e[00m"
    format_fail="  %b  %-${name_size}.${name_size}b %-6.6b (%-10.10b)\n"
    format_pass="  %b  %-${name_size}.${name_size}b\n"
    if egrep -q "error: unable to execute command: Segmentation fault:" <<< "${output}"; then
      num_crashed=$((num_crashed + 1))
      dupe_text="      "
      if [ $is_dupe == 1 ]; then
          dupe_text="*DUPE*"
      fi
      printf "${format_fail}" "${color_red}✘${color_stop}" "${test_name}" "${dupe_text}" "${checksum}"
    else
      printf "${format_pass}" "${color_green}✓${color_stop}" "${test_name}" 
    fi
  fi
}

run_tests() {
  header="$1"
  path="$2"
  echo
  echo "== ${header} =="
  echo
  for test_path in "${path}"/*.swift
  do
    do_test "${test_path}"
  done
}

run_tests "Currently known crashes" "./crashes"
run_tests "Crashes marked as fixed in previous releases" "./fixed"

echo "** Results: ${num_crashed} of ${num_tests} tests crashed the compiler. **"
echo
