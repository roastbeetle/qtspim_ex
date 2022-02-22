# 
#	Template for Factorial(n)
#		
#
#

	.data
promptstr:		.asciiz "Enter a number: "
answerstr:		.asciiz "Factorial(n) is: "

	.globl	main
	
	.text
main:
	# prompt for input
	# printf("Enter a number: ")
	
	li $v0, 4           
    la $a0, promptstr
    syscall

	# read in the value
	# scanf("%d", &n)

    li $v0, 5           # n = $a0
    syscall
    move $a0, $v0
	
	# call fact(n)
	jal fact
	move $s1, $v0	# backup the return value to use syscall

	# printf("Factorial(n) is: ")에 해당하는 코드 완성

	li $v0, 4           
    la $a0, answerstr
    syscall

	# printf("%d", fact(n))에 해당하는 코드 완성

	li $v0, 1           
    move $a0, $s1
    syscall

	
	# Exit (프로그램 종료)
	li	$v0,10		# exit
	syscall
		
	###############################################################
fact:
	addi	$sp, $sp, -8  	# Adjust stack for 2 items
	sw		$ra, 4($sp) 	# Save return address
	sw		$a0, 0($sp)		# Save argument n	
	
	slti	$t0, $a0, 1    	# test for (n<1)
    beq		$t0, $zero, L1	# if (n>=1), goto L1
	
	addi	$v0, $zero, 1   # return 1
#	lw 		$a0, 0($sp)
#	lw 		$ra, 4($sp)	
    addi	$sp, $sp, 8   	# Pop 2 items from stack
	
	jr		$ra        		# Return to caller
	
L1: addi	$a0, $a0, -1    # if (n>=1), n-1 
	jal		fact         	# call fact (n-1), 주의: 복귀 지점은 ? ($ra 레지스터 내용 확인)

	lw		$a0, 0($sp)		# restore return address	
	lw		$ra, 4($sp)  	# restore original n    

    addi	$sp, $sp, 8		# pop 2 items from stack
	mul		$v0, $a0, $v0   # n * fact(n-1)
    jr 		$ra				# return to caller
	###############################################################
