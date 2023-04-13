.data
	msg: .asciiz "Insira a nota: "
	msg2: .asciiz "Insira a frequência: "
	apv: .asciiz "\nO aluno foi aprovado"
	rpv: .asciiz "\nO aluno foi reprovado"
	two: .float 2.0
	medium: .float 7.0
	freq: .float 75.0
	num: 5.0

.text
	li $v0, 4 
	la $a0, msg2
	syscall
	li $v0, 6 #frequência
	syscall
	mov.s $f5, $f0
	
	li $v0, 4 
	la $a0, msg
	syscall
	li $v0, 6 #nota 1
	syscall
	mov.s $f1, $f0
	
	li $v0, 4 
	la $a0, msg
	syscall
	li $v0, 6 #nota 2
	syscall
	mov.s $f2, $f0
	
	lwc1 $f4, two
	
	add.s $f3, $f1, $f2 #soma
	div.s $f3, $f3, $f4 #média
	
	lwc1 $f6, medium
	c.le.s $f3, $f6
	bc1t repproved
	
	lwc1 $f8, freq
	c.le.s $f5, $f8
	bc1f approved
	bc1t repproved
	
	approved:
		li $v0, 4
		la $a0, apv 
		syscall
		j exit
		
	repproved:
		li $v0, 4
		la $a0, rpv
		syscall
		j exit

	exit:
		li $v0, 10
		syscall