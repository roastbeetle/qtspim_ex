# 
#	Example for while loop
#		while (save[i] == k)
#			i = i + 1;
#
#	Mission: 
#		(1) 가정: 정수 배열 save[] 값은 미리 결정되어 있음. 비교를 위한 변수 k는 콘솔에서 입력
#		(2) 배열 검사는 i=0 부터 시작
#		(3) 비교 과정에서 인덱스가 배열 크기를 넘는지 검사하는 코드 추가
#		(4) 각 변수의 레지스터 매핑은 교재에 있는 예시를 따르기 바람
#

	.data
promptstr:		.asciiz "Enter k: "
msg_exit:		.asciiz "Exit\n"
msg_Erro:       .asciiz "IndexOut_Error"
arraylen:		.word	10
# save[] 배열의 내용은 테스트 시나리오에 따라 변경 (다양한 시나리오에 대해 해 보기)

#save:		.word 	1, 1, 1, 1, 0, 5, 6, 7, 8, 9	# int save[10]
#save:		.word 	1, 1, 1, 1, 1, 0, 1, 1, 1, 1	# int save[10]
save:		.word 	0, 0, 0, 0, 0, 0, 0, 0, 0, 0	# int save[10]

	.globl	main
	
	.text
main:
	# 주소값을 갖는 레지스터는 tn, 변수 혹은 인자를 갖는 레지스터는 sn 을 사용
	# prompt for input
	# printf("Enter k: ")
	li	$v0, 4
	la	$a0, promptstr
	syscall

	# read in the value k - scanf("%d", &n)
   	li  $v0, 5
    syscall
    move $s0, $v0                                   # k = s0

	# 루프 바깥에서 검사 전 초기화할 내용 작성
    la  $t0, save                                   # 배열 시작 $t0
    addi $t2, $t0, 39                               # t2 = 배열 마지막 주소 (out) 
    addi $s1, $zero, 0                              # i = s1 = 0 미리 선언

    # meet while  
    j   Loop

	##############################################################
	#  Loop body - 교재 예시를 바탕으로 작성하되 배열 범위를 넘는지 검사하는 코드 추가해야 함
Loop:
    sll $t1, $s1, 2                                 # make i to  index 
    add $t1, $t1, $t0
    sltu $s2, $t2, $t1                              # t2(배열마지막주소) << t1(배열 현재주소)  ->  1  
    bne $s2, $zero, IndexOut                        # Error
    lw  $s2, 0($t1)                                 # s2 = arr[i]

    bne $s0, $s2, Exit                              # k값, 현재값(s2) 다르면 루프 탈풀 
    addi $s1, $s1, 1                                # 인덱스 1 증가 
    j   Loop

IndexOut:                                           # IndexOut Exit으로 분기
	li	$v0, 4
	la	$a0, msg_Erro 
	syscall
    li $v0,10
    syscall

	##############################################################
Exit:	
	# Exit (프로그램 종료)
	li	$v0, 4
	la	$a0, msg_exit
	syscall
	
	li	$v0,10		# exit
	syscall
