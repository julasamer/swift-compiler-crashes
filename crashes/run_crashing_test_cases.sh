#!/bin/bash

SWIFT_VERSION=$(xcrun swiftc -version | cut -f2 -d"(" | cut -f1 -d")" | head -1)
for CASE in ???-crash-minimized.swift
do
    echo -n "Compiling $CASE under $SWIFT_VERSION: "
    (xcrun swiftc $CASE 2>&1 | egrep -q "error: unable to execute command: Segmentation fault: 11") && echo "Compiler crashed." || echo "Compiler did not crash."
done
