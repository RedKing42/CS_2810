                .global get_within_row
                .text

// get_within_row(board, row, n)
get_within_row:
		//x0 = address of the board
		//x1 = which row
		//x2 = offset inside of row (n)
		//x3 = index
		b .calculate_index

.calculate_index:
		//x9 = scratch
		mov x9, #9
		mul x1, x1, x9
		add x3, x1, x2
		ldrb w0, [x0, x3]
		b .return
.return:
                ret
