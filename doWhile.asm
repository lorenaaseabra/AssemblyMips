.data 
	msg: .asciiz "\n"
	inputnum: .asciiz "input the value of X: "
	
.text 

	main:
        li $t0, 0       # $t0 é o incrementador 
	li $t1, 10
	
	loop: 
	li $v0, 4
	la $a0, inputnum
	syscall 
	         
	li $v0, 5
	syscall 
	move $t1, $v0
	
	li $v0, 4
	la $a0, msg
	syscall
	
	add $t0, $t0, $t1
	
	beq $t1, $zero, exit
	
	li $v0, 1
	move $a0, $t0 
	syscall 
	
	j loop      

	
	exit: 
	li $v0, 10
	syscall