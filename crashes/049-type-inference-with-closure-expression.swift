// Test case submitted to project by https://github.com/rnapier (Rob Napier)

var x1 = 1
var f1: Int -> Int = {
    return $0
}

let succeeds: Int = { (x: Int, f: Int -> Int) -> Int in
    return f(x)
}(x1, f1)

let crashes: Int = { x, f in
    return f(x)
}(x1, f1)
