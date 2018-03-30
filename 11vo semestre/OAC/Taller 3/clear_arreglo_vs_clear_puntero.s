# clear_arreglo_vs_punteros.s# 2016/06/02
# Autor: Jorge Ayala
# Ejemplo Array vs Pointer
#


        .data
Arreglo: .word 3, 0, 1, 2, 6, -2, 4, 7, 3, 7
Arreglo2: .word 3, 0, 1, 2, 6, -2, 4, 7, 3, 7
tamano: .word 10
msg:   .asciiz "Fin"


        #Declaro main como una funcion global
        .globl main
		.text
# La etiqueta main representa el punto de partida		
main:  
		#ARGUMENTOS DE FUNCION
		la $a0, Arreglo
		lw $a1, tamano
		jal clearArreglo
		la $a0, Arreglo2
		jal clearPuntero
		li $v0, 4       # syscall 4 (print_str)
        	la $a0, msg     # argument: string
        	syscall
		j salir
		
		
clearArreglo:
		addi $sp, $sp, -16
		sw $t0, 12($sp) 
		sw $t1, 8($sp) 
		sw $t2, 4($sp) 
		sw $t3, 0($sp) 
		move $t0, $zero # i = 0
		loop1:  sll $t1, $t0, 2 # $t1 = i * 4
      			add $t2, $a0, $t1  # $t2 = direccion de array [i]
       			sw $zero, 0($t2) # array[i] = 0
       			addi $t0, $t0, 1 # i = i + 1
       			slt $t3, $t0, $a1 # $t3 = (i < size)   slt set on less than
       			bne $t3, $zero, loop1 # si (i<size) ir a loop1
		lw $t3, 0($sp) 
		lw $t2, 4($sp) 
		lw $t1, 8($sp) 
		lw $t0, 12($sp) 
		addi $sp,$sp,16 


		jr $ra
		
clearPuntero:


		addi $sp, $sp, -16
		sw $t0, 12($sp) 
		sw $t1, 8($sp) 
		sw $t2, 4($sp) 
		sw $t3, 0($sp) 
		move $t0, $a0
		sll $t1,$a1,2
		add $t2,$a0,$t1
		loop2:  sw $zero, 0($t0)
       			addi $t0, $t0, 4 
       			slt $t3, $t0, $t2 
       			bne $t3, $zero, loop2 
		lw $t3, 0($sp) 
		lw $t2, 4($sp) 
		lw $t1, 8($sp) 
		lw $t0, 12($sp) 
		addi $sp,$sp,16 


		jr $ra


salir:
	
	


