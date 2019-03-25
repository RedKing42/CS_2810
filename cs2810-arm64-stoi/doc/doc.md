String to integer
=================

Write a function called `stoi` to convert a string containing a base
10 number to an integer value.

    stoi(buffer) -> n

`stoi` is given the address of a buffer in memory containing a text
representation of an integer value. Here is the basic algorithm for
doing this:

*   start with n = 0
*   read a character from the buffer and call it c
*   if the value of c is between '0' and '9' (48 and 57):
    *   n = n * 10 + (c - '0')
    *   read the next character from the buffer and repeat
*   else return n

You may find it helpful to re-write this into more detailed
pseudo-code before you start writing assembly language.

Note that you do not know in advance how many characters make up the
number. As soon as you read something that is not a digit, you
should assume you have reached the end of the input.

In addition to the outline given above, you should accept an
optional `-` (minus sign) at the beginning of the input, and return
a negative number instead of a positive number.

For example, if `stoi` is called with 0x1230 as the value of the
buffer pointer, and memory contains the following:

* 0x1230: '3' (ASCII code 51)
* 0x1231: '8' (ASCII code 56)
* 0x1232: '0' (ASCII code 48)
* 0x1233: '1' (ASCII code 49)
* 0x1234: '2' (ASCII code 50)
* 0x1235: ' ' (ASCII code 32)

Your function should return the number 38012.


Hints
-----

To negate a value, you can just subtract it from zero.
