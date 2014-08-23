protocol b {
    class func e()
}

struct c {
    var d: b.Type
    func e() {
        d.e()
    }
}
