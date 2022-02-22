# 
#	Example for understanding Endiness (Byte-ordering)
#
#	Mission: 
#		(1) MIPS의 byte-ordering 에 대해 설명을 읽고 이해
#		(2) 아래 예제를 실행한 결과 확인 (QtSpim의 Register 윈도우와 Data Segment 윈도우 내용 확인)
#		(3) Discussion 내용 제시
#

	.data
worddata:	.word 	0x01234567
	
	.globl	main
	
	.text
main:
	la	$t0, worddata

    # word 단위로 읽어 보는 예제 (load 명령어 중 byte, halfword 단위로 읽어 오는 명령어를 사용해서 내용 추가 확인)
	lw  $s0, 0($t0)
	lb  $s1, 0($t0)
	lb  $s2, 1($t0)
	lb  $s3, 2($t0)
	lb  $s4, 3($t0)
	lh	$s5, 0($t0)
	lh  $s6, 2($t0)
	# check the contents of $s0



	
	# Exit
	li	$v0,10
	syscall
	