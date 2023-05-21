#if (a[i]<a[i+1])  a[i]=a[i+1]

.data
q5:			.asciiz "if (a[i]<a[i+1])  a[i]= "
index:		.word 1
a:			.word 2, 12, 3, 4, 5, 6, 7, 8, 9
.text
	.globl main
main:
	lw $s1, index
	la $s2, a

	sll $t1, $s1, 2			# $t1 = index * 4 byte
	add $s0, $s2, $t1		# a[i] = $s2 + $t1
	lw $a1,	0($s0)  		# a1 = a[i]

	addi $s1, $s1, 1		# i += 1
	sll $t1, $s1, 2			# $t1 = index * 4 byte
	add $s3, $s2, $t1		# a[i+1] = $s2 + $t1
	lw $a2,	0($s3)  		# a2 = a[i+1]

	slt $t2, $a1, $a2		# if a[i] < a[i+1] $t2 = 1 else $t2 = 0
	bne $t2, $zero, SWAP	# if $t2 != 0 go to SWAP
	beq $t2, $zero, PRINT	# if $t2 == 0 go to PRINT
	
SWAP:
	addi $s1, $s1, -2		# i -= 2
	sll $t1, $s1, 2			# $t1 = index * 4 byte
	add $s3, $s2, $t1		# a[i-1] = $s2 + $t1
	lw $a2,	0($s3)  		# a2 = a[i-1]
	sw $a2,	0($s0)  		
	lw $a1, 0($s0)
	addi $s4, $s4, 1		
	
PRINT:	
	li $v0, 4
	la $a0, q5
	syscall		
	
	li $v0, 1
	move $a0, $s1
	syscall	
	

	li $v0, 10				# terminate the program
	syscall
