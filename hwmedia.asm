.data
	msg: .asciiz "informe sua nota 1: n"
	msg2: .asciiz "informe sua nota 2: \n"
	media: .asciiz "media: \n"
.text

#nota 1
	li $v0, 4 																				
	la $a0, msg
	syscall
	
	li $v0, 6
	syscall

	li $v0, 2
	mov.s $f12, $f0
	syscall
#nota 2 
	li $v0, 4 
	la $a0, msg2
	syscall
	
	li $v0, 6
	syscall

	li $v0, 2
	mov.s $f12, $f0
	syscall