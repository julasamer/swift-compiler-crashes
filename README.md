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

== Currently known crashes ==

  ✘  001 protocol conforming to itself                            (b80201f50d)
  ✘  002 function returning itself                                (          )
  ✘  003 sequencetype                                             (b1045bd42c)
  ✘  004 function taking itself as argument                       (          )
  ✘  005 recursive call                                           (f585534874)
  ✘  006 placeholder property initializer with closure            (ae47cff064)
  ✘  007 convenience init in extension                            (9a574095e0)
  ✘  008 boolean operator                                         (734a504575)
  ✘  009 class referencing protocol referencing class             (          )
  ✘  010 circular protocol reference                              (          )
  ✘  011 protocol class func dot type                             (eb2baee868)
  ✘  012 fixpoint of higher order function                        (1b50b3938c)
  ✘  013 dynamic type                                             (8e741c5012)
  ✘  014 enum in generic type                                     (7725393f6f)
  ✘  015 generic enum referencing itself in case                  (          )
  ✘  016 typealias referencing itself                             (192e32273b)
  ✘  017 type parameter resolved to protocol                      (fbb37f3936)
  ✘  018 generic function with nested type                        (fa88d89c9e)
  ✘  019 class hierarchy type confusion                           (43b90737f9)
  ✘  020 class extending itself                                   (68b8df7fc6)
  ✘  021 generic class referencing itself                         (065bafcd1b)
  ✘  022 generic class referencing itself with verbose syn        (          )
  ✘  023 calling func with default params via let or var          (60a655444a)
  ✘  024 parameterized struct with array var initialized t        (4da3a582bb)
  ✘  025 populating protocol typealias with generic types         (697745c3eb)
  ✘  026 extension property referenced from another file          (94ba271262)
  ✘  027 void map over sequence (-O)                              (a428fd6fd4)

== Crashes marked as fixed in previous releases ==

** Results: 27 of 27 tests crashed the compiler **

```

Contributor hall of fame
========================

| GitHub contributor | Twitter | Cases contributed | Started contributing |
| :---------- | :------ | ----------------: | -------------------: |
| <a href="https://github.com/practicalswift">practicalswift</a> – practicalswift | <a href="https://twitter.com/practicalswift">@practicalswift</a> | 22 test cases | Xcode6-Beta6 |
| <a href="https://github.com/0xc010d">0xc010d</a> – Ievgen Solodovnykov | <a href="https://twitter.com/0xc010d">@0xc010d</a> | 1 test case | Xcode6-Beta6 |
| <a href="https://github.com/AlexDenisov">AlexDenisov</a> – Alexey Denisov | <a href="https://twitter.com/1101_debian">@1101_debian</a> | 1 test case | Xcode6-Beta6 |
| <a href="https://github.com/jvasileff">jvasileff</a> – John Vasileff | <a href="https://twitter.com/jvasileff">@jvasileff</a> | 1 test case | Xcode6-Beta6 |
| <a href="https://github.com/owensd">owensd</a> – David Owens II | <a href="https://twitter.com/owensd">@owensd</a> | 1 test case | Xcode6-Beta6 |
| <a href="https://github.com/tmu">tmu</a> – Teemu Kurppa | <a href="https://twitter.com/Teemu">@Teemu</a> | 1 test case | Xcode6-Beta6 |
