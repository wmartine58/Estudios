		.data
prompt:		.asciiz "¿Que desa hacer?\n0. Encriptar\n1. Desencriptar\nIntroduzca opcion: "
prompt2:	.asciiz "Por favor ingrse la cadena(max 10 caracteres): "
prompt3:	.asciiz "\nIngrese el numero de saltos: "
prompt4:	.asciiz "\nIngrese la direccion: "
msg1:		.asciiz "\nLa cadena cifrada es: "
msg2:		.asciiz "\nLa cadena descifrada es: "

string:			.space 11
encrypted_string:	.space 11
decoded_string:		.space 11
step:			.word 0
direction:		.word 0
flag:			.word 0	

minMay:		.word 65
maxMay:		.word 90
minMin:		.word 97
maxMin:		.word 122

	.text
	.globl main
main:
	jal inputFlag
	jal inputString
	jal inputStep
	jal inputDirection
	
	jal encode
	
	lw $t0, flag($0)
	beq $t0, $zero, showEncrypted
		la $a0, msg2
		li $v0, 4
		syscall
		la $a0, decoded_string
        	li $v0, 4        
        	syscall 
        	j exit
	showEncrypted:	# Muestra cadena cifrada
		la $a0, msg1
		li $v0, 4
		syscall
		la $a0, encrypted_string
        	li $v0, 4        
        	syscall 
		j exit
	
inputFlag:
	#Muestro mensaje
	la $a0, prompt
	li $v0, 4
	syscall
	
	#Solicito ingreso de flag
	la $a0, flag
	li $a1, 1
	li $v0, 5
	syscall
	
	#Almaceno dato
	move $t0, $v0
	sw $t0, flag
	
	jr $ra
	
inputString:
	#Muestro mensaje
	la $a0, prompt2
	li $v0, 4
	syscall
	
	#Solicito ingreso de incremento
	la $a0, string
	la $a1, 11
	li $v0, 8
	syscall
	
	jr $ra
	
inputStep:
	#Muestro mensaje
	la $a0, prompt3
	li $v0, 4
	syscall
	
	#Solicito ingreso de incremento
	la $a0, step
	li $a1, 1
	li $v0, 5
	syscall
	
	#Almaceno dato
	move $t0, $v0
	sw $t0, step
	
	jr $ra
	
inputDirection:
	#Muestro mensaje
	la $a0, prompt4
	li $v0, 4
	syscall
	
	#Solicito ingreso de direccion
	la $a0, direction
	li $a1, 1
	li $v0, 5
	syscall
	
	#Almaceno dato
	move $t0, $v0
	sw $t0, direction
	
	jr $ra

encode:
	la $s1, string
	la $s2, encrypted_string($0)
	lw $t1, step($0)
	lw $t2, direction($0)
	lw $t3, flag($0)
	
	beq $t3, $zero encrypt
		la $s2, decoded_string($0)
		j begin
	encrypt:
		la $s2, encrypted_string($0)
	
	begin:
	sub $sp, $sp, 12 
	while:
		lb $t0, ($s1)	#Cargo caracter de la cadena
		blez $t0, end_while	#Mientras no llege al fin de cadena(\0)
		
		#Mayuscula
		blt $t0, 65, end_upper	
		bgt $t0, 90, end_upper
			 
			sw $ra, 8($sp) 
			sw $t2, 0($sp)
			
			move $a0, $t0	#Caracter
			move $a1, $t2
			jal shift
			move $t0, $v0
			lw $ra, 8($sp) 
			lw $t2, 0($sp)
			
			sw $ra, 8($sp) 
			sw $t2, 0($sp)
			
			move $a0, $t0
			la $a1, minMay
			la $a2, maxMay
			jal validate
			move $t0, $v0
			lw $ra, 8($sp) 
			lw $t2, 0($sp)
			j guardar
		end_upper:
		
		#Minuscula 
		blt $t0, 97, end_lower
		bgt $t0, 122, end_lower
			sw $ra, 8($sp) 
			sw $t2, 0($sp)
			
			move $a0, $t0	#Caracter
			move $a1, $t2
			jal shift
			move $t0, $v0
			lw $ra, 8($sp) 
			lw $t2, 0($sp)
			
			sw $ra, 8($sp) 
			sw $t2, 0($sp)
			
			move $a0, $t0
			la $a1, minMin
			la $a2, maxMin
			jal validate
			move $t0, $v0
			lw $ra, 8($sp) 
			lw $t2, 0($sp)
		end_lower:
		
		guardar:
		sb $t0, ($s2)	#Almaceno caracter en la nueva cadena
		addi $s1, $s1, 1
		addi $s2, $s2, 1
		j while
	
	end_while:
	add  $sp, $sp, 12  
	jr $ra

# Parametros a recibir:
#	$a0: Caracter a desplazar
#	$a1: Direccion
# Retorna:
#	$v0: Caracter desplazado
shift:	
	move $v0, $a0		# $v0 = caracter
	move $t2, $a1		# $t2 = direccion
	lw $t0, step		# $t0 = incremento
	lw $t3, flag		# $t3 = flag
	
	xor $t2, $t3, $t2
	
	beq $t2, $zero, else
		sub $v0, $v0, $t0	#Desplazamiento hacia la izquierda
		j end_if
	else:
		add $v0, $v0, $t0	#Desplazamiento hacia la derecha
	end_if:
	
	jr $ra

# Parametros a recibir:
#	$a0: Caracter a validar
#	$a1: Valor minimo
#	$a2: Valor maximo
# Retorna:
#	$v0: Caracter validado
validate:
	move $v0, $a0		# $v0 = caracter
	lw $t1, 0($a1)		# $t1 = valor minimo
	lw $t2, 0($a2)		# $t2 = valor maximo
	
	bge $v0, $t1, next	# $v0 >= $t1
		add $v0, $v0, 26
		j salir
	next:
	ble $v0, $t2, salir	# $v0 <= $t2
		sub $v0, $v0, 26
				
	salir:
	jr $ra

exit:
	li $v0, 10
	syscall
