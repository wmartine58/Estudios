# Loop01.s
# 2016/05/19
# Ejercicios de loop
#

        .data
nombre: .asciiz "Dennys"
var1:   .word 1
var2:   .word 5
        #Declaro main como una funcion global
        .globl main
		.text
# La etiqueta main representa el punto de partida		
main:   
        lw $t0, var1
        lw $t1, var2
loop:       
		beq $t0, $t1, exit
		addi $t0, $t0, 1
		j loop
exit:		