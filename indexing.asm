.data
array:		.word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
index:		.word 3

.text
	.globl main
main:
	la $s0, array       # load address of array into $s0
	lw $s1, index       # load value stored at index into $s1

	sll $t0, $s1, 2     # $t0 = index * 4
	add $s2, $s0, $t0   # array[index] = $t0 + $s0
	lw $a0, 0($s2)      # $a0 = array[index]
	
	#print statement
	li $v0, 1           # syscall number 1 will print int in $a0
	syscall
	
	# exit
	li $v0, 10         # Syscall number 10 is to terminate the program
	syscall            # exit now
