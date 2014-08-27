// Test case submitted to project by https://github.com/practicalswift (practicalswift)

protocol a {
    class func c()
}

class b: a {
    class func c() { }
}

(b() as a).dynamicType.c()
