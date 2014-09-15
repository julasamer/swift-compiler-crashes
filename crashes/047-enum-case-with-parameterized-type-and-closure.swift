// Test case submitted to project by https://github.com/practicalswift (practicalswift)
// http://www.openradar.me/18248167
// https://twitter.com/rob_rix/status/507976289564000258

enum S<T> {
    case C(T, () -> ())
}
