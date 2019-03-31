                .global _start
                .equ    sys_exit, 93

                .text
_start:
                // test the function with the array given below
                ldr     x0, =numbers
                mov     x1, #size
                bl      sort_ints

                // call the exit system call with exit code 0
                mov     x0, #0
                mov     x8, #sys_exit
                svc     #0

                .data
numbers:        .quad   5, 3, 1, 0, 2, 4
                .equ    size, (.-numbers)/8
