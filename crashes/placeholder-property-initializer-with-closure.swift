func initializer(closure: () -> ()) {
}

class Crash {
    var _ = initializer() {
    }
}
