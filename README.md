swift-compiler-crashes
======================

This repo collects known test cases crashing the Swift compiler. All tests cases in the `crashes/` directory are known to generate a compiler crash under Xcode6-Beta6 when being compiled.

Help us towards a rock solid Swift compiler by contributing any compiler crashes you may encounter.

Happy Swifting! :-)

Getting started
===============

```
$ git clone https://github.com/practicalswift/swift-compiler-crashes.git
$ cd swift-compiler-crashes/
$ ./test.sh

Running tests against swiftc: swift-600.0.47.8

== Currently Known Crashes ==

    ✘  protocol conforming to itself
    ✘  function returning itself
    ✘  sequencetype
    ✘  function taking itself as argument
    ✘  recursive call
    ✘  placeholder property initializer with closure
    ✘  convenience init in extension
    ✘  boolean operator
    ✘  class referencing protocol referencing class
    ✘  circular protocol reference

== Crashes Fixed in Previous Release ==

** CRASH-TESTS FAILED: 10 of 10 crashed **

```

Contributor hall of fame
========================

* <a href="https://github.com/practicalswift">practicalswift</a> (<a href="https://twitter.com/practicalswift">@practicalswift</a>), 8 crashes contributed
* <a href="https://github.com/AlexDenisov">AlexDenisov</a> (Alexey Denisov, <a href="https://twitter.com/1101_debian">@1101_debian</a>), 1 crash contributed
* <a href="https://github.com/0xc010d">0xc010d</a> (Ievgen Solodovnykov, <a href="https://twitter.com/0xc010d">@0xc010d</a>), 1 crash contributed
