               .global _start

                .text
_start:
				// test the function with a=5 and b=8
				// change these lines to test with other values.
                mov     x0, #5
                mov     x1, #8
                bl      sum

				// leave the return value of sum in x0 and
				// call exit. The return value of sum will be
				// the exit code of the program. If you run this using:
				//     make run
				// you will see the exit status code displayed as an
				// error code. If the exit status code is zero it will
				// not be displayed.
				// If you run the code using ./a.out instead, then
				// you can see the exit status code immediately
				// afterward by typing:
				//     echo $?
				mov	x8, #93
				svc 	#0
