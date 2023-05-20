.data
a:			.word 12, 2, 3, 4, 5, 6, 7, 8, 9
text:		.asciiz "a[index]=a[index](2)+a[index+1](3)="
index:		.word 1


.text
	.globl main
main:

	lw $s1, index			
	la $s2, a		


	sll $t1, $s1, 2			# $t1 = index * 4 byte
	add $s0, $s2, $t1		# a[i] = $s2 + $t1
	lw $a1,	0($s0)  		# a1 = a[i] (2)
	
	addi $s1, $s1, 1		# i += 1
	sll $t1, $s1, 2			# $t1 = index * 4 byte
	add $s7, $s2, $t1		# a[i+1] = $s2 + $t1
	lw $a2,	0($s7)  		# a2 = a[i+1] (3)
		
	add $a1, $a1, $a2		# a[i] += a[i+1] (5)
	sw $a1, 0($s0)	

	li $v0, 4
	la $a0, text
	syscall		
	
	li $v0, 1
	move $a0, $a1
	syscall	
	

