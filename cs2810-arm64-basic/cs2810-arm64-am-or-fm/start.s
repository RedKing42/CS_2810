                .global _start
                .equ    sys_exit, 93

                .text
_start:
                // test the function with freq=600
                // change these lines to test with other values
                mov     x0, #600
                bl      am_or_fm

                // call the exit system call, using the return
                // value of am_or_fm (in x0) as the exit status code
                mov     x8, #sys_exit
                svc     #0
