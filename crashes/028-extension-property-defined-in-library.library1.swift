// Test case submitted to project by https://github.com/practicalswift (practicalswift)
// http://www.openradar.me/17500497
// NOTE: Bug report in above radar is not 100 % accurate since this problem
//       seems isolated to property vars. Extending Array with say the function
//       a() works.
// NOTE: This bug is similar (but not identical) to #026.

extension Array {
    public var a: T? {
        get {
            return self[self.count]
        }
    }
}
