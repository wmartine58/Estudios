#Autores:
#Alex Ferrin
#Julio Larrea
#Neycker Aguayo

        .data
array:   .asciiz "Holaz"
sizer:   .word 5


        #Declaro main como una funcion global
        .globl main
		.text
# La etiqueta main representa el punto de partida		
main:   
        la $a0,array
		lw $a1,sizer
		move $t0,$a0
		add $t1,$a0,$a1   #t1 es la direccion de la ultima posicion de la palabra
		add $t2,$t1,$a1   #t2 es la direccion de la ultima palabra de la nueva cadena sumada
		addi $t2,$t2,-1
loopi:
        lb $t3,0($t0)
		slti $t4, $t3, 91
		jal comprobator
		sb $t3,0($t2)
		addi $t0,$t0,1
		addi $t2,$t2,-1
		slt $t5,$t0,$t1
		bne $t5,$zero,loopi
		j exit
		
comprobator:
		beq $t4,$zero,mayusquer
		jr $ra
mayusquer:
		addi $t3,$t3,-32
		sb $t3,0($t0)
		jr $ra	
exit: