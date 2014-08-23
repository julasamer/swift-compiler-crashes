func boom<T>(f: ((T, T -> T) -> T, T, (T -> T)) -> T) -> (T, T -> T) -> T {
	var recursive: ((T, T -> T) -> T)!
	return recursive
}
