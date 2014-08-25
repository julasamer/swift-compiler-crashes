// This bug is NOT triggered when compiling with -O.

func f<T : BooleanType>(b: T) {
}

f(true as BooleanType)
