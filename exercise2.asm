.data 
q4:			.asciiz "first i=1 if(a[i]>10) i=i+1 last i= "
a:			.word 12, 2, 3, 4, 5, 6, 7, 8, 9
index:		.word 1

.text
	.globl main
main:			
	lw $s1, index			
	la $s2, a		
	
	sll $t1, $s1, 2			# $t1 = index * 4 byte
	add $s0, $s2, $t1		# a[i] = $s2 + $t1
	lw $a1,	0($s0)  		# a1 = a[i]
	
	slt $t2, $t3, $a1		# if a[i] > 10 $t2 = 1 else $t2 = 0
	bne $t2, $zero, ADD
	beq $t2, $zero, END
	
ADD:
	addi $s1, $s1, 1
END:
	li $v0, 4
	la $a0, q4
	syscall	

	li $v0, 1
	move $a0, $s1
	syscall					
	

