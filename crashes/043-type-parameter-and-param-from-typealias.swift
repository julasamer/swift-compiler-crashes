// Test case submitted to project by https://github.com/jvasileff (John Vasileff)

protocol P {
    typealias Element
}

class C<E> {
    init <P: P where P.Element == E>(param: P.Element) {
    }
}
