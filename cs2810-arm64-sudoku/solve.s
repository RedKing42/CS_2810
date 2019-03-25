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
		mov x21, xzr


//def solve(board):
	//if has_conflict(board) != 0:
.initial_check:
		//x1 = address of has_conflict
		ldr x1, =has_conflict
		mov x0, x20
		blr x1

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
		//x1 = scratch for comparing
		mov x1, #81
		cmp x21, x1
		b.ge .return_good

		//x2 = board[i]
		ldrb w2, [x20, x21]
		cmp x2, xzr
		mov x22, #1
		b.eq .second_for_loop
		//what is continue?

		



		//for n = 1; n < 10; n++
			//board[i] = n
			//if solve(board) == 0:
				//return 0
.increment_n:
		add x22, x22, #1
.second_for_loop:
		//storing the value n at board[i]
		strb w22, [x20, x21]
		//x1 = scratch address of solve
		ldr x1, =solve
		mov x0, x20
		//recurse
		blr x1
		cmp x0, xzr
		b.ne .increment_n
		b .return_good



		//board[i] = 0
		//return 1
	//return 0



.return_good:
		mov x0, #0
		b .leave


.return_bad:
		mov x1, #1
		b .leave


.leave:
		ldur x20, [sp, #0]
		ldur x21, [sp, #8]
		ldur x22, [sp, #16]
		ldur x30, [sp, #24]
		add sp, sp, #32


		ret
