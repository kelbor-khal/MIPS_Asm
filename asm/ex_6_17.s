# translation of high-level language constructs into MIPS instructions

	.data

	.text
	.globl main
main:
	# load address register
	addi $sp, $sp , -4
	sw   $ra, 0($sp)
	# load value's
	li   $s0, 0x01234
	li   $s1, 0x01235
	
	# $s0 = g and $s1 = h
	slt  $t0, $s1, $s0
	beq  $t0, $0   else_first
	# if(g > h) g = g + h;
	add  $s0, $s0, $s1
	j 	 continue_first
	# else      g = g - h;
else_first:
	sub  $s0, $s0, $s1
continue_first:

	# $s0 = g and $s1 = h
	beq  $s0, $s1, if_twice 
	slt  $t0, $s1, $s0
	beq  $t0, $0   else_twice
	# if(g >= h) g = g + 1;
if_twice:
	addi $s0, $s0, 1
	j    continue_twice
	# else       h = h - 1;
else_twice:
	addi $s1, $s1, -1
continue_twice:	

    # $s0 = g and $s1 = h
	beq  $s0, $s1, if_thrid
	slt  $t0, $s0, $s1
	beq  $t0, $0,  else_thrid
	# if(g <= h) g = 0;
if_thrid:
	move $s0, $0
	# else       h = 0;
else_thrid:
	move $s1, $0
	
	# load value register address
	lw   $ra, 0($sp)
	addi $sp, $sp, 4
	jr   $ra
	# end programm