swift-compiler-crashes
======================

This repo collects known test cases crashing the Swift compiler. All tests cases in the `crashes/` directory are known to generate a compiler crash under Xcode6-Beta6 when being compiled.

Help us towards a rock solid Swift compiler by contributing any compiler crashes you may encounter.

Happy Swifting! :-)

Getting started
===============

```
$ git clone https://github.com/practicalswift/swift-compiler-crashes.git
$ cd swift-compiler-crashes/crashes/
$ ./run_crashing_test_cases.sh
Compiling 001-protocol-conforming-to-itself.swift under swift-600.0.47.8: Compiler crashed.
Compiling 002-function-returning-itself.swift under swift-600.0.47.8: Compiler crashed.
Compiling 003-sequencetype.swift under swift-600.0.47.8: Compiler crashed.
Compiling 004-function-taking-itself-as-argument.swift under swift-600.0.47.8: Compiler crashed.
Compiling 005-recursive-call.swift under swift-600.0.47.8: Compiler crashed.
Compiling 006-placeholder-property-initializer-with-closure.swift under swift-600.0.47.8: Compiler crashed.
```

Contributor hall of fame
========================

* <a href="https://github.com/practicalswift">practicalswift</a> (<a href="https://twitter.com/practicalswift">@practicalswift</a>), 5 crashes contributed
* <a href="https://github.com/AlexDenisov">AlexDenisov</a> (<a href="https://twitter.com/1101_debian">@1101_debian</a>), 1 crash contributed
