protocol P {
    typealias Element
}

class C<E> {
    init <P: P where P.Element == E>(param1: P, param2: P.Element) { }
}
