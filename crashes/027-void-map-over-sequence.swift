// rdar://18118173

class a<T : Hashable> {
    var b = [T : Bool]()
    init<S : SequenceType where S.Generator.Element == T>(_ c: S) {
        map(c) { self.b[$0] = true }
    }
}
a([1])
