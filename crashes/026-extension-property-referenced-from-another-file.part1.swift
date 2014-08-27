// Test case submitted to project by https://github.com/practicalswift (practicalswift)
// https://twitter.com/krzyzanowskim/status/501658160428367872
// https://github.com/krzyzanowskim/CryptoSwift/commit/c8e779f9af5d9fe1debdfcfe45803ecbf3d61fc2
// rdar://18061554
// NOTE: This bug is similar (but not identical) to #028.

import Foundation

extension NSData {
    public var a: String {
        return ""
    }
}
