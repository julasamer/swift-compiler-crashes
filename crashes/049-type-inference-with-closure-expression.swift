var x1 = 1
var f1: Int -> Int = { return $0 }

// Succeeds
let y = { (x: Int, f: Int -> Int) -> Int in
  return f(x)
}(x1, f1)

let fail: Int = { x, f in
  return f(x)
  }(x1, f1)
