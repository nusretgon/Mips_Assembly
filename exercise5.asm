# if (i<x) i = x;
# else i=y;
.data
i:			.word 0
x:			.word 3
y:			.word 4
q1:			.asciiz "if (i<x) i=x else i=y  "

.text
	.globl main
main:
	lw $s0, i
	lw $s1, x
	lw $s2, y

	slt $t0, $s0, $s1		# if (i < x) $t0 = 1 else $t0 = 0
	bne $t0, $zero, SWAP	# if $t0 = 1 go to FUNC1
	move $s0, $s2			# if $t0 = 0 $s0 = $s2
	j END
SWAP:
	move $s0, $s1
END:
	li $v0, 4
	la $a0, q1
	syscall	

	li $v0, 1
	move $a0, $s0		# i=x
	syscall

	li $v0, 10
	syscall					# terminate the program