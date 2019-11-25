# This is just an example to get you started. You may wish to put all of your
# tests into a single file, or separate them into multiple `test1`, `test2`
# etc. files (better names are recommended, just make sure the name starts with
# the letter 't').
#
# To run these tests, simply execute `nimble test`.

import unittest

import asciitype
test "test":
    var
        a = 'f'
        b = "FOO1"
        c = "fhioeFKOhu47893joi983FFd"
    doAssert a.isPrint == true
    doAssert b.isUpper == false
    doAssert b.isUpper(true) == true
    doAssert c.isAnyType({upper, lower, num}) == true
    doAssert ' '.isAnyType({space}) == true