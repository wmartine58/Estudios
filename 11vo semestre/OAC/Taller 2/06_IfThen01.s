# IfThen01.s
# 2016/05/19
# Ejercicios de sentencia if then
#

        .data
nombre: .asciiz "Dennys"
var1:   .word 6
var2:   .word 5
var3:   .word 0

        #Declaro main como una funcion global
        .globl main
		.text
# La etiqueta main representa el punto de partida		
main:   
        lw $t0, var1
        lw $t1, var2
		beq $t0, $t1, exit
		li $t2, 33
		sw $t2, var3
exit:		