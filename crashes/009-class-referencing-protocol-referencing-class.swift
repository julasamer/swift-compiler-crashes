protocol b {
    var a: c<b> {
        get
    }
}

class c<d : b> {
}
