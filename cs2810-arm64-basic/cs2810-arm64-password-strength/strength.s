                .global strength

                .text
strength:
		b .load_values

		//x0 = return strength
		//x1 = length score
		//x2 = lower char score
		//x3 = upper char score
		//x4 = digit score
		//x5 = symbol score
		//x7 = value of char
		//x8 = count of char moved

.load_values:
		mov x8, #0
		mov x5, #0
		mov x4, #0
		mov x3, #0
		mov x2, #0
		mov x1, #0
		b .main_loop

.main_loop:
		ldrb w7, [x0, x8]
		b .check_values

.check_values:
		cmp x7, #0
		b.eq .end
		add x8, x8, #1
		b .check_number
		

.end:
		cmp x8, #16
		b.ge .sixteen
		cmp x8, #12
		b.ge .twelve
		b .score

.score:
		add x0, x1, x2
		add x0, x0, x3
		add x0, x0, x4
		add x0, x0, x5
		b .return		

.return:
		ret

.sixteen:
		mov x1, #2
		b .score
.twelve:
		mov x1, #1
		b .score
		//do a loop for all characters on this:
.check_number:
		cmp x7, #'0'
		b.lt .none
		cmp x7, #'9'
		b.gt .upper_test
		mov x4, #1
		b .main_loop

.upper_test:
		cmp x7, #'A'
		b.lt .none
		cmp x7, #'Z'
		b.gt .lower_test
		mov x3, #1
		b .main_loop

.lower_test:
		cmp x7, #'a'
		b.lt .none
		cmp x7, #'z'
		b.gt .none
		mov x2, #1
		b .main_loop

.none:
		mov x5, #1
		b .main_loop
		
