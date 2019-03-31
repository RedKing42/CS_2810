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
		mov x3, #0


.increment_j:
		add x3, x3, #1

		//for j in range( i, len(A ) ) :
.j_for_loop:


			//if A[i] > A[j]:
.comparison:



				//A[i], A[j] = A[j], A[i]
.switch:



.leave:
		ret
