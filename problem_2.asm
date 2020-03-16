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
	
	# Problem 2
	# Generate MIPS instructions that compute a = 15 * (b + c)
	# Three instructions, no multiplication
	# After execution: a = 75
	
	# Store b + c in register $v0
	add $v0, $t1, $t2 # $v0 = b + c = 5
	# Store 15 in register $t4
	addi $t4, $zero, 15 # $t4 = 15
	# Store 15 * (b + c) in $t0, which is a
	mul $t0, $t4, $v0 # a = 15 * (b + c) = 75
	
	# Exit
	li $v0, 10
	syscall