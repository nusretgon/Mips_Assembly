##########################################
# n = 2; x = 10; y = 20;
# for (i = 0; i < n; i++)
#      x += y;
# printf("%d", x)
##########################################

.data
n:		.word 2
x:		.word 10
y:		.word 20

.text
	.globl main
main:
	#-----------------------------------------------------------------
	lw $s1, n
	lw $s2, x
	lw $s3, y
	#-----------------------------------------------------------------
	sub $t1, $t1, $t1   # i = 0
LOOP:
	beq $t1, $s1, EXIT  # if (i == n) exit loop
	add $s2, $s2, $s3   # x += y
	addi $t1, $t1, 1    # i++
	j LOOP
EXIT:
	#-----------------------------------------------------------------
	add $a0, $zero, $s2
	li $v0, 1           # syscall number 1 will print int in $a0
	syscall
	li $v0, 10         # Syscall number 10 is to terminate the program
	syscall            # exit now
	#-----------------------------------------------------------------
