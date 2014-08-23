protocol a {
    class func c()
}

class b: a {
    class func c() {
    }
}

var d: a = b()
d.dynamicType.c()
