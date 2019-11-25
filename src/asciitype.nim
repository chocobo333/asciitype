##[
    AsciiType
    =========
    This module provids functions that perform character tests such as ``isdigit(char c)`` in ``ctype.h`` in ``c language``.
    
    Usage-exsample
    --------------
    
    .. code-block:: nim
        import asciitype
        
        var
            a = 'f'
            b = "FOO1"
            c = "fhioeFKOhu47893joi983FFd"
        doAssert a.isPrint == true
        doAssert b.isUpper == false
        doAssert b.isUpper(true) == true
        doAssert c.isAnyType({upper, lower, num}) == true
        doAssert ' '.isAnyType({space}) == true
]##

import asciitype/tests
import asciitype/conversions

export tests
export conversions
