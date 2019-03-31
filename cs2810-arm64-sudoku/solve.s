                .global solve
                .text

// solve(board) -> 0 for success, 1 for failure
// on success, the board will be solved
// on failure, the board will be unchanged
solve:

//callee-saved registers needed:
		sub sp, sp, #32
		stur x20, [sp, #0]
		stur x21, [sp, #8]
		stur x22, [sp, #16]
		stur x30, [sp, #24]

		//x20 = copy of board
		//x21 = i
		//x22 = n
		mov x20, x0
		mov x21, #0
		//initialized i


//def solve(board):
	//if has_conflict(board) != 0:
.initial_check:
		mov x0, x20
		bl has_conflict

		cmp x0, xzr
		b.ne .return_bad
		//return 1
		b .first_for_loop


	//for i = 0; i < 81; i++
		//if board[i] != 0:
			//continue
.increment_i:
		add x21, x21, #1
.first_for_loop:

		cmp x21, #81
		b.ge .return_good
		mov x22, #1
		//initalized n

		//x2 = board[i]
		ldrb w2, [x20, x21]
		cmp x2, xzr
		b.eq .second_for_loop
		b .increment_i
		//continue by incrementing i
		



		//for n = 1; n < 10; n++
			//board[i] = n
			//if solve(board) == 0:
				//return 0
.increment_n:
		add x22, x22, #1
.second_for_loop:
		cmp x22, #10
		b.ge .reset_board
		//storing the value n at board[i]
		strb w22, [x20, x21]
		mov x0, x20
		//recurse
		bl solve
		cmp x0, xzr
		b.ne .increment_n

.return_good:
		mov x0, #0
		b .leave
		
		
		//board[i] = 0
		//return 1
	//return 0
.reset_board:
		strb wzr, [x20, x21]
		b .return_bad





.return_bad:
		mov x1, #1


.leave:
		ldur x20, [sp, #0]
		ldur x21, [sp, #8]
		ldur x22, [sp, #16]
		ldur x30, [sp, #24]
		add sp, sp, #32


		ret
