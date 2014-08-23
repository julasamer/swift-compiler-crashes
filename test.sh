#!/bin/bash

swiftc_version=$(xcrun swiftc -version | cut -f2 -d"(" | cut -f1 -d")" | head -1)

echo
echo "Running tests against swiftc: $swiftc_version"

num_crashed=0
num_tests=0

do_test() {
  path="$1"
  
  if [ -f $path ]; then
    num_tests=$((num_tests + 1))
    test_name=$(basename -s ".swift" "$path")
    test_name=${test_name//-/ }
    
    $(xcrun swiftc $path 2>&1 | egrep -q "error: unable to execute command: Segmentation fault:")

    if [ $? == 0 ]; then
      num_crashed=$((num_crashed + 1))
      echo "    ✘  $test_name"
    else
      echo "    ✓  $test_name"
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
