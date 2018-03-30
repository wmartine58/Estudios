# LoadStore01.s
# 2016/05/19
# Ejercicios de load y store
#

        .data
var1:   .word 10
var2:   .word 20
var3:   .word 30
var4:   .word 40
        #Declaro main como una funcion global
        .globl main
		.text
# La etiqueta main representa el punto de partida		
main:   
        lw $t0, var1
        lw $t1, var2
        lw $t2, var3
        #li $t2, 33
		sw $t2, var4
