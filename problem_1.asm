# CISC 340 - HW1
.data
	# store your initial values in the .data segment 
	a: .word 1
	b: .word 2
	c: .word 3
	d: .word 4
.text
	#  load them to the register file appropriately
	lw $t0, a($zero) # $t0 = 1
	lw $t1, b($zero) # $t1 = 2
	lw $t2, c($zero) # $t2 = 3
	lw $t3, d($zero) # $t3 = 4
	
	# Problem 1
	# Generate MIPS instructions that compute a = b - (c – d)
	# After execution: a = 3
	
	# Store c - d in register $v0
	sub $v0, $t2, $t3 # $v0 = c - d = -1
	# Store b - (c - d) in $t0, which holds a
	sub $t0, $t1, $v0 # a = b - (c - d) = 3
	
	# Exit
	li $v0, 10
	syscall