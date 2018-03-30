        .data
array:   .asciiz "HolaMundo"
arreglo: .asciiz "EstoyAquiTratoDeAbarcar32BYTES"
sizer:   .word 9, 8, 7, 6, 100
bites:   .byte 0                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         4
        #Declaro main como una funcion global
        .globl main
		.text
# La etiqueta main representa el punto de partida		
main:   
		#li $t0, 0
		#li $t1, 0
		#li $t2, 0  #t2 no se esta empleando, se lo puede omitir para disminuir tiempo de ejecucion
		#li $t3, 0
		li $t4, 'y'
		#li $t5, 0
        la $a0,array
		lw $a1,sizer
		move $t0,$a0
		add $t1,$a0,$a1   #t1 es la direccion de la ultima posicion de la palabra
loopi:
        lb $t3,0($t0)
		sb $t4,0($t0)
		addi $t0,$t0,1
		slt $t5,$t0,$t1
		bne $t5,$zero,loopi
		j exit
exit:


#PCin es 4194308 (con el primer f10)
#PCfin es 4194408 (despues que se ejecuta todo el programa)
#PC se puede interpretar como numero de pasos del programa