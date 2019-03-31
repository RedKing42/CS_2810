Sort
====

Implement a function that sorts an array of integers in ascending
order:

    sort_ints(array, size)

The function takes two parameters and returns nothing. The first
parameter is the address in memory of an array of integers, each
64-bits in size. The second parameter indicates how many integers
are in the array. When the function returns, the array should be
sorted from smallest to largest element.

An *array* is just a list of numbers in memory, one after another.
Each entry uses 8 bytes, so an array of 5 numbers will be 40 bytes
long. The `array` parameters to `sort_ints` is the address of the
first element of the array.

You may use any reasonable sorting algorithm. One of the simplest to
understand (and probably to debug) is the *selection sort*. If in
doubt, I suggest using it, but you are welcome to use a different
algorithm:

* <https://en.wikipedia.org/wiki/Selection_sort>

You should do the following:

1. Pick a sorting algorithm
2. Write detailed pseudo-code for exactly how you plan to implement it
3. Implement your pseudo-code in some high-level language to test
   that your algorithm is correct
4. Transform your pseudo-code as on previous assignments to
   eliminate loops, complex conditionals, and anything else that
   does not translate directly into assembly language
5. Plan how you will use registers, the stack, memory, etc.
6. Implement the assembly language and test it

When loading values from memory, note that you will need to load
8-byte (64-bit) values. When you index an array by item number, you
need to multiply the index value by 8 to get the correct byte offset
to add to the beginning of the array. For example, to load the
value at index 13 of an array that begins at memory location 2000,
you would compute the correct address of the item using:

    address = 2000 + 13 * 8

This is a common operation, and the CPU has built-in support for it
in the form of index shifting. It works like this:

    ldr x3, [x6, x8, lsl #3]

This instruction loads a 64-bit value into x3. The address it loads
from is x6 (the array) plus x8 (the index) shifted left 3 times,
i.e.: x6 + x8 * 8. The logical shift left (lsl) only applies to the
index (the second register inside the square brackets).

It works the same way for str.
