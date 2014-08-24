// http://www.openradar.me/17822208

func a<T>() -> (T, T -> T) -> T {
    var b: ((T, T -> T) -> T)!
    return b
}

