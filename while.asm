.data 
	msg: .asciiz "\n"
	inputnum: .asciiz "input the value of X: "
	
.text 

	main:
        li $t0, 0       # $t0 é o incrementador 
	li $t1, 10
	
	loop: 
	beq $t1, $zero, exit
	li $v0, 4
	la $a0, inputnum
	syscall
	li $v0, 5
	syscall 
	move $t1, $v0
	add $t0, $t0, $t1     #incrementa 
	
	#print 
	li $v0, 1
	move $a0, $t0 
	syscall 
	li $v0, 4
	la $a0, msg
	syscall 
	j loop               
	
	exit: 
	li $v0, 10
	syscall