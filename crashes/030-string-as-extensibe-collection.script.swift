// Run with
//    xcrun swift -O 030-string-as-extensible-collection.swift

func f<S:ExtensibleCollectionType>(seq:S)-> S {
    return S() + seq
}

f("a")
