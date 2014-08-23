#!/bin/bash

xcode_path=$(xcode-select -p)
swiftc_version=$(xcrun swiftc -version | cut -f2 -d"(" | cut -f1 -d")" | head -1)

echo
echo "Running tests against: $swiftc_version"
echo "    Using Xcode found at path: $xcode_path"

num_crashed=0
num_tests=0

color_red="\e[01;31m"
color_green="\e[32m"
color_stop="\e[00m"


do_test() {
  path="$1"
  
  if [ -f $path ]; then
    num_tests=$((num_tests + 1))
    test_name=$(basename -s ".swift" "$path")
    test_name=${test_name//-/ }
    
    $(xcrun swiftc $path 2>&1 | egrep -q "error: unable to execute command: Segmentation fault:")

    if [ $? == 0 ]; then
      num_crashed=$((num_crashed + 1))
      printf "    ${color_red}✘${color_stop}  $test_name\n"
    else
      printf "    ${color_green}✓${color_stop}  $test_name\n"
    fi
  fi
}

run_tests() {
  header="$1"
  path="$2"

  echo
  echo "== $header =="
  echo
  
  for test_path in $path/*.swift
  do
    do_test $test_path
  done

}

show_results() {
  if [ $num_crashed == 0 ]; then
    echo "** CRASH-TESTS PASSED **"
    echo
  else
    echo "** CRASH-TESTS FAILED: $num_crashed of $num_tests crashed **"
    echo
  fi
}

run_tests "Currently Known Crashes" "./crashes"
run_tests "Crashes Fixed in Previous Release" "./fixed"

show_results
