# translation of high-level language constructs into MIPS instructions

	.data

	.text
	.globl main
main:
	# load address register
	addi $sp, $sp , -4
	sw   $ra, 0($sp)
	# $s0 = g and $s1 = h
	# if(g > h) g = g + h;
	# else      g = g - h;

	# if(g >= h) g = g + 1;
	# else       h = h - 1;

	# if(g <= h) g = 0;
	# else       g = 0;

	# load value register address
	lw   $ra, 0($sp)
	addi $sp, $sp, 4
	jr   $ra
	# end programm