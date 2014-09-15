// Test case submitted to project by https://github.com/practicalswift (practicalswift)
// rdar://17242486

protocol a {
  typealias d
  typealias e = d
  typealias f = d
}

class b<h : c, i : c where h.g == i> : a {
}

class b<h, i> {
}

protocol c {
    typealias g
}
