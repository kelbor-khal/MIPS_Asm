# realisation swap register values
# 25.07.23
# Filin I.A.
# version 1.0

	.data
space_symb: .asciiz " "
new_str:    .asciiz "\n"
	.text
	.globl main
main:
	# save address register
	addi $sp, $sp, -4
	sw   $ra, 0($sp)
	# load imm constant in register
	li   $t0, 0x01234567
	li   $t1, 0x07654321
	# print source value's
	move $a0, $t0
	li   $v0, 1
	syscall
    la $a0, space_symb
	li   $v0, 4
	syscall
	move $a0, $t1
	li   $v0, 1
	syscall
	la $a0, new_str
	li   $v0, 4
	syscall
	# xor first
	xor  $t0, $t0, $t1
	# xor twice
	xor  $t1, $t1, $t0
	# xor thrid 
	xor  $t0, $t0, $t1 
	# print result swap
	move $a0, $t0
	li   $v0, 1
	syscall
	la   $a0, space_symb
	li   $v0, 4
	syscall
	move $a0, $t1
	li   $v0, 1
	syscall
	# back in stack
	lw   $ra, 0($sp)
	addi $sp, $sp, 4
	jr   $ra
