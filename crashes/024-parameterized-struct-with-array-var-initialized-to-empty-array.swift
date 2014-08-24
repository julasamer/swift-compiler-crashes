// http://www.openradar.me/17662010

struct A<T> {
    let a: [(T, () -> ())] = []
}
