# CISC 340 - HW1
.data
	# store your initial values in the .data segment 
	a: .word 1
	b: .word 2
	c: .word 3
	d: .word 4
	array: .space 40
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
	
	# n = 10
	addi $t4, $zero, 10 # $t4 = 10
	addi $t5, $zero, 4 # $t5 = 4, use this to multiply by n to index into array
	addi $t6, $zero, 1 # $t6 = 1, use this for the bit shifting left
	
	while:
		# while(n > 0)
		ble $t4, 0, exit # if n becomes less than or equal to 0 then exit
		
		# subtract 1 from n, for the array indexing A[n-1]
		subi $t8, $t4, 1 # $t8 = n - 1
		
		# multiply n by 4 to get address of index because byte addressable
		mul $t7, $t5, $t8 # $t7 = n * 4
		
		# store n + b to be used in bit shifting left
		add $v0, $t4, $t1 # $v0 = n + b
		
		# bit shift 1 by n + b: 1 << n + b
		sllv  $v1, $t6, $v0 # $v1 = 1 << n + b
		
		# store bit shifted value into array at n - 1
		sw $v1, array($t7) # A[n-1] = 1 << n + b
		
		# decrement n
		subi $t4, $t4, 1 # --n
		
		j while # jump back to top of loop
	
	exit:
		li $v0, 10 # $v0 = 10 is terminate execution, syscall looks in $v0 for code
		syscall