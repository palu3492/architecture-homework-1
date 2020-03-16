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
	
	# Problem 3
	# Generate MIPS instructions that accomplish the following:
	# int n = 10
	# int A[10]
	# while(n > 0){
	#	A[n-1] = 1 << n + b
	#	--n
	# }