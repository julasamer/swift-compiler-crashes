// http://www.openradar.me/17822208
// https://twitter.com/rob_rix/status/493199478879682561

func a<T>() -> (T, T -> T) -> T {
    var b: ((T, T -> T) -> T)!
    return b
}

