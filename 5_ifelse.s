# 
#	Example for if-then-else structure
#		if (i == j)  f = g + h;
#		else 		 f = g - h;
#
#	Mission: 
#		(1) 가정: 변수 g와 h 값은 미리 고정. 콘솔에서 i 값과 j 값을 입력받아 계산 결과 출력하는 루틴을 완성하기
#		(2) 각 변수의 레지스터 매핑은 교재에 있는 예시를 따르기 바람
#
	.data
prompt_i:		.asciiz "Enter i: "
prompt_j:		.asciiz "Enter j: "
msg_result:		.asciiz "The result is: "
newline:		.asciiz "\n"
msg_exit:		.asciiz "\nExit\n"

	.globl	main

	.text
main:
	# prompt for input - printf("Enter i: ")
	li	$v0, 4
	la	$a0, prompt_i
	syscall

	# read in the value - scanf("%d", &i)
	li	$v0, 5
	syscall
	move $s3, $v0		# $s3 <- i
	
	# (1) prompt for input - printf("Enter j: ")
	li	$v0, 4
	la  $a0, prompt_j	
	syscall

	# (2) read in the value - scanf("%d", &j)
	#   - 변수 i 입력 예제를 참고해서 채울 것
	li	$v0, 5
    syscall
	move $s4, $v0       # $s4 <-j

	#  변수 g, h 값 결정 (li 의사명령어 사용)
	li  $s1, 4			# $s1 <- g
	li  $s2, 8			# $s2 <- h
	
	#########################################################
	# (3) 아래 구조의 코드 블록 완성하기
	#	
	#		if (i == j)  f = g + h;
	#		else 		 f = g - h;
    bne $s3, $s4, Else   # i != j -> 분기
    add $s1, $s1, $s2    # s1 에 값 저장
    j   Exit

Else:
    sub $s1, $s1, $s2
    j   Exit

Exit:
	#########################################################
	# printf("The result is: ")
	li	$v0, 4
	la	$a0, msg_result
	syscall	
	
	# (4) 결과값 출력 - printf("%d", f)
    li  $v0, 1
    move $a0, $s1
    syscall
	
	# Exit (프로그램 종료)
	# printf("\nExit\n")
	li	$v0, 4
	la	$a0, msg_exit
	syscall	
	
	li	$v0,10		# exit
	syscall

