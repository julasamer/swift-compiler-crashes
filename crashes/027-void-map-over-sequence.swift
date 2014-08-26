class Set<T: Hashable> {
    typealias Element = T
    var contents : [Element: Bool]

    init<S: SequenceType where S.Generator.Element == Element>(_ s : S) {
        self.contents = [Element: Bool]()
        // Note: it would be more idiomatic to use for-in, but that doesn't
        //       compile in Beta-6.
        map(s) { self.contents[$0] = true; }
    }
}
Set([1,2,3])
