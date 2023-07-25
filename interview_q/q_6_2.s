# search max subset in array
# 25.07.23
# Filin I.A.
# version 1.0
	.data
source_array: .space 40		
output_array:

	.text
	.globl main
main:
	addi $sp, $sp, -4
	sw   $ra, 0($sp)
	# load member array in memory
	la   $t0, source_array
	add  $t1, $0, $0
	addi $t1, 128
	sw   $t1, 0($t0) 
	addi $t0, $t0, 4
	# load member array in memory
	add  $t1, $0, $0
	addi $t1, 2
	sw   $t1, 0($t0) 
	addi $t0, $t0, 4
	# load member array in memory
	add  $t1, $0, $0
	addi $t1, 3
	sw   $t1, 0($t0) 
	addi $t0, $t0, 4
	# load member array in memory
	add  $t1, $0, $0
	addi $t1, -5
	sw   $t1, 0($t0) 
	addi $t0, $t0, 4
	# load member array in memory
	add  $t1, $0, $0
	addi $t1, 8
	sw   $t1, 0($t0) 
	addi $t0, $t0, 4
	# load member array in memory
	add  $t1, $0, $0
	addi $t1, 9
	sw   $t1, 0($t0) 
	addi $t0, $t0, 4
	# load member array in memory
	add  $t1, $0, $0
	addi $t1, 10
	sw   $t1, 0($t0) 
	addi $t0, $t0, 4
	# load member array in memory
	add  $t1, $0, $0
	addi $t1, -1
	sw   $t1, 0($t0) 
	addi $t0, $t0, 4
	# load member array in memory
	add  $t1, $0, $0
	addi $t1, 11
	sw   $t1, 0($t0) 
	addi $t0, $t0, 4
	# load member array in memory
	add  $t1, $0, $0
	addi $t1, 128
	sw   $t1, 0($t0) 
	addi $t0, $t0, 4
	# call function search max subset
	add  $a0, $0, $0
	addi $a1, $0, 40
	la   $a0, source_array
	jal  funct_subset
	#print result
	add  $a0, $0, $0
	add  $a0, $v0, $0
	li   $v0, 1
	syscall
	# back in stack
	lw   $ra, 0($sp)
	addi $sp, $sp, 4
	jr   $ra

# function find max subset in array
funct_subset:
	add  $t1, $0, $0
	add  $t0, $0, $0
	add  $t0, $0, $0    		# accum_next
	add  $t1, $0, $0    		# counter
	add  $v0, $0, $0 			# clear accum
loop:
	beq  $a1, $t1, end_cycle
	lw   $t2, 0($a0)
	addi $a0, $a0, 4 			# shift address
	blez $t2, negative_number	# searched negative num
	add  $t0, $t0, $t2
	addi $t1, $t1, 4
	j    loop
negative_number:
	slt  $t3, $v0, $t0			# check value
	beq  $t3, $0, no_less	    # v0 < t0
	move $v0, $t0				# v0 = t0
no_less:
	add  $t0, $0, $0            # t0 = 0
	addi $t1, $t1, 4
	j    loop
end_cycle:
	jr   $ra