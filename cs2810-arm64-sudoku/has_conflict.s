                .global has_conflict
                .text

// has_conflict(board) -> 0 or 1
has_conflict:
		//x0 = board
		// don't need to directly access the board, just pass in as a parameter
		// but I will save it in a callee-saved because it will be overwritten
		sub sp, sp, #32
		stur x20, [sp, #0]
		stur x21, [sp, #8]
		stur x30, [sp, #16]

		mov x20, x0
		// we will pass in x20
		//x20 = copy of the board
		mov x21, #0
		//x21 = i variable needs to stay in this function
		

//for i = 0; i < 9; i++
.for_loop:
		mov x9, #9
		//scratch for comparing
		cmp x21, x9
		b.ge .return_good


	//if has_conflict_within(board, get_within_row, i) != 0:
		//return 1
.row:
		mov x0, x20
		ldr x1, =get_within_row
		mov x2, x21
		ldr x3, =has_conflict_within
		blr x3

//now test the return
		cmp x0, xzr
		b.ne .return_bad
		b .column

	//if has_conflict_within(board, get_within_column, i) != 0:
		//return 1
.column:
		mov x0, x20
		ldr x1, =get_within_column
		mov x2, x21
		ldr x3, =has_conflict_within
		blr x3

//now test the return
		cmp x0, xzr
		b.ne .return_bad
		b .group


	//if has_conflict_within(board, get_within_group, i) != 0:
		//return 1
.group:
		mov x0, x20
		ldr x1, =get_within_group
		mov x2, x21
		ldr x3, =has_conflict_within
		blr x3

//now test the return
		cmp x0, xzr
		b.ne .return_bad
		//increment index:
		add x21, x21, #1
		b .for_loop


.return_bad:
		mov x0, #1
		b .leave

.return_good:
	//return 0
		mov x0, #0
		b .leave

.leave:
		ldur x20, [sp, #0]
		ldur x21, [sp, #8]
		ldur x30, [sp, #16]
		add sp, sp, #32
                ret
