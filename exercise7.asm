# while (array[i]<n)
#	i++;

.data

array:		.word 0, 1, 2, 3, 4, 3, 6, 7, 8, 9, 10
i:			.word 0
n:			.word 8
q3:			.asciiz "while(array[i]<n) i++; "
length:		.word 11

.text
	.globl main
main:
	lw $s0, i
	lw $s1, n
	la $s2, array
	lw $s3, length

LOOP:
	sll $t1, $s0, 2			# $t1 = index * 4 byte
	add $s4, $s2, $t1		# a[i] = $s2 + $t1
	lw $a1, 0($s4)			# $a1 = $s4

	slt $t0, $a1, $s1		# if array[i] < n $t0 = 1 else $t0 = 0
	beq $t0, $zero, END	# if $t0 == 0 go to FUNC4

	slt $t0, $s0, $s3		# if i < arraysize $t0 = 1 else $t0 = 0
	beq $t0, $zero, END	
	addi $s0, $s0, 1		# i++
	j LOOP
END:
	li $v0, 4
	la $a0, q3
	syscall	

	li $v0, 1               
	move $a0, $s0			# The number of loop is 8 so solution is 8
	syscall	

	li $v0, 10
	syscall					# terminate the program
	
