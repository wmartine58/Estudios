# AddSub01.s
# 2016/05/19
# Ejemplo de add y sub
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
        add $t2, $t0, $t1
		sub $t3, $t1, $t0
		#sub $t3, $t0, $t1
