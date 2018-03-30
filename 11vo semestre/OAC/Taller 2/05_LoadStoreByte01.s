# LoadStoreByte01.s
# 2016/05/19
# Ejercicios de load y store byte
#

        .data
var1:   .asciiz "Hola"
var2:   .word 20
var3:   .word 30
var4:   .word 40
        #Declaro main como una funcion global
        .globl main
		.text
# La etiqueta main representa el punto de partida		
main:   
        la $t0, var1 # t0 contiene la direccion de var1
        li $t1, 'a'
        lb $t2, 0($t0)
		sb $t1, 1($t0)
