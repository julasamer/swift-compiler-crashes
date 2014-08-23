#!/bin/bash

xcode_path=$(xcode-select -p)
swiftc_version=$(xcrun swiftc -version | cut -f2 -d"(" | cut -f1 -d")" | head -1)

echo
echo "Running tests against: $swiftc_version"
echo "Using Xcode found at path: $xcode_path"

num_crashed=0
num_tests=0

color_red="\e[01;31m"
color_green="\e[32m"
color_stop="\e[00m"

columns=$(tput cols)

#
# Test results should be logged as this (+---...---+ is the width of terminal):
# +------------------------------------------------------------+
#   ✘  <test name>                                (88591ef1ad)
#

name_size=$((columns-20))
format_fail="  %b  %-$name_size.${name_size}b (%10.10b)\n"
format_pass="  %b  %-$name_size.${name_size}b\n"

do_test() {
  path="$1"
  
  if [ -f ${path} ]; then
    num_tests=$((num_tests + 1))
    test_name=$(basename -s ".swift" ${path})
    test_name=${test_name//-/ }
    output=$(xcrun swiftc ${path} 2>&1)
    md5=$(md5 <<< "${output}")
    $(egrep -q "error: unable to execute command: Segmentation fault:" <<< "${output}")
    if [ $? == 0 ]; then
      num_crashed=$((num_crashed + 1))
      printf "${format_fail}" "${color_red}✘${color_stop}" "${test_name}" "${md5}"
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
  
  for test_path in ${path}/*.swift
  do
    do_test ${test_path}
  done

}

run_tests "Currently known crashes" "./crashes"
run_tests "Crashes marked as fixed in previous releases" "./fixed"

echo "** Results: ${num_crashed} of ${num_tests} tests crashed the compiler. **"
echo
