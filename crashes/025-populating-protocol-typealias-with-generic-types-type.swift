protocol A {
    typealias B
    func b(B)
}

struct X<Y> : A {
    func b(b: X.Type) {
    }
}
