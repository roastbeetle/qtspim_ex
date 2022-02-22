# 
#	Lab for comparison between signed vs. unsigned operations
#
#	Mission: 
#		(1) slt 와 sltu 실행 결과 비교 내용 이해 및 discussion 
#
#			
#
	.globl	main
	
	.text
main:
	li $s0, 0xffffffff	# $s0 = 1111 1111 1111 1111 1111 1111 1111
	li $s1, 0x00000001  # $s1 = 0000 0000 0000 0000 0000 0000 0001

	nor $t2, $s1, $zero
	addi $s2, $t2, 1 
	
	slt  $t0, $s0, $s1	# signed comparison
	sltu $t1, $s0, $s1	# unsigned comparison
	
	
	# Exit
	li	$v0,10
	syscall