                .global sort_ints
                .text
// sort_ints(array, size)
sort_ints:

//def BubbleSort( A ):
		//x0 = address of array
		//x1 = size of the array
		//x2 = i 
		//x3 = j
		//x4 = A[i]
		//x5 = A[j]
		mov x2, #0
		b .i_for_loop
		
.increment_i:
		add x2, x2, #1

	//for i in range( len(A)):
.i_for_loop:
		cmp x2, x1
		b.ge .leave
		mov x3, x2
		b .j_for_loop


.increment_j:
		add x3, x3, #1

		//for j in range( i, len(A ) ) :
.j_for_loop:
		cmp x3, x1
		b.ge .increment_i


			//if A[i] > A[j]:
.comparison:
		ldr x4, [x0, x2, lsl #3]
		ldr x5, [x0, x3, lsl #3]
		cmp x4, x5
		b.le .increment_j


				//A[i], A[j] = A[j], A[i]
.switch:
		str x5, [x0, x2, lsl #3]
		str x4, [x0, x3, lsl #3]

		b .increment_j


.leave:
		ret

