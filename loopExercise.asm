#######
#for (i=0;i<n;i=i+2){
#	x=x-y;
#}
#	printf(x)
#######


.data
n:		.word 5
x:		.word 110
y:		.word 10

.text
	.globl main
main:
	# Assignment
	lw $s1, n 
	lw $s2, x
	lw $s3, y
	
	sub  $t1, $t1, $t1    # i = 0 counter value
LOOP:
	bgt $t1, $s1, EXIT 	  # i<n check   
	sub $s2, $s2, $s3     # x=x-y
	addi $t1, $t1, 2      # i=i+2   
	j LOOP
EXIT:
	#-----------------------------------------------------------------
	add $a0, $zero, $s2	  # $a0=0+x(new)
	li $v0, 1             # syscall number 1 will print int in $a0
	syscall
	li $v0, 10            # Syscall number 10 is to terminate the program
	syscall               # exit now
	#-----------------------------------------------------------------