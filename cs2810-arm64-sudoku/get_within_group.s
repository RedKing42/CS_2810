                .global get_within_group
                .text

// get_within_row(board, group, n)
get_within_group:
		//x0 = address of the board
		//x1 = which group
		//x2 = offset inside of group (n)
		//x3 = index
		//x4 = row number
		//x5 = column number
		b .get_row

.get_row:
		//x9 = scratch
		mov x9, #3
		mov x10, #0
		mov x11, x1
		mov x12, x2
		
		//we will now begin to divide
.divide_1:
		//x9 = #3
		//x10 = first division #
		udiv x10, x1, x9
		b .divide_2

.divide_2:
		//x11 = second division #
		udiv x11, x2, x9
		b .put_together_row

.put_together_row:
		mul x10, x10, x9
		add x4, x10, x11
		//x4 is now the row number


.get_column:
		//x10 = remainder of first modulus
		//x11 = copy of the group #
		//x12 = copy of the offset (n)
		//x9 is still equal to the int 3
		//x6 will be the remainder of second modulus
		mov x10, #0
		mov x11, x1
		mov x12, x2

.modulus_1:
		cmp x11, x9
		b.lt .modulus_2
		sub x11, x11, x9
		cmp x11, x9
		b.ge .modulus_1
		b .modulus_2
.modulus_2:
		mov x10, x11
		//this will make sure that x10 is the remainder 
		cmp x12, x9
		b.lt .put_together_column
		sub x12, x12, x9
		cmp x12, x9
		b.ge .modulus_2
		b .put_together_column


.put_together_column:
		mov x6, x12
		//this makes x6 a copy of the second modulus
		mul x10, x10, x9
		//this gives us row * 9
		add x5, x10, x6
		//x5 is now the column number
		b .calculate_index


.calculate_index:
		//x9 = scratch
		mov x9, #9
		mul x4, x4, x9
		add x3, x4, x5
		ldrb w0, [x0, x3]
		b .return
.return:
                ret


