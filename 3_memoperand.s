# Section 2.3
#	Example:  g = h + A[8];
#
#	Mission: 
#		(1) 정수값 h를 콘솔에서 입력 받아서, 미리 정의된 배열 A[8]과 더한 결과를 출력하기
#		(2) 각 변수의 레지스터 매핑은 교재에 있는 예시를 따르기 바람
#

	.data
prompt_h:		.asciiz "Enter h: "
str1:			.asciiz "The answer is: "
arrayA:  		.word	0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15
	.globl	main
	
	.text
main:
	# prompt for input
	li	$v0, 4
	la	$a0, prompt_h
	syscall	
	
    # (1) 정수값 h 콘솔에서 입력받기
    li  $v0, 5
    syscall
    move $s0, $v0           # h = $s0

	# (2) 배열 원소 A[8] 값 읽어오기
    la  $t0, arrayA
    lw  $t1, 32($t0)         # A[8] = $t1
	 
	# (3) g = h + A[8] 계산하기
    add $s0, $s0, $t1
	
	# print result prompt
	li  $v0, 4
	la  $a0, str1
	syscall	
	# (4) 계산결과값 출력하기
	li  $v0, 1
    move $a0, $s0
	syscall	
	
	sw $s0, 32($t0)
	lw $t2, 32($t0)

	
	# Exit
	li	$v0,10
	syscall
	


