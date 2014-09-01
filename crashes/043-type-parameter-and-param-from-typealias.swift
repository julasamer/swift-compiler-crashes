// Test case submitted to project by https://github.com/jvasileff (John Vasileff)

protocol A {
    typealias B
}

class C<D> {
    init <A: A where A.B == D>(param: A.B) {
    }
}
