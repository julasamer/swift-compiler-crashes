// Test case submitted to project by https://github.com/practicalswift (practicalswift)
// http://www.openradar.me/17929884
// https://twitter.com/joshaber/status/496833803160416256

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
