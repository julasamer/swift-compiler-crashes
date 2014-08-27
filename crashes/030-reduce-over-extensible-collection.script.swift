// Run with
//    xcrun swift -O 028-reduce-over-extensible-collection.swift

func deleteDuplicates<S:ExtensibleCollectionType where S.Generator.Element: Comparable>(seq:S)-> S {
    let s = reduce(seq, S()){
        ac, x in contains(ac,x) ? ac : ac + [x]
    }
    return s
}

var str = "Hello, playground"
str = deleteDuplicates(str)
println(str)
