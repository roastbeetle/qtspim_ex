# Section 2.2
#	Example 1:  f = (g+h)-(i+j);
#	
#	Mission: 
#		(1) QtSpim 에서 정수값 입력을 위한 syscall 서비스를 이용해 정수값 g, h, i, j 를 콘솔에서 입력받고
#		(2) 교재의 예제 코드를 참조해서 위의 식을 계산해서 최종적으로 콘솔에 출력하는 루틴을 완성해 보기
#		(3) 각 변수의 레지스터 매핑은 교재에 있는 예시를 따르기 바람
#
#
	.data
promptg:	.asciiz "Enter an integer g : "
prompth:	.asciiz "Enter an integer h : "
prompti:	.asciiz "Enter an integer i : "
promptj:	.asciiz "Enter an integer j : "
str1:	.asciiz "The answer ((g+h)-(i+j)) is : "

	.globl	main
	
	.text
main:
	#
	# initialize (read values)
	#

	# prompt for input for g
	li	$v0, 4
	la	$a0, promptg
	syscall	
	# (1) $s1 <- g (using syscall #5 (read_int)
	li $v0, 5
	syscall
	move 	$s1, $v0

	# prompt for input for h (g 입력을 참조해서 채워 보시오.)
	li	$v0, 4
	la	$a0, prompth
	syscall	
	
	# (2) $s2 <- h using syscall #5 (read_int)
	li $v0, 5
	syscall
	move 	$s2, $v0

	# prompt for input for i (g 입력을 참조해서 채워 보시오.)
	li	$v0, 4
	la	$a0, prompti
	syscall	
	
	# (3) $s3 <- i using syscall #5 (read_int)
	li $v0, 5
	syscall
	move 	$s3, $v0

	# prompt for input for i (g 입력을 참조해서 채워 보시오.)
	li	$v0, 4
	la	$a0, promptj
	syscall	

	# (2) $s4 <- j using syscall #5 (read_int)
	li $v0, 5
	syscall
	move 	$s4, $v0
	
	# add, sub 명령을 이용해서 (g+h)-(i+j) 계산
	
	add $t1, $s1, $s2
	add $t2, $s3, $s4
	sub $t0, $t1, $t2

	# print result
	li	$v0, 4
	la	$a0, str1
	syscall	
	# 계산결과값을 콘솔로 출력하는 부분 추가할 것
	li	$v0, 1
	move	$a0, $t0 
	syscall	
	
	
	
	jr $ra 	