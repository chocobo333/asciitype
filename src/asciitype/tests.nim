
type
    AsciiTypeEnum* {.size: sizeof(cint).} = enum
        upper,
        lower,
        num,
        space,
        control,
        print
    AsciiType* = set[AsciiTypeEnum]

const asciiTypeTable = block:
    var
        t: array[int(char.low)..int(char.high), AsciiType]
    for c in 'a'..'z':
        t[int(c)].incl lower
    for c in 'A'..'Z':
        t[int(c)].incl upper
    for c in '0'..'9':
        t[int(c)].incl num
    t[int(' ')].incl space
    t[int('\t')].incl space
    t[int('\n')].incl space
    t[int('\v')].incl space
    t[int('\f')].incl space
    t[int('\r')].incl space
    for i in 0x00..0x1f:
        t[i].incl control
    t[0x7f].incl control
    for i in 0x20..0x7e:
        t[i].incl print
    t

proc isAnyType*(c: char, typeset: AsciiType): bool =
    for t in typeset:
        if t in asciiTypeTable[int(c)]:
            return true
    return false

proc isAnyType*(s: string, typeset: AsciiType): bool =
    for c in s:
        if not c.isAnyType(typeset):
            return false
    return true

proc isAllType*(c: char, typeset: AsciiType): bool =
    for t in typeset:
        if t notin asciiTypeTable[int(c)]:
            return false
    return true

proc isAllType*(s: string, typeset: AsciiType): bool =
    for c in s:
        if not c.isAllType(typeset):
            return false
    return true

template isAlpha*(s: string|char): bool =
    s.isAnyType({lower, upper})

template isAlnum*(s: string|char): bool =
    s.isAnyType({lower, upper, num})

template isPrint*(s: string|char): bool =
    s.isAnyType({print})

template isLower*(s: string|char, allownum: bool = false): bool =
    if allownum:
        s.isAnyType({lower, num})
    else:
        s.isAnyType({lower})

template isUpper*(s: string|char, allownum: bool = false): bool =
    if allownum:
        s.isAnyType({upper, num})
    else:
        s.isAnyType({upper})