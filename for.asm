.data 
	msg: .asciiz "\n"

.text
	#for
	move $s0, $zero #i = 0 ($s0 é i)
	li $a1, 10
	
	LOOP: 
	slt $t0, $s0, $a1 #t0 = 0 se #s0 <= $s3 ( i<=n), t0 = 1 caso contrario
	beq $s0, $a1, EXIT 
	
	#contador 
	addi $s0, $s0, 1
	
	#print 
	li $v0, 1
	move $a0, $s0 
	syscall 
	li $v0, 4
	la $a0, msg
	syscall 
	j LOOP #volta p loop 
	
	EXIT: 
	li $v0, 10
	syscall
	
