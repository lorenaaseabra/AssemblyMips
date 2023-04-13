.data
	Numero1:.asciiz "Digite a nota 1:"
	Numero2: .asciiz "Digite a nota 2:"
	media:.asciiz"A media eh: "
	frequencia:.asciiz"Digite a frequencia:"
	resultado:.asciiz"Voce esta "
	pula:.asciiz"\n"
	aprovado:.asciiz"Aprovado"
	reprovado:.asciiz"Reprovado"
	
.text

	
	li $v0, 4
	la $a0, Numero1
	syscall
	
	la $a0, pula		
	li $v0, 4		
	syscall
	
	li $v0, 5
	syscall
	
	move $t0, $v0
	
	
	
	li $v0, 4
	la $a0, Numero2
	syscall
	
	la $a0, pula		
	li $v0, 4		
	syscall
	
	li $v0, 5
	syscall
	
	move $t1, $v0
	
	
	
	li $v0, 4
	la $a0, frequencia
	syscall
	
	la $a0, pula		
	li $v0, 4		
	syscall
	
	li $v0, 5
	syscall
	
	move $t2, $v0
	
	add $t3, $t0, $t1
	div $t3, $t3, 2
	
	
	
	#printf da media
	li $v0, 4
	la $a0, media
	syscall
	
	
	li $v0, 1
	move $a0, $t3
	syscall
	
	la $a0, pula		
	li $v0, 4		
	syscall
	
	bge $t3, 7, VerAprov
	li $v0, 4
	la $a0, reprovado
	syscall
	
	li $v0, 10
	syscall
	
	VerAprov:
		bge $t2, 75, VerFreq
		li $v0, 4		
		la $a0, reprovado
		syscall
		
		li $v0, 10
		syscall
		
	VerFreq:
		li $v0, 4
		la $a0, aprovado
		syscall