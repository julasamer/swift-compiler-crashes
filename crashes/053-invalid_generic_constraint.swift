protocol SomeProtocol {}
struct SomeStruct: SomeProtocol {}

struct X<V, E: SomeProtocol where V.X == E> {}