.data
name:	.asciiz "Nusret!!! \n"
number:	.asciiz "1453"

.text
	.globl main
main:
	
	li $v0, 4          # pseudoinstruction: syscall number 4 will print string whose address is in $a0
	la $a0, name    # pseudoinstruction: load address of the string
	syscall            # pseudoinstruction: actually print the string

	li $v0,4
	la $a0,number
	syscall
	
	# exit
	li $v0, 10         # Syscall number 10 is to terminate the program
	syscall            # exit now
