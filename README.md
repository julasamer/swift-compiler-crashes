Project swift-compiler-crashes
==============================

This repo collects known test cases crashing the Swift compiler. All tests cases in the `crashes/` directory are known to generate a compiler crash under Xcode6-Beta6.

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
Usage: ./test.sh [-v] [-c<columns>] [file ...]

== Currently known crashes ==

  ✘  001 protocol conforming to itself                            (654d61252d)
  ✘  002 function returning itself                                (          )
  ✘  003 sequencetype                                             (eed5383bd5)
  ✘  004 function taking itself as argument                       (          )
  ✘  005 recursive call                                           (446073f2f9)
  ✘  006 placeholder property initializer with closure            (ede6c0e5c7)
  ✘  007 convenience init in extension                            (6e2c39af29)
  ✘  008 boolean operator                                         (43d38f379a)
  ✘  009 class referencing protocol referencing class             (          )
  ✘  010 circular protocol reference                              (          )
  ✘  011 protocol class func dot type                             (dd131f4b24)
  ✘  012 fixpoint of higher order function                        (f05d6fb24b)
  ✘  013 dynamic type                                             (e0a705eea8)
  ✘  014 enum in generic type                                     (0fbd19edfe)
  ✘  015 generic enum referencing itself in case                  (          )
  ✘  016 typealias referencing itself                             (99f7b1e534)
  ✘  017 type parameter resolved to protocol                      (162d98be89)
  ✘  018 generic function with nested type                        (135cbb4383)
  ✘  019 class hierarchy type confusion                           (9ae7b64893)
  ✘  020 class extending itself                                   (22b78d5dfc)
  ✘  021 generic class referencing itself                         (da161d77bd)
  ✘  022 generic class referencing itself with verbose syn        (          )
  ✘  023 calling func with default params via let or var          (f359a5fd4b)
  ✘  024 parameterized struct with array var initialized t        (561c7657a3)
  ✘  025 populating protocol typealias with generic types         (31c5d7710d)
  ✘  026 extension property referenced from another file          (0d53bc6869)
  ✘  027 void map over sequence (-O)                              (ce61ea1d03)
  ✘  028 extension property defined in library (lib)              (          )
  ✘  029 class with anyobject type constraint                     (adce75c94e)
  ✘  030 string as extensibe collection (script)                  (8a3d2facf1)

== Crashes marked as fixed in previous releases ==

  ✓  No tests found.

** Results: 30 of 30 tests crashed the compiler **

```

Contributor hall of fame
========================

| GitHub contributor | Twitter | Cases contributed | Started contributing |
| :---------- | :------ | ----------------: | -------------------: |
| <a href="https://github.com/practicalswift">practicalswift</a> – practicalswift | <a href="https://twitter.com/practicalswift">@practicalswift</a> | 23 test cases | Xcode6-Beta6 |
| <a href="https://github.com/tmu">tmu</a> – Teemu Kurppa | <a href="https://twitter.com/Teemu">@Teemu</a> | 2 test cases | Xcode6-Beta6 |
| <a href="https://github.com/0xc010d">0xc010d</a> – Ievgen Solodovnykov | <a href="https://twitter.com/0xc010d">@0xc010d</a> | 1 test case | Xcode6-Beta6 |
| <a href="https://github.com/AlexDenisov">AlexDenisov</a> – Alexey Denisov | <a href="https://twitter.com/1101_debian">@1101_debian</a> | 1 test case | Xcode6-Beta6 |
| <a href="https://github.com/jvasileff">jvasileff</a> – John Vasileff | <a href="https://twitter.com/jvasileff">@jvasileff</a> | 1 test case | Xcode6-Beta6 |
| <a href="https://github.com/owensd">owensd</a> – David Owens II | <a href="https://twitter.com/owensd">@owensd</a> | 1 test case | Xcode6-Beta6 |
| <a href="https://github.com/jansabbe">jansabbe</a> – Jan Sabbe | <a href="https://twitter.com/jansabbe">@jansabbe</a> | 1 test case | Xcode6-Beta6 |
