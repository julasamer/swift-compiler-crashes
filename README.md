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

    ✘  001 protocol conforming to itself
    ✘  002 function returning itself
    ✘  003 sequencetype
    ✘  004 function taking itself as argument
    ✘  005 recursive call
    ✘  006 placeholder property initializer with closure
    ✘  007 convenience init in extension
    ✘  008 boolean operator
    ✘  009 class referencing protocol referencing class
    ✘  010 circular protocol reference
    ✘  011 protocol class func dot type
    ✘  012 fixpoint of higher order function
    ✘  013 dynamic type
    ✘  014 enum in generic type
    ✘  015 generic enum referencing itself in case
    ✘  016 typealias referencing itself
    ✘  017 type parameter resolved to protocol
    ✘  018 generic function with nested type
    ✘  019 class hierarchy type confusion
    ✘  020 class extending itself
    ✘  021 generic class referencing itself
    ✘  022 generic class referencing itself with verbose syntax

== Crashes Fixed in Previous Release ==

** CRASH-TESTS FAILED: 22 of 22 crashed **

```

Contributor hall of fame
========================

| Contributor | Twitter | Cases contributed | Started contributing |
| :---------- | :------ | ----------------: | -------------------: |
| <a href="https://github.com/practicalswift">practicalswift</a> – practicalswift | <a href="https://twitter.com/practicalswift">@practicalswift</a> | 18 test cases | Xcode6-Beta6 |
| <a href="https://github.com/0xc010d">0xc010d</a> – Ievgen Solodovnykov | <a href="https://twitter.com/0xc010d">@0xc010d</a> | 1 test case | Xcode6-Beta6 |
| <a href="https://github.com/AlexDenisov">AlexDenisov</a> – Alexey Denisov | <a href="https://twitter.com/1101_debian">@1101_debian</a> | 1 test case | Xcode6-Beta6 |
| <a href="https://github.com/jvasileff">jvasileff</a> – John Vasileff | <a href="https://twitter.com/jvasileff">@jvasileff</a> | 1 test case | Xcode6-Beta6 |
| <a href="https://github.com/owensd">owensd</a> – David Owens II | <a href="https://twitter.com/owensd">@owensd</a> | 1 test case | Xcode6-Beta6 |
