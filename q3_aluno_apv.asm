.data
	msg: .asciiz "\nInsira a nota: "
	msg2: .asciiz "\nInsira a frequência: "
	msg3: .asciiz "\nInsira a quantidade de alunos: "
	apv: .asciiz "\nO aluno foi aprovado"
	rpv: .asciiz "\nO aluno foi reprovado"
	two: .float 2.0
	medium: .float 7.0
	freq: .float 75.0
	num: 5.0

.text
	move $t0, $zero
	li $v0, 4 
	la $a0, msg3
	syscall
	li $v0, 5
	syscall
	move $t1, $v0
	begin:
		beq $t0, $t1, exit
		addi $t0, $t0, 1
		
		li $v0, 4 
		la $a0, msg2
		syscall
		li $v0, 6 #frequência
		syscall
		mov.s $f5, $f0
	
		li $v0, 4 
		la $a0, msg
		syscall
		li $v0, 6 #nota 
		syscall
		mov.s $f1, $f0
	
		li $v0, 4 
		la $a0, msg
		syscall
		li $v0, 6 #nota 
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
		j begin
		
	repproved:
		li $v0, 4
		la $a0, rpv
		syscall
		j begin

	exit:
		li $v0, 10
		syscall
