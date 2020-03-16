# CISC 340 - HW1
.data
	# store your initial values in the .data segment 
	a: .word 1
	b: .word 2
	c: .word 3
	d: .word 4
.text
	#  load them to the register file appropriately
	lw $t0, a($zero) # t0 = 1
	lw $t1, b($zero) # t1 = 2
	lw $t2, c($zero) # t2 = 3
	lw $t3, d($zero) # t3 = 4
	
	# Problem 1
	# Generate MIPS instructions that compute a = b - (c – d)
	sub $t4, $t2, $t3 # t4 = c - d = -1
	sub $t0, $t1, $t4 # a = b - (c-d) = 3