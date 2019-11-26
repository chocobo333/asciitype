# asciitype
That module has functions that test whether a character is of a certain type.

### Contents
* [Installation](#Installation)
* [Usage](#Usage)
* [Document](#Document)

## Installation
```
nimble install asciitype
```

## Usage
```nim
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
```

## Document