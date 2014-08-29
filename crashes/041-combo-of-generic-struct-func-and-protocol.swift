// Test case submitted to project by https://github.com/practicalswift (practicalswift)
// rdar://18176436

protocol A {
    typealias E
}

struct B<T : A> {
    let h: T
    let i: T.E
}

protocol C {
    typealias F
    func g<T where T.E == F>(f: B<T>)
}

struct D : C {
    typealias F = Int
    func g<T where T.E == F>(f: B<T>) {
    }
}
