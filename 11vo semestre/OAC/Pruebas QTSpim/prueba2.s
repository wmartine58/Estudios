         .data
nombre1: .asciiz "wellington"
nombre2: .asciiz "martinez"
var1:   .word 9
var2:   .word 153

        .globl main
		.text
main:
la $t0, var1
la $a0, nombre1
#move $t1, $a0
lb $t3, 0($t0)
exit:
