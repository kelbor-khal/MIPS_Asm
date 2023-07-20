# fibonacсi sequence
# 20.07.23
# Filin I.A.
# version 1.0
	.data
num_source: .word 9

	.text
	.globl main
main:
	# stored address register 
	addi $sp, $sp, -4
	sw   $ra, 0($sp)

	# calculate num sequence fiboncci
	lw   $a0, num_source
	jal  funct_fibonacci

	# print result calculated
	add $a0, $v0, $0
	li  $v0, 1
	syscall

	# load address register
	lw   $ra, 0($sp)
	addi $sp, $sp, 4

	# return control
	jr   $ra

	#end programm

	# function calculate fibonacci sequence
funct_fibonacci:
	addi $t0, $t0, 1 			# a == 1
	addi $t1, $t1, 2

	beq  $a0, $t0, output_1		# chec equal 1
	beq  $a0, $t1, output_1		# chec equal 2

	add  $t1, $0, $0 			
	addi $t1, $t1, 1 			# b == 1

	addi $t3, $0, 3 			# counter == 3
loop:
	beq  $a0, $t3, equal_cnt	# i == num 
	slt  $t4, $a0, $t3
	bne  $t4, $0,  end_cycle
equal_cnt:
	add  $t2, $t0, $t1 			# c = a + b
	move $t0, $t1 				# a = b
	move $t1, $t2 				# b = c
	addi $t3, $t3, 1 			# i ++
	j    loop

end_cycle:
	add  $v0, $0, $0
	add  $v0, $t1, $0 			# return value b
	jr   $ra

output_1:
	add  $v0, $0, $0
	addi $v0, $v0, 1 			# return 1
	jr   $ra
