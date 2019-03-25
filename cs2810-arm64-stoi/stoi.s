                .global stoi
                .text
stoi:
                // your code goes here
		//x0 = address of the buffer in memory containing a text representation of an integer value
		//x1 = initial number
		mov x1, xzr
		//x2 = c or character that is read in from the address
		//x3 = offset of the buffer in memory
		mov x3, xzr
		//x4 = if the initial character is a minus sign, 1 for True, 0 for False
		mov x4, xzr
		//x5 = scratch of 10
		mov x5, #10

		ldrb w2, [x0, x3]
		cmp x2, #'-'
		b.eq .will_be_negative
		b .loop

.will_be_negative:
		mov x4, #1
		add x3, x3, #1
		b .loop

.loop:
		ldrb w2, [x0, x3]
		add x3, x3, #1
		b .check

.check:
		cmp x2, #'0'
		b.lt .is_negative
		cmp x2, #'9'
		b.gt .is_negative
		b .good_number

.good_number:
		sub x2, x2, #'0'
		mul x1, x1, x5
		add x1, x1, x2
		b .loop

.is_negative:
		cmp x4, #0
		b.eq .return
		cmp x4, #1
		b.eq .make_negative

.make_negative:
		sub x1, xzr, x1
		b .return

.return:
		mov x0, x1
		ret

