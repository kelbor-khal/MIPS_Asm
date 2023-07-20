# realisation pseudo-instruction nori
# 20.07.23
# Filin I.A.
# version 1.0

	.data
num_0:	.word 0x00000001

	.text
	.globl main
main:
	# load address register
	addi $sp, $sp , -4
	sw   $ra, 0($sp)
	# load constant in $t1
	lw   $t1, num_0
	# realisation NORI:
	# nori $t0, 0xF234
	add  $t0, $0, $0 		# clear register
	ori  $t0, 0xF234 		# load half-word
	nor  $t0, $t0, $t1 		# nor instruction
	# print result
	move $a0, $t0
	li   $v0, 1
	syscall	 
	# load value register address
	lw   $ra, 0($sp)
	addi $sp, $sp, 4
	jr   $ra
	# end programm 