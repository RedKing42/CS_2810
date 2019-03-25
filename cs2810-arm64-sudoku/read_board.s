                .global read_board
                .text

// read_board(*input, *board) ->
//     0 for success
//     1 for input too short
//     2 for input contains invalid character
//     3 for input too long
read_board:
		mov x2, #0
		b .loop

.loop:

		//x0 = address of the first character in input
		//x1 = address of the board
		//x2 = offset of the string and board
		//w4 = register of value
		ldrb w4, [x0, x2]
		cmp x4, #0
		b.eq .end
		cmp x4, #'.'
		b.eq .unfilled_square
		cmp x4, #'1'
		b.lt .invalid_character
		cmp x4, #'9'
		b.gt .invalid_character
		b .filled_square

.unfilled_square:
		// storing a dot where an unfilled square is
		strb wzr, [x1, x2]
		add x2, x2, #1
		b .loop

.filled_square:
		//storing the appropriate number in the appropriate space
		//board[i] = w4 - #'0'
		sub x4, x4, #'0'
		strb w4, [x1, x2]
		add x2, x2, #1
		b .loop


.invalid_character:
		mov x0, #2
		b .return

.end:
		cmp x2, #81
		b.ge .test_for_long
		mov x0, #1
		b .return

.test_for_long:
		cmp x2, #81
		b.eq .good_length
		mov x0, #3
		b .return

.good_length:
		mov x0, #0
		b .return

.return:
		ret

