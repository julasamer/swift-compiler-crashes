// Test case submitted to project by https://github.com/practicalswift (practicalswift)
// rdar://18176436

protocol FirstProtocol {
    typealias FirstType
}

struct FirstStruct<T : FirstProtocol> {
    let foo: T
    let bar: T.FirstType
}

protocol SecondProtocol {
    typealias SecondType
    func baz<T where T.FirstType == SecondType>(f: FirstStruct<T>)
}

struct SecondStruct: SecondProtocol {
    typealias SecondType = Int
    func baz<T where T.FirstType == SecondType>(f: FirstStruct<T>) {
    }
}
