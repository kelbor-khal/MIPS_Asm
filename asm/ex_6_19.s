# stcpy realisation
# 19.07.23
# Filin I.A.
# version 1.0

	.data
source_array: .asciiz "Hello, World! \n"
output_array: .space  20

	.text
	.globl main
main:
	# load address register
	addi $sp, $sp , -4
	sw   $ra, 0($sp)
	# print source array
	li   $v0, 4
	la   $a0, source_array
	syscall	
	# funct strcpy
	add  $a0, $0, $0
	la   $a0, source_array
	add  $a1, $0, $0
	la   $a1, output_array
	jal funct_strcpy 
	# print output array
	li   $v0, 4
	la   $a0, output_array
	syscall	
	# load value register address
	lw   $ra, 0($sp)
	addi $sp, $sp, 4
	jr   $ra
	# end programm

	
	# function copy array
funct_strcpy:
	add  $t0, $0, $0 		# clear register
	li   $t0, 0xA			# load byte - LF symbol
	add  $t1, $0, $0        # clear register
	lbu  $t1, 0($a0)		# load first symbol array
loo_copy:
	beq  $t1, $t0, end_copy  
	sb   $t1, 0($a1)		# load byte in output array
	addi $a0, $a0, 1 		# increment for 1 byte
	addi $a1, $a1, 1 		# increment for 1 byte
	lbu  $t1, 0($a0)		# load new byte   
	j    loo_copy
end_copy:
	jr   $ra
