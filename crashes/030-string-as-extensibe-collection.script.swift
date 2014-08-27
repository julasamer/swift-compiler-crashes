func f<S : ExtensibleCollectionType>(seq: S) -> S {
    return S() + seq
}

f("a")
