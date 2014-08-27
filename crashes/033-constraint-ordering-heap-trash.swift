// rdar://17240924

protocol a {
}

class b : a {
}

class c : a {
}

struct d<f : e, g: e where g.h == f.h> {
}

protocol e {
    typealias h
}
