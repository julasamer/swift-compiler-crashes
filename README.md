Project swift-compiler-crashes
==============================

This repo collects known test cases crashing the Swift compiler. All tests cases in the `crashes/` directory are known to generate a compiler crash under Xcode6-Beta7.

Help us towards a rock solid Swift compiler by contributing any compiler crashes you may encounter.

Happy Swifting! :-)

Getting started
===============

```
$ git clone https://github.com/practicalswift/swift-compiler-crashes.git
$ cd swift-compiler-crashes/
$ ./test.sh

Running tests against: swift-600.0.51.3
Using Xcode found at path: /Applications/Xcode6-Beta7.app/Contents/Developer/
Usage: ./test.sh [-v] [-c<columns>] [file ...]

== Currently known crashes ==

  ✘  001 protocol conforming to itself                            (654d61252d)
  ✘  002 function returning itself                                (          )
  ✘  003 sequencetype                                             (eed5383bd5)
  ✘  004 function taking itself as argument                       (          )
  ✘  005 recursive call                                           (446073f2f9)
  ✘  006 placeholder property initializer with closure            (6f675588c7)
  ✘  008 boolean operator                                         (43d38f379a)
  ✘  009 class referencing protocol referencing class             (          )
  ✘  010 circular protocol reference                              (          )
  ✘  011 protocol class func dot type                             (3395cd089c)
  ✘  012 fixpoint of higher order function                        (f05d6fb24b)
  ✘  013 dynamic type                                             (e0a705eea8)
  ✘  015 generic enum referencing itself in case                  (          )
  ✘  016 typealias referencing itself                             (99f7b1e534)
  ✘  017 type parameter resolved to protocol                      (162d98be89)
  ✘  018 generic function with nested type                        (f2d0908f50)
  ✘  019 class hierarchy type confusion                           (9ae7b64893)
  ✘  020 class extending itself                                   (22b78d5dfc)
  ✘  021 generic class referencing itself                         (119fafce99)
  ✘  022 generic class referencing itself with verbose syntax     (          )
  ✘  023 calling func with default params via let or var          (f359a5fd4b)
  ✘  024 parameterized struct with array var initialized to empty (561c7657a3)
  ✘  025 populating protocol typealias with generic types type    (31c5d7710d)
  ✘  028 extension property defined in library (lib II)           (          )
  ✘  029 class with anyobject type constraint                     (adce75c94e)
  ✘  031 basic block terminator                                   (          )
  ✘  032 type constraint emit type metadata                       (7498fa7f98)
  ✘  033 constraint ordering heap trash                           (446456229f)
  ✘  034 typecheck segfault                                       (612babfff4)
  ✘  035 multiple typecheck segfault                              (5db9b52cef)
  ✘  036 lisp style                                               (bfa18d7b9c)
  ✘  037 exit code depends on optimization level (script)         (97f491bfbd)
  ✘  040 optional in generics                                     (96778af20a)
  ✘  041 combo of generic struct func and protocol                (91e0bfd454)
  ✘  042 nested pattern match with type cast (timeout)            (          )
  ✘  043 type parameter and param from typealias                  (804f7c6fe3)
  ✘  044 string range subscript (lib III) (dupe?)                 (97f491bfbd)

== Crashes marked as fixed in previous releases ==

  ✓  007 convenience init in extension
  ✓  014 enum in generic type
  ✓  026 extension property referenced from another file
  ✓  027 void map over sequence
  ✓  030 string as extensibe collection
  ✓  038 hang on init of recursive generic type
  ✓  039 string join

** Results: 37 of 44 tests crashed the compiler **

```

Contributor hall of fame
========================

| GitHub contributor | Twitter | Cases contributed | Started contributing |
| :----------------- | :------ | ----------------: | -------------------: |
| <a href="https://github.com/practicalswift">practicalswift</a> – practicalswift | <a href="https://twitter.com/practicalswift">@practicalswift</a> | 34 test cases | Xcode6-Beta6 |
| <a href="https://github.com/tmu">tmu</a> – Teemu Kurppa | <a href="https://twitter.com/Teemu">@Teemu</a> | 4 test cases | Xcode6-Beta6 |
| <a href="https://github.com/jvasileff">jvasileff</a> – John Vasileff | <a href="https://twitter.com/jvasileff">@jvasileff</a> | 2 test cases | Xcode6-Beta6 |
| <a href="https://github.com/0xc010d">0xc010d</a> – Ievgen Solodovnykov | <a href="https://twitter.com/0xc010d">@0xc010d</a> | 1 test case | Xcode6-Beta6 |
| <a href="https://github.com/AlexDenisov">AlexDenisov</a> – Alexey Denisov | <a href="https://twitter.com/1101_debian">@1101_debian</a> | 1 test case | Xcode6-Beta6 |
| <a href="https://github.com/jansabbe">jansabbe</a> – Jan Sabbe | <a href="https://twitter.com/jansabbe">@jansabbe</a> | 1 test case | Xcode6-Beta6 |
| <a href="https://github.com/owensd">owensd</a> – David Owens II | <a href="https://twitter.com/owensd">@owensd</a> | 1 test case | Xcode6-Beta6 |
