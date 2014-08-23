protocol A {
    func c() -> String
}

class B {
    func d() -> String {
        return ""
    }
}

class C: B, A {
    override func d() -> String {
        return ""
    }

    func c() -> String {
        return ""
    }
}

func e<T where T: A, T: B>(t: T) {
    t.c()
}
