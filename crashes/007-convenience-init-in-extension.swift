class A {
	var value: Int?
	init() {}
}

extension A {
	convenience init(i: Int?) {
		self.init()
		value = i
	}
	convenience init(s: String?) {
		self.init(i: s?.toInt())
	}
}

