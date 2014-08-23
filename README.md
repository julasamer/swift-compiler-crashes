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

Running tests against: swift-600.0.47.8
    Using Xcode found at path: /Applications/Xcode6-Beta6.app/Contents/Developer/

== Currently Known Crashes ==

    ✘  boolean operator
    ✘  circular protocol reference
    ✘  class referencing protocol referencing class
    ✘  convenience init in extension
    ✘  dynamic type
    ✘  enum in generic type
    ✘  fixpoint of higher order function
    ✘  function returning itself
    ✘  function taking itself as argument
    ✘  generic enum referencing itself in case
    ✘  generic function with nested type
    ✘  placeholder property initializer with closure
    ✘  protocol class func dot type
    ✘  protocol conforming to itself
    ✘  recursive call
    ✘  sequencetype
    ✘  type parameter resolved to protocol
    ✘  typealias referencing itself

== Crashes Fixed in Previous Release ==

** CRASH-TESTS FAILED: 18 of 18 crashed **

```

Contributor hall of fame
========================

| Contributor  | Twitter  | Test Cases Contributed |
| :------------ |:---------------:| -----:|
| <a href="https://github.com/practicalswift">practicalswift</a> – practicalswift | <a href="https://twitter.com/practicalswift">@practicalswift</a> | 14 test cases |
| <a href="https://github.com/0xc010d">0xc010d</a> – Ievgen Solodovnykov | <a href="https://twitter.com/0xc010d">@0xc010d</a> | 1 test case |
| <a href="https://github.com/AlexDenisov">AlexDenisov</a> – Alexey Denisov | <a href="https://twitter.com/1101_debian">@1101_debian</a> | 1 test case |
| <a href="https://github.com/jvasileff">jvasileff</a> – John Vasileff | <a href="https://twitter.com/jvasileff">@jvasileff</a> | 1 test case |
| <a href="https://github.com/owensd">owensd</a> – David Owens II | <a href="https://twitter.com/owensd">@owensd</a> | 1 test case |
