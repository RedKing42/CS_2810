                .global has_conflict_within
                .text

// has_conflict_within(board, get_within, major) -> 0 or 1
has_conflict_within:

.save_registers:
		sub sp, sp, #64
		stur x17, [sp, #0]
		stur x18, [sp, #8]
		stur x19, [sp, #16]
		stur x20, [sp, #24]
		stur x21, [sp, #32]
		stur x22, [sp, #40]
		stur x23, [sp, #48]
		stur x30, [sp, #56]
		//x0 = board
		//x1 = get_within
		//x2 = major
		//save all parameters in callee saved registers:
		mov x17, x0
		//x17 is a copy of the board
		//x18 is a copy of the address of the get_within
		//x19 is a copy of the major variable
		mov x18, x1
		mov x19, x2
		//x20 = will be used for the for loop (i)
		mov x20, #0
		//x21 = "used" variable
		mov x21, #0
		//x22 = will be the return value of each get_within.

.for_loop:
//now we need to call get_within using x18 as the blr register
//x18 is the address of the get_within	
//make sure everything is in place first:
		cmp x20, #9
		b.ge .return_good

		mov x0, x17
		mov x1, x19
		mov x2, x20
		blr x18

		add x20, x20, #1

//for i = 0; i < 9; i++ 
		
	//cell = get_within(board, major, i)
		//blr x1

		mov x22, x0
//next we need to test the return value with others
//x22 = copy of the return value
		cmp x22, xzr
		b.le .for_loop
	//if cell > 0:

.greater_than:
//x23 = "bit_position" (new variable for a left shift)
		mov x4, #1
		//x4 = scratch (#1)
		lsl x23, x4, x22
		//bit_position = 1 << cell
		//remember - x21 is the "used" variable

		//x3 = scratch (used & bit_position)
		and x3, x23, x21
// != is NOT EQUALS
		//if used & bit_position != 0:
		
		cmp x3, xzr
		b.ne .return_bad

// | is logical OR
		//used = used | bit_position
		orr x21, x21, x23
		b .for_loop

.return_good:
		mov x0, #0
                b .return


.return_bad:
		mov x0, #1
		b .return

.return:
//.retrieve_registers:
		ldur x17, [sp, #0]
		ldur x18, [sp, #8]
		ldur x19, [sp, #16]
		ldur x20, [sp, #24]
		ldur x21, [sp, #32]
		ldur x22, [sp, #40]
		ldur x23, [sp, #48]
		ldur x30, [sp, #56]
		add sp, sp, #64

		ret

