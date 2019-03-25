                .global get_within_column
                .text

// get_within_row(board, column, n)
get_within_column:
		//x0 = address of the board
		//x1 = which column
		//x2 = offset inside of column (n)
		//x3 = index
		b .calculate_index

.calculate_index:
		//x9 = scratch
		mov x9, #9
		mul x2, x2, x9
		add x3, x1, x2
		ldrb w0, [x0, x3]
		b .return
.return:
                ret
