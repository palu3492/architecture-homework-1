# CISC 340 - HW1
.data
	# store your initial values in the .data segment 
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
	
	addi $s0, $zero, 3 # a = 3
	addi $s1, $zero, 4 # b = 4
	la $s2, D # put address of D into $s2
	
	# First loop
	addi $t0, $zero, 0 # i = 0
	loop1:
		bge $t0, $s0, exit # while i < a
		
		
		addi $t0, $t0, 1 # i++
		j loop1 # jump to top of loop
	
	
	# Inner loop
	addi $t1, $zero, 0 # j = 0
	loop2:
		bge $t1, $s1, exit # while j < b
		
		addi $t1, $t1, 1 # j++
		j loop1  # jump to top of loop
	
	
	exit:
	 	# exit syscall
		li $v0, 10
		syscall