# 
#	Lab for logical operations
#
#	Mission: 
#		(1) MIPS의 기본 논리연산 명령어를 이용해 실행해 보고 결과 확인
#		(2) 아래 예제를 실행한 결과 확인 (QtSpim의 Register 윈도우)
#		(3) Discussion 내용 제시
#
	.globl	main
	
	.text
main:
	# t0,t1, t2 변수
	# s0  shift
	# s1  and
	# s2  or
	# s3  not
	# s4  nor
 	# s5  xor

	# (1) Test for "sll"
	li $t0, 0x00000009  # $s0 = 0000 0000 0000 0000 0000 0000 0000 1001
	sll $s0, $t0, 4		# $t0 = $s0 << 4
	
	li $t1, 0x00000DC0	# $t1 = 0000 0000 0000 0000 0000 1101 1100 0000
	li $t2, 0x00003C00	# $t1 = 0000 0000 0000 0000 0011 1100 0000 0000

	# (2) Test for "and" 
	and $s1, $t1, $t2 
	
	# (3) Test for "or"
    or  $s2, $t1, $t2 
	
	# (4) Test for "not" (pseudo instrction으로 해 보기
    not $s3, $t1
	
	# (5) Test for "not" (nor instrction으로 해 보기)
    nor $s4, $t1, $zero	
	
	# (6) Test for "xor" (XOR 명령어도 추가해서 수행 결과 테스트해 보기)
    # A xor B = (nA&B)|(A&nB)
    nor $t4, $t1, $zero # $t4 = not A
    nor $t5, $t2, $zero # $t5 = not B
    and $t4, $t4, $t2   # $t4 = (notA) & B
    and $t5, $t5, $t1   # $t5 = (notB) & A
    or  $s5, $t4, $t5   # $s5 = $s1 | $s2

	# Exit
	li	$v0,10
	syscall
