                .global _start
                .equ    sys_exit, 93

                .text
_start:
                // test the function with the password given below
                // the score should be 4
                // change the password below to test with other cases
                ldr     x0, =password
                bl      strength

                // call the exit system call, using the return
                // value of am_or_fm (in x0) as the exit status code
                mov     x8, #sys_exit
                svc     #0

                .data
password:       .asciz  "Password1234"
