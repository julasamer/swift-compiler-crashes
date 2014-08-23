#!/bin/bash

XCODE_VERSION=$(xcode-select -p | tr "/" "\n" | egrep "^Xcode" | head -1 | cut -f1 -d".")
SWIFT_VERSION=$(xcrun swiftc -version | cut -f2 -d"(" | cut -f1 -d")" | head -1)
echo "Compiling under ${XCODE_VERSION} (${SWIFT_VERSION}) …"
echo
for CASE in *.swift
do
    printf "\t${CASE}\n"
    COLOR_RED="\e[31m"
    COLOR_GREEN="\e[32m"
    COLOR_NO_COLOR="\e[0m"
    (xcrun swiftc $CASE 2>&1 | egrep -q "error: unable to execute command: Segmentation fault: 11") && \
        printf "\t\t${COLOR_GREEN}Compiler crashed.${COLOR_NO_COLOR}\n" || \
        printf "\t\t${COLOR_RED}Compiler did not crash.${COLOR_NO_COLOR}\n"
done
echo
