.data
	Numero1:.asciiz "Digite a nota 1:"
	pula: .asciiz "\n"
	msg: .asciiz "voce precisa de: "
	
.text

	main: 
	li $v0, 4
	la $a0, Numero1
	syscall
		
	li $v0, 4		
	la $a0, pula	
	syscall
	
	li $v0, 5
	syscall
	
	move $t0, $v0
	
	jal media
	
	li $v0, 10
	syscall
	
	
	#calculo media se av1 -> sum maior igual a 14 
	media: 
	li $t1, 14
	sub $t2, $t1, $t0 # t5 = t4(14) - t0(av1)
	
	li $v0, 4
	la $a0, msg
	syscall
	
	li $v0, 1
	move $a0, $t2
	syscall 
	
	la $a0, pula		
	li $v0, 4		
	syscall
	
	jr $ra 
	
	
	
	
	
	

	
	 
	
	
	
	
	