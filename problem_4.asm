# CISC 340 - HW1
.data
	# store your initial values in the .data segment 
	a: .word 3
	b: .word 4
	D: .space 80
.text
	#  load them to the register file appropriately

	
	# Problem 4
	# Assume that the values of a, b, i, and j are in registers $s0, $s1, $t0, and $t1, respectively.
	# Also, assume that register $s2 holds the base address of the array D.
	# Assume that initial values should be: a=3, b = 4, and D should have 20 elements.
	# for(i=0; i<a; i++)
		# for(j=0; j<b; j++)
			# D[4*j] = i + j;
			
	# a = 3 @ $s0
	# b = 4 @ $s1
	# i @ $t0
	# j @ $t1
	# $s2 = D[20]
	
	lw $s0, a($zero) # a = 3
	lw $s1, b($zero) # b = 4
	la $s2, D # put address of D into $s2
	
	# Outer loop, for(i=0; i<a; i++)
	addi $t0, $zero, 0 # i = 0
	outerloop:
		bge $t0, $s0, exitouter # while i < a
		
		# Nested inner loop, for(j=0; j<b; j++)
		addi $t1, $zero, 0 # j = 0
		innerloop:
			bge $t1, $s1, exitinner # while j < b
			
			# D[4*j] = i + j;
			
			add $v0, $t0, $t1 # $v0 = i + j
			
			mul $v1, $t1, 4 # $v1 = 4*j to used in D[4*j]
			mul $v1, $v1, 4 # get byte address of index, (4*j) * 4
			
			sw $v0, D($v1) # D[4*j] = i + j
			
			addi $t1, $t1, 1 # j++
			j innerloop  # jump to top of inner loop
			
		exitinner:
			addi $t0, $t0, 1 # i++
			j outerloop # jump to top of outer loop
	
	
	exitouter:
	 	# exit syscall
		li $v0, 10
		syscall