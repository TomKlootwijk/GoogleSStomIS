	.file	"ecs.cpp"
	.text
	.p2align 4
	.type	_ZN7edge_ai3ecs12_GLOBAL__N_111event_bytesERKNS0_5EventE, @function
_ZN7edge_ai3ecs12_GLOBAL__N_111event_bytesERKNS0_5EventE:
.LFB5309:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pxor	%xmm0, %xmm0
	movq	%rdi, %rdx
	xorl	%eax, %eax
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	leaq	-1(%rdi), %rdi
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	(%rsi), %r8
	movups	%xmm0, 1(%rdi)
	movups	%xmm0, 17(%rdi)
	movups	%xmm0, 33(%rdi)
	.p2align 4,,10
	.p2align 3
.L2:
	leal	0(,%rax,8), %ecx
	movq	%r8, %rbx
	addq	$1, %rax
	shrq	%cl, %rbx
	movb	%bl, (%rdi,%rax)
	cmpq	$8, %rax
	jne	.L2
	movq	8(%rsi), %rax
	movq	16(%rsi), %r8
	xorl	%ecx, %ecx
	movq	%rax, 8(%rdx)
	leaq	16(%rdx), %rax
	.p2align 4,,10
	.p2align 3
.L3:
	movq	%r8, %rdi
	addq	$1, %rax
	shrq	%cl, %rdi
	addl	$8, %ecx
	movb	%dil, -1(%rax)
	cmpl	$64, %ecx
	jne	.L3
	movl	28(%rsi), %r13d
	movl	24(%rsi), %eax
	movl	36(%rsi), %r10d
	movzwl	34(%rsi), %r8d
	movq	%r13, %r14
	movq	%r13, %rcx
	movq	%r13, %rbx
	movzbl	%r13b, %r12d
	shrq	$16, %r14
	shrq	$24, %rcx
	movzbl	%bh, %ebx
	movq	%rax, %rbp
	salq	$8, %rcx
	movzbl	%r14b, %r14d
	shrq	$16, %rbp
	movq	%rax, %rdi
	orq	%r14, %rcx
	movzbl	%bpl, %ebp
	movq	%r10, %r11
	movzbl	%r10b, %r9d
	salq	$8, %rcx
	shrq	$16, %r11
	movzwl	32(%rsi), %r15d
	movzbl	%dil, %edi
	orq	%rbx, %rcx
	movzbl	%r11b, %r11d
	movq	%r10, %rbx
	salq	$8, %rcx
	movzbl	%bh, %ebx
	orq	%r12, %rcx
	movq	%rax, %r12
	movzbl	%ah, %eax
	shrq	$24, %r12
	salq	$8, %rcx
	orq	%r12, %rcx
	salq	$8, %rcx
	orq	%rbp, %rcx
	salq	$8, %rcx
	orq	%rax, %rcx
	movq	%r10, %rax
	shrq	$24, %rax
	salq	$8, %rcx
	salq	$8, %rax
	orq	%r11, %rax
	salq	$8, %rax
	orq	%rbx, %rax
	movl	%r8d, %ebx
	movzbl	%r8b, %r8d
	salq	$8, %rax
	movzbl	%bh, %ebx
	orq	%r9, %rax
	salq	$8, %rax
	orq	%rbx, %rax
	movl	%r15d, %ebx
	salq	$8, %rax
	movzbl	%bh, %ebx
	orq	%r8, %rax
	salq	$8, %rax
	orq	%rbx, %rax
	movzbl	%r15b, %ebx
	salq	$8, %rax
	orq	%rdi, %rcx
	movq	40(%rsi), %rdi
	orq	%rbx, %rax
	movq	%rcx, -24(%rsp)
	xorl	%ecx, %ecx
	movq	%rax, -16(%rsp)
	movdqa	-24(%rsp), %xmm1
	leaq	40(%rdx), %rax
	movups	%xmm1, 24(%rdx)
	.p2align 4,,10
	.p2align 3
.L4:
	movq	%rdi, %rsi
	addq	$1, %rax
	shrq	%cl, %rsi
	addl	$8, %ecx
	movb	%sil, -1(%rax)
	cmpl	$64, %ecx
	jne	.L4
	popq	%rbx
	.cfi_def_cfa_offset 48
	movq	%rdx, %rax
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE5309:
	.size	_ZN7edge_ai3ecs12_GLOBAL__N_111event_bytesERKNS0_5EventE, .-_ZN7edge_ai3ecs12_GLOBAL__N_111event_bytesERKNS0_5EventE
	.p2align 4
	.type	_ZN7edge_ai3ecs12_GLOBAL__N_111words_stateERKSt5arrayImLm64EE, @function
_ZN7edge_ai3ecs12_GLOBAL__N_111words_stateERKSt5arrayImLm64EE:
.LFB5313:
	.cfi_startproc
	movl	(%rsi), %edx
	movdqu	64(%rsi), %xmm0
	movq	%rdi, %rax
	movdqu	80(%rsi), %xmm1
	movl	%edx, (%rdi)
	movl	8(%rsi), %edx
	shufps	$136, %xmm1, %xmm0
	movups	%xmm0, 32(%rdi)
	movl	%edx, 4(%rdi)
	movl	16(%rsi), %edx
	movl	%edx, 8(%rdi)
	movl	24(%rsi), %edx
	movl	%edx, 12(%rdi)
	movl	32(%rsi), %edx
	movl	%edx, 16(%rdi)
	movl	40(%rsi), %edx
	movl	%edx, 20(%rdi)
	movl	48(%rsi), %edx
	movl	%edx, 24(%rdi)
	movl	56(%rsi), %edx
	movl	%edx, 28(%rdi)
	movq	96(%rsi), %rdx
	movl	%edx, 48(%rdi)
	movq	104(%rsi), %rdx
	movl	%edx, 52(%rdi)
	movl	112(%rsi), %edx
	movl	%edx, 56(%rdi)
	movq	120(%rsi), %rdx
	movl	%edx, 60(%rdi)
	ret
	.cfi_endproc
.LFE5313:
	.size	_ZN7edge_ai3ecs12_GLOBAL__N_111words_stateERKSt5arrayImLm64EE, .-_ZN7edge_ai3ecs12_GLOBAL__N_111words_stateERKSt5arrayImLm64EE
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Truncated TOMAGI word"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB1:
	.text
.LHOTB1:
	.p2align 4
	.type	_ZN7edge_ai3ecs12_GLOBAL__N_14le32ESt4spanIKhLm18446744073709551615EEm, @function
_ZN7edge_ai3ecs12_GLOBAL__N_14le32ESt4spanIKhLm18446744073709551615EEm:
.LFB5280:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA5280
	cmpq	%rdx, %rsi
	jb	.L21
	subq	%rdx, %rsi
	cmpq	$3, %rsi
	jbe	.L21
	movzbl	1(%rdi,%rdx), %eax
	movzbl	2(%rdi,%rdx), %ecx
	sall	$8, %eax
	sall	$16, %ecx
	orl	%ecx, %eax
	movzbl	(%rdi,%rdx), %ecx
	movzbl	3(%rdi,%rdx), %edx
	orl	%ecx, %eax
	sall	$24, %edx
	orl	%edx, %eax
	ret
	.globl	__gxx_personality_v0
	.section	.gcc_except_table,"a",@progbits
.LLSDA5280:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE5280-.LLSDACSB5280
.LLSDACSB5280:
.LLSDACSE5280:
	.text
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDAC5280
	.type	_ZN7edge_ai3ecs12_GLOBAL__N_14le32ESt4spanIKhLm18446744073709551615EEm.cold, @function
_ZN7edge_ai3ecs12_GLOBAL__N_14le32ESt4spanIKhLm18446744073709551615EEm.cold:
.LFSB5280:
.L21:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	$16, %edi
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	pushq	%rax
	.cfi_def_cfa_offset 32
	call	__cxa_allocate_exception@PLT
	leaq	.LC0(%rip), %rsi
	movq	%rax, %rdi
	movq	%rax, %rbx
.LEHB0:
	call	_ZNSt16invalid_argumentC1EPKc@PLT
.LEHE0:
	movq	_ZNSt16invalid_argumentD1Ev@GOTPCREL(%rip), %rdx
	leaq	_ZTISt16invalid_argument(%rip), %rsi
	movq	%rbx, %rdi
.LEHB1:
	call	__cxa_throw@PLT
.L25:
	endbr64
	movq	%rax, %rbp
	movq	%rbx, %rdi
	call	__cxa_free_exception@PLT
	movq	%rbp, %rdi
	call	_Unwind_Resume@PLT
.LEHE1:
	.cfi_endproc
.LFE5280:
	.section	.gcc_except_table
.LLSDAC5280:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSEC5280-.LLSDACSBC5280
.LLSDACSBC5280:
	.uleb128 .LEHB0-.LCOLDB1
	.uleb128 .LEHE0-.LEHB0
	.uleb128 .L25-.LCOLDB1
	.uleb128 0
	.uleb128 .LEHB1-.LCOLDB1
	.uleb128 .LEHE1-.LEHB1
	.uleb128 0
	.uleb128 0
.LLSDACSEC5280:
	.section	.text.unlikely
	.text
	.size	_ZN7edge_ai3ecs12_GLOBAL__N_14le32ESt4spanIKhLm18446744073709551615EEm, .-_ZN7edge_ai3ecs12_GLOBAL__N_14le32ESt4spanIKhLm18446744073709551615EEm
	.section	.text.unlikely
	.size	_ZN7edge_ai3ecs12_GLOBAL__N_14le32ESt4spanIKhLm18446744073709551615EEm.cold, .-_ZN7edge_ai3ecs12_GLOBAL__N_14le32ESt4spanIKhLm18446744073709551615EEm.cold
.LCOLDE1:
	.text
.LHOTE1:
	.section	.rodata.str1.1
.LC2:
	.string	"vector::_M_realloc_insert"
	.text
	.p2align 4
	.type	_ZN7edge_ai3ecs12_GLOBAL__N_13putERSt6vectorIhSaIhEEmj, @function
_ZN7edge_ai3ecs12_GLOBAL__N_13putERSt6vectorIhSaIhEEmj:
.LFB5279:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rsi, %r8
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	leal	0(,%rdx,8), %r14d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	xorl	%r12d, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	jmp	.L39
	.p2align 4,,10
	.p2align 3
.L48:
	addl	$8, %r12d
	movb	%r13b, (%rax)
	addq	$1, 8(%rbx)
	cmpl	%r14d, %r12d
	je	.L47
.L39:
	movq	%r8, %r13
	movl	%r12d, %ecx
	movq	8(%rbx), %rax
	shrq	%cl, %r13
	cmpq	16(%rbx), %rax
	jne	.L48
	movq	(%rbx), %r10
	subq	%r10, %rax
	movq	%rax, %rbp
	movabsq	$9223372036854775807, %rax
	cmpq	%rax, %rbp
	je	.L49
	movq	%r8, 8(%rsp)
	movq	%r10, (%rsp)
	testq	%rbp, %rbp
	je	.L34
	movabsq	$9223372036854775807, %r15
	leaq	(%rbp,%rbp), %rax
	cmpq	%r15, %rax
	cmovbe	%rax, %r15
	cmpq	%rbp, %rax
	movabsq	$9223372036854775807, %rax
	cmovb	%rax, %r15
	movq	%r15, %rdi
	call	_Znwm@PLT
	testq	%rbp, %rbp
	movq	(%rsp), %r10
	movq	8(%rsp), %r8
	movb	%r13b, (%rax,%rbp)
	movq	%rax, %rcx
	jle	.L36
	movq	%r10, %rsi
	movq	%rbp, %rdx
	movq	%rax, %rdi
	movq	%r8, 8(%rsp)
	movq	%r10, (%rsp)
	call	memmove@PLT
	movq	16(%rbx), %rsi
	movq	(%rsp), %r10
	movq	8(%rsp), %r8
	movq	%rax, %rcx
	leaq	1(%rax,%rbp), %rbp
	subq	%r10, %rsi
.L37:
	movq	%r10, %rdi
	movq	%r8, 8(%rsp)
	movq	%rcx, (%rsp)
	call	_ZdlPvm@PLT
	movq	8(%rsp), %r8
	movq	(%rsp), %rcx
.L38:
	movq	%rcx, (%rbx)
	addl	$8, %r12d
	addq	%r15, %rcx
	movq	%rbp, 8(%rbx)
	movq	%rcx, 16(%rbx)
	cmpl	%r14d, %r12d
	jne	.L39
.L47:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L34:
	.cfi_restore_state
	movl	$1, %edi
	movl	$1, %r15d
	call	_Znwm@PLT
	movq	(%rsp), %r10
	movq	8(%rsp), %r8
	movb	%r13b, (%rax)
	movq	%rax, %rcx
.L36:
	leaq	1(%rcx,%rbp), %rbp
	testq	%r10, %r10
	je	.L38
	movq	16(%rbx), %rsi
	subq	%r10, %rsi
	jmp	.L37
.L49:
	leaq	.LC2(%rip), %rdi
	call	_ZSt20__throw_length_errorPKc@PLT
	.cfi_endproc
.LFE5279:
	.size	_ZN7edge_ai3ecs12_GLOBAL__N_13putERSt6vectorIhSaIhEEmj, .-_ZN7edge_ai3ecs12_GLOBAL__N_13putERSt6vectorIhSaIhEEmj
	.align 2
	.p2align 4
	.type	_ZNKSt14default_deleteIN7edge_ai3ecs6Kernel4ImplEEclEPS3_.part.0, @function
_ZNKSt14default_deleteIN7edge_ai3ecs6Kernel4ImplEEclEPS3_.part.0:
.LFB7501:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	movq	5336(%rdi), %rdi
	testq	%rdi, %rdi
	je	.L51
	movq	5352(%rbx), %rsi
	subq	%rdi, %rsi
	call	_ZdlPvm@PLT
.L51:
	movq	216(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L52
	movq	232(%rbx), %rsi
	subq	%rdi, %rsi
	call	_ZdlPvm@PLT
.L52:
	movq	192(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L53
	movq	208(%rbx), %rsi
	subq	%rdi, %rsi
	call	_ZdlPvm@PLT
.L53:
	movq	168(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L54
	movq	184(%rbx), %rsi
	subq	%rdi, %rsi
	call	_ZdlPvm@PLT
.L54:
	movq	144(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L55
	movq	160(%rbx), %rsi
	subq	%rdi, %rsi
	call	_ZdlPvm@PLT
.L55:
	movq	120(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L56
	movq	136(%rbx), %rsi
	subq	%rdi, %rsi
	call	_ZdlPvm@PLT
.L56:
	movq	96(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L57
	movq	112(%rbx), %rsi
	subq	%rdi, %rsi
	call	_ZdlPvm@PLT
.L57:
	movq	72(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L58
	movq	88(%rbx), %rsi
	subq	%rdi, %rsi
	call	_ZdlPvm@PLT
.L58:
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L59
	movq	64(%rbx), %rsi
	subq	%rdi, %rsi
	call	_ZdlPvm@PLT
.L59:
	movq	%rbx, %rdi
	movl	$5400, %esi
	popq	%rbx
	.cfi_def_cfa_offset 8
	jmp	_ZdlPvm@PLT
	.cfi_endproc
.LFE7501:
	.size	_ZNKSt14default_deleteIN7edge_ai3ecs6Kernel4ImplEEclEPS3_.part.0, .-_ZNKSt14default_deleteIN7edge_ai3ecs6Kernel4ImplEEclEPS3_.part.0
	.section	.rodata.str1.1
.LC3:
	.string	"vector::_M_range_insert"
	.text
	.align 2
	.p2align 4
	.type	_ZNSt6vectorIhSaIhEE15_M_range_insertIPKhEEvN9__gnu_cxx17__normal_iteratorIPhS1_EET_S9_St20forward_iterator_tag.isra.0, @function
_ZNSt6vectorIhSaIhEE15_M_range_insertIPKhEEvN9__gnu_cxx17__normal_iteratorIPhS1_EET_S9_St20forward_iterator_tag.isra.0:
.LFB7552:
	.cfi_startproc
	cmpq	%rcx, %rdx
	je	.L125
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rcx, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	subq	%rdx, %r14
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rdx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	movq	8(%rdi), %r15
	movq	16(%rdi), %rax
	subq	%r15, %rax
	cmpq	%r14, %rax
	jb	.L91
	movq	%r15, %r13
	subq	%rsi, %r13
	cmpq	%r13, %r14
	jnb	.L92
	movq	%r15, %r13
	subq	%r14, %r13
	cmpq	$1, %r14
	jle	.L93
	movq	%r14, %rdx
	movq	%r13, %rsi
	movq	%r15, %rdi
	call	memmove@PLT
	movq	8(%rbx), %rax
.L94:
	movq	%r13, %rdx
	addq	%r14, %rax
	subq	%r12, %rdx
	movq	%rax, 8(%rbx)
	cmpq	$1, %rdx
	jle	.L95
	movq	%r15, %rdi
	movq	%r12, %rsi
	subq	%rdx, %rdi
	call	memmove@PLT
.L96:
	cmpq	$1, %r14
	jle	.L97
	movq	%r14, %rdx
.L129:
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%rbp, %rsi
	movq	%r12, %rdi
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_restore 12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_restore 13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_restore 14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_restore 15
	.cfi_def_cfa_offset 8
	jmp	memmove@PLT
	.p2align 4,,10
	.p2align 3
.L91:
	.cfi_restore_state
	movabsq	$9223372036854775807, %rdx
	movq	(%rdi), %rsi
	movq	%r15, %rax
	movq	%rdx, %rcx
	subq	%rsi, %rax
	movq	%rsi, 16(%rsp)
	subq	%rax, %rcx
	cmpq	%r14, %rcx
	jb	.L130
	cmpq	%r14, %rax
	jb	.L104
	movabsq	$9223372036854775807, %r13
	leaq	(%rax,%rax), %rcx
	cmpq	%r13, %rcx
	cmovbe	%rcx, %r13
	cmpq	%rax, %rcx
	cmovb	%rdx, %r13
.L105:
	movq	%r13, %rdi
	call	_Znwm@PLT
	movq	%rax, 8(%rsp)
	addq	%r13, %rax
	movq	%rax, 24(%rsp)
.L108:
	movq	16(%rsp), %rsi
	movq	%r12, %r13
	subq	%rsi, %r13
	cmpq	$1, %r13
	jle	.L109
	movq	8(%rsp), %rdi
	movq	%r13, %rdx
	call	memmove@PLT
.L110:
	movq	8(%rsp), %rax
	leaq	(%rax,%r13), %rcx
	cmpq	$1, %r14
	jle	.L111
	movq	%rcx, %rdi
	movq	%r14, %rdx
	movq	%rbp, %rsi
	call	memcpy@PLT
	movq	%rax, %rcx
.L112:
	subq	%r12, %r15
	addq	%r14, %rcx
	movq	%r15, %rbp
	cmpq	$1, %r15
	jle	.L113
	movq	%rcx, %rdi
	movq	%r15, %rdx
	movq	%r12, %rsi
	call	memcpy@PLT
	movq	%rax, %rcx
.L114:
	movq	16(%rsp), %rdi
	addq	%rcx, %rbp
	testq	%rdi, %rdi
	je	.L115
	movq	16(%rbx), %rsi
	subq	%rdi, %rsi
	call	_ZdlPvm@PLT
.L115:
	movq	8(%rsp), %rax
	movq	%rbp, 8(%rbx)
	movq	%rax, (%rbx)
	movq	24(%rsp), %rax
	movq	%rax, 16(%rbx)
.L88:
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L92:
	.cfi_restore_state
	leaq	(%rdx,%r13), %rsi
	movq	%rcx, %rdx
	subq	%rsi, %rdx
	cmpq	$1, %rdx
	jle	.L99
	movq	%r15, %rdi
	call	memmove@PLT
	movq	8(%rbx), %r15
.L100:
	movq	%r14, %rdi
	subq	%r13, %rdi
	addq	%r15, %rdi
	movq	%rdi, 8(%rbx)
	cmpq	$1, %r13
	jle	.L101
	movq	%r13, %rdx
	movq	%r12, %rsi
	call	memmove@PLT
	addq	%r13, 8(%rbx)
	movq	%r13, %rdx
	jmp	.L129
	.p2align 4,,10
	.p2align 3
.L104:
	addq	%r14, %rax
	jc	.L107
	testq	%rax, %rax
	jne	.L131
	movq	$0, 24(%rsp)
	movq	$0, 8(%rsp)
	jmp	.L108
	.p2align 4,,10
	.p2align 3
.L125:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	.cfi_restore 15
	ret
	.p2align 4,,10
	.p2align 3
.L97:
	.cfi_def_cfa_offset 96
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	jne	.L88
.L128:
	movzbl	0(%rbp), %eax
	movb	%al, (%r12)
	jmp	.L88
	.p2align 4,,10
	.p2align 3
.L99:
	jne	.L100
	movzbl	(%rsi), %eax
	movb	%al, (%r15)
	movq	8(%rdi), %r15
	jmp	.L100
	.p2align 4,,10
	.p2align 3
.L101:
	je	.L102
	leaq	(%r15,%r14), %r8
	movq	%r8, 8(%rbx)
	jmp	.L88
	.p2align 4,,10
	.p2align 3
.L93:
	movq	%r15, %rax
	jne	.L94
	movzbl	0(%r13), %eax
	movb	%al, (%r15)
	movq	8(%rdi), %rax
	jmp	.L94
	.p2align 4,,10
	.p2align 3
.L95:
	jne	.L96
	movzbl	(%r12), %eax
	movb	%al, -1(%r15)
	jmp	.L96
	.p2align 4,,10
	.p2align 3
.L113:
	jne	.L114
	movzbl	(%r12), %eax
	movb	%al, (%rcx)
	jmp	.L114
	.p2align 4,,10
	.p2align 3
.L111:
	jne	.L112
	movzbl	0(%rbp), %eax
	movb	%al, (%rcx)
	jmp	.L112
	.p2align 4,,10
	.p2align 3
.L109:
	jne	.L110
	movq	16(%rsp), %rax
	movq	8(%rsp), %rdx
	movzbl	(%rax), %eax
	movb	%al, (%rdx)
	jmp	.L110
.L102:
	movzbl	(%r12), %eax
	movb	%al, (%rdi)
	addq	$1, 8(%rbx)
	jmp	.L128
.L131:
	movabsq	$9223372036854775807, %r13
	cmpq	%r13, %rax
	cmovbe	%rax, %r13
	jmp	.L105
.L130:
	leaq	.LC3(%rip), %rdi
	call	_ZSt20__throw_length_errorPKc@PLT
.L107:
	movq	%rdx, %r13
	jmp	.L105
	.cfi_endproc
.LFE7552:
	.size	_ZNSt6vectorIhSaIhEE15_M_range_insertIPKhEEvN9__gnu_cxx17__normal_iteratorIPhS1_EET_S9_St20forward_iterator_tag.isra.0, .-_ZNSt6vectorIhSaIhEE15_M_range_insertIPKhEEvN9__gnu_cxx17__normal_iteratorIPhS1_EET_S9_St20forward_iterator_tag.isra.0
	.p2align 4
	.type	_ZSt13__adjust_heapIN9__gnu_cxx17__normal_iteratorIPN7edge_ai3ecs6Kernel4Impl7PendingESt6vectorIS6_SaIS6_EEEElS6_NS0_5__ops15_Iter_comp_iterIZNS4_14commit_throughEmNS3_12CapabilitiesENS3_10WorkBudgetEEUlRKS6_SH_E_EEEvT_T0_SL_T1_T2_, @function
_ZSt13__adjust_heapIN9__gnu_cxx17__normal_iteratorIPN7edge_ai3ecs6Kernel4Impl7PendingESt6vectorIS6_SaIS6_EEEElS6_NS0_5__ops15_Iter_comp_iterIZNS4_14commit_throughEmNS3_12CapabilitiesENS3_10WorkBudgetEEUlRKS6_SH_E_EEEvT_T0_SL_T1_T2_:
.LFB7380:
	.cfi_startproc
	leaq	-1(%rdx), %rax
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movq	%rsi, %r8
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movq	%rdx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	andl	$1, %r12d
	movq	%rdx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%rax, %rbx
	movq	64(%rsp), %r11
	shrq	$63, %rbx
	movl	56(%rsp), %r10d
	movq	48(%rsp), %r9
	addq	%rax, %rbx
	sarq	%rbx
	cmpq	%rbx, %rsi
	jge	.L133
	movq	%rsi, %r13
	jmp	.L138
	.p2align 4,,10
	.p2align 3
.L160:
	cmovnb	%rcx, %rax
	cmovnb	%rsi, %rdx
.L137:
	leaq	0(,%r13,8), %rcx
	movdqu	(%rax), %xmm3
	subq	%r13, %rcx
	leaq	(%rdi,%rcx,8), %rcx
	movups	%xmm3, (%rcx)
	movdqu	16(%rax), %xmm4
	movups	%xmm4, 16(%rcx)
	movdqu	32(%rax), %xmm5
	movups	%xmm5, 32(%rcx)
	movzbl	48(%rax), %esi
	movb	%sil, 48(%rcx)
	cmpq	%rbx, %rdx
	jge	.L166
	movq	%rdx, %r13
.L138:
	leaq	1(%r13), %rcx
	leaq	(%rcx,%rcx), %rsi
	salq	$4, %rcx
	leaq	-1(%rsi), %rdx
	subq	%rsi, %rcx
	leaq	0(,%rdx,8), %rax
	leaq	(%rdi,%rcx,8), %rcx
	subq	%rdx, %rax
	leaq	(%rdi,%rax,8), %rax
	movq	(%rax), %r14
	cmpq	%r14, (%rcx)
	jne	.L160
	movl	8(%rax), %r14d
	cmpl	%r14d, 8(%rcx)
	jne	.L160
	movq	16(%rax), %r14
	cmpq	%r14, 16(%rcx)
	jne	.L160
	movq	%rcx, %rax
	movq	%rsi, %rdx
	jmp	.L137
	.p2align 4,,10
	.p2align 3
.L166:
	testq	%r12, %r12
	je	.L139
.L161:
	leaq	-1(%rdx), %rcx
	movq	%rcx, %rsi
	shrq	$63, %rsi
	addq	%rcx, %rsi
	sarq	%rsi
.L140:
	movdqu	48(%rsp), %xmm7
	movdqu	80(%rsp), %xmm6
	movq	96(%rsp), %rcx
	movaps	%xmm7, -64(%rsp)
	movdqu	64(%rsp), %xmm7
	movq	%rcx, -16(%rsp)
	movaps	%xmm7, -48(%rsp)
	movaps	%xmm6, -32(%rsp)
	cmpq	%r8, %rdx
	jle	.L142
	.p2align 4,,10
	.p2align 3
.L147:
	leaq	0(,%rsi,8), %rax
	subq	%rsi, %rax
	leaq	(%rdi,%rax,8), %rax
	cmpq	%r9, (%rax)
	je	.L143
.L146:
	jb	.L144
.L162:
	leaq	0(,%rdx,8), %rax
	subq	%rdx, %rax
	leaq	(%rdi,%rax,8), %rax
.L142:
	movq	%r9, -64(%rsp)
	movzbl	-16(%rsp), %edx
	movl	%r10d, -56(%rsp)
	movdqa	-64(%rsp), %xmm6
	movq	%r11, -48(%rsp)
	movdqa	-48(%rsp), %xmm7
	movups	%xmm6, (%rax)
	movdqa	-32(%rsp), %xmm6
	movb	%dl, 48(%rax)
	movups	%xmm7, 16(%rax)
	movups	%xmm6, 32(%rax)
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L143:
	.cfi_restore_state
	cmpl	%r10d, 8(%rax)
	jne	.L146
	cmpq	%r11, 16(%rax)
	je	.L162
	jnb	.L162
	.p2align 4,,10
	.p2align 3
.L144:
	leaq	0(,%rdx,8), %rcx
	movdqu	(%rax), %xmm0
	subq	%rdx, %rcx
	leaq	(%rdi,%rcx,8), %rdx
	movups	%xmm0, (%rdx)
	movdqu	16(%rax), %xmm1
	movups	%xmm1, 16(%rdx)
	movdqu	32(%rax), %xmm2
	movups	%xmm2, 32(%rdx)
	movzbl	48(%rax), %ecx
	movb	%cl, 48(%rdx)
	leaq	-1(%rsi), %rcx
	movq	%rcx, %rdx
	shrq	$63, %rdx
	addq	%rcx, %rdx
	sarq	%rdx
	movq	%rdx, %rcx
	movq	%rsi, %rdx
	cmpq	%rsi, %r8
	jge	.L142
	movq	%rcx, %rsi
	jmp	.L147
	.p2align 4,,10
	.p2align 3
.L133:
	leaq	0(,%rsi,8), %rax
	subq	%rsi, %rax
	leaq	(%rdi,%rax,8), %rax
	testq	%r12, %r12
	jne	.L167
	movq	%r8, %rdx
	.p2align 4,,10
	.p2align 3
.L139:
	subq	$2, %rbp
	movq	%rbp, %rcx
	shrq	$63, %rcx
	addq	%rbp, %rcx
	sarq	%rcx
	cmpq	%rdx, %rcx
	jne	.L161
	leaq	1(%rdx,%rdx), %rbx
	leaq	0(,%rbx,8), %rcx
	subq	%rbx, %rcx
	leaq	(%rdi,%rcx,8), %rcx
	movdqu	(%rcx), %xmm7
	movups	%xmm7, (%rax)
	movdqu	16(%rcx), %xmm6
	movups	%xmm6, 16(%rax)
	movdqu	32(%rcx), %xmm7
	movups	%xmm7, 32(%rax)
	movzbl	48(%rcx), %esi
	movb	%sil, 48(%rax)
	movq	%rdx, %rsi
	movq	%rcx, %rax
	movq	%rbx, %rdx
	jmp	.L140
.L167:
	movdqu	48(%rsp), %xmm6
	movq	96(%rsp), %rdx
	movaps	%xmm6, -64(%rsp)
	movdqu	64(%rsp), %xmm6
	movq	%rdx, -16(%rsp)
	movaps	%xmm6, -48(%rsp)
	movdqu	80(%rsp), %xmm6
	movaps	%xmm6, -32(%rsp)
	jmp	.L142
	.cfi_endproc
.LFE7380:
	.size	_ZSt13__adjust_heapIN9__gnu_cxx17__normal_iteratorIPN7edge_ai3ecs6Kernel4Impl7PendingESt6vectorIS6_SaIS6_EEEElS6_NS0_5__ops15_Iter_comp_iterIZNS4_14commit_throughEmNS3_12CapabilitiesENS3_10WorkBudgetEEUlRKS6_SH_E_EEEvT_T0_SL_T1_T2_, .-_ZSt13__adjust_heapIN9__gnu_cxx17__normal_iteratorIPN7edge_ai3ecs6Kernel4Impl7PendingESt6vectorIS6_SaIS6_EEEElS6_NS0_5__ops15_Iter_comp_iterIZNS4_14commit_throughEmNS3_12CapabilitiesENS3_10WorkBudgetEEUlRKS6_SH_E_EEEvT_T0_SL_T1_T2_
	.p2align 4
	.type	_ZSt13__adjust_heapIN9__gnu_cxx17__normal_iteratorIPN7edge_ai3ecs6Kernel4Impl7PendingESt6vectorIS6_SaIS6_EEEElS6_NS0_5__ops15_Iter_comp_iterIZNKS4_15canonical_stateEvEUlRKS6_SF_E_EEEvT_T0_SJ_T1_T2_, @function
_ZSt13__adjust_heapIN9__gnu_cxx17__normal_iteratorIPN7edge_ai3ecs6Kernel4Impl7PendingESt6vectorIS6_SaIS6_EEEElS6_NS0_5__ops15_Iter_comp_iterIZNKS4_15canonical_stateEvEUlRKS6_SF_E_EEEvT_T0_SJ_T1_T2_:
.LFB7391:
	.cfi_startproc
	leaq	-1(%rdx), %rax
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movq	%rsi, %r8
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movq	%rdx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	andl	$1, %r12d
	movq	%rdx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%rax, %rbx
	movq	64(%rsp), %r11
	shrq	$63, %rbx
	movl	56(%rsp), %r10d
	movq	48(%rsp), %r9
	addq	%rax, %rbx
	sarq	%rbx
	cmpq	%rbx, %rsi
	jge	.L169
	movq	%rsi, %r13
	jmp	.L174
	.p2align 4,,10
	.p2align 3
.L196:
	cmovnb	%rcx, %rax
	cmovnb	%rsi, %rdx
.L173:
	leaq	0(,%r13,8), %rcx
	movdqu	(%rax), %xmm3
	subq	%r13, %rcx
	leaq	(%rdi,%rcx,8), %rcx
	movups	%xmm3, (%rcx)
	movdqu	16(%rax), %xmm4
	movups	%xmm4, 16(%rcx)
	movdqu	32(%rax), %xmm5
	movups	%xmm5, 32(%rcx)
	movzbl	48(%rax), %esi
	movb	%sil, 48(%rcx)
	cmpq	%rbx, %rdx
	jge	.L202
	movq	%rdx, %r13
.L174:
	leaq	1(%r13), %rcx
	leaq	(%rcx,%rcx), %rsi
	salq	$4, %rcx
	leaq	-1(%rsi), %rdx
	subq	%rsi, %rcx
	leaq	0(,%rdx,8), %rax
	leaq	(%rdi,%rcx,8), %rcx
	subq	%rdx, %rax
	leaq	(%rdi,%rax,8), %rax
	movq	(%rax), %r14
	cmpq	%r14, (%rcx)
	jne	.L196
	movl	8(%rax), %r14d
	cmpl	%r14d, 8(%rcx)
	jne	.L196
	movq	16(%rax), %r14
	cmpq	%r14, 16(%rcx)
	jne	.L196
	movq	%rcx, %rax
	movq	%rsi, %rdx
	jmp	.L173
	.p2align 4,,10
	.p2align 3
.L202:
	testq	%r12, %r12
	je	.L175
.L197:
	leaq	-1(%rdx), %rcx
	movq	%rcx, %rsi
	shrq	$63, %rsi
	addq	%rcx, %rsi
	sarq	%rsi
.L176:
	movdqu	48(%rsp), %xmm7
	movdqu	80(%rsp), %xmm6
	movq	96(%rsp), %rcx
	movaps	%xmm7, -64(%rsp)
	movdqu	64(%rsp), %xmm7
	movq	%rcx, -16(%rsp)
	movaps	%xmm7, -48(%rsp)
	movaps	%xmm6, -32(%rsp)
	cmpq	%r8, %rdx
	jle	.L178
	.p2align 4,,10
	.p2align 3
.L183:
	leaq	0(,%rsi,8), %rax
	subq	%rsi, %rax
	leaq	(%rdi,%rax,8), %rax
	cmpq	%r9, (%rax)
	je	.L179
.L182:
	jb	.L180
.L198:
	leaq	0(,%rdx,8), %rax
	subq	%rdx, %rax
	leaq	(%rdi,%rax,8), %rax
.L178:
	movq	%r9, -64(%rsp)
	movzbl	-16(%rsp), %edx
	movl	%r10d, -56(%rsp)
	movdqa	-64(%rsp), %xmm6
	movq	%r11, -48(%rsp)
	movdqa	-48(%rsp), %xmm7
	movups	%xmm6, (%rax)
	movdqa	-32(%rsp), %xmm6
	movb	%dl, 48(%rax)
	movups	%xmm7, 16(%rax)
	movups	%xmm6, 32(%rax)
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L179:
	.cfi_restore_state
	cmpl	%r10d, 8(%rax)
	jne	.L182
	cmpq	%r11, 16(%rax)
	je	.L198
	jnb	.L198
	.p2align 4,,10
	.p2align 3
.L180:
	leaq	0(,%rdx,8), %rcx
	movdqu	(%rax), %xmm0
	subq	%rdx, %rcx
	leaq	(%rdi,%rcx,8), %rdx
	movups	%xmm0, (%rdx)
	movdqu	16(%rax), %xmm1
	movups	%xmm1, 16(%rdx)
	movdqu	32(%rax), %xmm2
	movups	%xmm2, 32(%rdx)
	movzbl	48(%rax), %ecx
	movb	%cl, 48(%rdx)
	leaq	-1(%rsi), %rcx
	movq	%rcx, %rdx
	shrq	$63, %rdx
	addq	%rcx, %rdx
	sarq	%rdx
	movq	%rdx, %rcx
	movq	%rsi, %rdx
	cmpq	%rsi, %r8
	jge	.L178
	movq	%rcx, %rsi
	jmp	.L183
	.p2align 4,,10
	.p2align 3
.L169:
	leaq	0(,%rsi,8), %rax
	subq	%rsi, %rax
	leaq	(%rdi,%rax,8), %rax
	testq	%r12, %r12
	jne	.L203
	movq	%r8, %rdx
	.p2align 4,,10
	.p2align 3
.L175:
	subq	$2, %rbp
	movq	%rbp, %rcx
	shrq	$63, %rcx
	addq	%rbp, %rcx
	sarq	%rcx
	cmpq	%rdx, %rcx
	jne	.L197
	leaq	1(%rdx,%rdx), %rbx
	leaq	0(,%rbx,8), %rcx
	subq	%rbx, %rcx
	leaq	(%rdi,%rcx,8), %rcx
	movdqu	(%rcx), %xmm7
	movups	%xmm7, (%rax)
	movdqu	16(%rcx), %xmm6
	movups	%xmm6, 16(%rax)
	movdqu	32(%rcx), %xmm7
	movups	%xmm7, 32(%rax)
	movzbl	48(%rcx), %esi
	movb	%sil, 48(%rax)
	movq	%rdx, %rsi
	movq	%rcx, %rax
	movq	%rbx, %rdx
	jmp	.L176
.L203:
	movdqu	48(%rsp), %xmm6
	movq	96(%rsp), %rdx
	movaps	%xmm6, -64(%rsp)
	movdqu	64(%rsp), %xmm6
	movq	%rdx, -16(%rsp)
	movaps	%xmm6, -48(%rsp)
	movdqu	80(%rsp), %xmm6
	movaps	%xmm6, -32(%rsp)
	jmp	.L178
	.cfi_endproc
.LFE7391:
	.size	_ZSt13__adjust_heapIN9__gnu_cxx17__normal_iteratorIPN7edge_ai3ecs6Kernel4Impl7PendingESt6vectorIS6_SaIS6_EEEElS6_NS0_5__ops15_Iter_comp_iterIZNKS4_15canonical_stateEvEUlRKS6_SF_E_EEEvT_T0_SJ_T1_T2_, .-_ZSt13__adjust_heapIN9__gnu_cxx17__normal_iteratorIPN7edge_ai3ecs6Kernel4Impl7PendingESt6vectorIS6_SaIS6_EEEElS6_NS0_5__ops15_Iter_comp_iterIZNKS4_15canonical_stateEvEUlRKS6_SF_E_EEEvT_T0_SJ_T1_T2_
	.p2align 4
	.type	_ZSt16__insertion_sortIN9__gnu_cxx17__normal_iteratorIPN7edge_ai3ecs6Kernel4Impl7PendingESt6vectorIS6_SaIS6_EEEENS0_5__ops15_Iter_comp_iterIZNKS4_15canonical_stateEvEUlRKS6_SF_E_EEEvT_SI_T0_, @function
_ZSt16__insertion_sortIN9__gnu_cxx17__normal_iteratorIPN7edge_ai3ecs6Kernel4Impl7PendingESt6vectorIS6_SaIS6_EEEENS0_5__ops15_Iter_comp_iterIZNKS4_15canonical_stateEvEUlRKS6_SF_E_EEEvT_SI_T0_:
.LFB7016:
	.cfi_startproc
	cmpq	%rdi, %rsi
	je	.L228
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	leaq	56(%rdi), %rdx
	movq	%rsi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdi, %rbx
	subq	$72, %rsp
	.cfi_def_cfa_offset 112
	cmpq	%rdx, %rsi
	je	.L204
	movl	$56, %ebp
	.p2align 4,,10
	.p2align 3
.L222:
	movq	(%rdx), %rsi
	cmpq	(%rbx), %rsi
	je	.L232
	jb	.L210
	movl	8(%rdx), %edi
	movq	16(%rdx), %r8
.L211:
	movq	48(%rdx), %rax
	movdqu	(%rdx), %xmm4
	movdqu	16(%rdx), %xmm5
	movdqu	32(%rdx), %xmm6
	movq	%rax, 48(%rsp)
	movq	%rdx, %rax
	movaps	%xmm4, (%rsp)
	movaps	%xmm5, 16(%rsp)
	movaps	%xmm6, 32(%rsp)
	.p2align 4,,10
	.p2align 3
.L217:
	cmpq	-56(%rax), %rsi
	je	.L218
.L231:
	jb	.L219
.L220:
	movzbl	48(%rsp), %ecx
	movdqa	(%rsp), %xmm7
	leaq	56(%rdx), %r12
	movdqa	16(%rsp), %xmm3
	movdqa	32(%rsp), %xmm4
	movb	%cl, 48(%rax)
	movups	%xmm7, (%rax)
	movups	%xmm3, 16(%rax)
	movups	%xmm4, 32(%rax)
.L216:
	movq	%r12, %rdx
	cmpq	%r12, %r13
	jne	.L222
.L204:
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L218:
	.cfi_restore_state
	cmpl	-48(%rax), %edi
	jne	.L231
	cmpq	-40(%rax), %r8
	je	.L220
	jnb	.L220
	.p2align 4,,10
	.p2align 3
.L219:
	movdqu	-56(%rax), %xmm0
	movdqu	-40(%rax), %xmm1
	subq	$56, %rax
	movdqu	32(%rax), %xmm2
	movzbl	48(%rax), %ecx
	movups	%xmm0, 56(%rax)
	movups	%xmm1, 72(%rax)
	movups	%xmm2, 88(%rax)
	movb	%cl, 104(%rax)
	jmp	.L217
	.p2align 4,,10
	.p2align 3
.L210:
	movq	48(%rdx), %rax
	movdqu	(%rdx), %xmm3
	leaq	56(%rdx), %r12
	movdqu	16(%rdx), %xmm4
	movdqu	32(%rdx), %xmm5
	movq	%rax, 48(%rsp)
	movq	%rdx, %rax
	subq	%rbx, %rax
	movaps	%xmm3, (%rsp)
	movaps	%xmm4, 16(%rsp)
	movaps	%xmm5, 32(%rsp)
	cmpq	$56, %rax
	jle	.L214
	movq	%rbp, %rdi
	movq	%rbx, %rsi
	subq	%rax, %rdi
	addq	%rdx, %rdi
	movq	%rax, %rdx
	call	memmove@PLT
.L215:
	movdqa	(%rsp), %xmm6
	movdqa	16(%rsp), %xmm7
	movdqa	32(%rsp), %xmm3
	movzbl	48(%rsp), %eax
	movups	%xmm6, (%rbx)
	movb	%al, 48(%rbx)
	movups	%xmm7, 16(%rbx)
	movups	%xmm3, 32(%rbx)
	jmp	.L216
	.p2align 4,,10
	.p2align 3
.L232:
	movl	8(%rdx), %edi
	cmpl	8(%rbx), %edi
	je	.L233
	jb	.L210
	movq	16(%rdx), %r8
	jmp	.L211
	.p2align 4,,10
	.p2align 3
.L233:
	movq	16(%rdx), %rax
	movq	16(%rbx), %r8
	cmpq	%r8, %rax
	je	.L211
	jb	.L210
	movq	%rax, %r8
	jmp	.L211
	.p2align 4,,10
	.p2align 3
.L214:
	jne	.L215
	movdqu	(%rbx), %xmm5
	movups	%xmm5, (%rdx)
	movdqu	16(%rbx), %xmm6
	movups	%xmm6, 16(%rdx)
	movdqu	32(%rbx), %xmm7
	movups	%xmm7, 32(%rdx)
	movzbl	48(%rbx), %eax
	movb	%al, 48(%rdx)
	jmp	.L215
.L228:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	ret
	.cfi_endproc
.LFE7016:
	.size	_ZSt16__insertion_sortIN9__gnu_cxx17__normal_iteratorIPN7edge_ai3ecs6Kernel4Impl7PendingESt6vectorIS6_SaIS6_EEEENS0_5__ops15_Iter_comp_iterIZNKS4_15canonical_stateEvEUlRKS6_SF_E_EEEvT_SI_T0_, .-_ZSt16__insertion_sortIN9__gnu_cxx17__normal_iteratorIPN7edge_ai3ecs6Kernel4Impl7PendingESt6vectorIS6_SaIS6_EEEENS0_5__ops15_Iter_comp_iterIZNKS4_15canonical_stateEvEUlRKS6_SF_E_EEEvT_SI_T0_
	.p2align 4
	.type	_ZSt16__insertion_sortIN9__gnu_cxx17__normal_iteratorIPN7edge_ai3ecs6Kernel4Impl7PendingESt6vectorIS6_SaIS6_EEEENS0_5__ops15_Iter_comp_iterIZNS4_14commit_throughEmNS3_12CapabilitiesENS3_10WorkBudgetEEUlRKS6_SH_E_EEEvT_SK_T0_, @function
_ZSt16__insertion_sortIN9__gnu_cxx17__normal_iteratorIPN7edge_ai3ecs6Kernel4Impl7PendingESt6vectorIS6_SaIS6_EEEENS0_5__ops15_Iter_comp_iterIZNS4_14commit_throughEmNS3_12CapabilitiesENS3_10WorkBudgetEEUlRKS6_SH_E_EEEvT_SK_T0_:
.LFB6989:
	.cfi_startproc
	cmpq	%rdi, %rsi
	je	.L258
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	leaq	56(%rdi), %rdx
	movq	%rsi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdi, %rbx
	subq	$72, %rsp
	.cfi_def_cfa_offset 112
	cmpq	%rdx, %rsi
	je	.L234
	movl	$56, %ebp
	.p2align 4,,10
	.p2align 3
.L252:
	movq	(%rdx), %rsi
	cmpq	(%rbx), %rsi
	je	.L262
	jb	.L240
	movl	8(%rdx), %edi
	movq	16(%rdx), %r8
.L241:
	movq	48(%rdx), %rax
	movdqu	(%rdx), %xmm4
	movdqu	16(%rdx), %xmm5
	movdqu	32(%rdx), %xmm6
	movq	%rax, 48(%rsp)
	movq	%rdx, %rax
	movaps	%xmm4, (%rsp)
	movaps	%xmm5, 16(%rsp)
	movaps	%xmm6, 32(%rsp)
	.p2align 4,,10
	.p2align 3
.L247:
	cmpq	-56(%rax), %rsi
	je	.L248
.L261:
	jb	.L249
.L250:
	movzbl	48(%rsp), %ecx
	movdqa	(%rsp), %xmm7
	leaq	56(%rdx), %r12
	movdqa	16(%rsp), %xmm3
	movdqa	32(%rsp), %xmm4
	movb	%cl, 48(%rax)
	movups	%xmm7, (%rax)
	movups	%xmm3, 16(%rax)
	movups	%xmm4, 32(%rax)
.L246:
	movq	%r12, %rdx
	cmpq	%r12, %r13
	jne	.L252
.L234:
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L248:
	.cfi_restore_state
	cmpl	-48(%rax), %edi
	jne	.L261
	cmpq	-40(%rax), %r8
	je	.L250
	jnb	.L250
	.p2align 4,,10
	.p2align 3
.L249:
	movdqu	-56(%rax), %xmm0
	movdqu	-40(%rax), %xmm1
	subq	$56, %rax
	movdqu	32(%rax), %xmm2
	movzbl	48(%rax), %ecx
	movups	%xmm0, 56(%rax)
	movups	%xmm1, 72(%rax)
	movups	%xmm2, 88(%rax)
	movb	%cl, 104(%rax)
	jmp	.L247
	.p2align 4,,10
	.p2align 3
.L240:
	movq	48(%rdx), %rax
	movdqu	(%rdx), %xmm3
	leaq	56(%rdx), %r12
	movdqu	16(%rdx), %xmm4
	movdqu	32(%rdx), %xmm5
	movq	%rax, 48(%rsp)
	movq	%rdx, %rax
	subq	%rbx, %rax
	movaps	%xmm3, (%rsp)
	movaps	%xmm4, 16(%rsp)
	movaps	%xmm5, 32(%rsp)
	cmpq	$56, %rax
	jle	.L244
	movq	%rbp, %rdi
	movq	%rbx, %rsi
	subq	%rax, %rdi
	addq	%rdx, %rdi
	movq	%rax, %rdx
	call	memmove@PLT
.L245:
	movdqa	(%rsp), %xmm6
	movdqa	16(%rsp), %xmm7
	movdqa	32(%rsp), %xmm3
	movzbl	48(%rsp), %eax
	movups	%xmm6, (%rbx)
	movb	%al, 48(%rbx)
	movups	%xmm7, 16(%rbx)
	movups	%xmm3, 32(%rbx)
	jmp	.L246
	.p2align 4,,10
	.p2align 3
.L262:
	movl	8(%rdx), %edi
	cmpl	8(%rbx), %edi
	je	.L263
	jb	.L240
	movq	16(%rdx), %r8
	jmp	.L241
	.p2align 4,,10
	.p2align 3
.L263:
	movq	16(%rdx), %rax
	movq	16(%rbx), %r8
	cmpq	%r8, %rax
	je	.L241
	jb	.L240
	movq	%rax, %r8
	jmp	.L241
	.p2align 4,,10
	.p2align 3
.L244:
	jne	.L245
	movdqu	(%rbx), %xmm5
	movups	%xmm5, (%rdx)
	movdqu	16(%rbx), %xmm6
	movups	%xmm6, 16(%rdx)
	movdqu	32(%rbx), %xmm7
	movups	%xmm7, 32(%rdx)
	movzbl	48(%rbx), %eax
	movb	%al, 48(%rdx)
	jmp	.L245
.L258:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	ret
	.cfi_endproc
.LFE6989:
	.size	_ZSt16__insertion_sortIN9__gnu_cxx17__normal_iteratorIPN7edge_ai3ecs