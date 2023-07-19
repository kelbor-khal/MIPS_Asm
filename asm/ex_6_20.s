# realisation function find number in array
# 17.07.23
# Filin I.A.
# version 1.0

	.data
array_int:  .space 256
new_string: .asciiz "\n"

	.text
	.globl main
main:
	# load adress register in stack
	addi $sp, $sp, -4
	sw   $ra, 0($sp)
	# call function added number's
	la   $a0, array_int
	jal  funct_load
	# print cycle value from syscall (debug)
	# la   $a0, array_int
	# jal  funct_print
	# search number 42 in array
	la   $a0, array_int
	add  $a1, $0, $0
	addi $a1, $a1, 256 
	jal  funct_search
	# print check result
	add  $a0, $0,  $0 
	add  $a0, $a0, $v0
	li   $v0, 1
	syscall
	# stored address register in stack
	lw   $ra, 0($sp)
	addi $sp, $sp, 4
	jr   $ra
	# end programm


	# function load data in array
funct_load:
	add  $t0, $t0, $0 		# counter
	addi $t1, $t1, 256		# lenght array
cycle_load:
	beq  $t0, $t1, end_load
	sw   $t0, 0($a0)
	addi $a0, $a0, 4		#increment address
	addi $t0, $t0, 4
	j    cycle_load
end_load:
	jr $ra


	# function cycle print from syscall
funct_print:
	add  $t0, $t0, $0 		# counter
	addi $t1, $t1, 256		# lenght array
	add  $t2, $a0, $0 		# copy first argument
cycle_print:
	beq  $t0, $t1, end_print
	li   $v0, 1
	lw   $a0, 0($t2)
	syscall
	li   $v0, 4
	la   $a0, new_string
	syscall
	addi $t2, $t2, 4		# increment address
	addi $t0, $t0, 4 		# increment value		
	j cycle_print
end_print:
	jr $ra
	

	#function search number 42 in array
funct_search:
	add  $t0, $0, $0 		# counter
	add  $t2, $t2, $0 		# check
	addi $t3, $t3, 16
loop_find:
	beq  $t0, $a1, end_find
	lw   $t4, 0($a0)		# load word
	beq  $t3, $t4, find
	addi $a0, $a0, 4 		# increment address
	addi $t0, $t0, 1 		# increment index
	j loop_find
end_find:
	add  $v0, $0,  $0 
	addi $v0, $v0, -1
	j end_funct
find:
	add  $v0, $0,  $0 
	add  $v0, $v0, $t0
end_funct:
	jr   $ra

	
