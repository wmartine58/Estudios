        .data
var1:   .word 1#g
var2:   .word 2#h
var3:   .word 3#i
var4:   .word 4#j
varResultado:   .word 0
        #Declaro main como una funcion global
        .globl main
		.text
# La etiqueta main representa el punto de partida		
main:  
		#ARGUMENTOS DE FUNCION
		lw $a0, var1
		lw $a1, var2
		lw $a2, var3
		lw $a3, var4
		jal leafExample# LLAMO A LA FUNCION
		sw $v0, varResultado 
		j exit
		
leafExample:
				#addi $sp, $sp, –12 # adjust stack to make room for 3 items
				addi $sp, $sp, -12
				sw $t1, 8($sp) # save register $t1 for use afterwards
				sw $t0, 4($sp) # save register $t0 for use afterwards
				sw $s0, 0($sp) 
				#REALIZO LAS OPERACIONES CON REGISTROS TEMPORALES
				add $t0, $a0, $a1
				add $t1, $a2, $a3
				add $s0,$t0,$t1 # 
				add $v0,$s0,$zero # returns f ($v0 = $s0 + 0)
				lw $s0, 0($sp) # restore register $s0 for caller
				lw $t0, 4($sp) # restore register $t0 for caller
				lw $t1, 8($sp) # restore register $t1 for caller
				addi $sp,$sp,12 # adjust stack to delete 3 items
				jr $ra
exit:	
	li $v0, 10 #loads op code into $v0 to exit program     #El registro 0 lo utiliza el sistema para ejecutar una funcionalidad, por medio de syscall
	syscall #reads $v0 and exits program