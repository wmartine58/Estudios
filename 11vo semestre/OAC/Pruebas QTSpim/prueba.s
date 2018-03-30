# IfThen01.s
# 2016/05/19
# Ejercicios de sentencia if then
#

         .data
nombre1: .asciiz "wellington"
nombre2: .asciiz "martinez"
var1:   .word 9
var2:   .word 153

        #Declaro main como una funcion global
        .globl main
		.text
# La etiqueta main representa el punto de partida		
main:   
        lw $s0, var2                 #4294967295 para 32 bits 255 para 8 bits
		lb $s1, var2
		#addi $t0,$t0,2               #addi rt, rs, valor: Carga la suma de rs con valor en rt, rs necesariamente
									 #debe ser una localidad de memoria, y valor un número (no etiqueta)
exit:
