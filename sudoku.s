	.file	"sudoku.c"
	.text
	.section	.rodata
.LC0:
	.string	"Error: too many attempts"
.LC1:
	.string	"Error: TOO many attempts"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$704, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, %edi
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	leaq	-672(%rbp), %rdx
	movl	$0, %eax
	movl	$40, %ecx
	movq	%rdx, %rdi
	rep stosq
	movq	%rdi, %rdx
	movl	%eax, (%rdx)
	addq	$4, %rdx
	leaq	-336(%rbp), %rdx
	movl	$0, %eax
	movl	$40, %ecx
	movq	%rdx, %rdi
	rep stosq
	movq	%rdi, %rdx
	movl	%eax, (%rdx)
	addq	$4, %rdx
	movl	$0, -692(%rbp)
	movl	$0, -688(%rbp)
	movl	$0, -684(%rbp)
	movl	$1, -680(%rbp)
	jmp	.L2
.L9:
	cmpl	$50, -692(%rbp)
	jle	.L4
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	-672(%rbp), %rdx
	leaq	-336(%rbp), %rax
	movl	$40, %ecx
	movq	%rdx, %rdi
	movq	%rax, %rsi
	rep movsq
	movq	%rsi, %rax
	movq	%rdi, %rdx
	movl	(%rax), %ecx
	movl	%ecx, (%rdx)
	movl	$0, -692(%rbp)
	movl	$0, -684(%rbp)
	addl	$1, -688(%rbp)
	cmpl	$10, -688(%rbp)
	jle	.L13
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	-672(%rbp), %rax
	movl	$324, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	leaq	-336(%rbp), %rax
	movl	$324, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movl	$0, -688(%rbp)
	movl	$1, -680(%rbp)
	jmp	.L13
.L4:
	call	rand@PLT
	movl	%eax, %edx
	movslq	%edx, %rax
	imulq	$954437177, %rax, %rax
	shrq	$32, %rax
	sarl	%eax
	movl	%edx, %ecx
	sarl	$31, %ecx
	subl	%ecx, %eax
	movl	%eax, -676(%rbp)
	movl	-676(%rbp), %ecx
	movl	%ecx, %eax
	sall	$3, %eax
	addl	%ecx, %eax
	subl	%eax, %edx
	movl	%edx, -676(%rbp)
	movl	-676(%rbp), %eax
	movslq	%eax, %rcx
	movl	-684(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	addq	%rcx, %rax
	movl	-672(%rbp,%rax,4), %eax
	testl	%eax, %eax
	jne	.L14
	movl	-684(%rbp), %edx
	movl	-680(%rbp), %ecx
	leaq	-672(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	row_ok
	testl	%eax, %eax
	je	.L8
	movl	-676(%rbp), %edx
	movl	-680(%rbp), %ecx
	leaq	-672(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	column_ok
	testl	%eax, %eax
	je	.L8
	movl	-676(%rbp), %ecx
	movl	-684(%rbp), %edx
	movl	-680(%rbp), %esi
	leaq	-672(%rbp), %rax
	movq	%rax, %rdi
	call	box_ok
	testl	%eax, %eax
	je	.L8
	movl	-676(%rbp), %eax
	movslq	%eax, %rcx
	movl	-684(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	leaq	(%rax,%rcx), %rdx
	movl	-680(%rbp), %eax
	movl	%eax, -672(%rbp,%rdx,4)
	addl	$1, -684(%rbp)
.L8:
	addl	$1, -692(%rbp)
	jmp	.L3
.L13:
	nop
	jmp	.L3
.L14:
	nop
.L3:
	cmpl	$8, -684(%rbp)
	jle	.L9
	movl	$0, -684(%rbp)
	addl	$1, -680(%rbp)
	leaq	-336(%rbp), %rdx
	leaq	-672(%rbp), %rax
	movl	$40, %ecx
	movq	%rdx, %rdi
	movq	%rax, %rsi
	rep movsq
	movq	%rsi, %rax
	movq	%rdi, %rdx
	movl	(%rax), %ecx
	movl	%ecx, (%rdx)
.L2:
	cmpl	$9, -680(%rbp)
	jle	.L3
	leaq	-672(%rbp), %rax
	movq	%rax, %rdi
	call	print_matrix
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L12
	call	__stack_chk_fail@PLT
.L12:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.globl	row_ok
	.type	row_ok, @function
row_ok:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	%edx, -32(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L16
.L19:
	movl	-32(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movl	-4(%rbp), %eax
	cltq
	movl	(%rdx,%rax,4), %eax
	cmpl	%eax, -28(%rbp)
	jne	.L17
	movl	$0, %eax
	jmp	.L18
.L17:
	addl	$1, -4(%rbp)
.L16:
	cmpl	$8, -4(%rbp)
	jle	.L19
	movl	$1, %eax
.L18:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	row_ok, .-row_ok
	.globl	column_ok
	.type	column_ok, @function
column_ok:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	%edx, -32(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L21
.L24:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movl	-32(%rbp), %eax
	cltq
	movl	(%rdx,%rax,4), %eax
	cmpl	%eax, -28(%rbp)
	jne	.L22
	movl	$0, %eax
	jmp	.L23
.L22:
	addl	$1, -4(%rbp)
.L21:
	cmpl	$8, -4(%rbp)
	jle	.L24
	movl	$1, %eax
.L23:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	column_ok, .-column_ok
	.globl	box_ok
	.type	box_ok, @function
box_ok:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	%edx, -32(%rbp)
	movl	%ecx, -36(%rbp)
	movl	-32(%rbp), %eax
	movslq	%eax, %rdx
	imulq	$1431655766, %rdx, %rdx
	shrq	$32, %rdx
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	movl	%eax, -8(%rbp)
	movl	-36(%rbp), %eax
	movslq	%eax, %rdx
	imulq	$1431655766, %rdx, %rdx
	shrq	$32, %rdx
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	movl	%eax, -4(%rbp)
	movl	$0, -16(%rbp)
	jmp	.L26
.L31:
	movl	$0, -12(%rbp)
	jmp	.L27
.L30:
	movl	-8(%rbp), %edx
	movl	-16(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movl	-4(%rbp), %ecx
	movl	-12(%rbp), %eax
	addl	%ecx, %eax
	cltq
	movl	(%rdx,%rax,4), %eax
	cmpl	%eax, -28(%rbp)
	jne	.L28
	movl	$0, %eax
	jmp	.L29
.L28:
	addl	$1, -12(%rbp)
.L27:
	cmpl	$2, -12(%rbp)
	jle	.L30
	addl	$1, -16(%rbp)
.L26:
	cmpl	$2, -16(%rbp)
	jle	.L31
	movl	$1, %eax
.L29:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	box_ok, .-box_ok
	.globl	copy_matrix
	.type	copy_matrix, @function
copy_matrix:
.LFB10:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L33
.L36:
	movl	$0, -4(%rbp)
	jmp	.L34
.L35:
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	leaq	(%rdx,%rax), %rsi
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	movl	-4(%rbp), %eax
	cltq
	movl	(%rsi,%rax,4), %edx
	movl	-4(%rbp), %eax
	cltq
	movl	%edx, (%rcx,%rax,4)
	addl	$1, -4(%rbp)
.L34:
	cmpl	$8, -4(%rbp)
	jle	.L35
	addl	$1, -8(%rbp)
.L33:
	cmpl	$8, -8(%rbp)
	jle	.L36
	nop
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	copy_matrix, .-copy_matrix
	.section	.rodata
.LC2:
	.string	"\n"
.LC3:
	.string	"%d "
.LC4:
	.string	"| "
.LC5:
	.string	"---------------------"
	.text
	.globl	print_matrix
	.type	print_matrix, @function
print_matrix:
.LFB11:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, -8(%rbp)
	jmp	.L38
.L45:
	movl	$0, -4(%rbp)
	jmp	.L39
.L42:
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movl	-4(%rbp), %eax
	cltq
	movl	(%rdx,%rax,4), %eax
	movl	%eax, %esi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	cmpl	$2, -4(%rbp)
	je	.L40
	cmpl	$5, -4(%rbp)
	jne	.L41
.L40:
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L41:
	addl	$1, -4(%rbp)
.L39:
	cmpl	$8, -4(%rbp)
	jle	.L42
	movl	$10, %edi
	call	putchar@PLT
	cmpl	$2, -8(%rbp)
	je	.L43
	cmpl	$5, -8(%rbp)
	jne	.L44
.L43:
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L44:
	addl	$1, -8(%rbp)
.L38:
	cmpl	$8, -8(%rbp)
	jle	.L45
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	print_matrix, .-print_matrix
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
