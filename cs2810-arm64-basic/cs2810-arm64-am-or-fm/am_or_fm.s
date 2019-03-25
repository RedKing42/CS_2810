                .global am_or_fm

                .text
am_or_fm:
		//x0 = number we check for am or fm
		cmp x0, #535
		b.lt .fmif
		cmp x0, #1605
		b.gt .fmif
		mov x0, #1
		b .return
.fmif:
		cmp x0, #88
		b.lt .neither
		cmp x0, #108
		b.gt .neither
		mov x0, #2
		b .return
.neither:	
		mov x0, #0	
                b .return
.return:
		ret

