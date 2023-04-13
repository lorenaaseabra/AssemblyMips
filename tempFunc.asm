#q2 - fa�a um programa que leia a temperatura em graus celsius, 
#converta e exiba o valor da temperatura em graus Fahrenheit

.data
	msg: .asciiz "Insira o valor em Celsius: "
	out: .asciiz "Valor em Fahrenheit: "
	num: .float 1.8
	zero: .float 0.0
	num2: .float 32
.text
	main: 
	li $v0, 4
	la $a0, msg	
	syscall
	
	li $v0, 6
	syscall
	jal result
	
	result:
	lwc1 $f1, num
	lwc1 $f2, zero
	lwc1 $f3, num2
	mul.s $f2, $f1, $f0
	add.s $f2, $f2, $f3
	
	li $v0, 4
	la $a0, out	
	syscall
	
	li $v0, 2
	mov.s $f12, $f2
	syscall
	