// rdar://18118173

class a<T : Hashable> {
    typealias Element = T
    var b = [Element: Bool]()
    init<S: SequenceType where S.Generator.Element == Element>(_ s: S) {
        map(s) { self.b[$0] = true }
    }
}
a([1])
