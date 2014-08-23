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
Using Xcode found at path: /Applications/Xcode6-Beta6.app/Contents/Developer

== Currently known crashes ==

  ✘  001 protocol conforming to itself                             (7b5c3e7fb0)
  ✘  002 function returning itself                                 (f8b9bd940b)
  ✘  003 sequencetype                                              (9f4ed5eb66)
  ✘  004 function taking itself as argument                        (f8b9bd940b)
  ✘  005 recursive call                                            (df062b9ea1)
  ✘  006 placeholder property initializer with closure             (9975029407)
  ✘  007 convenience init in extension                             (71687e4601)
  ✘  008 boolean operator                                          (a55bb40e11)
  ✘  009 class referencing protocol referencing class              (f8b9bd940b)
  ✘  010 circular protocol reference                               (f8b9bd940b)
  ✘  011 protocol class func dot type                              (9e29634326)
  ✘  012 fixpoint of higher order function                         (1c98dce711)
  ✘  013 dynamic type                                              (3a12b036f4)
  ✘  014 enum in generic type                                      (2a7429668a)
  ✘  015 generic enum referencing itself in case                   (f8b9bd940b)
  ✘  016 typealias referencing itself                              (8cee145f9c)
  ✘  017 type parameter resolved to protocol                       (ed28f63438)
  ✘  018 generic function with nested type                         (0e36b201fd)
  ✘  019 class hierarchy type confusion                            (b95a2950eb)
  ✘  020 class extending itself                                    (37b64723fb)
  ✘  021 generic class referencing itself                          (98469ec8d2)
  ✘  022 generic class referencing itself with verbose syntax      (f8b9bd940b)
  ✘  023 calling func with default params via let or var           (6aca4b991b)

== Crashes marked as fixed in previous releases ==

** Results: 23 of 23 tests crashed the compiler. **

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
