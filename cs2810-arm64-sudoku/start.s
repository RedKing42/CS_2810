                .global _start

                .equ    sys_exit, 93

                // here is a valid, fully solved board
                .data
board:          .byte   8,1,9, 7,6,3, 4,2,5
                .byte   4,7,5, 9,2,8, 6,1,3
                .byte   3,2,6, 5,4,1, 9,7,8

                .byte   5,4,2, 8,9,7, 1,3,6
                .byte   6,8,7, 1,3,4, 5,9,2
                .byte   9,3,1, 6,5,2, 8,4,7

                .byte   1,9,8, 2,7,5, 3,6,4
                .byte   2,5,4, 3,1,6, 7,8,9
                .byte   7,6,3, 4,8,9, 2,5,1

                .text
                // call solve and use whatever it returns
                // as the exit status code
                //
                // in this case, the expected output is 0 since the
                // entire board is solved and valid.
_start:
                ldr     x0, =board
                bl      solve

                mov     x8, #sys_exit
                svc     #0
