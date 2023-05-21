# for (i=0;i<n;i++){
#	x+=y; }
#

.data
i:			.word 0
x:			.word 3
y:			.word 4
n:			.word 8
q2:			.asciiz "for(i=0;i<n;i++) x+=y  "

.text
	.globl main
main:
	lw $s0, i
	lw $s1, x
	lw $s2, y
	lw $s3, n

	LOOP:	
	slt $t0, $s0, $s3		# if i < n $t0 = 1 else $t0 = 0
	beq $t0, $zero, END1	# if $t0 == 0 go to END1
	add $s1, $s1, $s2		# x += y
	addi $s0, $s0, 1		# i++
	j LOOP
END1:
	li $v0, 4
	la $a0, q2
	syscall	

	li $v0, 1               # x=x(3)+8*y(3)=35
	move $a0, $s1			
	syscall	

	li $v0, 10
	syscall	
