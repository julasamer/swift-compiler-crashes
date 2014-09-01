// Test case submitted to project by https://github.com/practicalswift (practicalswift)

import Foundation

extension String {
    public subscript (range: Range<Int>) -> String {
        let start = Swift.advance(self.startIndex, range.startIndex)
        let end = Swift.advance(start, range.endIndex - range.startIndex)
        return self.substringWithRange(Range(start: start, end: end))
    }
}
