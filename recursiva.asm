.data
	msg: .asciiz "Digite um numero e o retorno será o fatorial dele: "

.text	
	li $t3, 1
	li $t0, 1

.main:
	li $v0, 4 
	la $a0, msg
	syscall 

	li $v0, 5 
	syscall
		
	move $t1, $v0
	jal fat
			
fat:
  	beq $t0, $t1, exit 
 	addi  $t0, $t0, 1	
  	mult $t3, $t0 
  	mflo $t3
  	j fatorial
  		
 exit:
  	move $a0, $t3
  	li $v0, 1 
	syscall 		

	li $v0, 10
	syscall

	