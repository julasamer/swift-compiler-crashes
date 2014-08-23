protocol a {
    class func c() -> String
}

class b: a {
    class func c() -> String {
        return ""
    }
}

var d: a = b()
d.dynamicType.c()
