# Logical01.s
# 2016/05/19
# Ejercicios con operaciones logicas: and or sll srl nor
#

        .data
var1:   .word 11
var2:   .word 10

        #Declaro main como una funcion global
        .globl main
		.text
# La etiqueta main representa el punto de partida		
main:   
        lw $t0, var1
        lw $t1, var2
        and $t2, $t0, $t1 
		or $t3, $t0, $t1 
