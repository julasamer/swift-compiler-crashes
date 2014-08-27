// rdar://17240924

struct d<f : e, g: e where g.h == f.h> {
}

protocol e {
    typealias h
}
