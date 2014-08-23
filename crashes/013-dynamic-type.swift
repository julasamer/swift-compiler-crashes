protocol a {
    class func c()
}

class b: a {
    class func c() { }
}

(b() as a).dynamicType.c()
