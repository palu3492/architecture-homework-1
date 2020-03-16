.data
	a: .word 3
	b: .word 4
	D: .space 80
.text
	lw $s0, a($zero)
	lw $s1, b($zero)
	la $s2, D
	
	addi $t0, $zero, 0
	outerloop:
		bge $t0, $s0, exitouter

		addi $t1, $zero, 0
		innerloop:
			bge $t1, $s1, exitinner
			
			add $v0, $t0, $t1
			mul $v1, $t1, 4
			mul $v1, $v1, 4
			sw $v0, D($v1)
			
			addi $t1, $t1, 1
			j innerloop
			
		exitinner:
			addi $t0, $t0, 1
			j outerloop
	
	exitouter:
		li $v0, 10
		syscall