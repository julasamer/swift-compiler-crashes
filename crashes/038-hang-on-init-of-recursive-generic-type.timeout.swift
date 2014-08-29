// http://www.openradar.me/18072376

public class A<T> {
    var b: A<T>?
}

A<Int>()
