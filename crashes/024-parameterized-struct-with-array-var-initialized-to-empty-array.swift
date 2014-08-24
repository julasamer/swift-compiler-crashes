// http://www.openradar.me/17662010
// https://twitter.com/rob_rix/status/488692270908973058

struct A<T> {
    let a: [(T, () -> ())] = []
}
