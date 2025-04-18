fun cloop() {
    if (rdrec() == 0) {
        endfil()
    }
    wrrec()
    cloop()
}

buffer = resb(4096)

fun endfil() {
    if (buffer == eof) {

    }
}


def("cloop", proc(
    if_(equal(run("rdrec"), 0),
        run("endfil"),
    ),
))