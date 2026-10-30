	.file	"ecs_tests.cpp"
	.text
#APP
	.globl _ZSt21ios_base_library_initv
#NO_APP
	.section	.text.unlikely,"ax",@progbits
.LCOLDB2:
	.text
.LHOTB2:
	.p2align 4
	.type	_ZN12_GLOBAL__N_14tinyEm, @function
_ZN12_GLOBAL__N_14tinyEm:
.LFB6347:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA6347
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pxor	%xmm0, %xmm0
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	subq	$120, %rsp
	.cfi_def_cfa_offset 144
	movdqa	.LC0(%rip), %xmm1
	movq	%fs:40, %rax
	movq	%rax, 104(%rsp)
	xorl	%eax, %eax
	movaps	%xmm0, 64(%rsp)
	movdqa	64(%rsp), %xmm2
	movaps	%xmm0, 80(%rsp)
	movdqa	80(%rsp), %xmm3
	movups	%xmm1, (%rsp)
	movups	%xmm2, 16(%rsp)
	movups	%xmm3, 32(%rsp)
.LEHB0:
	call	_ZN7edge_ai3ecs6KernelC1ENS0_6ConfigE@PLT
.LEHE0:
	addq	$48, %rsp
	.cfi_def_cfa_offset 96
	movq	%rbx, %rdi
.LEHB1:
	call	_ZN7edge_ai3ecs6Kernel13create_entityEv@PLT
	movq	%rax, %rsi
	movq	%rbp, %rcx
	xorl	%edx, %edx
	movq	%rbx, %rdi
	call	_ZN7edge_ai3ecs6Kernel13set_componentENS0_8EntityIdEtm@PLT
.LEHE1:
	movq	56(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L9
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movq	%rbx, %rax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L9:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
.L5:
	endbr64
	movq	%rax, %rbp
	jmp	.L2
	.globl	__gxx_personality_v0
	.section	.gcc_except_table,"a",@progbits
.LLSDA6347:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE6347-.LLSDACSB6347
.LLSDACSB6347:
	.uleb128 .LEHB0-.LFB6347
	.uleb128 .LEHE0-.LEHB0
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB1-.LFB6347
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L5-.LFB6347
	.uleb128 0
.LLSDACSE6347:
	.text
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDAC6347
	.type	_ZN12_GLOBAL__N_14tinyEm.cold, @function
_ZN12_GLOBAL__N_14tinyEm.cold:
.LFSB6347:
.L2:
	.cfi_def_cfa_offset 96
	.cfi_offset 3, -24
	.cfi_offset 6, -16
	movq	%rbx, %rdi
	call	_ZN7edge_ai3ecs6KernelD1Ev@PLT
	movq	56(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L10
	movq	%rbp, %rdi
.LEHB2:
	call	_Unwind_Resume@PLT
.LEHE2:
.L10:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE6347:
	.section	.gcc_except_table
.LLSDAC6347:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSEC6347-.LLSDACSBC6347
.LLSDACSBC6347:
	.uleb128 .LEHB2-.LCOLDB2
	.uleb128 .LEHE2-.LEHB2
	.uleb128 0
	.uleb128 0
.LLSDACSEC6347:
	.section	.text.unlikely
	.text
	.size	_ZN12_GLOBAL__N_14tinyEm, .-_ZN12_GLOBAL__N_14tinyEm
	.section	.text.unlikely
	.size	_ZN12_GLOBAL__N_14tinyEm.cold, .-_ZN12_GLOBAL__N_14tinyEm.cold
.LCOLDE2:
	.text
.LHOTE2:
	.section	.text.unlikely
.LCOLDB3:
	.text
.LHOTB3:
	.p2align 4
	.type	_ZN12_GLOBAL__N_17requireEbPKc, @function
_ZN12_GLOBAL__N_17requireEbPKc:
.LFB6340:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA6340
	addl	$1, _ZN12_GLOBAL__N_16checksE(%rip)
	testb	%dil, %dil
	je	.L15
	ret
	.section	.gcc_except_table
.LLSDA6340:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE6340-.LLSDACSB6340
.LLSDACSB6340:
.LLSDACSE6340:
	.text
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDAC6340
	.type	_ZN12_GLOBAL__N_17requireEbPKc.cold, @function
_ZN12_GLOBAL__N_17requireEbPKc.cold:
.LFSB6340:
.L15:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	$16, %edi
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	movq	%rsi, 8(%rsp)
	call	__cxa_allocate_exception@PLT
	movq	8(%rsp), %rsi
	movq	%rax, %rdi
	movq	%rax, %rbx
.LEHB3:
	call	_ZNSt13runtime_errorC1EPKc@PLT
.LEHE3:
	movq	_ZNSt13runtime_errorD1Ev@GOTPCREL(%rip), %rdx
	leaq	_ZTISt13runtime_error(%rip), %rsi
	movq	%rbx, %rdi
.LEHB4:
	call	__cxa_throw@PLT
.L14:
	endbr64
	movq	%rax, %rbp
	movq	%rbx, %rdi
	call	__cxa_free_exception@PLT
	movq	%rbp, %rdi
	call	_Unwind_Resume@PLT
.LEHE4:
	.cfi_endproc
.LFE6340:
	.section	.gcc_except_table
.LLSDAC6340:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSEC6340-.LLSDACSBC6340
.LLSDACSBC6340:
	.uleb128 .LEHB3-.LCOLDB3
	.uleb128 .LEHE3-.LEHB3
	.uleb128 .L14-.LCOLDB3
	.uleb128 0
	.uleb128 .LEHB4-.LCOLDB3
	.uleb128 .LEHE4-.LEHB4
	.uleb128 0
	.uleb128 0
.LLSDACSEC6340:
	.section	.text.unlikely
	.text
	.size	_ZN12_GLOBAL__N_17requireEbPKc, .-_ZN12_GLOBAL__N_17requireEbPKc
	.section	.text.unlikely
	.size	_ZN12_GLOBAL__N_17requireEbPKc.cold, .-_ZN12_GLOBAL__N_17requireEbPKc.cold
.LCOLDE3:
	.text
.LHOTE3:
	.p2align 4
	.type	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c.isra.0, @function
_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c.isra.0:
.LFB7621:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	(%rdi), %rax
	movb	%sil, 12(%rsp)
	movq	-24(%rax), %rax
	cmpq	$0, 16(%rdi,%rax)
	je	.L19
	leaq	12(%rsp), %rsi
	movl	$1, %edx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
.L18:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L19:
	.cfi_restore_state
	movsbl	12(%rsp), %esi
	call	_ZNSo3putEc@PLT
	jmp	.L18
	.cfi_endproc
.LFE7621:
	.size	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c.isra.0, .-_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c.isra.0
	.p2align 4
	.type	_ZSteqIhSaIhEEbRKSt6vectorIT_T0_ES6_.isra.0, @function
_ZSteqIhSaIhEEbRKSt6vectorIT_T0_ES6_.isra.0:
.LFB7622:
	.cfi_startproc
	movq	%rdx, %rax
	movq	%rsi, %rdx
	xorl	%esi, %esi
	subq	%rdi, %rdx
	subq	%rax, %rcx
	cmpq	%rcx, %rdx
	je	.L31
.L28:
	movl	%esi, %eax
	ret
.L31:
	movl	$1, %esi
	testq	%rdx, %rdx
	je	.L28
	pushq	%rcx
	.cfi_def_cfa_offset 16
	movq	%rax, %rsi
	call	memcmp@PLT
	testl	%eax, %eax
	sete	%sil
	movl	%esi, %eax
	popq	%rsi
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE7622:
	.size	_ZSteqIhSaIhEEbRKSt6vectorIT_T0_ES6_.isra.0, .-_ZSteqIhSaIhEEbRKSt6vectorIT_T0_ES6_.isra.0
	.section	.text.unlikely
.LCOLDB4:
	.text
.LHOTB4:
	.p2align 4
	.globl	_Znwm
	.type	_Znwm, @function
_Znwm:
.LFB6334:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	cmpb	$0, _ZN12_GLOBAL__N_117count_allocationsE(%rip)
	je	.L33
	addq	$1, _ZN12_GLOBAL__N_116allocation_countE(%rip)
.L33:
	testq	%rdi, %rdi
	movl	$1, %eax
	cmove	%rax, %rdi
	call	malloc@PLT
	testq	%rax, %rax
	je	.L34
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	_Znwm.cold, @function
_Znwm.cold:
.LFSB6334:
.L34:
	.cfi_def_cfa_offset 16
	movl	$8, %edi
	call	__cxa_allocate_exception@PLT
	movq	_ZNSt9bad_allocD1Ev@GOTPCREL(%rip), %rdx
	leaq	_ZTISt9bad_alloc(%rip), %rsi
	movq	%rax, %rdi
	leaq	16+_ZTVSt9bad_alloc(%rip), %rax
	movq	%rax, (%rdi)
	call	__cxa_throw@PLT
	.cfi_endproc
.LFE6334:
	.text
	.size	_Znwm, .-_Znwm
	.section	.text.unlikely
	.size	_Znwm.cold, .-_Znwm.cold
.LCOLDE4:
	.text
.LHOTE4:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC5:
	.string	"basic_string::append"
.LC6:
	.string	"basic_string::_M_create"
	.text
	.align 2
	.p2align 4
	.type	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6appendEPKcm.isra.0, @function
_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6appendEPKcm.isra.0:
.LFB7624:
	.cfi_startproc
	movabsq	$9223372036854775807, %rax
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
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
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movq	8(%rdi), %r14
	subq	%r14, %rax
	cmpq	%rdx, %rax
	jb	.L66
	movq	%rdi, %rbx
	movq	(%rdi), %rdi
	movq	%rsi, %rcx
	movq	%rdx, %rbp
	leaq	16(%rbx), %r8
	leaq	(%r14,%rdx), %r13
	cmpq	%r8, %rdi
	je	.L67
	movq	16(%rbx), %rax
	cmpq	%r13, %rax
	jb	.L41
.L40:
	testq	%rbp, %rbp
	je	.L42
	addq	%r14, %rdi
	cmpq	$1, %rbp
	je	.L68
	movq	%rbp, %rdx
	movq	%rcx, %rsi
	call	memcpy@PLT
	movq	(%rbx), %rdi
.L42:
	movq	%r13, 8(%rbx)
	movb	$0, (%rdi,%r13)
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
.L67:
	.cfi_restore_state
	movl	$15, %eax
	cmpq	$15, %r13
	jbe	.L40
.L41:
	testq	%r13, %r13
	js	.L69
	addq	%rax, %rax
	movq	%r13, %r15
	cmpq	%rax, %r13
	jb	.L70
.L45:
	movq	%r15, %rdi
	addq	$1, %rdi
	js	.L71
	movq	%rcx, 8(%rsp)
	movq	%r8, (%rsp)
	call	_Znwm
	testq	%r14, %r14
	movq	(%rsp), %r8
	movq	8(%rsp), %rcx
	movq	%rax, %r12
	je	.L47
	movq	(%rbx), %rsi
	cmpq	$1, %r14
	je	.L72
	movq	%r14, %rdx
	movq	%rax, %rdi
	movq	%rcx, 8(%rsp)
	movq	%r8, (%rsp)
	call	memcpy@PLT
	movq	8(%rsp), %rcx
	movq	(%rsp), %r8
.L47:
	testq	%rcx, %rcx
	je	.L49
	testq	%rbp, %rbp
	je	.L49
	leaq	(%r12,%r14), %rdi
	cmpq	$1, %rbp
	je	.L73
	movq	%rbp, %rdx
	movq	%rcx, %rsi
	movq	%r8, (%rsp)
	call	memcpy@PLT
	movq	(%rsp), %r8
.L49:
	movq	(%rbx), %rdi
	cmpq	%rdi, %r8
	je	.L51
	call	free@PLT
.L51:
	movq	%r12, (%rbx)
	movq	%r12, %rdi
	movq	%r15, 16(%rbx)
	jmp	.L42
.L70:
	movabsq	$9223372036854775807, %r15
	cmpq	%r15, %rax
	cmovbe	%rax, %r15
	jmp	.L45
.L68:
	movzbl	(%rcx), %eax
	movb	%al, (%rdi)
	movq	(%rbx), %rdi
	jmp	.L42
.L72:
	movzbl	(%rsi), %eax
	movb	%al, (%r12)
	jmp	.L47
.L73:
	movzbl	(%rcx), %eax
	movb	%al, (%rdi)
	jmp	.L49
.L71:
	call	_ZSt17__throw_bad_allocv@PLT
.L66:
	leaq	.LC5(%rip), %rdi
	call	_ZSt20__throw_length_errorPKc@PLT
.L69:
	leaq	.LC6(%rip), %rdi
	call	_ZSt20__throw_length_errorPKc@PLT
	.cfi_endproc
.LFE7624:
	.size	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6appendEPKcm.isra.0, .-_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6appendEPKcm.isra.0
	.section	.text.unlikely
.LCOLDB7:
	.text
.LHOTB7:
	.p2align 4
	.globl	_Znam
	.type	_Znam, @function
_Znam:
.LFB6335:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	cmpb	$0, _ZN12_GLOBAL__N_117count_allocationsE(%rip)
	je	.L75
	addq	$1, _ZN12_GLOBAL__N_116allocation_countE(%rip)
.L75:
	testq	%rdi, %rdi
	movl	$1, %eax
	cmove	%rax, %rdi
	call	malloc@PLT
	testq	%rax, %rax
	je	.L76
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	_Znam.cold, @function
_Znam.cold:
.LFSB6335:
.L76:
	.cfi_def_cfa_offset 16
	movl	$8, %edi
	call	__cxa_allocate_exception@PLT
	movq	_ZNSt9bad_allocD1Ev@GOTPCREL(%rip), %rdx
	leaq	_ZTISt9bad_alloc(%rip), %rsi
	movq	%rax, %rdi
	leaq	16+_ZTVSt9bad_alloc(%rip), %rax
	movq	%rax, (%rdi)
	call	__cxa_throw@PLT
	.cfi_endproc
.LFE6335:
	.text
	.size	_Znam, .-_Znam
	.section	.text.unlikely
	.size	_Znam.cold, .-_Znam.cold
.LCOLDE7:
	.text
.LHOTE7:
	.p2align 4
	.globl	_ZdlPv
	.type	_ZdlPv, @function
_ZdlPv:
.LFB6336:
	.cfi_startproc
	endbr64
	jmp	free@PLT
	.cfi_endproc
.LFE6336:
	.size	_ZdlPv, .-_ZdlPv
	.p2align 4
	.globl	_ZdaPv
	.type	_ZdaPv, @function
_ZdaPv:
.LFB7618:
	.cfi_startproc
	endbr64
	jmp	free@PLT
	.cfi_endproc
.LFE7618:
	.size	_ZdaPv, .-_ZdaPv
	.p2align 4
	.globl	_ZdlPvm
	.type	_ZdlPvm, @function
_ZdlPvm:
.LFB6338:
	.cfi_startproc
	endbr64
	jmp	free@PLT
	.cfi_endproc
.LFE6338:
	.size	_ZdlPvm, .-_ZdlPvm
	.p2align 4
	.globl	_ZdaPvm
	.type	_ZdaPvm, @function
_ZdaPvm:
.LFB7620:
	.cfi_startproc
	endbr64
	jmp	free@PLT
	.cfi_endproc
.LFE7620:
	.size	_ZdaPvm, .-_ZdaPvm
	.section	.text._ZNSt6vectorIhSaIhEEC1ERKS1_,"axG",@progbits,_ZNSt6vectorIhSaIhEEC1ERKS1_,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt6vectorIhSaIhEEC1ERKS1_
	.type	_ZNSt6vectorIhSaIhEEC1ERKS1_, @function
_ZNSt6vectorIhSaIhEEC1ERKS1_:
.LFB6393:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pxor	%xmm0, %xmm0
	movq	%rsi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	8(%rsi), %rbp
	movq	%rdi, %rbx
	subq	(%rsi), %rbp
	movq	$0, 16(%rdi)
	movups	%xmm0, (%rdi)
	je	.L89
	js	.L91
	movq	%rbp, %rdi
	call	_Znwm
	movq	%rax, %rcx
.L84:
	movq	%rcx, %xmm0
	addq	%rcx, %rbp
	punpcklqdq	%xmm0, %xmm0
	movq	%rbp, 16(%rbx)
	movups	%xmm0, (%rbx)
	movq	(%r12), %rsi
	movq	8(%r12), %rax
	subq	%rsi, %rax
	cmpq	$1, %rax
	jle	.L86
	movq	%rcx, %rdi
	movq	%rax, %rdx
	movq	%rax, %rbp
	call	memmove@PLT
	movq	%rax, %rcx
.L87:
	addq	%rbp, %rcx
	movq	%rcx, 8(%rbx)
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L89:
	.cfi_restore_state
	xorl	%ecx, %ecx
	jmp	.L84
	.p2align 4,,10
	.p2align 3
.L91:
	call	_ZSt17__throw_bad_allocv@PLT
	.p2align 4,,10
	.p2align 3
.L86:
	movq	%rax, %rbp
	jne	.L87
	movzbl	(%rsi), %eax
	movl	$1, %ebp
	movb	%al, (%rcx)
	jmp	.L87
	.cfi_endproc
.LFE6393:
	.size	_ZNSt6vectorIhSaIhEEC1ERKS1_, .-_ZNSt6vectorIhSaIhEEC1ERKS1_
	.section	.rodata._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_.str1.8,"aMS",@progbits,1
	.align 8
.LC8:
	.string	"basic_string: construction from null is not valid"
	.section	.text._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_,"axG",@progbits,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC5IS3_EEPKcRKS3_,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_
	.type	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_, @function
_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_:
.LFB6725:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	leaq	16(%rdi), %r13
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movq	%r13, (%rdi)
	testq	%rsi, %rsi
	je	.L103
	movq	%rdi, %rbp
	movq	%rsi, %rdi
	movq	%rsi, %r12
	call	strlen@PLT
	movq	%rax, %rbx
	cmpq	$15, %rax
	ja	.L104
	cmpq	$1, %rax
	je	.L105
	testq	%rax, %rax
	jne	.L95
.L97:
	movq	%rbx, 8(%rbp)
	movb	$0, 0(%r13,%rbx)
	addq	$8, %rsp
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
.L105:
	.cfi_restore_state
	movzbl	(%r12), %eax
	movb	%al, 16(%rbp)
	jmp	.L97
	.p2align 4,,10
	.p2align 3
.L104:
	leaq	1(%rax), %rdi
	call	_Znwm
	movq	%rbx, 16(%rbp)
	movq	%rax, 0(%rbp)
	movq	%rax, %r13
.L95:
	movq	%r13, %rdi
	movq	%rbx, %rdx
	movq	%r12, %rsi
	call	memcpy@PLT
	movq	0(%rbp), %r13
	jmp	.L97
.L103:
	leaq	.LC8(%rip), %rdi
	call	_ZSt19__throw_logic_errorPKc@PLT
	.cfi_endproc
.LFE6725:
	.size	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_, .-_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_
	.weak	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_
	.set	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_
	.section	.text._ZNSt6vectorIhSaIhEED2Ev,"axG",@progbits,_ZNSt6vectorIhSaIhEED5Ev,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt6vectorIhSaIhEED2Ev
	.type	_ZNSt6vectorIhSaIhEED2Ev, @function
_ZNSt6vectorIhSaIhEED2Ev:
.LFB6847:
	.cfi_startproc
	endbr64
	movq	(%rdi), %rdi
	testq	%rdi, %rdi
	je	.L106
	jmp	free@PLT
	.p2align 4,,10
	.p2align 3
.L106:
	ret
	.cfi_endproc
.LFE6847:
	.size	_ZNSt6vectorIhSaIhEED2Ev, .-_ZNSt6vectorIhSaIhEED2Ev
	.weak	_ZNSt6vectorIhSaIhEED1Ev
	.set	_ZNSt6vectorIhSaIhEED1Ev,_ZNSt6vectorIhSaIhEED2Ev
	.section	.text._ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_,"axG",@progbits,_ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_,comdat
	.p2align 4
	.weak	_ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_
	.type	_ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_, @function
_ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_:
.LFB6853:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	8(%rdi), %r12
	movq	%rsi, %rdi
	movq	%rsi, %rbx
	call	strlen@PLT
	movq	%rax, %rdx
	xorl	%eax, %eax
	cmpq	%rdx, %r12
	je	.L114
.L108:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L114:
	.cfi_restore_state
	movl	$1, %eax
	testq	%r12, %r12
	je	.L108
	movq	0(%rbp), %rdi
	movq	%r12, %rdx
	movq	%rbx, %rsi
	call	memcmp@PLT
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	testl	%eax, %eax
	popq	%r12
	.cfi_def_cfa_offset 8
	sete	%al
	ret
	.cfi_endproc
.LFE6853:
	.size	_ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_, .-_ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_
	.section	.text._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv,"axG",@progbits,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	.type	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv, @function
_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv:
.LFB6947:
	.cfi_startproc
	endbr64
	movq	(%rdi), %rax
	addq	$16, %rdi
	cmpq	%rdi, %rax
	je	.L115
	movq	%rax, %rdi
	jmp	free@PLT
	.p2align 4,,10
	.p2align 3
.L115:
	ret
	.cfi_endproc
.LFE6947:
	.size	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv, .-_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	.section	.text.unlikely
.LCOLDB9:
	.text
.LHOTB9:
	.p2align 4
	.type	_ZSt12__str_concatINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEET_PKNS6_10value_typeENS6_9size_typeES9_SA_RKNS6_14allocator_typeE.isra.0, @function
_ZSt12__str_concatINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEET_PKNS6_10value_typeENS6_9size_typeES9_SA_RKNS6_14allocator_typeE.isra.0:
.LFB7637:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA7637
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	leaq	(%rdx,%r8), %rax
	leaq	16(%rdi), %r15
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rsi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rcx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%r8, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movq	%r15, (%rdi)
	movq	$0, 8(%rdi)
	movb	$0, 16(%rdi)
	cmpq	$15, %rax
	ja	.L131
.L118:
	movq	%r12, %rdx
	movq	%r14, %rsi
	movq	%rbx, %rdi
.LEHB5:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6appendEPKcm.isra.0
	movq	%rbp, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6appendEPKcm.isra.0
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%rbx, %rax
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
.L131:
	.cfi_restore_state
	testq	%rax, %rax
	js	.L132
	movl	$30, %edx
	cmpq	%rdx, %rax
	cmovnb	%rax, %rdx
	movq	%rdx, %rdi
	movq	%rdx, (%rsp)
	addq	$1, %rdi
	js	.L133
	call	_Znwm
	movq	%rax, %rcx
	movq	8(%rbx), %rax
	movq	(%rbx), %rsi
	leaq	1(%rax), %rdx
	testq	%rax, %rax
	je	.L134
	testq	%rdx, %rdx
	jne	.L135
.L122:
	cmpq	%rsi, %r15
	je	.L123
	movq	%rsi, %rdi
	movq	%rcx, 8(%rsp)
	call	free@PLT
	movq	8(%rsp), %rcx
.L123:
	movq	(%rsp), %rax
	movq	%rcx, (%rbx)
	movq	%rax, 16(%rbx)
	jmp	.L118
.L135:
	movq	%rcx, %rdi
	movq	%rsi, 8(%rsp)
	call	memcpy@PLT
	movq	8(%rsp), %rsi
	movq	%rax, %rcx
	jmp	.L122
.L134:
	movzbl	(%rsi), %eax
	movb	%al, (%rcx)
	jmp	.L122
.L133:
	call	_ZSt17__throw_bad_allocv@PLT
.L132:
	leaq	.LC6(%rip), %rdi
	call	_ZSt20__throw_length_errorPKc@PLT
.LEHE5:
.L125:
	endbr64
	movq	%rax, %rbp
	jmp	.L124
	.section	.gcc_except_table
.LLSDA7637:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE7637-.LLSDACSB7637
.LLSDACSB7637:
	.uleb128 .LEHB5-.LFB7637
	.uleb128 .LEHE5-.LEHB5
	.uleb128 .L125-.LFB7637
	.uleb128 0
.LLSDACSE7637:
	.text
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDAC7637
	.type	_ZSt12__str_concatINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEET_PKNS6_10value_typeENS6_9size_typeES9_SA_RKNS6_14allocator_typeE.isra.0.cold, @function
_ZSt12__str_concatINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEET_PKNS6_10value_typeENS6_9size_typeES9_SA_RKNS6_14allocator_typeE.isra.0.cold:
.LFSB7637:
.L124:
	.cfi_def_cfa_offset 80
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	movq	%rbx, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	movq	%rbp, %rdi
.LEHB6:
	call	_Unwind_Resume@PLT
.LEHE6:
	.cfi_endproc
.LFE7637:
	.section	.gcc_except_table
.LLSDAC7637:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSEC7637-.LLSDACSBC7637
.LLSDACSBC7637:
	.uleb128 .LEHB6-.LCOLDB9
	.uleb128 .LEHE6-.LEHB6
	.uleb128 0
	.uleb128 0
.LLSDACSEC7637:
	.section	.text.unlikely
	.text
	.size	_ZSt12__str_concatINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEET_PKNS6_10value_typeENS6_9size_typeES9_SA_RKNS6_14allocator_typeE.isra.0, .-_ZSt12__str_concatINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEET_PKNS6_10value_typeENS6_9size_typeES9_SA_RKNS6_14allocator_typeE.isra.0
	.section	.text.unlikely
	.size	_ZSt12__str_concatINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEET_PKNS6_10value_typeENS6_9size_typeES9_SA_RKNS6_14allocator_typeE.isra.0.cold, .-_ZSt12__str_concatINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEET_PKNS6_10value_typeENS6_9size_typeES9_SA_RKNS6_14allocator_typeE.isra.0.cold
.LCOLDE9:
	.text
.LHOTE9:
	.section	.text._ZNSt12_Vector_baseIN7edge_ai9LutSampleESaIS1_EED2Ev,"axG",@progbits,_ZNSt12_Vector_baseIN7edge_ai9LutSampleESaIS1_EED5Ev,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt12_Vector_baseIN7edge_ai9LutSampleESaIS1_EED2Ev
	.type	_ZNSt12_Vector_baseIN7edge_ai9LutSampleESaIS1_EED2Ev, @function
_ZNSt12_Vector_baseIN7edge_ai9LutSampleESaIS1_EED2Ev:
.LFB7155:
	.cfi_startproc
	endbr64
	movq	(%rdi), %rdi
	testq	%rdi, %rdi
	je	.L136
	jmp	free@PLT
	.p2align 4,,10
	.p2align 3
.L136:
	ret
	.cfi_endproc
.LFE7155:
	.size	_ZNSt12_Vector_baseIN7edge_ai9LutSampleESaIS1_EED2Ev, .-_ZNSt12_Vector_baseIN7edge_ai9LutSampleESaIS1_EED2Ev
	.weak	_ZNSt12_Vector_baseIN7edge_ai9LutSampleESaIS1_EED1Ev
	.set	_ZNSt12_Vector_baseIN7edge_ai9LutSampleESaIS1_EED1Ev,_ZNSt12_Vector_baseIN7edge_ai9LutSampleESaIS1_EED2Ev
	.section	.text._ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mIKhhEEPT0_PT_S7_S5_,"axG",@progbits,_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mIKhhEEPT0_PT_S7_S5_,comdat
	.p2align 4
	.weak	_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mIKhhEEPT0_PT_S7_S5_
	.type	_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mIKhhEEPT0_PT_S7_S5_, @function
_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mIKhhEEPT0_PT_S7_S5_:
.LFB7552:
	.cfi_startproc
	endbr64
	subq	%rdi, %rsi
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdx, %rcx
	movq	%rsi, %rbx
	cmpq	$1, %rsi
	jle	.L139
	movq	%rsi, %rdx
	movq	%rdi, %rsi
	movq	%rcx, %rdi
	call	memmove@PLT
	movq	%rax, %rcx
.L140:
	leaq	(%rcx,%rbx), %rax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L139:
	.cfi_restore_state
	jne	.L140
	movzbl	(%rdi), %eax
	movb	%al, (%rdx)
	jmp	.L140
	.cfi_endproc
.LFE7552:
	.size	_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mIKhhEEPT0_PT_S7_S5_, .-_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mIKhhEEPT0_PT_S7_S5_
	.text
	.align 2
	.p2align 4
	.type	_ZNSt6vectorIhSaIhEEaSERKS1_.isra.0, @function
_ZNSt6vectorIhSaIhEEaSERKS1_.isra.0:
.LFB7639:
	.cfi_startproc
	cmpq	%rdi, %rsi
	je	.L156
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%rdi, %rbx
	movq	8(%rsi), %r14
	movq	(%rsi), %r13
	movq	(%rdi), %rdi
	movq	16(%rbx), %rax
	movq	%r14, %r12
	subq	%r13, %r12
	subq	%rdi, %rax
	cmpq	%r12, %rax
	jb	.L159
	movq	8(%rbx), %rax
	movq	%rax, %rdx
	subq	%rdi, %rdx
	cmpq	%r12, %rdx
	jb	.L148
	movq	%rdi, %rdx
	movq	%r14, %rsi
	movq	%r13, %rdi
	call	_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mIKhhEEPT0_PT_S7_S5_
.L147:
	addq	(%rbx), %r12
	movq	%r12, 8(%rbx)
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
.L159:
	.cfi_restore_state
	testq	%r12, %r12
	js	.L160
	movq	%r12, %rdi
	call	_Znwm
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%rax, %rdx
	movq	%rax, %rbp
	call	_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mIKhhEEPT0_PT_S7_S5_
	movq	(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L146
	call	free@PLT
.L146:
	movq	%rbp, (%rbx)
	addq	%r12, %rbp
	movq	%rbp, 16(%rbx)
	jmp	.L147
.L156:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	ret
.L148:
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	.cfi_offset 6, -40
	.cfi_offset 12, -32
	.cfi_offset 13, -24
	.cfi_offset 14, -16
	cmpq	$1, %rdx
	jle	.L149
	movq	%r13, %rsi
	call	memmove@PLT
	movq	8(%rbp), %r14
	movq	0(%rbp), %r13
	movq	8(%rbx), %rax
.L150:
	movq	%rax, %rdx
	subq	(%rbx), %rdx
	leaq	0(%r13,%rdx), %rsi
	movq	%r14, %rdx
	subq	%rsi, %rdx
	cmpq	$1, %rdx
	jle	.L151
	movq	%rax, %rdi
	call	memmove@PLT
	jmp	.L147
.L151:
	jne	.L147
	movzbl	(%rsi), %edx
	movb	%dl, (%rax)
	jmp	.L147
.L149:
	jne	.L150
	movzbl	0(%r13), %eax
	movb	%al, (%rdi)
	movq	8(%rsi), %r14
	movq	(%rsi), %r13
	movq	8(%rbx), %rax
	jmp	.L150
.L160:
	call	_ZSt17__throw_bad_allocv@PLT
	.cfi_endproc
.LFE7639:
	.size	_ZNSt6vectorIhSaIhEEaSERKS1_.isra.0, .-_ZNSt6vectorIhSaIhEEaSERKS1_.isra.0
	.section	.rodata.str1.1
.LC10:
	.string	"Missing fixture: "
.LC11:
	.string	"vector::_M_realloc_insert"
.LC12:
	.string	"Original initial rho"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC14:
	.string	"TOMAGI tick allocation/work contract"
	.align 8
.LC15:
	.string	"TOMAGI first source trace mismatch"
	.section	.rodata.str1.1
.LC16:
	.string	"TOMAGI second step failed"
	.section	.rodata.str1.8
	.align 8
.LC20:
	.string	"TOMAGI published source final state mismatch"
	.align 8
.LC21:
	.string	"TOMAGI reserved words accepted"
	.section	.rodata.str1.1
.LC22:
	.string	"Truncated TOMAGI accepted"
	.section	.rodata.str1.8
	.align 8
.LC23:
	.string	"Unknown TOMAGI opcode accepted"
	.align 8
.LC24:
	.string	"Invalid TOMAGI successor accepted"
	.align 8
.LC25:
	.string	"Actual source model replay changed canonical state"
	.align 8
.LC26:
	.string	"Fresh model ignored original entry field"
	.section	.text.unlikely
.LCOLDB29:
	.text
.LHOTB29:
	.p2align 4
	.type	_ZN12_GLOBAL__N_111test_tomagiERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE, @function
_ZN12_GLOBAL__N_111test_tomagiERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE:
.LFB6375:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA6375
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rdi, %rsi
	movl	$4, %edx
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
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
	movq	%rdi, %rbx
	subq	$1160, %rsp
	.cfi_def_cfa_offset 1216
	movq	%fs:40, %rax
	movq	%rax, 1144(%rsp)
	xorl	%eax, %eax
	leaq	624(%rsp), %r14
	movq	%r14, %rdi
.LEHB7:
	call	_ZNSt14basic_ifstreamIcSt11char_traitsIcEEC1ERKNSt7__cxx1112basic_stringIcS1_SaIcEEESt13_Ios_Openmode@PLT
.LEHE7:
	movl	912(%rsp), %eax
	andl	$5, %eax
	movl	%eax, 20(%rsp)
	jne	.L255
	movq	624(%rsp), %rax
	pxor	%xmm0, %xmm0
	movq	$0, 272(%rsp)
	movabsq	$9223372036854775807, %r15
	movaps	%xmm0, 256(%rsp)
	movq	-24(%rax), %rax
	movq	856(%rsp,%rax), %rbp
	testq	%rbp, %rbp
	jne	.L164
	jmp	.L165
	.p2align 4,,10
	.p2align 3
.L265:
	movb	%r12b, (%rbx)
	addq	$1, %rbx
	movq	16(%rbp), %rax
	movq	%rbx, 264(%rsp)
	cmpq	24(%rbp), %rax
	jnb	.L176
.L268:
	addq	$1, %rax
	movq	%rax, 16(%rbp)
.L164:
	movq	16(%rbp), %rax
	cmpq	24(%rbp), %rax
	jnb	.L264
	.p2align 4,,10
	.p2align 3
.L178:
	movzbl	(%rax), %r12d
.L166:
	movq	264(%rsp), %rbx
	cmpq	272(%rsp), %rbx
	jne	.L265
	movq	256(%rsp), %r13
	subq	%r13, %rbx
	cmpq	%r15, %rbx
	je	.L266
	testq	%rbx, %rbx
	je	.L267
	movabsq	$9223372036854775807, %rax
	leaq	(%rbx,%rbx), %rdx
	cmpq	%rax, %rdx
	cmovbe	%rdx, %rax
	cmpq	%rbx, %rdx
	cmovb	%r15, %rax
	movq	%rax, %rdi
	movq	%rax, 8(%rsp)
.LEHB8:
	call	_Znwm
	movb	%r12b, (%rax,%rbx)
	movq	%rax, %rcx
	testq	%rbx, %rbx
	jle	.L172
	movq	%rbx, %rdx
	movq	%r13, %rsi
	leaq	1(%rax,%rbx), %r12
	movq	%rax, %rdi
	call	memmove@PLT
	movq	%rax, %rcx
.L174:
	movq	%r13, %rdi
	movq	%rcx, 24(%rsp)
	call	free@PLT
	movq	24(%rsp), %rcx
.L175:
	movq	8(%rsp), %rax
	movq	%rcx, 256(%rsp)
	movq	%r12, 264(%rsp)
	addq	%rax, %rcx
	movq	16(%rbp), %rax
	movq	%rcx, 272(%rsp)
	cmpq	24(%rbp), %rax
	jb	.L268
	.p2align 4,,10
	.p2align 3
.L176:
	movq	0(%rbp), %rax
	movq	%rbp, %rdi
	call	*80(%rax)
	movq	16(%rbp), %rax
	cmpq	24(%rbp), %rax
	jb	.L178
.L264:
	movq	0(%rbp), %rax
	movq	%rbp, %rdi
	call	*72(%rax)
	addl	$1, %eax
	je	.L165
	movq	16(%rbp), %rax
	cmpq	24(%rbp), %rax
	jb	.L178
	movq	0(%rbp), %rax
	movq	%rbp, %rdi
	call	*72(%rax)
	movl	%eax, %r12d
	xorl	%eax, %eax
	cmpl	$-1, %r12d
	cmove	%rax, %rbp
	jmp	.L166
.L267:
	movl	$1, %edi
	call	_Znwm
.LEHE8:
	movb	%r12b, (%rax)
	movq	%rax, %rcx
	movq	$1, 8(%rsp)
.L172:
	leaq	1(%rcx,%rbx), %r12
	testq	%r13, %r13
	je	.L175
	jmp	.L174
	.p2align 4,,10
	.p2align 3
.L165:
	movq	%r14, %rdi
	leaq	232(%rsp), %r13
	call	_ZNSt14basic_ifstreamIcSt11char_traitsIcEED1Ev@PLT
	xorl	%esi, %esi
	movq	%r13, %rdi
.LEHB9:
	call	_ZN12_GLOBAL__N_14tinyEm
.LEHE9:
	movq	256(%rsp), %rsi
	movq	264(%rsp), %rax
	movq	%r13, %rdi
	leaq	256(%rsp), %rbp
	subq	%rsi, %rax
	movq	%rsi, 24(%rsp)
	movq	%rax, %rdx
	movq	%rax, 8(%rsp)
.LEHB10:
	call	_ZN7edge_ai3ecs6Kernel13attach_tomagiESt4spanIKhLm18446744073709551615EE@PLT
	movabsq	$4294967296, %rsi
	movq	%r13, %rdi
	call	_ZN7edge_ai3ecs6Kernel24initialize_tomagi_entityENS0_8EntityIdE@PLT
	movabsq	$4294967296, %rsi
	xorl	%edx, %edx
	movq	%r13, %rdi
	call	_ZNK7edge_ai3ecs6Kernel9componentENS0_8EntityIdEt@PLT
	xorl	%edi, %edi
	cmpq	$19, %rax
	leaq	.LC12(%rip), %rsi
	sete	%dil
	call	_ZN12_GLOBAL__N_17requireEbPKc
	movq	.LC13(%rip), %rax
	movq	%r13, %rdi
	leaq	320(%rsp), %r15
	movq	$1, 320(%rsp)
	movq	$0, 328(%rsp)
	movq	%r15, %rsi
	movq	$1, 336(%rsp)
	movq	%rax, 344(%rsp)
	movq	$256, 352(%rsp)
	movq	$0, 360(%rsp)
	call	_ZN7edge_ai3ecs6Kernel7enqueueERKNS0_5EventE@PLT
	leaq	432(%rsp), %rdi
	movl	$1024, %r8d
	movl	$1000000, %r9d
	movq	%r13, %rsi
	movl	$31, %ecx
	movl	$1, %edx
	movq	$0, _ZN12_GLOBAL__N_116allocation_countE(%rip)
	movb	$1, _ZN12_GLOBAL__N_117count_allocationsE(%rip)
	call	_ZN7edge_ai3ecs6Kernel14commit_throughEmNS0_12CapabilitiesENS0_10WorkBudgetE@PLT
	xorl	%edi, %edi
	cmpq	$0, _ZN12_GLOBAL__N_116allocation_countE(%rip)
	movb	$0, _ZN12_GLOBAL__N_117count_allocationsE(%rip)
	je	.L269
.L190:
	movzbl	%dil, %edi
	leaq	.LC14(%rip), %rsi
	leaq	256(%rsp), %rbp
	call	_ZN12_GLOBAL__N_17requireEbPKc
	movl	$12, %edx
	movq	%r13, %rdi
	movabsq	$4294967296, %rsi
	call	_ZNK7edge_ai3ecs6Kernel9componentENS0_8EntityIdEt@PLT
	xorl	%edi, %edi
	cmpq	$291744817, %rax
	je	.L270
.L191:
	leaq	.LC15(%rip), %rsi
	leaq	256(%rsp), %rbp
	call	_ZN12_GLOBAL__N_17requireEbPKc
	movq	.LC13(%rip), %rax
	movq	%r15, %rsi
	movq	%r13, %rdi
	movq	$2, 320(%rsp)
	movq	$0, 328(%rsp)
	movq	$2, 336(%rsp)
	movq	%rax, 344(%rsp)
	movq	$256, 352(%rsp)
	movq	$0, 360(%rsp)
	call	_ZN7edge_ai3ecs6Kernel7enqueueERKNS0_5EventE@PLT
	movl	$31, %ecx
	movl	$2, %edx
	movq	%r13, %rsi
	movq	%r14, %rdi
	movl	$1024, %r8d
	movl	$1000000, %r9d
	call	_ZN7edge_ai3ecs6Kernel14commit_throughEmNS0_12CapabilitiesENS0_10WorkBudgetE@PLT
	xorl	%edi, %edi
	leaq	.LC16(%rip), %rsi
	cmpq	$1, 640(%rsp)
	sete	%dil
	call	_ZN12_GLOBAL__N_17requireEbPKc
	movdqa	.LC17(%rip), %xmm0
	xorl	%ebx, %ebx
	movq	%rbp, %r12
	movaps	%xmm0, 624(%rsp)
	pxor	%xmm0, %xmm0
	movaps	%xmm0, 640(%rsp)
	movdqa	.LC18(%rip), %xmm0
	movaps	%xmm0, 656(%rsp)
	movdqa	.LC19(%rip), %xmm0
	movaps	%xmm0, 672(%rsp)
	.p2align 4,,10
	.p2align 3
.L192:
	movl	%ebx, %edx
	movq	%r13, %rdi
	movq	%r12, %rbp
	movabsq	$4294967296, %rsi
	call	_ZNK7edge_ai3ecs6Kernel9componentENS0_8EntityIdEt@PLT
	movl	(%r14,%rbx,4), %edx
	xorl	%edi, %edi
	leaq	.LC20(%rip), %rsi
	cmpq	%rax, %rdx
	sete	%dil
	call	_ZN12_GLOBAL__N_17requireEbPKc
	addq	$1, %rbx
	cmpq	$16, %rbx
	jne	.L192
	leaq	256(%rsp), %rbp
	leaq	288(%rsp), %r12
	movq	%rbp, %rsi
	movq	%r12, %rdi
	call	_ZNSt6vectorIhSaIhEEC1ERKS1_
.LEHE10:
	movq	288(%rsp), %rbx
	xorl	%esi, %esi
	movq	%r15, %rdi
	movb	$1, 40(%rbx)
.LEHB11:
	call	_ZN12_GLOBAL__N_14tinyEm
.LEHE11:
	movq	296(%rsp), %rdx
	movq	%rbx, %rsi
	movq	%r15, %rdi
	subq	%rbx, %rdx
.LEHB12:
	call	_ZN7edge_ai3ecs6Kernel13attach_tomagiESt4spanIKhLm18446744073709551615EE@PLT
.LEHE12:
	movq	%r15, %rdi
	call	_ZN7edge_ai3ecs6KernelD1Ev@PLT
	xorl	%edi, %edi
.L193:
	leaq	.LC21(%rip), %rsi
.LEHB13:
	call	_ZN12_GLOBAL__N_17requireEbPKc
	movq	%rbp, %rsi
	movq	%r12, %rdi
	call	_ZNSt6vectorIhSaIhEEaSERKS1_.isra.0
.LEHE13:
	movq	296(%rsp), %rax
	xorl	%esi, %esi
	movq	%r15, %rdi
	leaq	-1(%rax), %rbx
	movq	%rbx, 296(%rsp)
.LEHB14:
	call	_ZN12_GLOBAL__N_14tinyEm
.LEHE14:
	movq	288(%rsp), %rsi
	movq	%r15, %rdi
	subq	%rsi, %rbx
	movq	%rbx, %rdx
.LEHB15:
	call	_ZN7edge_ai3ecs6Kernel13attach_tomagiESt4spanIKhLm18446744073709551615EE@PLT
.LEHE15:
	movq	%r15, %rdi
	call	_ZN7edge_ai3ecs6KernelD1Ev@PLT
	xorl	%edi, %edi
.L199:
	leaq	.LC22(%rip), %rsi
.LEHB16:
	call	_ZN12_GLOBAL__N_17requireEbPKc
	movq	%rbp, %rsi
	movq	%r12, %rdi
	call	_ZNSt6vectorIhSaIhEEaSERKS1_.isra.0
.LEHE16:
	movq	288(%rsp), %rbx
	xorl	%esi, %esi
	movq	%r15, %rdi
	movb	$16, 136(%rbx)
.LEHB17:
	call	_ZN12_GLOBAL__N_14tinyEm
.LEHE17:
	movq	296(%rsp), %rdx
	movq	%rbx, %rsi
	movq	%r15, %rdi
	subq	%rbx, %rdx
.LEHB18:
	call	_ZN7edge_ai3ecs6Kernel13attach_tomagiESt4spanIKhLm18446744073709551615EE@PLT
.LEHE18:
	movq	%r15, %rdi
	call	_ZN7edge_ai3ecs6KernelD1Ev@PLT
	xorl	%edi, %edi
.L204:
	leaq	.LC23(%rip), %rsi
.LEHB19:
	call	_ZN12_GLOBAL__N_17requireEbPKc
	movq	%rbp, %rsi
	movq	%r12, %rdi
	call	_ZNSt6vectorIhSaIhEEaSERKS1_.isra.0
.LEHE19:
	movq	288(%rsp), %rbx
	xorl	%esi, %esi
	movq	%r15, %rdi
	movb	$-1, 160(%rbx)
.LEHB20:
	call	_ZN12_GLOBAL__N_14tinyEm
.LEHE20:
	movq	296(%rsp), %rdx
	movq	%rbx, %rsi
	movq	%r15, %rdi
	subq	%rbx, %rdx
.LEHB21:
	call	_ZN7edge_ai3ecs6Kernel13attach_tomagiESt4spanIKhLm18446744073709551615EE@PLT
.LEHE21:
	movq	%r15, %rdi
	call	_ZN7edge_ai3ecs6KernelD1Ev@PLT
.L209:
	movl	20(%rsp), %edi
	leaq	.LC24(%rip), %rsi
.LEHB22:
	call	_ZN12_GLOBAL__N_17requireEbPKc
	leaq	240(%rsp), %rbx
	xorl	%esi, %esi
	movq	%rbx, %rdi
	call	_ZN12_GLOBAL__N_14tinyEm
.LEHE22:
	movq	24(%rsp), %rsi
	movq	8(%rsp), %rdx
	movq	%rbx, %rdi
.LEHB23:
	call	_ZN7edge_ai3ecs6Kernel13attach_tomagiESt4spanIKhLm18446744073709551615EE@PLT
	movabsq	$4294967296, %rsi
	movq	%rbx, %rdi
	call	_ZN7edge_ai3ecs6Kernel24initialize_tomagi_entityENS0_8EntityIdE@PLT
	movq	.LC13(%rip), %rax
	movq	%r15, %rsi
	movq	%rbx, %rdi
	movq	$2, 320(%rsp)
	movq	$0, 328(%rsp)
	movq	$2, 336(%rsp)
	movq	%rax, 344(%rsp)
	movq	$256, 352(%rsp)
	movq	$0, 360(%rsp)
	call	_ZN7edge_ai3ecs6Kernel7enqueueERKNS0_5EventE@PLT
	movq	.LC13(%rip), %rax
	movq	%r15, %rsi
	movq	%rbx, %rdi
	movq	$1, 320(%rsp)
	movq	$0, 328(%rsp)
	movq	$1, 336(%rsp)
	movq	%rax, 344(%rsp)
	movq	$256, 352(%rsp)
	movq	$0, 360(%rsp)
	call	_ZN7edge_ai3ecs6Kernel7enqueueERKNS0_5EventE@PLT
	leaq	32(%rsp), %rdi
	movl	$1024, %r8d
	movl	$1000000, %r9d
	movq	%rbx, %rsi
	movl	$31, %ecx
	movl	$2, %edx
	call	_ZN7edge_ai3ecs6Kernel14commit_throughEmNS0_12CapabilitiesENS0_10WorkBudgetE@PLT
	leaq	400(%rsp), %rdi
	movq	%r13, %rsi
	call	_ZNK7edge_ai3ecs6Kernel12state_sha256Ev@PLT
	leaq	368(%rsp), %rdi
	movq	%rbx, %rsi
	call	_ZNK7edge_ai3ecs6Kernel12state_sha256Ev@PLT
	movq	368(%rsp), %rax
	movq	376(%rsp), %rdx
	xorq	400(%rsp), %rax
	xorq	408(%rsp), %rdx
	orq	%rdx, %rax
	je	.L271
.L214:
	movl	$1, %edi
.L215:
	xorl	$1, %edi
	leaq	.LC25(%rip), %rsi
	call	_ZN12_GLOBAL__N_17requireEbPKc
	movq	%rbp, %rsi
	movq	%r15, %rdi
	call	_ZNSt6vectorIhSaIhEEC1ERKS1_
.LEHE23:
	movq	320(%rsp), %rsi
	leaq	248(%rsp), %r14
	movq	%r14, %rdi
	movb	$2, 20(%rsi)
	movq	%rsi, 8(%rsp)
	xorl	%esi, %esi
.LEHB24:
	call	_ZN12_GLOBAL__N_14tinyEm
.LEHE24:
	movq	328(%rsp), %rdx
	movq	8(%rsp), %rsi
	movq	%r14, %rdi
	subq	%rsi, %rdx
.LEHB25:
	call	_ZN7edge_ai3ecs6Kernel13attach_tomagiESt4spanIKhLm18446744073709551615EE@PLT
	movabsq	$4294967296, %rsi
	movq	%r14, %rdi
	call	_ZN7edge_ai3ecs6Kernel24initialize_tomagi_entityENS0_8EntityIdE@PLT
	movl	$11, %edx
	movq	%r14, %rdi
	movabsq	$4294967296, %rsi
	call	_ZNK7edge_ai3ecs6Kernel9componentENS0_8EntityIdEt@PLT
	xorl	%edi, %edi
	cmpq	$2, %rax
	leaq	.LC26(%rip), %rsi
	sete	%dil
	call	_ZN12_GLOBAL__N_17requireEbPKc
.LEHE25:
	movq	%r14, %rdi
	call	_ZN7edge_ai3ecs6KernelD1Ev@PLT
	movq	%r15, %rdi
	call	_ZNSt6vectorIhSaIhEED1Ev
	movq	%rbx, %rdi
	call	_ZN7edge_ai3ecs6KernelD1Ev@PLT
	movq	%r12, %rdi
	call	_ZNSt6vectorIhSaIhEED1Ev
	movq	%r13, %rdi
	call	_ZN7edge_ai3ecs6KernelD1Ev@PLT
	movq	%rbp, %rdi
	call	_ZNSt6vectorIhSaIhEED1Ev
	movq	1144(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L272
	addq	$1160, %rsp
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
.L269:
	.cfi_restore_state
	cmpq	$1, 448(%rsp)
	jne	.L190
	cmpq	$146, 464(%rsp)
	sete	%dil
	jmp	.L190
.L271:
	movq	384(%rsp), %rax
	movq	392(%rsp), %rdx
	xorq	416(%rsp), %rax
	xorq	424(%rsp), %rdx
	orq	%rdx, %rax
	jne	.L214
	xorl	%edi, %edi
	jmp	.L215
.L270:
	movl	$1, %esi
	movl	$15, %edx
	movq	%r13, %rdi
	salq	$32, %rsi
.LEHB26:
	call	_ZNK7edge_ai3ecs6Kernel9componentENS0_8EntityIdEt@PLT
.LEHE26:
	xorl	%edi, %edi
	cmpq	$16, %rax
	sete	%dil
	jmp	.L191
.L266:
	movq	1144(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L273
	leaq	.LC11(%rip), %rdi
.LEHB27:
	call	_ZSt20__throw_length_errorPKc@PLT
.LEHE27:
.L272:
	call	__stack_chk_fail@PLT
.L273:
	call	__stack_chk_fail@PLT
.L232:
	endbr64
	movq	%rax, %r14
	jmp	.L217
.L241:
	endbr64
	movq	%rax, %rbx
	movq	%rdx, %r14
	jmp	.L201
.L233:
	endbr64
	movq	%rax, 8(%rsp)
	jmp	.L216
.L239:
	endbr64
	movq	%rax, %rbx
	movq	%rdx, %r14
	jmp	.L195
.L244:
	endbr64
	movq	%rax, %rbx
	movq	%rdx, %r14
	jmp	.L205
.L242:
	endbr64
	movq	%rax, %rbx
	movq	%rdx, %r14
	jmp	.L200
.L243:
	endbr64
	movq	%rax, %rbx
	movq	%rdx, %r14
	jmp	.L206
.L237:
	endbr64
	movq	%rax, %rdi
	jmp	.L180
.L231:
	endbr64
	movq	%rax, %r14
	jmp	.L218
.L246:
	endbr64
	movq	%rax, %rbx
	movq	%rdx, %r14
	jmp	.L210
.L245:
	endbr64
	movq	%rax, %rbx
	movq	%rdx, %r14
	jmp	.L211
.L230:
	endbr64
	movq	%rax, %rbx
	jmp	.L198
.L229:
	endbr64
	movq	%rax, %rbx
	jmp	.L219
.L228:
	endbr64
	movq	%rax, %rbx
	leaq	256(%rsp), %rbp
	jmp	.L220
.L240:
	endbr64
	movq	%rax, %rbx
	movq	%rdx, %r14
	jmp	.L194
	.section	.gcc_except_table
	.align 4
.LLSDA6375:
	.byte	0xff
	.byte	0x9b
	.uleb128 .LLSDATT6375-.LLSDATTD6375
.LLSDATTD6375:
	.byte	0x1
	.uleb128 .LLSDACSE6375-.LLSDACSB6375
.LLSDACSB6375:
	.uleb128 .LEHB7-.LFB6375
	.uleb128 .LEHE7-.LEHB7
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB8-.LFB6375
	.uleb128 .LEHE8-.LEHB8
	.uleb128 .L237-.LFB6375
	.uleb128 0x1
	.uleb128 .LEHB9-.LFB6375
	.uleb128 .LEHE9-.LEHB9
	.uleb128 .L228-.LFB6375
	.uleb128 0
	.uleb128 .LEHB10-.LFB6375
	.uleb128 .LEHE10-.LEHB10
	.uleb128 .L229-.LFB6375
	.uleb128 0
	.uleb128 .LEHB11-.LFB6375
	.uleb128 .LEHE11-.LEHB11
	.uleb128 .L239-.LFB6375
	.uleb128 0x5
	.uleb128 .LEHB12-.LFB6375
	.uleb128 .LEHE12-.LEHB12
	.uleb128 .L240-.LFB6375
	.uleb128 0x5
	.uleb128 .LEHB13-.LFB6375
	.uleb128 .LEHE13-.LEHB13
	.uleb128 .L230-.LFB6375
	.uleb128 0
	.uleb128 .LEHB14-.LFB6375
	.uleb128 .LEHE14-.LEHB14
	.uleb128 .L241-.LFB6375
	.uleb128 0x5
	.uleb128 .LEHB15-.LFB6375
	.uleb128 .LEHE15-.LEHB15
	.uleb128 .L242-.LFB6375
	.uleb128 0x5
	.uleb128 .LEHB16-.LFB6375
	.uleb128 .LEHE16-.LEHB16
	.uleb128 .L230-.LFB6375
	.uleb128 0
	.uleb128 .LEHB17-.LFB6375
	.uleb128 .LEHE17-.LEHB17
	.uleb128 .L243-.LFB6375
	.uleb128 0x5
	.uleb128 .LEHB18-.LFB6375
	.uleb128 .LEHE18-.LEHB18
	.uleb128 .L244-.LFB6375
	.uleb128 0x5
	.uleb128 .LEHB19-.LFB6375
	.uleb128 .LEHE19-.LEHB19
	.uleb128 .L230-.LFB6375
	.uleb128 0
	.uleb128 .LEHB20-.LFB6375
	.uleb128 .LEHE20-.LEHB20
	.uleb128 .L245-.LFB6375
	.uleb128 0x5
	.uleb128 .LEHB21-.LFB6375
	.uleb128 .LEHE21-.LEHB21
	.uleb128 .L246-.LFB6375
	.uleb128 0x5
	.uleb128 .LEHB22-.LFB6375
	.uleb128 .LEHE22-.LEHB22
	.uleb128 .L230-.LFB6375
	.uleb128 0
	.uleb128 .LEHB23-.LFB6375
	.uleb128 .LEHE23-.LEHB23
	.uleb128 .L231-.LFB6375
	.uleb128 0
	.uleb128 .LEHB24-.LFB6375
	.uleb128 .LEHE24-.LEHB24
	.uleb128 .L232-.LFB6375
	.uleb128 0
	.uleb128 .LEHB25-.LFB6375
	.uleb128 .LEHE25-.LEHB25
	.uleb128 .L233-.LFB6375
	.uleb128 0
	.uleb128 .LEHB26-.LFB6375
	.uleb128 .LEHE26-.LEHB26
	.uleb128 .L229-.LFB6375
	.uleb128 0
	.uleb128 .LEHB27-.LFB6375
	.uleb128 .LEHE27-.LEHB27
	.uleb128 .L237-.LFB6375
	.uleb128 0x1
.LLSDACSE6375:
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0
	.byte	0x2
	.byte	0x7d
	.align 4
	.long	DW.ref._ZTISt9exception-.
	.long	0

.LLSDATT6375:
	.text
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDAC6375
	.type	_ZN12_GLOBAL__N_111test_tomagiERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.cold, @function
_ZN12_GLOBAL__N_111test_tomagiERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.cold:
.LFSB6375:
.L216:
	.cfi_def_cfa_offset 1216
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	movq	%r14, %rdi
	call	_ZN7edge_ai3ecs6KernelD1Ev@PLT
	movq	8(%rsp), %r14
.L217:
	movq	%r15, %rdi
	call	_ZNSt6vectorIhSaIhEED1Ev
.L218:
	movq	%rbx, %rdi
	movq	%r14, %rbx
	call	_ZN7edge_ai3ecs6KernelD1Ev@PLT
.L198:
	movq	%r12, %rdi
	call	_ZNSt6vectorIhSaIhEED1Ev
.L219:
	movq	%r13, %rdi
	call	_ZN7edge_ai3ecs6KernelD1Ev@PLT
.L220:
	movq	%rbp, %rdi
	call	_ZNSt6vectorIhSaIhEED1Ev
	movq	1144(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L274
	movq	%rbx, %rdi
.LEHB28:
	call	_Unwind_Resume@PLT
.LEHE28:
.L200:
	movq	%r15, %rdi
	call	_ZN7edge_ai3ecs6KernelD1Ev@PLT
.L201:
	cmpq	$2, %r14
	jne	.L198
	movq	%rbx, %rdi
	call	__cxa_begin_catch@PLT
	call	__cxa_end_catch@PLT
	movl	$1, %edi
	jmp	.L199
.L274:
	call	__stack_chk_fail@PLT
.L194:
	movq	%r15, %rdi
	call	_ZN7edge_ai3ecs6KernelD1Ev@PLT
.L195:
	cmpq	$2, %r14
	jne	.L198
	movq	%rbx, %rdi
	call	__cxa_begin_catch@PLT
	call	__cxa_end_catch@PLT
	movl	$1, %edi
	jmp	.L193
.L255:
	movl	$16, %edi
	leaq	432(%rsp), %r12
	call	__cxa_allocate_exception@PLT
	movq	8(%rbx), %r8
	movq	(%rbx), %rcx
	movq	%r12, %rdi
	movl	$17, %edx
	leaq	.LC10(%rip), %rsi
	movq	%rax, %rbp
.LEHB29:
	call	_ZSt12__str_concatINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEET_PKNS6_10value_typeENS6_9size_typeES9_SA_RKNS6_14allocator_typeE.isra.0
.LEHE29:
	movq	%r12, %rsi
	movq	%rbp, %rdi
.LEHB30:
	call	_ZNSt13runtime_errorC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE@PLT
.LEHE30:
	movq	%r12, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	movq	1144(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L275
	movq	_ZNSt13runtime_errorD1Ev@GOTPCREL(%rip), %rdx
	leaq	_ZTISt13runtime_error(%rip), %rsi
	movq	%rbp, %rdi
.LEHB31:
	call	__cxa_throw@PLT
.LEHE31:
.L205:
	movq	%r15, %rdi
	call	_ZN7edge_ai3ecs6KernelD1Ev@PLT
.L206:
	cmpq	$2, %r14
	jne	.L198
	movq	%rbx, %rdi
	call	__cxa_begin_catch@PLT
	call	__cxa_end_catch@PLT
	movl	$1, %edi
	jmp	.L204
.L275:
	call	__stack_chk_fail@PLT
.L236:
	endbr64
	movq	%r12, %rdi
	movq	%rax, %rbx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
.L188:
	movq	%rbp, %rdi
	call	__cxa_free_exception@PLT
.L186:
	movq	%r14, %rdi
	call	_ZNSt14basic_ifstreamIcSt11char_traitsIcEED1Ev@PLT
	movq	1144(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L276
	movq	%rbx, %rdi
.LEHB32:
	call	_Unwind_Resume@PLT
.LEHE32:
.L235:
	endbr64
	movq	%rax, %rbx
	jmp	.L188
.L276:
	call	__stack_chk_fail@PLT
.L234:
	endbr64
	movq	%rax, %rbx
	jmp	.L186
.L180:
	call	__cxa_begin_catch@PLT
	movq	256(%rsp), %rbp
	movq	1144(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L277
.LEHB33:
	call	__cxa_rethrow@PLT
.LEHE33:
.L210:
	movq	%r15, %rdi
	call	_ZN7edge_ai3ecs6KernelD1Ev@PLT
.L211:
	cmpq	$2, %r14
	jne	.L198
	movq	%rbx, %rdi
	call	__cxa_begin_catch@PLT
	call	__cxa_end_catch@PLT
	movl	$1, 20(%rsp)
	jmp	.L209
.L277:
	call	__stack_chk_fail@PLT
.L238:
	endbr64
	movq	%rax, %rbx
	call	__cxa_end_catch@PLT
	testq	%rbp, %rbp
	je	.L186
	movq	%rbp, %rdi
	call	free@PLT
	jmp	.L186
	.cfi_endproc
.LFE6375:
	.section	.gcc_except_table
	.align 4
.LLSDAC6375:
	.byte	0xff
	.byte	0x9b
	.uleb128 .LLSDATTC6375-.LLSDATTDC6375
.LLSDATTDC6375:
	.byte	0x1
	.uleb128 .LLSDACSEC6375-.LLSDACSBC6375
.LLSDACSBC6375:
	.uleb128 .LEHB28-.LCOLDB29
	.uleb128 .LEHE28-.LEHB28
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB29-.LCOLDB29
	.uleb128 .LEHE29-.LEHB29
	.uleb128 .L235-.LCOLDB29
	.uleb128 0
	.uleb128 .LEHB30-.LCOLDB29
	.uleb128 .LEHE30-.LEHB30
	.uleb128 .L236-.LCOLDB29
	.uleb128 0
	.uleb128 .LEHB31-.LCOLDB29
	.uleb128 .LEHE31-.LEHB31
	.uleb128 .L234-.LCOLDB29
	.uleb128 0
	.uleb128 .LEHB32-.LCOLDB29
	.uleb128 .LEHE32-.LEHB32
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB33-.LCOLDB29
	.uleb128 .LEHE33-.LEHB33
	.uleb128 .L238-.LCOLDB29
	.uleb128 0
.LLSDACSEC6375:
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0
	.byte	0x2
	.byte	0x7d
	.align 4
	.long	DW.ref._ZTISt9exception-.
	.long	0

.LLSDATTC6375:
	.section	.text.unlikely
	.text
	.size	_ZN12_GLOBAL__N_111test_tomagiERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE, .-_ZN12_GLOBAL__N_111test_tomagiERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	.section	.text.unlikely
	.size	_ZN12_GLOBAL__N_111test_tomagiERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.cold, .-_ZN12_GLOBAL__N_111test_tomagiERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.cold
.LCOLDE29:
	.text
.LHOTE29:
	.section	.rodata.str1.1
.LC30:
	.string	"assets/lognet"
	.section	.rodata.str1.8
	.align 8
.LC31:
	.string	"ecs/vendor/tomk/examples/exact19_rule.tmg"
	.section	.rodata.str1.1
.LC32:
	.string	""
	.section	.rodata.str1.8
	.align 8
.LC33:
	.string	"e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
	.section	.rodata.str1.1
.LC34:
	.string	"SHA256 empty KAT"
.LC35:
	.string	"abc"
	.section	.rodata.str1.8
	.align 8
.LC36:
	.string	"ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad"
	.section	.rodata.str1.1
.LC37:
	.string	"SHA256 abc KAT"
	.section	.rodata.str1.8
	.align 8
.LC38:
	.string	"abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq"
	.align 8
.LC39:
	.string	"248d6a61d20638b8e5c026930c3e6039a33ce45964ff2167f6ecedd419db06c1"
	.section	.rodata.str1.1
.LC40:
	.string	"SHA256 padding KAT"
	.section	.rodata.str1.8
	.align 8
.LC41:
	.string	"cdc76e5c9914fb9281a1c7e284d73e67f1809a48a497200e046d39ccc7112cd0"
	.section	.rodata.str1.1
.LC42:
	.string	"SHA256 multiblock KAT"
.LC45:
	.string	"Pair admission"
.LC46:
	.string	"Budget changed state or queue"
	.section	.rodata.str1.8
	.align 8
.LC47:
	.string	"Operation budget changed state"
	.section	.rodata.str1.1
.LC48:
	.string	"Commit allocated memory"
.LC49:
	.string	"Act used wrong snapshot"
	.section	.rodata.str1.8
	.align 8
.LC50:
	.string	"Rewrite did not use pre-event snapshot"
	.section	.rodata.str1.1
.LC51:
	.string	"Next-event admission"
	.section	.rodata.str1.8
	.align 8
.LC52:
	.string	"Rewritten rule did not become active next event"
	.section	.rodata.str1.1
.LC53:
	.string	"Second rewrite snapshot"
	.section	.rodata.str1.8
	.align 8
.LC54:
	.string	"Setup mutation after publication accepted"
	.align 8
.LC55:
	.string	"Rule setup after publication accepted"
	.section	.rodata.str1.1
.LC62:
	.string	"Permuted input admission"
	.section	.rodata.str1.8
	.align 8
.LC63:
	.string	"Canonical replay unexpectedly rejected input"
	.align 8
.LC64:
	.string	"Lexicographic event order changed arithmetic result"
	.align 8
.LC65:
	.string	"Arrival order changed state or receipts"
	.section	.rodata.str1.1
.LC66:
	.string	"Sequence test admission1"
.LC67:
	.string	"Sequence test admission2"
	.section	.rodata.str1.8
	.align 8
.LC68:
	.string	"Out-of-order source sequence not rejected"
	.section	.rodata.str1.1
.LC69:
	.string	"Identical duplicate contract"
.LC70:
	.string	"Duplicate was executed twice"
	.section	.rodata.str1.8
	.align 8
.LC71:
	.string	"Published frontier accepted late event"
	.align 8
.LC72:
	.string	"Previously consumed sequence reused"
	.section	.rodata.str1.1
.LC73:
	.string	"Unknown epoch accepted"
.LC74:
	.string	"Explicit epoch barrier failed"
	.section	.rodata.str1.8
	.align 8
.LC75:
	.string	"New epoch sequence reset rejected"
	.align 8
.LC76:
	.string	"Epoch changed with pending events"
	.section	.rodata.str1.1
.LC77:
	.string	"New epoch did not execute"
.LC78:
	.string	"Clock frontier regressed"
.LC79:
	.string	"Unknown opcode admitted"
.LC80:
	.string	"Unknown flags admitted"
.LC82:
	.string	"Bounded queue first"
.LC83:
	.string	"Queue bound ignored"
.LC85:
	.string	"Empty commit"
.LC87:
	.string	"Zero capacity accepted"
	.section	.rodata.str1.8
	.align 8
.LC89:
	.string	"Component bitset overflow accepted"
	.section	.rodata.str1.1
.LC90:
	.string	"Conflict admission1"
.LC91:
	.string	"Conflict admission2"
	.section	.rodata.str1.8
	.align 8
.LC92:
	.string	"Conflicting duplicate arrival changed pending representation"
	.align 8
.LC93:
	.string	"Conflicting identity was executed"
	.align 8
.LC94:
	.string	"Conflicting duplicate changed result"
	.align 8
.LC95:
	.string	"Checked overflow mutated state"
	.section	.rodata.str1.1
.LC96:
	.string	"Unsigned wrap contract"
.LC98:
	.string	"Generation guard failed"
	.section	.rodata.str1.8
	.align 8
.LC99:
	.string	"Entity reuse retained stale state"
	.section	.rodata.str1.1
.LC102:
	.string	"Exhausted generation reused"
	.section	.rodata.str1.8
	.align 8
.LC105:
	.string	"Failed paired transaction partially committed"
	.section	.rodata.str1.1
.LC106:
	.string	"Rewrite capability bypass"
.LC107:
	.string	"Mutation capability bypass"
.LC108:
	.string	"/hex_validity_bits.bin"
.LC109:
	.string	"/hex_q16_bitplanes.bin"
.LC110:
	.string	"LUT module failed"
	.section	.rodata.str1.8
	.align 8
.LC111:
	.string	"LUT module changed source sample"
	.align 8
.LC112:
	.string	"No invalid source fixture sample"
	.align 8
.LC113:
	.string	"Invalid sample became measured zero"
	.section	.rodata.str1.1
.LC114:
	.string	"\"equal\":true"
	.section	.rodata.str1.8
	.align 8
.LC115:
	.string	"Fixture wrapper replay mismatch"
	.section	.rodata.str1.1
.LC116:
	.string	"PASS: "
.LC117:
	.string	" ECS checks\n"
.LC118:
	.string	"FAIL after "
.LC119:
	.string	": "
	.section	.text.unlikely
.LCOLDB120:
	.section	.text.startup,"ax",@progbits
.LHOTB120:
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB6419:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA6419
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	leaq	-688(%rbp), %r14
	pushq	%r13
	.cfi_offset 13, -40
	leaq	-960(%rbp), %r13
	pushq	%r12
	movq	%r13, %rdx
	pushq	%rbx
	subq	$1256, %rsp
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movl	%edi, -1276(%rbp)
	movq	%r14, %rdi
	movq	%rsi, -1288(%rbp)
	leaq	.LC32(%rip), %rsi
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
.LEHB34:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_
.LEHE34:
	leaq	-496(%rbp), %rbx
	movq	-688(%rbp), %rsi
	movq	-680(%rbp), %rdx
	movq	%rbx, %rdi
	movq	%rbx, -1248(%rbp)
.LEHB35:
	call	_ZN7edge_ai3ecs6sha256ESt4spanIKhLm18446744073709551615EE@PLT
	leaq	-304(%rbp), %r15
	movq	%rbx, %rsi
	movq	%r15, %rdi
	call	_ZN7edge_ai3ecs10hex_digestB5cxx11ERKSt5arrayIhLm32EE@PLT
.LEHE35:
	leaq	.LC33(%rip), %rsi
	movq	%r15, %rdi
	call	_ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_
	leaq	.LC34(%rip), %rsi
	movzbl	%al, %edi
.LEHB36:
	call	_ZN12_GLOBAL__N_17requireEbPKc
.LEHE36:
	movq	%r15, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	movq	%r14, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	movq	%r13, %rdx
	leaq	.LC35(%rip), %rsi
	movq	%r14, %rdi
.LEHB37:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_
.LEHE37:
	movq	-688(%rbp), %rsi
	movq	-680(%rbp), %rdx
	movq	%rbx, %rdi
.LEHB38:
	call	_ZN7edge_ai3ecs6sha256ESt4spanIKhLm18446744073709551615EE@PLT
	movq	%rbx, %rsi
	movq	%r15, %rdi
	call	_ZN7edge_ai3ecs10hex_digestB5cxx11ERKSt5arrayIhLm32EE@PLT
.LEHE38:
	leaq	.LC36(%rip), %rsi
	movq	%r15, %rdi
	call	_ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_
	leaq	.LC37(%rip), %rsi
	movzbl	%al, %edi
.LEHB39:
	call	_ZN12_GLOBAL__N_17requireEbPKc
.LEHE39:
	movq	%r15, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	movq	%r14, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	movq	%r13, %rdx
	leaq	.LC38(%rip), %rsi
	movq	%r14, %rdi
.LEHB40:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_
.LEHE40:
	movq	-688(%rbp), %rsi
	movq	-680(%rbp), %rdx
	movq	%rbx, %rdi
.LEHB41:
	call	_ZN7edge_ai3ecs6sha256ESt4spanIKhLm18446744073709551615EE@PLT
	movq	%rbx, %rsi
	movq	%r15, %rdi
	call	_ZN7edge_ai3ecs10hex_digestB5cxx11ERKSt5arrayIhLm32EE@PLT
.LEHE41:
	leaq	.LC39(%rip), %rsi
	movq	%r15, %rdi
	call	_ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_
	leaq	.LC40(%rip), %rsi
	movzbl	%al, %edi
.LEHB42:
	call	_ZN12_GLOBAL__N_17requireEbPKc
.LEHE42:
	movq	%r15, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	movq	%r14, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	leaq	-672(%rbp), %rax
	movl	$1000001, %edi
	movq	%rax, -688(%rbp)
.LEHB43:
	call	_Znwm
.LEHE43:
	movl	$1000000, %edx
	movl	$97, %esi
	movq	%rax, %rdi
	movq	%rax, -688(%rbp)
	movq	$1000000, -672(%rbp)
	call	memset@PLT
	movl	$1000000, %edx
	movq	%rbx, %rdi
	movq	$1000000, -680(%rbp)
	movb	$0, 1000000(%rax)
	movq	%rax, %rsi
.LEHB44:
	call	_ZN7edge_ai3ecs6sha256ESt4spanIKhLm18446744073709551615EE@PLT
	movq	%rbx, %rsi
	movq	%r15, %rdi
	call	_ZN7edge_ai3ecs10hex_digestB5cxx11ERKSt5arrayIhLm32EE@PLT
.LEHE44:
	leaq	.LC41(%rip), %rsi
	movq	%r15, %rdi
	call	_ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_
	leaq	.LC42(%rip), %rsi
	movzbl	%al, %edi
.LEHB45:
	call	_ZN12_GLOBAL__N_17requireEbPKc
.LEHE45:
	movq	%r15, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	movq	%r14, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	leaq	-1104(%rbp), %rax
	movl	$10, %esi
	movq	%rax, %rdi
	movq	%rax, -1264(%rbp)
.LEHB46:
	call	_ZN12_GLOBAL__N_14tinyEm
.LEHE46:
	movdqa	.LC43(%rip), %xmm5
	movdqa	.LC44(%rip), %xmm6
	subq	$32, %rsp
	movabsq	$4294967296, %rsi
	movdqa	.LC43(%rip), %xmm7
	movaps	%xmm5, -1168(%rbp)
	movaps	%xmm6, -1152(%rbp)
	movups	%xmm7, (%rsp)
	movdqa	-1152(%rbp), %xmm5
	movups	%xmm5, 16(%rsp)
	movq	-1264(%rbp), %rbx
	movq	%rbx, %rdi
.LEHB47:
	.cfi_escape 0x2e,0x20
	call	_ZN7edge_ai3ecs6Kernel8set_ruleENS0_8EntityIdENS0_4RuleE@PLT
	movq	.LC13(%rip), %rax
	addq	$32, %rsp
	movq	%r13, %rsi
	movq	%rbx, %rdi
	movq	$1, -960(%rbp)
	movq	$0, -952(%rbp)
	movq	$1, -944(%rbp)
	movq	%rax, -936(%rbp)
	movq	$6, -928(%rbp)
	movq	$1, -920(%rbp)
	.cfi_escape 0x2e,0
	call	_ZN7edge_ai3ecs6Kernel7enqueueERKNS0_5EventE@PLT
	xorl	%edi, %edi
	testw	%ax, %ax
	leaq	.LC45(%rip), %rsi
	sete	%dil
	call	_ZN12_GLOBAL__N_17requireEbPKc
	leaq	-1056(%rbp), %rdi
	movq	%rbx, %rsi
	movq	%rdi, -1272(%rbp)
	call	_ZNK7edge_ai3ecs6Kernel15canonical_stateEv@PLT
.LEHE47:
	xorl	%r8d, %r8d
	movl	$100000, %r9d
	movq	%rbx, %rsi
	movq	%r14, %rdi
	movl	$31, %ecx
	movl	$1, %edx
.LEHB48:
	call	_ZN7edge_ai3ecs6Kernel14commit_throughEmNS0_12CapabilitiesENS0_10WorkBudgetE@PLT
	cmpw	$11, -688(%rbp)
	je	.L289
	leaq	.LC46(%rip), %rsi
	xorl	%edi, %edi
	call	_ZN12_GLOBAL__N_17requireEbPKc
.L290:
	xorl	%r9d, %r9d
	movl	$31, %ecx
	movl	$1, %edx
	movq	%r14, %rdi
	movq	-1264(%rbp), %rsi
	movl	$100, %r8d
	call	_ZN7edge_ai3ecs6Kernel14commit_throughEmNS0_12CapabilitiesENS0_10WorkBudgetE@PLT
	cmpw	$11, -688(%rbp)
	je	.L490
	leaq	.LC47(%rip), %rsi
	xorl	%edi, %edi
	call	_ZN12_GLOBAL__N_17requireEbPKc
.L296:
	movl	$1024, %r8d
	movl	$31, %ecx
	movl	$1, %edx
	movq	-1264(%rbp), %rsi
	movq	-1248(%rbp), %rdi
	movl	$1000000, %r9d
	movq	$0, _ZN12_GLOBAL__N_116allocation_countE(%rip)
	movb	$1, _ZN12_GLOBAL__N_117count_allocationsE(%rip)
	call	_ZN7edge_ai3ecs6Kernel14commit_throughEmNS0_12CapabilitiesENS0_10WorkBudgetE@PLT
	xorl	%edi, %edi
	leaq	.LC48(%rip), %rsi
	movb	$0, _ZN12_GLOBAL__N_117count_allocationsE(%rip)
	cmpq	$0, _ZN12_GLOBAL__N_116allocation_countE(%rip)
	sete	%dil
	call	_ZN12_GLOBAL__N_17requireEbPKc
	xorl	%edi, %edi
	cmpq	$1, -480(%rbp)
	je	.L491
.L297:
	leaq	.LC49(%rip), %rsi
	call	_ZN12_GLOBAL__N_17requireEbPKc
	movq	-1264(%rbp), %rsi
	movq	%r13, %rdi
	movabsq	$4294967296, %rdx
	call	_ZNK7edge_ai3ecs6Kernel4ruleENS0_8EntityIdE@PLT
	xorl	%edi, %edi
	cmpq	$9, -960(%rbp)
	je	.L492
.L298:
	leaq	.LC50(%rip), %rsi
	call	_ZN12_GLOBAL__N_17requireEbPKc
	movq	-1264(%rbp), %rbx
	movq	%r13, %rsi
	movq	.LC13(%rip), %rax
	movq	$2, -960(%rbp)
	movq	$0, -952(%rbp)
	movq	%rbx, %rdi
	movq	$2, -944(%rbp)
	movq	%rax, -936(%rbp)
	movq	$6, -928(%rbp)
	movq	$0, -920(%rbp)
	call	_ZN7edge_ai3ecs6Kernel7enqueueERKNS0_5EventE@PLT
	xorl	%edi, %edi
	testw	%ax, %ax
	leaq	.LC51(%rip), %rsi
	sete	%dil
	call	_ZN12_GLOBAL__N_17requireEbPKc
	movl	$31, %ecx
	movl	$2, %edx
	movq	%rbx, %rsi
	movq	%r15, %rdi
	movl	$1024, %r8d
	movl	$1000000, %r9d
	call	_ZN7edge_ai3ecs6Kernel14commit_throughEmNS0_12CapabilitiesENS0_10WorkBudgetE@PLT
	xorl	%edi, %edi
	cmpq	$1, -288(%rbp)
	je	.L493
.L299:
	leaq	.LC52(%rip), %rsi
	call	_ZN12_GLOBAL__N_17requireEbPKc
	movq	-1264(%rbp), %rbx
	movq	%r13, %rdi
	movabsq	$4294967296, %rdx
	movq	%rbx, %rsi
	call	_ZNK7edge_ai3ecs6Kernel4ruleENS0_8EntityIdE@PLT
	xorl	%edi, %edi
	cmpq	$4, -960(%rbp)
	leaq	.LC53(%rip), %rsi
	sete	%dil
	call	_ZN12_GLOBAL__N_17requireEbPKc
.LEHE48:
	movl	$100, %ecx
	xorl	%edx, %edx
	movq	%rbx, %rdi
	movabsq	$4294967296, %rsi
.LEHB49:
	call	_ZN7edge_ai3ecs6Kernel13set_componentENS0_8EntityIdEtm@PLT
.LEHE49:
	xorl	%edi, %edi
.L303:
	leaq	.LC54(%rip), %rsi
.LEHB50:
	call	_ZN12_GLOBAL__N_17requireEbPKc
.LEHE50:
	movdqa	.LC44(%rip), %xmm6
	pxor	%xmm0, %xmm0
	subq	$32, %rsp
	movabsq	$4294967296, %rsi
	movaps	%xmm0, -1136(%rbp)
	movaps	%xmm6, -1120(%rbp)
	movups	%xmm0, (%rsp)
	movdqa	-1120(%rbp), %xmm7
	movups	%xmm7, 16(%rsp)
	movq	-1264(%rbp), %rdi
.LEHB51:
	.cfi_escape 0x2e,0x20
	call	_ZN7edge_ai3ecs6Kernel8set_ruleENS0_8EntityIdENS0_4RuleE@PLT
.LEHE51:
	addq	$32, %rsp
	xorl	%edi, %edi
.L307:
	leaq	.LC55(%rip), %rsi
.LEHB52:
	.cfi_escape 0x2e,0
	call	_ZN12_GLOBAL__N_17requireEbPKc
.LEHE52:
	movq	-1272(%rbp), %rdi
	call	_ZNSt6vectorIhSaIhEED1Ev
	movq	-1264(%rbp), %rdi
	call	_ZN7edge_ai3ecs6KernelD1Ev@PLT
	movdqa	.LC56(%rip), %xmm0
	movq	.LC13(%rip), %rax
	movq	$2, -304(%rbp)
	movq	.LC13(%rip), %rcx
	movq	$0, -296(%rbp)
	movups	%xmm0, -264(%rbp)
	movdqa	.LC57(%rip), %xmm0
	movq	%rax, -280(%rbp)
	movups	%xmm0, -216(%rbp)
	movdqa	.LC59(%rip), %xmm0
	movq	%rax, -232(%rbp)
	movq	.LC58(%rip), %rax
	movups	%xmm0, -168(%rbp)
	movdqa	.LC60(%rip), %xmm0
	movq	$2, -288(%rbp)
	movups	%xmm0, -120(%rbp)
	movq	$2, -272(%rbp)
	movq	$0, -248(%rbp)
	movq	$1, -240(%rbp)
	movq	$1, -224(%rbp)
	movq	%rax, -200(%rbp)
	movq	$2, -192(%rbp)
	movq	%rcx, -184(%rbp)
	movq	$4, -176(%rbp)
	movq	$0, -152(%rbp)
	movq	$3, -144(%rbp)
	movq	%rcx, -136(%rbp)
	movq	$2, -128(%rbp)
	movq	%rax, -104(%rbp)
	movq	$1, -96(%rbp)
	movq	%rcx, -88(%rbp)
	movq	$4, -80(%rbp)
	movq	$1, -72(%rbp)
	movdqa	.LC61(%rip), %xmm0
	movl	$4, -768(%rbp)
	movb	$1, -1256(%rbp)
	movaps	%xmm0, -784(%rbp)
	pxor	%xmm0, %xmm0
	movaps	%xmm0, -736(%rbp)
	movaps	%xmm0, -720(%rbp)
.L318:
	xorl	%esi, %esi
	movq	%r13, %rdi
.LEHB53:
	call	_ZN12_GLOBAL__N_14tinyEm
.LEHE53:
	leaq	-784(%rbp), %rax
	leaq	-764(%rbp), %r12
	movq	%rax, -1240(%rbp)
	movq	%rax, %rbx
	.p2align 4,,10
	.p2align 3
.L311:
	movl	(%rbx), %eax
	movq	%r13, %rdi
	leaq	(%rax,%rax,2), %rsi
	salq	$4, %rsi
	addq	%r15, %rsi
.LEHB54:
	call	_ZN7edge_ai3ecs6Kernel7enqueueERKNS0_5EventE@PLT
	xorl	%edi, %edi
	testw	%ax, %ax
	leaq	.LC62(%rip), %rsi
	sete	%dil
	call	_ZN12_GLOBAL__N_17requireEbPKc
	addq	$4, %rbx
	cmpq	%rbx, %r12
	jne	.L311
	movq	-1248(%rbp), %rdi
	movl	$1024, %r8d
	movl	$1000000, %r9d
	movq	%r13, %rsi
	movl	$31, %ecx
	movl	$3, %edx
	call	_ZN7edge_ai3ecs6Kernel14commit_throughEmNS0_12CapabilitiesENS0_10WorkBudgetE@PLT
	xorl	%edi, %edi
	cmpq	$5, -480(%rbp)
	leaq	.LC63(%rip), %rsi
	sete	%dil
	call	_ZN12_GLOBAL__N_17requireEbPKc
	movabsq	$4294967296, %rsi
	xorl	%edx, %edx
	movq	%r13, %rdi
	call	_ZNK7edge_ai3ecs6Kernel9componentENS0_8EntityIdEt@PLT
	xorl	%edi, %edi
	cmpq	$12, %rax
	leaq	.LC64(%rip), %rsi
	sete	%dil
	call	_ZN12_GLOBAL__N_17requireEbPKc
	cmpb	$0, -1256(%rbp)
	je	.L312
	leaq	-1232(%rbp), %rdi
	movq	%r13, %rsi
	call	_ZNK7edge_ai3ecs6Kernel12state_sha256Ev@PLT
.LEHE54:
	movdqu	-1232(%rbp), %xmm3
	movdqu	-1216(%rbp), %xmm4
	movaps	%xmm3, -736(%rbp)
	movaps	%xmm4, -720(%rbp)
.L313:
	movq	%r13, %rdi
	call	_ZN7edge_ai3ecs6KernelD1Ev@PLT
	movl	-768(%rbp), %r8d
	leaq	-768(%rbp), %rsi
	movq	-1240(%rbp), %rbx
	movq	%rsi, %rax
	movl	%r8d, %edx
	jmp	.L321
	.p2align 4,,10
	.p2align 3
.L316:
	cmpq	%rbx, %rax
	je	.L494
.L321:
	movq	%rax, %rcx
	subq	$4, %rax
	movl	%edx, %edi
	movl	(%rax), %edx
	cmpl	%edi, %edx
	jnb	.L316
	movq	%r12, %rdi
	.p2align 4,,10
	.p2align 3
.L317:
	movl	-4(%rdi), %r8d
	subq	$4, %rdi
	cmpl	%r8d, %edx
	jnb	.L317
	movl	%r8d, (%rax)
	movb	$0, -1256(%rbp)
	movl	%edx, (%rdi)
	cmpq	%r12, %rcx
	je	.L318
	cmpq	%rsi, %rcx
	jnb	.L319
	movq	%rsi, %rax
	.p2align 4,,10
	.p2align 3
.L320:
	movl	(%rcx), %edx
	movl	(%rax), %esi
	addq	$4, %rcx
	subq	$4, %rax
	movl	%esi, -4(%rcx)
	movl	%edx, 4(%rax)
	cmpq	%rax, %rcx
	jb	.L320
.L319:
	movb	$0, -1256(%rbp)
	jmp	.L318
	.p2align 4,,10
	.p2align 3
.L494:
	movq	-784(%rbp), %xmm0
	movd	-772(%rbp), %xmm2
	leaq	-1008(%rbp), %rbx
	xorl	%esi, %esi
	movd	%r8d, %xmm1
	movq	%rbx, %rdi
	movq	%rbx, -1240(%rbp)
	punpckldq	%xmm2, %xmm1
	pshufd	$225, %xmm0, %xmm0
	movq	%xmm1, -784(%rbp)
	movq	%xmm0, -772(%rbp)
.LEHB55:
	call	_ZN12_GLOBAL__N_14tinyEm
.LEHE55:
	movq	.LC13(%rip), %rax
	movq	%r13, %rsi
	movq	%rbx, %rdi
	movq	$1, -960(%rbp)
	movq	$0, -952(%rbp)
	movq	$2, -944(%rbp)
	movq	%rax, -936(%rbp)
	movq	$1, -928(%rbp)
	movq	$1, -920(%rbp)
.LEHB56:
	call	_ZN7edge_ai3ecs6Kernel7enqueueERKNS0_5EventE@PLT
	xorl	%edi, %edi
	testw	%ax, %ax
	leaq	.LC66(%rip), %rsi
	sete	%dil
	call	_ZN12_GLOBAL__N_17requireEbPKc
	movq	.LC13(%rip), %rax
	movq	%r13, %rsi
	movq	%rbx, %rdi
	movq	$2, -960(%rbp)
	movq	$0, -952(%rbp)
	movq	$1, -944(%rbp)
	movq	%rax, -936(%rbp)
	movq	$1, -928(%rbp)
	movq	$9, -920(%rbp)
	call	_ZN7edge_ai3ecs6Kernel7enqueueERKNS0_5EventE@PLT
	xorl	%edi, %edi
	testw	%ax, %ax
	leaq	.LC67(%rip), %rsi
	sete	%dil
	call	_ZN12_GLOBAL__N_17requireEbPKc
	movq	-1248(%rbp), %rdi
	movl	$1024, %r8d
	movl	$1000000, %r9d
	movq	%rbx, %rsi
	movl	$31, %ecx
	movl	$2, %edx
	call	_ZN7edge_ai3ecs6Kernel14commit_throughEmNS0_12CapabilitiesENS0_10WorkBudgetE@PLT
	xorl	%eax, %eax
	cmpq	$1, -480(%rbp)
	jne	.L322
	cmpq	$1, -352(%rbp)
	sete	%al
.L322:
	movzbl	%al, %edi
	leaq	.LC68(%rip), %rsi
	call	_ZN12_GLOBAL__N_17requireEbPKc
.LEHE56:
	movq	-1240(%rbp), %rdi
	leaq	-1184(%rbp), %rbx
	call	_ZN7edge_ai3ecs6KernelD1Ev@PLT
	xorl	%esi, %esi
	movq	%rbx, %rdi
.LEHB57:
	call	_ZN12_GLOBAL__N_14tinyEm
.LEHE57:
	movq	.LC13(%rip), %rax
	movq	%rbx, %rdi
	movq	-1264(%rbp), %rsi
	movq	$1, -1104(%rbp)
	movq	$0, -1096(%rbp)
	movq	$1, -1088(%rbp)
	movq	%rax, -1080(%rbp)
	movq	$1, -1072(%rbp)
	movq	$4, -1064(%rbp)
.LEHB58:
	call	_ZN7edge_ai3ecs6Kernel7enqueueERKNS0_5EventE@PLT
	movl	%eax, %edx
	xorl	%eax, %eax
	testw	%dx, %dx
	je	.L495
.L326:
	movzbl	%al, %edi
	leaq	.LC69(%rip), %rsi
	call	_ZN12_GLOBAL__N_17requireEbPKc
	movl	$31, %ecx
	movl	$1, %edx
	movq	%rbx, %rsi
	movq	%r15, %rdi
	movl	$1024, %r8d
	movl	$1000000, %r9d
	call	_ZN7edge_ai3ecs6Kernel14commit_throughEmNS0_12CapabilitiesENS0_10WorkBudgetE@PLT
	xorl	%edi, %edi
	cmpq	$1, -288(%rbp)
	leaq	.LC70(%rip), %rsi
	sete	%dil
	call	_ZN12_GLOBAL__N_17requireEbPKc
	movq	-1264(%rbp), %rsi
	movq	%rbx, %rdi
	call	_ZN7edge_ai3ecs6Kernel7enqueueERKNS0_5EventE@PLT
	xorl	%edi, %edi
	cmpw	$3, %ax
	leaq	.LC71(%rip), %rsi
	sete	%dil
	call	_ZN12_GLOBAL__N_17requireEbPKc
	movq	-1272(%rbp), %r14
	movdqa	-1104(%rbp), %xmm5
	movq	%rbx, %rdi
	movdqa	-1088(%rbp), %xmm6
	movdqa	-1072(%rbp), %xmm7
	movq	%r14, %rsi
	movaps	%xmm5, -1056(%rbp)
	movaps	%xmm6, -1040(%rbp)
	movq	$2, -1056(%rbp)
	movaps	%xmm7, -1024(%rbp)
	call	_ZN7edge_ai3ecs6Kernel7enqueueERKNS0_5EventE@PLT
	xorl	%edi, %edi
	cmpw	$13, %ax
	leaq	.LC72(%rip), %rsi
	sete	%dil
	call	_ZN12_GLOBAL__N_17requireEbPKc
	movl	$1, -1044(%rbp)
	movq	%r14, %rsi
	movq	%rbx, %rdi
	movq	$2, -1040(%rbp)
	call	_ZN7edge_ai3ecs6Kernel7enqueueERKNS0_5EventE@PLT
	xorl	%edi, %edi
	cmpw	$4, %ax
	leaq	.LC73(%rip), %rsi
	sete	%dil
	call	_ZN12_GLOBAL__N_17requireEbPKc
	movl	$1, %edx
	xorl	%esi, %esi
	movq	%rbx, %rdi
	call	_ZN7edge_ai3ecs6Kernel19rotate_source_epochEjj@PLT
	xorl	%edi, %edi
	testw	%ax, %ax
	leaq	.LC74(%rip), %rsi
	sete	%dil
	call	_ZN12_GLOBAL__N_17requireEbPKc
	movq	%r14, %rsi
	movq	%rbx, %rdi
	movq	$0, -1040(%rbp)
	call	_ZN7edge_ai3ecs6Kernel7enqueueERKNS0_5EventE@PLT
	xorl	%edi, %edi
	testw	%ax, %ax
	leaq	.LC75(%rip), %rsi
	sete	%dil
	call	_ZN12_GLOBAL__N_17requireEbPKc
	movl	$2, %edx
	xorl	%esi, %esi
	movq	%rbx, %rdi
	call	_ZN7edge_ai3ecs6Kernel19rotate_source_epochEjj@PLT
	xorl	%edi, %edi
	cmpw	$14, %ax
	leaq	.LC76(%rip), %rsi
	sete	%dil
	call	_ZN12_GLOBAL__N_17requireEbPKc
	movl	$31, %ecx
	movl	$2, %edx
	movq	%rbx, %rsi
	movq	%r15, %rdi
	movl	$1024, %r8d
	movl	$1000000, %r9d
	call	_ZN7edge_ai3ecs6Kernel14commit_throughEmNS0_12CapabilitiesENS0_10WorkBudgetE@PLT
	xorl	%edi, %edi
	cmpq	$1, -288(%rbp)
	leaq	.LC77(%rip), %rsi
	sete	%dil
	call	_ZN12_GLOBAL__N_17requireEbPKc
	movl	$31, %ecx
	movl	$1, %edx
	movq	%rbx, %rsi
	movq	%r15, %rdi
	movl	$1024, %r8d
	movl	$1000000, %r9d
	call	_ZN7edge_ai3ecs6Kernel14commit_throughEmNS0_12CapabilitiesENS0_10WorkBudgetE@PLT
	xorl	%edi, %edi
	cmpw	$14, -304(%rbp)
	leaq	.LC78(%rip), %rsi
	sete	%dil
	call	_ZN12_GLOBAL__N_17requireEbPKc
	movq	-1240(%rbp), %r14
	movq	%rbx, %rdi
	movq	.LC13(%rip), %rax
	movq	$3, -1008(%rbp)
	movq	$1, -992(%rbp)
	movq	%r14, %rsi
	movq	%rax, -1000(%rbp)
	movq	%rax, -984(%rbp)
	movq	$65535, -976(%rbp)
	movq	$0, -968(%rbp)
	call	_ZN7edge_ai3ecs6Kernel7enqueueERKNS0_5EventE@PLT
	xorl	%edi, %edi
	cmpw	$5, %ax
	leaq	.LC79(%rip), %rsi
	sete	%dil
	call	_ZN12_GLOBAL__N_17requireEbPKc
	movl	$1, %eax
	movq	%r14, %rsi
	movq	%rbx, %rdi
	movl	$1, -972(%rbp)
	movw	%ax, -976(%rbp)
	call	_ZN7edge_ai3ecs6Kernel7enqueueERKNS0_5EventE@PLT
	xorl	%edi, %edi
	cmpw	$5, %ax
	leaq	.LC80(%rip), %rsi
	sete	%dil
	call	_ZN12_GLOBAL__N_17requireEbPKc
	pxor	%xmm0, %xmm0
	subq	$48, %rsp
	leaq	-1176(%rbp), %r14
	movaps	%xmm0, -816(%rbp)
	movq	%r14, %rdi
	movaps	%xmm0, -800(%rbp)
	movdqa	.LC81(%rip), %xmm0
	movaps	%xmm0, -832(%rbp)
	movups	%xmm0, (%rsp)
	movdqa	-816(%rbp), %xmm5
	movups	%xmm5, 16(%rsp)
	movdqa	-800(%rbp), %xmm6
	movups	%xmm6, 32(%rsp)
	.cfi_escape 0x2e,0x30
	call	_ZN7edge_ai3ecs6KernelC1ENS0_6ConfigE@PLT
.LEHE58:
	addq	$48, %rsp
	movq	%r14, %rdi
.LEHB59:
	.cfi_escape 0x2e,0
	call	_ZN7edge_ai3ecs6Kernel13create_entityEv@PLT
	movq	.LC13(%rip), %rax
	movq	%r13, %rsi
	movq	%r14, %rdi
	movq	$1, -960(%rbp)
	movq	$0, -952(%rbp)
	movq	$1, -944(%rbp)
	movq	%rax, -936(%rbp)
	movq	$1, -928(%rbp)
	movq	$1, -920(%rbp)
	call	_ZN7edge_ai3ecs6Kernel7enqueueERKNS0_5EventE@PLT
	xorl	%edi, %edi
	testw	%ax, %ax
	leaq	.LC82(%rip), %rsi
	sete	%dil
	call	_ZN12_GLOBAL__N_17requireEbPKc
	movq	.LC13(%rip), %rax
	movq	%r13, %rsi
	movq	%r14, %rdi
	movq	$2, -960(%rbp)
	movq	$0, -952(%rbp)
	movq	$2, -944(%rbp)
	movq	%rax, -936(%rbp)
	movq	$1, -928(%rbp)
	movq	$2, -920(%rbp)
	call	_ZN7edge_ai3ecs6Kernel7enqueueERKNS0_5EventE@PLT
	xorl	%edi, %edi
	cmpw	$6, %ax
	je	.L496
.L327:
	leaq	.LC83(%rip), %rsi
	call	_ZN12_GLOBAL__N_17requireEbPKc
	pxor	%xmm0, %xmm0
	subq	$48, %rsp
	movq	%r13, %rdi
	movaps	%xmm0, -864(%rbp)
	movaps	%xmm0, -848(%rbp)
	movdqa	.LC84(%rip), %xmm0
	movaps	%xmm0, -880(%rbp)
	movups	%xmm0, (%rsp)
	movdqa	-864(%rbp), %xmm7
	movups	%xmm7, 16(%rsp)
	movdqa	-848(%rbp), %xmm5
	movups	%xmm5, 32(%rsp)
	.cfi_escape 0x2e,0x30
	call	_ZN7edge_ai3ecs6KernelC1ENS0_6ConfigE@PLT
.LEHE59:
	addq	$48, %rsp
	movl	$1024, %r8d
	xorl	%edx, %edx
	movq	%r13, %rsi
	movl	$1000000, %r9d
	movl	$31, %ecx
	movq	%r15, %rdi
.LEHB60:
	.cfi_escape 0x2e,0
	call	_ZN7edge_ai3ecs6Kernel14commit_throughEmNS0_12CapabilitiesENS0_10WorkBudgetE@PLT
	xorl	%edi, %edi
	cmpq	$0, -296(%rbp)
	leaq	.LC85(%rip), %rsi
	sete	%dil
	call	_ZN12_GLOBAL__N_17requireEbPKc
.LEHE60:
	movq	.LC86(%rip), %rax
	pxor	%xmm0, %xmm0
	subq	$48, %rsp
	leaq	-1200(%rbp), %r12
	movaps	%xmm0, -784(%rbp)
	movq	%r12, %rdi
	movq	%rax, -780(%rbp)
	movl	$1, -772(%rbp)
	movdqa	-784(%rbp), %xmm6
	movaps	%xmm0, -768(%rbp)
	movaps	%xmm0, -752(%rbp)
	movups	%xmm6, (%rsp)
	movdqa	-768(%rbp), %xmm7
	movups	%xmm7, 16(%rsp)
	movdqa	-752(%rbp), %xmm3
	movups	%xmm3, 32(%rsp)
.LEHB61:
	.cfi_escape 0x2e,0x30
	call	_ZN7edge_ai3ecs6KernelC1ENS0_6ConfigE@PLT
.LEHE61:
	movq	%r12, %rdi
	addq	$48, %rsp
	call	_ZN7edge_ai3ecs6KernelD1Ev@PLT
	xorl	%edi, %edi
.L332:
	leaq	.LC87(%rip), %rsi
.LEHB62:
	.cfi_escape 0x2e,0
	call	_ZN12_GLOBAL__N_17requireEbPKc
.LEHE62:
	pxor	%xmm0, %xmm0
	subq	$48, %rsp
	leaq	-1192(%rbp), %r12
	movaps	%xmm0, -720(%rbp)
	movq	%r12, %rdi
	movaps	%xmm0, -704(%rbp)
	movdqa	.LC88(%rip), %xmm0
	movaps	%xmm0, -736(%rbp)
	movups	%xmm0, (%rsp)
	movdqa	-720(%rbp), %xmm4
	movups	%xmm4, 16(%rsp)
	movdqa	-704(%rbp), %xmm5
	movups	%xmm5, 32(%rsp)
.LEHB63:
	.cfi_escape 0x2e,0x30
	call	_ZN7edge_ai3ecs6KernelC1ENS0_6ConfigE@PLT
.LEHE63:
	movq	%r12, %rdi
	addq	$48, %rsp
	call	_ZN7edge_ai3ecs6KernelD1Ev@PLT
	xorl	%edi, %edi
.L336:
	leaq	.LC89(%rip), %rsi
.LEHB64:
	.cfi_escape 0x2e,0
	call	_ZN12_GLOBAL__N_17requireEbPKc
.LEHE64:
	movq	%r13, %rdi
	call	_ZN7edge_ai3ecs6KernelD1Ev@PLT
	movq	%r14, %rdi
	call	_ZN7edge_ai3ecs6KernelD1Ev@PLT
	movq	%rbx, %rdi
	call	_ZN7edge_ai3ecs6KernelD1Ev@PLT
	xorl	%esi, %esi
	movq	%rbx, %rdi
.LEHB65:
	call	_ZN12_GLOBAL__N_14tinyEm
.LEHE65:
	xorl	%esi, %esi
	movq	%r14, %rdi
.LEHB66:
	call	_ZN12_GLOBAL__N_14tinyEm
.LEHE66:
	movq	.LC13(%rip), %rax
	movq	%rbx, %rdi
	movq	$1, -1008(%rbp)
	movq	$0, -1000(%rbp)
	movq	-1240(%rbp), %rsi
	movq	%rax, -984(%rbp)
	movdqa	-1008(%rbp), %xmm6
	movq	$1, -992(%rbp)
	movdqa	-992(%rbp), %xmm7
	movq	$1, -976(%rbp)
	movq	$4, -968(%rbp)
	movdqa	-976(%rbp), %xmm2
	movaps	%xmm6, -960(%rbp)
	movaps	%xmm2, -928(%rbp)
	movaps	%xmm7, -944(%rbp)
	movq	$9, -920(%rbp)
.LEHB67:
	call	_ZN7edge_ai3ecs6Kernel7enqueueERKNS0_5EventE@PLT
	movl	%eax, %edx
	xorl	%eax, %eax
	testw	%dx, %dx
	je	.L497
.L340:
	movzbl	%al, %edi
	leaq	.LC90(%rip), %rsi
	call	_ZN12_GLOBAL__N_17requireEbPKc
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	_ZN7edge_ai3ecs6Kernel7enqueueERKNS0_5EventE@PLT
	movl	%eax, %edx
	xorl	%eax, %eax
	testw	%dx, %dx
	je	.L498
.L341:
	movzbl	%al, %edi
	leaq	.LC91(%rip), %rsi
	call	_ZN12_GLOBAL__N_17requireEbPKc
	movq	-1272(%rbp), %rdi
	movq	%r14, %rsi
	call	_ZNK7edge_ai3ecs6Kernel15canonical_stateEv@PLT
.LEHE67:
	movq	-1264(%rbp), %r12
	movq	%rbx, %rsi
	movq	%r12, %rdi
.LEHB68:
	call	_ZNK7edge_ai3ecs6Kernel15canonical_stateEv@PLT
.LEHE68:
	movq	-1096(%rbp), %rsi
	movq	-1104(%rbp), %rdi
	movq	-1048(%rbp), %rcx
	movq	-1056(%rbp), %rdx
	call	_ZSteqIhSaIhEEbRKSt6vectorIT_T0_ES6_.isra.0
	leaq	.LC92(%rip), %rsi
	movzbl	%al, %edi
.LEHB69:
	call	_ZN12_GLOBAL__N_17requireEbPKc
.LEHE69:
	movq	%r12, %rdi
	call	_ZNSt6vectorIhSaIhEED1Ev
	movq	-1272(%rbp), %rdi
	call	_ZNSt6vectorIhSaIhEED1Ev
	movl	$31, %ecx
	movq	%rbx, %rsi
	movq	%r15, %rdi
	movl	$1024, %r8d
	movl	$1000000, %r9d
	movl	$1, %edx
.LEHB70:
	call	_ZN7edge_ai3ecs6Kernel14commit_throughEmNS0_12CapabilitiesENS0_10WorkBudgetE@PLT
	xorl	%edi, %edi
	cmpq	$1, -280(%rbp)
	je	.L499
.L342:
	leaq	.LC93(%rip), %rsi
	call	_ZN12_GLOBAL__N_17requireEbPKc
	movq	%r14, %rsi
	movq	%r15, %rdi
	call	_ZNK7edge_ai3ecs6Kernel12state_sha256Ev@PLT
	movq	-1248(%rbp), %rdi
	movq	%rbx, %rsi
	call	_ZNK7edge_ai3ecs6Kernel12state_sha256Ev@PLT
	movq	-496(%rbp), %rax
	movq	-488(%rbp), %rdx
	xorq	-304(%rbp), %rax
	xorq	-296(%rbp), %rdx
	orq	%rdx, %rax
	je	.L500
.L343:
	xorl	%eax, %eax
.L345:
	movzbl	%al, %edi
	leaq	.LC94(%rip), %rsi
	call	_ZN12_GLOBAL__N_17requireEbPKc
.LEHE70:
	movq	%r14, %rdi
	call	_ZN7edge_ai3ecs6KernelD1Ev@PLT
	movq	%rbx, %rdi
	call	_ZN7edge_ai3ecs6KernelD1Ev@PLT
	movq	$-1, %rsi
	movq	%r14, %rdi
.LEHB71:
	call	_ZN12_GLOBAL__N_14tinyEm
.LEHE71:
	movq	.LC13(%rip), %rax
	movq	%r13, %rsi
	movq	%r14, %rdi
	movq	$1, -960(%rbp)
	movq	$0, -952(%rbp)
	movq	$1, -944(%rbp)
	movq	%rax, -936(%rbp)
	movq	$3, -928(%rbp)
	movq	$1, -920(%rbp)
.LEHB72:
	call	_ZN7edge_ai3ecs6Kernel7enqueueERKNS0_5EventE@PLT
	movq	-1248(%rbp), %rdi
	movl	$1024, %r8d
	movl	$1000000, %r9d
	movq	%r14, %rsi
	movl	$31, %ecx
	movl	$1, %edx
	call	_ZN7edge_ai3ecs6Kernel14commit_throughEmNS0_12CapabilitiesENS0_10WorkBudgetE@PLT
	xorl	%edi, %edi
	cmpq	$1, -472(%rbp)
	je	.L501
.L351:
	leaq	.LC95(%rip), %rsi
	call	_ZN12_GLOBAL__N_17requireEbPKc
	movq	.LC13(%rip), %rax
	movq	%r13, %rsi
	movq	%r14, %rdi
	movq	$2, -960(%rbp)
	movq	$0, -952(%rbp)
	movq	$2, -944(%rbp)
	movq	%rax, -936(%rbp)
	movq	$2, -928(%rbp)
	movq	$1, -920(%rbp)
	call	_ZN7edge_ai3ecs6Kernel7enqueueERKNS0_5EventE@PLT
	movl	$31, %ecx
	movl	$2, %edx
	movq	%r14, %rsi
	movq	%r15, %rdi
	movl	$1024, %r8d
	movl	$1000000, %r9d
	call	_ZN7edge_ai3ecs6Kernel14commit_throughEmNS0_12CapabilitiesENS0_10WorkBudgetE@PLT
	xorl	%edi, %edi
	cmpq	$1, -288(%rbp)
	je	.L502
.L352:
	leaq	.LC96(%rip), %rsi
	call	_ZN12_GLOBAL__N_17requireEbPKc
	movq	.LC13(%rip), %rax
	movq	%r13, %rsi
	movq	%r14, %rdi
	movq	$3, -960(%rbp)
	movq	$0, -952(%rbp)
	movq	$3, -944(%rbp)
	movq	%rax, -936(%rbp)
	movq	$7, -928(%rbp)
	movq	$0, -920(%rbp)
	call	_ZN7edge_ai3ecs6Kernel7enqueueERKNS0_5EventE@PLT
	movq	.LC97(%rip), %rax
	movq	%r13, %rsi
	movq	%r14, %rdi
	movq	$4, -960(%rbp)
	movq	$0, -952(%rbp)
	movq	$4, -944(%rbp)
	movq	%rax, -936(%rbp)
	movq	$8, -928(%rbp)
	movq	$0, -920(%rbp)
	call	_ZN7edge_ai3ecs6Kernel7enqueueERKNS0_5EventE@PLT
	movq	.LC13(%rip), %rax
	movq	%r13, %rsi
	movq	%r14, %rdi
	movq	$5, -960(%rbp)
	movq	$0, -952(%rbp)
	movq	$5, -944(%rbp)
	movq	%rax, -936(%rbp)
	movq	$1, -928(%rbp)
	movq	$99, -920(%rbp)
	call	_ZN7edge_ai3ecs6Kernel7enqueueERKNS0_5EventE@PLT
	movq	-1248(%rbp), %rdi
	movl	$1024, %r8d
	movl	$1000000, %r9d
	movq	%r14, %rsi
	movl	$31, %ecx
	movl	$5, %edx
	call	_ZN7edge_ai3ecs6Kernel14commit_throughEmNS0_12CapabilitiesENS0_10WorkBudgetE@PLT
	xorl	%eax, %eax
	cmpq	$2, -480(%rbp)
	jne	.L353
	cmpq	$1, -400(%rbp)
	sete	%al
.L353:
	movzbl	%al, %edi
	leaq	.LC98(%rip), %rsi
	call	_ZN12_GLOBAL__N_17requireEbPKc
	movabsq	$4294967296, %rsi
	movq	%r14, %rdi
	call	_ZNK7edge_ai3ecs6Kernel5aliveENS0_8EntityIdE@PLT
	testb	%al, %al
	je	.L354
.L356:
	xorl	%edi, %edi
.L355:
	leaq	.LC99(%rip), %rsi
	call	_ZN12_GLOBAL__N_17requireEbPKc
	pxor	%xmm0, %xmm0
	subq	$48, %rsp
	movaps	%xmm0, -672(%rbp)
	movaps	%xmm0, -656(%rbp)
	movdqa	.LC100(%rip), %xmm0
	movaps	%xmm0, -688(%rbp)
	movups	%xmm0, (%rsp)
	movdqa	-672(%rbp), %xmm3
	movups	%xmm3, 16(%rsp)
	movdqa	-656(%rbp), %xmm4
	movups	%xmm4, 32(%rsp)
	movq	-1272(%rbp), %r12
	movq	%r12, %rdi
	.cfi_escape 0x2e,0x30
	call	_ZN7edge_ai3ecs6KernelC1ENS0_6ConfigE@PLT
.LEHE72:
	addq	$48, %rsp
	movq	%r12, %rdi
	movq	%r12, -1272(%rbp)
	movabsq	$-4294967296, %rsi
.LEHB73:
	.cfi_escape 0x2e,0
	call	_ZN7edge_ai3ecs6Kernel17initialize_entityENS0_8EntityIdE@PLT
	movq	.LC101(%rip), %r12
	movq	%r13, %rsi
	movq	-1272(%rbp), %rdi
	movq	$1, -960(%rbp)
	movq	$0, -952(%rbp)
	movq	$1, -944(%rbp)
	movq	%r12, -936(%rbp)
	movq	$7, -928(%rbp)
	movq	$0, -920(%rbp)
	call	_ZN7edge_ai3ecs6Kernel7enqueueERKNS0_5EventE@PLT
	movq	%r12, -936(%rbp)
	movq	%r13, %rsi
	movq	-1272(%rbp), %r12
	movq	$2, -960(%rbp)
	movq	$0, -952(%rbp)
	movq	%r12, %rdi
	movq	$2, -944(%rbp)
	movq	$8, -928(%rbp)
	movq	$0, -920(%rbp)
	call	_ZN7edge_ai3ecs6Kernel7enqueueERKNS0_5EventE@PLT
	movq	-1248(%rbp), %rdi
	movl	$1024, %r8d
	movl	$1000000, %r9d
	movq	%r12, %rsi
	movl	$31, %ecx
	movl	$2, %edx
	call	_ZN7edge_ai3ecs6Kernel14commit_throughEmNS0_12CapabilitiesENS0_10WorkBudgetE@PLT
	cmpq	$1, -480(%rbp)
	jne	.L410
	cmpq	$1, -472(%rbp)
	je	.L503
.L410:
	xorl	%edi, %edi
.L357:
	leaq	.LC102(%rip), %rsi
	call	_ZN12_GLOBAL__N_17requireEbPKc
	movq	-1240(%rbp), %r12
	movl	$7, %esi
	movq	%r12, %rdi
	call	_ZN12_GLOBAL__N_14tinyEm
.LEHE73:
	movdqa	.LC103(%rip), %xmm0
	subq	$32, %rsp
	movq	%r12, %rdi
	movdqa	.LC104(%rip), %xmm1
	movabsq	$4294967296, %rsi
	movaps	%xmm1, -1088(%rbp)
	movaps	%xmm0, -1104(%rbp)
	movups	%xmm0, (%rsp)
	movdqa	-1088(%rbp), %xmm5
	movups	%xmm5, 16(%rsp)
.LEHB74:
	.cfi_escape 0x2e,0x20
	call	_ZN7edge_ai3ecs6Kernel8set_ruleENS0_8EntityIdENS0_4RuleE@PLT
	movq	.LC13(%rip), %rax
	addq	$32, %rsp
	movq	%r13, %rsi
	movq	%r12, %rdi
	movq	$1, -960(%rbp)
	movq	$0, -952(%rbp)
	movq	$1, -944(%rbp)
	movq	%rax, -936(%rbp)
	movq	$6, -928(%rbp)
	movq	$9, -920(%rbp)
	.cfi_escape 0x2e,0
	call	_ZN7edge_ai3ecs6Kernel7enqueueERKNS0_5EventE@PLT
	movq	-1248(%rbp), %rdi
	movl	$1024, %r8d
	movl	$1000000, %r9d
	movq	%r12, %rsi
	movl	$31, %ecx
	movl	$1, %edx
	call	_ZN7edge_ai3ecs6Kernel14commit_throughEmNS0_12CapabilitiesENS0_10WorkBudgetE@PLT
	cmpq	$1, -472(%rbp)
	je	.L358
.L360:
	xorl	%edi, %edi
.L359:
	leaq	.LC105(%rip), %rsi
	call	_ZN12_GLOBAL__N_17requireEbPKc
.LEHE74:
	movq	-1240(%rbp), %r12
	movq	%r12, %rdi
	call	_ZN7edge_ai3ecs6KernelD1Ev@PLT
	movq	-1272(%rbp), %rdi
	call	_ZN7edge_ai3ecs6KernelD1Ev@PLT
	movq	%r14, %rdi
	call	_ZN7edge_ai3ecs6KernelD1Ev@PLT
	movl	$7, %esi
	movq	%r12, %rdi
.LEHB75:
	call	_ZN12_GLOBAL__N_14tinyEm
.LEHE75:
	movdqa	.LC43(%rip), %xmm6
	movdqa	.LC44(%rip), %xmm7
	subq	$32, %rsp
	movabsq	$4294967296, %rsi
	movdqa	.LC43(%rip), %xmm2
	movaps	%xmm7, -1040(%rbp)
	movaps	%xmm6, -1056(%rbp)
	movups	%xmm2, (%rsp)
	movdqa	-1040(%rbp), %xmm3
	movups	%xmm3, 16(%rsp)
	movq	-1240(%rbp), %r12
	movq	%r12, %rdi
.LEHB76:
	.cfi_escape 0x2e,0x20
	call	_ZN7edge_ai3ecs6Kernel8set_ruleENS0_8EntityIdENS0_4RuleE@PLT
	movq	.LC13(%rip), %rax
	addq	$32, %rsp
	movq	%r13, %rsi
	movq	%r12, %rdi
	movq	$1, -960(%rbp)
	movq	$0, -952(%rbp)
	movq	$1, -944(%rbp)
	movq	%rax, -936(%rbp)
	movq	$6, -928(%rbp)
	movq	$1, -920(%rbp)
	.cfi_escape 0x2e,0
	call	_ZN7edge_ai3ecs6Kernel7enqueueERKNS0_5EventE@PLT
	movl	$1, %ecx
	movl	$1, %edx
	movq	%r12, %rsi
	movq	%r15, %rdi
	movl	$1024, %r8d
	movl	$1000000, %r9d
	call	_ZN7edge_ai3ecs6Kernel14commit_throughEmNS0_12CapabilitiesENS0_10WorkBudgetE@PLT
	cmpq	$1, -280(%rbp)
	je	.L365
.L367:
	xorl	%edi, %edi
.L366:
	leaq	.LC106(%rip), %rsi
	call	_ZN12_GLOBAL__N_17requireEbPKc
	movq	-1240(%rbp), %r12
	movq	%r13, %rsi
	movq	.LC13(%rip), %rax
	movq	$2, -960(%rbp)
	movq	$0, -952(%rbp)
	movq	%r12, %rdi
	movq	$2, -944(%rbp)
	movq	%rax, -936(%rbp)
	movq	$1, -928(%rbp)
	movq	$100, -920(%rbp)
	call	_ZN7edge_ai3ecs6Kernel7enqueueERKNS0_5EventE@PLT
	movl	$1024, %r8d
	xorl	%ecx, %ecx
	movl	$2, %edx
	movq	%r12, %rsi
	movl	$1000000, %r9d
	movq	%r15, %rdi
	call	_ZN7edge_ai3ecs6Kernel14commit_throughEmNS0_12CapabilitiesENS0_10WorkBudgetE@PLT
	xorl	%edi, %edi
	cmpq	$1, -280(%rbp)
	je	.L504
.L368:
	leaq	.LC107(%rip), %rsi
	call	_ZN12_GLOBAL__N_17requireEbPKc
.LEHE76:
	movq	-1240(%rbp), %rdi
	call	_ZN7edge_ai3ecs6KernelD1Ev@PLT
	cmpl	$1, -1276(%rbp)
	leaq	.LC30(%rip), %rsi
	jle	.L370
	movq	-1288(%rbp), %rax
	movq	8(%rax), %rsi
.L370:
	leaq	-912(%rbp), %rax
	movq	%rbx, %rdx
	movq	%rax, %rdi
	movq	%rax, -1256(%rbp)
.LEHB77:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_
.LEHE77:
	movq	-904(%rbp), %rdx
	movl	$22, %r8d
	movq	%r15, %rdi
	movq	-912(%rbp), %rsi
	leaq	.LC108(%rip), %rcx
.LEHB78:
	call	_ZSt12__str_concatINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEET_PKNS6_10value_typeENS6_9size_typeES9_SA_RKNS6_14allocator_typeE.isra.0
.LEHE78:
	movq	-1248(%rbp), %rbx
	movq	-904(%rbp), %rdx
	movl	$22, %r8d
	leaq	.LC109(%rip), %rcx
	movq	-912(%rbp), %rsi
	movq	%rbx, %rdi
.LEHB79:
	call	_ZSt12__str_concatINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEET_PKNS6_10value_typeENS6_9size_typeES9_SA_RKNS6_14allocator_typeE.isra.0
.LEHE79:
	movq	-1240(%rbp), %r12
	movq	%r15, %rdx
	movq	%rbx, %rsi
	movq	%r12, %rdi
.LEHB80:
	call	_ZN7edge_ai6HexLut4loadERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_@PLT
.LEHE80:
	movq	%rbx, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	movq	%r15, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	xorl	%esi, %esi
	movq	%r14, %rdi
.LEHB81:
	call	_ZN12_GLOBAL__N_14tinyEm
.LEHE81:
	movq	%r12, %rsi
	movq	%r14, %rdi
.LEHB82:
	call	_ZN7edge_ai3ecs6Kernel10attach_lutERKNS_6HexLutE@PLT
	movq	.LC13(%rip), %rax
	movq	%r13, %rsi
	movq	%r14, %rdi
	movq	$1, -960(%rbp)
	movq	$0, -952(%rbp)
	movq	$1, -944(%rbp)
	movq	%rax, -936(%rbp)
	movq	$9, -928(%rbp)
	movq	$37, -920(%rbp)
	call	_ZN7edge_ai3ecs6Kernel7enqueueERKNS0_5EventE@PLT
	movl	$31, %ecx
	movl	$1, %edx
	movq	%r14, %rsi
	movq	%r15, %rdi
	movl	$1024, %r8d
	movl	$1000000, %r9d
	call	_ZN7edge_ai3ecs6Kernel14commit_throughEmNS0_12CapabilitiesENS0_10WorkBudgetE@PLT
	xorl	%edi, %edi
	cmpq	$1, -288(%rbp)
	leaq	.LC110(%rip), %rsi
	sete	%dil
	call	_ZN12_GLOBAL__N_17requireEbPKc
	movabsq	$4294967296, %rsi
	xorl	%edx, %edx
	movq	%r14, %rdi
	call	_ZNK7edge_ai3ecs6Kernel9componentENS0_8EntityIdEt@PLT
	movl	$37, %edx
	xorl	%esi, %esi
	movq	%r12, %rdi
	movq	%rax, %rbx
	call	_ZNK7edge_ai6HexLut16canonical_sampleEjj@PLT
	movzwl	%ax, %eax
	xorl	%edi, %edi
	leaq	.LC111(%rip), %rsi
	cmpq	%rbx, %rax
	sete	%dil
	call	_ZN12_GLOBAL__N_17requireEbPKc
	xorl	%r12d, %r12d
	.p2align 4,,10
	.p2align 3
.L372:
	xorl	%ebx, %ebx
	jmp	.L374
	.p2align 4,,10
	.p2align 3
.L506:
	addl	$1, %ebx
	cmpl	$72, %ebx
	je	.L505
.L374:
	movq	-1240(%rbp), %rdi
	movl	%ebx, %edx
	movl	%r12d, %esi
	call	_ZNK7edge_ai6HexLut2atEjj@PLT
	testl	$16711680, %eax
	jne	.L506
	movl	$1, %edi
.L373:
	leaq	.LC112(%rip), %rsi
	call	_ZN12_GLOBAL__N_17requireEbPKc
	movq	.LC13(%rip), %rax
	salq	$32, %r12
	movq	%r13, %rsi
	movq	%r14, %rdi
	movq	$2, -960(%rbp)
	orq	%rbx, %r12
	movq	$0, -952(%rbp)
	movq	$2, -944(%rbp)
	movq	%rax, -936(%rbp)
	movq	$9, -928(%rbp)
	movq	%r12, -920(%rbp)
	call	_ZN7edge_ai3ecs6Kernel7enqueueERKNS0_5EventE@PLT
	movl	$31, %ecx
	movl	$2, %edx
	movq	%r14, %rsi
	movq	%r15, %rdi
	movl	$1024, %r8d
	movl	$1000000, %r9d
	call	_ZN7edge_ai3ecs6Kernel14commit_throughEmNS0_12CapabilitiesENS0_10WorkBudgetE@PLT
	xorl	%edi, %edi
	cmpq	$1, -288(%rbp)
	je	.L507
.L375:
	leaq	.LC113(%rip), %rsi
	call	_ZN12_GLOBAL__N_17requireEbPKc
.LEHE82:
	movq	%r14, %rdi
	call	_ZN7edge_ai3ecs6KernelD1Ev@PLT
	movq	-1240(%rbp), %rdi
	call	_ZNSt12_Vector_baseIN7edge_ai9LutSampleESaIS1_EED2Ev
	movq	-1256(%rbp), %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	cmpl	$2, -1276(%rbp)
	leaq	.LC31(%rip), %rsi
	jg	.L508
.L377:
	movq	%r13, %rdx
	movq	%r15, %rdi
.LEHB83:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_
.LEHE83:
	movq	%r15, %rdi
.LEHB84:
	call	_ZN12_GLOBAL__N_111test_tomagiERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
.LEHE84:
	movq	%r15, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	movl	$1, %esi
	movq	%r15, %rdi
.LEHB85:
	call	_ZN7edge_ai3ecs16run_fixture_jsonB5cxx11Em@PLT
.LEHE85:
	movq	-296(%rbp), %rdx
	movq	-304(%rbp), %r12
	movq	$-1, %rax
	testq	%rdx, %rdx
	je	.L383
	leaq	(%r12,%rdx), %rbx
	cmpq	$11, %rdx
	jbe	.L383
	movq	%r12, %rdi
.L387:
	subq	$11, %rdx
	movl	$34, %esi
	call	memchr@PLT
	testq	%rax, %rax
	je	.L418
	movabsq	$4189029769245975842, %rcx
	cmpq	%rcx, (%rax)
	je	.L509
.L464:
	leaq	1(%rax), %rdi
	movq	%rbx, %rdx
	subq	%rdi, %rdx
	cmpq	$11, %rdx
	ja	.L387
.L418:
	orq	$-1, %rax
.L383:
	xorl	%edi, %edi
	cmpq	$-1, %rax
	leaq	.LC115(%rip), %rsi
	setne	%dil
.LEHB86:
	call	_ZN12_GLOBAL__N_17requireEbPKc
.LEHE86:
	movq	%r15, %rdi
	leaq	_ZSt4cout(%rip), %rbx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	leaq	.LC116(%rip), %rsi
	movq	%rbx, %rdi
.LEHB87:
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movl	_ZN12_GLOBAL__N_16checksE(%rip), %esi
	movq	%rax, %rdi
	call	_ZNSo9_M_insertImEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC117(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movl	$1, %esi
	movq	%r15, %rdi
	call	_ZN7edge_ai3ecs16run_fixture_jsonB5cxx11Em@PLT
.LEHE87:
	movq	-296(%rbp), %rdx
	movq	-304(%rbp), %rsi
	movq	%rbx, %rdi
.LEHB88:
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	%rax, %rdi
	movl	$10, %esi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c.isra.0
.LEHE88:
	movq	%r15, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	xorl	%eax, %eax
.L278:
	movq	-56(%rbp), %rdx
	subq	%fs:40, %rdx
	jne	.L510
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L505:
	.cfi_restore_state
	addl	$1, %r12d
	cmpl	$17, %r12d
	jne	.L372
	xorl	%edi, %edi
	xorl	%ebx, %ebx
	xorl	%r12d, %r12d
	jmp	.L373
	.p2align 4,,10
	.p2align 3
.L312:
	movq	%r13, %rsi
	movq	%r14, %rdi
.LEHB89:
	call	_ZNK7edge_ai3ecs6Kernel12state_sha256Ev@PLT
	movq	(%r14), %rax
	movq	8(%r14), %rdx
	xorq	-736(%rbp), %rax
	xorq	-728(%rbp), %rdx
	orq	%rdx, %rax
	je	.L511
.L314:
	movl	$1, %edi
.L315:
	xorl	$1, %edi
	leaq	.LC65(%rip), %rsi
	call	_ZN12_GLOBAL__N_17requireEbPKc
.LEHE89:
	jmp	.L313
	.p2align 4,,10
	.p2align 3
.L511:
	movq	16(%r14), %rax
	movq	24(%r14), %rdx
	xorq	-720(%rbp), %rax
	xorq	-712(%rbp), %rdx
	orq	%rdx, %rax
	jne	.L314
	xorl	%edi, %edi
	jmp	.L315
.L508:
	movq	-1288(%rbp), %rax
	movq	16(%rax), %rsi
	jmp	.L377
.L500:
	movq	-480(%rbp), %rax
	movq	-472(%rbp), %rdx
	xorq	-288(%rbp), %rax
	xorq	-280(%rbp), %rdx
	orq	%rdx, %rax
	jne	.L343
	movl	$1, %esi
	xorl	%edx, %edx
	movq	%rbx, %rdi
	salq	$32, %rsi
.LEHB90:
	call	_ZNK7edge_ai3ecs6Kernel9componentENS0_8EntityIdEt@PLT
.LEHE90:
	testq	%rax, %rax
	sete	%al
	jmp	.L345
.L354:
	movl	$1, %esi
	movq	%r14, %rdi
	salq	$33, %rsi
.LEHB91:
	call	_ZNK7edge_ai3ecs6Kernel5aliveENS0_8EntityIdE@PLT
	testb	%al, %al
	je	.L356
	movl	$1, %esi
	xorl	%edx, %edx
	movq	%r14, %rdi
	salq	$33, %rsi
	call	_ZNK7edge_ai3ecs6Kernel13has_componentENS0_8EntityIdEt@PLT
.LEHE91:
	xorl	$1, %eax
	movzbl	%al, %edi
	jmp	.L355
.L509:
	cmpl	$1702195828, 8(%rax)
	jne	.L464
	subq	%r12, %rax
	jmp	.L383
.L490:
	movq	-1264(%rbp), %rsi
	movq	%r13, %rdi
.LEHB92:
	call	_ZNK7edge_ai3ecs6Kernel15canonical_stateEv@PLT
.LEHE92:
	movq	-952(%rbp), %rsi
	movq	-960(%rbp), %rdi
	movq	-1048(%rbp), %rcx
	movq	-1056(%rbp), %rdx
	call	_ZSteqIhSaIhEEbRKSt6vectorIT_T0_ES6_.isra.0
	leaq	.LC47(%rip), %rsi
	movzbl	%al, %edi
.LEHB93:
	call	_ZN12_GLOBAL__N_17requireEbPKc
.LEHE93:
	movq	%r13, %rdi
	call	_ZNSt6vectorIhSaIhEED1Ev
	jmp	.L296
.L289:
	movq	-1264(%rbp), %rsi
	movq	%r13, %rdi
.LEHB94:
	call	_ZNK7edge_ai3ecs6Kernel15canonical_stateEv@PLT
.LEHE94:
	movq	-952(%rbp), %rsi
	movq	-960(%rbp), %rdi
	movq	-1048(%rbp), %rcx
	movq	-1056(%rbp), %rdx
	call	_ZSteqIhSaIhEEbRKSt6vectorIT_T0_ES6_.isra.0
	leaq	.LC46(%rip), %rsi
	movzbl	%al, %edi
.LEHB95:
	call	_ZN12_GLOBAL__N_17requireEbPKc
.LEHE95:
	movq	%r13, %rdi
	call	_ZNSt6vectorIhSaIhEED1Ev
	jmp	.L290
.L498:
	movq	-1240(%rbp), %rsi
	movq	%r14, %rdi
.LEHB96:
	call	_ZN7edge_ai3ecs6Kernel7enqueueERKNS0_5EventE@PLT
	cmpw	$2, %ax
	sete	%al
	jmp	.L341
.L497:
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	_ZN7edge_ai3ecs6Kernel7enqueueERKNS0_5EventE@PLT
.LEHE96:
	cmpw	$2, %ax
	sete	%al
	jmp	.L340
.L495:
	movq	-1264(%rbp), %rsi
	movq	%rbx, %rdi
.LEHB97:
	call	_ZN7edge_ai3ecs6Kernel7enqueueERKNS0_5EventE@PLT
.LEHE97:
	subw	$1, %ax
	sete	%al
	jmp	.L326
.L365:
	movl	$1, %esi
	movq	-1240(%rbp), %rdi
	xorl	%edx, %edx
	salq	$32, %rsi
.LEHB98:
	call	_ZNK7edge_ai3ecs6Kernel9componentENS0_8EntityIdEt@PLT
	cmpq	$7, %rax
	jne	.L367
	movl	$1, %edx
	movq	-1240(%rbp), %rsi
	movq	%r13, %rdi
	salq	$32, %rdx
	call	_ZNK7edge_ai3ecs6Kernel4ruleENS0_8EntityIdE@PLT
.LEHE98:
	xorl	%edi, %edi
	cmpq	$1, -944(%rbp)
	sete	%dil
	jmp	.L366
.L358:
	movl	$1, %esi
	movq	-1240(%rbp), %rdi
	xorl	%edx, %edx
	salq	$32, %rsi
.LEHB99:
	call	_ZNK7edge_ai3ecs6Kernel9componentENS0_8EntityIdEt@PLT
	cmpq	$7, %rax
	jne	.L360
	movl	$1, %edx
	movq	-1240(%rbp), %rsi
	movq	%r13, %rdi
	salq	$32, %rdx
	call	_ZNK7edge_ai3ecs6Kernel4ruleENS0_8EntityIdE@PLT
.LEHE99:
	xorl	%edi, %edi
	cmpq	$2, -960(%rbp)
	sete	%dil
	jmp	.L359
.L503:
	movl	$4294967295, %esi
	movq	-1272(%rbp), %rdi
	salq	$32, %rsi
.LEHB100:
	call	_ZNK7edge_ai3ecs6Kernel5aliveENS0_8EntityIdE@PLT
.LEHE100:
	xorl	$1, %eax
	movzbl	%al, %edi
	jmp	.L357
.L492:
	movl	$1, %edx
	movq	-1264(%rbp), %rsi
	leaq	-1008(%rbp), %rdi
	salq	$32, %rdx
.LEHB101:
	call	_ZNK7edge_ai3ecs6Kernel4ruleENS0_8EntityIdE@PLT
	xorl	%edi, %edi
	cmpq	$2, -992(%rbp)
	sete	%dil
	jmp	.L298
.L493:
	movl	$1, %esi
	movq	-1264(%rbp), %rdi
	xorl	%edx, %edx
	salq	$32, %rsi
	call	_ZNK7edge_ai3ecs6Kernel9componentENS0_8EntityIdEt@PLT
.LEHE101:
	xorl	%edi, %edi
	cmpq	$22, %rax
	sete	%dil
	jmp	.L299
.L496:
	movq	%r14, %rdi
.LEHB102:
	call	_ZNK7edge_ai3ecs6Kernel6queuedEv@PLT
.LEHE102:
	xorl	%edi, %edi
	subq	$1, %rax
	sete	%dil
	jmp	.L327
.L507:
	movl	$1, %esi
	xorl	%edx, %edx
	movq	%r14, %rdi
	salq	$32, %rsi
.LEHB103:
	call	_ZNK7edge_ai3ecs6Kernel13has_componentENS0_8EntityIdEt@PLT
.LEHE103:
	xorl	$1, %eax
	movzbl	%al, %edi
	jmp	.L375
.L491:
	movl	$1, %esi
	movq	-1264(%rbp), %rdi
	xorl	%edx, %edx
	salq	$32, %rsi
.LEHB104:
	call	_ZNK7edge_ai3ecs6Kernel9componentENS0_8EntityIdEt@PLT
.LEHE104:
	xorl	%edi, %edi
	cmpq	$13, %rax
	sete	%dil
	jmp	.L297
.L501:
	movl	$1, %esi
	xorl	%edx, %edx
	movq	%r14, %rdi
	salq	$32, %rsi
.LEHB105:
	call	_ZNK7edge_ai3ecs6Kernel9componentENS0_8EntityIdEt@PLT
	xorl	%edi, %edi
	addq	$1, %rax
	sete	%dil
	jmp	.L351
.L502:
	movl	$1, %esi
	xorl	%edx, %edx
	movq	%r14, %rdi
	salq	$32, %rsi
	call	_ZNK7edge_ai3ecs6Kernel9componentENS0_8EntityIdEt@PLT
.LEHE105:
	xorl	%edi, %edi
	testq	%rax, %rax
	sete	%dil
	jmp	.L352
.L504:
	movl	$1, %esi
	movq	-1240(%rbp), %rdi
	xorl	%edx, %edx
	salq	$32, %rsi
.LEHB106:
	call	_ZNK7edge_ai3ecs6Kernel9componentENS0_8EntityIdEt@PLT
.LEHE106:
	xorl	%edi, %edi
	cmpq	$7, %rax
	sete	%dil
	jmp	.L368
.L499:
	movq	-1248(%rbp), %rdi
	movl	$1024, %r8d
	movl	$1000000, %r9d
	movq	%r14, %rsi
	movl	$31, %ecx
	movl	$1, %edx
.LEHB107:
	call	_ZN7edge_ai3ecs6Kernel14commit_throughEmNS0_12CapabilitiesENS0_10WorkBudgetE@PLT
.LEHE107:
	xorl	%edi, %edi
	cmpq	$1, -472(%rbp)
	sete	%dil
	jmp	.L342
.L510:
	call	__stack_chk_fail@PLT
.L435:
	endbr64
	movq	%rax, %r14
	movq	%rdx, %rbx
	jmp	.L292
.L457:
	endbr64
	movq	%rax, %r14
	movq	%rdx, %rbx
	jmp	.L309
.L429:
	endbr64
	movq	%rax, %r15
	movq	%rdx, %rbx
	jmp	.L288
.L432:
	endbr64
	movq	%rax, %r13
	movq	%rdx, %rbx
	jmp	.L280
.L431:
	endbr64
	movq	%rax, %r15
	movq	%rdx, %rbx
	jmp	.L288
.L419:
	endbr64
	movq	%rax, %r12
	movq	%rdx, %rax
	jmp	.L282
.L434:
	endbr64
	movq	%rax, %r14
	movq	%rdx, %rbx
	jmp	.L293
.L454:
	endbr64
	movq	%rax, %r12
	movq	%rdx, %rbx
	jmp	.L381
.L438:
	endbr64
	movq	%rax, %r12
	movq	%rdx, %rbx
	jmp	.L371
.L445:
	endbr64
	movq	%rax, %r12
	movq	%rdx, %r14
	jmp	.L350
.L448:
	endbr64
	movq	%rax, %r12
	movq	%rdx, %r15
	jmp	.L347
.L433:
	endbr64
	movq	%rax, %r14
	movq	%rdx, %rbx
	jmp	.L310
.L451:
	endbr64
	movq	%rax, %r12
	movq	%rdx, %rbx
	jmp	.L362
.L421:
	endbr64
	movq	%rax, %r12
	movq	%rdx, %rbx
	jmp	.L390
.L449:
	endbr64
	movq	%rax, %r15
	movq	%rdx, %rbx
	jmp	.L364
.L450:
	endbr64
	movq	%rax, %r15
	movq	%rdx, %rbx
	jmp	.L363
.L437:
	endbr64
	movq	%rax, %rdi
	movq	%rdx, %rbx
	jmp	.L305
.L436:
	endbr64
	movq	%rax, %rdi
	movq	%rdx, %rbx
	jmp	.L301
.L439:
	endbr64
	movq	%rax, %r12
	movq	%rdx, %rbx
	jmp	.L324
.L440:
	endbr64
	movq	%rax, %r12
	movq	%rdx, %r14
	jmp	.L350
.L441:
	endbr64
	movq	%rax, %r12
	movq	%rdx, %r15
	jmp	.L338
.L447:
	endbr64
	movq	%rax, %r12
	movq	%rdx, %r15
	jmp	.L348
.L446:
	endbr64
	movq	%rax, %r12
	movq	%rdx, %r15
	jmp	.L349
.L455:
	endbr64
	movq	%rax, %r14
	movq	%rdx, %rbx
	jmp	.L379
.L420:
	endbr64
	movq	%rax, %r12
	movq	%rdx, %rbx
	jmp	.L380
.L452:
	endbr64
	movq	%rax, %r12
	movq	%rdx, %rbx
	jmp	.L371
.L425:
	endbr64
	movq	%rax, %r15
	movq	%rdx, %rbx
	jmp	.L288
.L428:
	endbr64
	movq	%rax, %r13
	movq	%rdx, %rbx
	jmp	.L285
.L427:
	endbr64
	movq	%rax, %r15
	movq	%rdx, %rbx
	jmp	.L288
.L430:
	endbr64
	movq	%rax, %r13
	movq	%rdx, %rbx
	jmp	.L283
.L443:
	endbr64
	movq	%rax, %rdi
	jmp	.L329
.L442:
	endbr64
	movq	%rax, %r12
	movq	%rdx, %r15
	jmp	.L331
.L444:
	endbr64
	movq	%rax, %rdi
	jmp	.L334
.L453:
	endbr64
	movq	%rax, %r12
	movq	%rdx, %rbx
	jmp	.L382
.L456:
	endbr64
	movq	%rax, %r14
	movq	%rdx, %rbx
	jmp	.L378
.L423:
	endbr64
	movq	%rax, %r12
	movq	%rdx, %rbx
	jmp	.L390
.L426:
	endbr64
	movq	%rax, %r13
	movq	%rdx, %rbx
	jmp	.L287
.L422:
	endbr64
	movq	%rax, %r12
	movq	%rdx, %rbx
	jmp	.L390
	.section	.gcc_except_table
	.align 4
.LLSDA6419:
	.byte	0xff
	.byte	0x9b
	.uleb128 .LLSDATT6419-.LLSDATTD6419
.LLSDATTD6419:
	.byte	0x1
	.uleb128 .LLSDACSE6419-.LLSDACSB6419
.LLSDACSB6419:
	.uleb128 .LEHB34-.LFB6419
	.uleb128 .LEHE34-.LEHB34
	.uleb128 .L419-.LFB6419
	.uleb128 0x1
	.uleb128 .LEHB35-.LFB6419
	.uleb128 .LEHE35-.LEHB35
	.uleb128 .L431-.LFB6419
	.uleb128 0x3
	.uleb128 .LEHB36-.LFB6419
	.uleb128 .LEHE36-.LEHB36
	.uleb128 .L432-.LFB6419
	.uleb128 0x3
	.uleb128 .LEHB37-.LFB6419
	.uleb128 .LEHE37-.LEHB37
	.uleb128 .L419-.LFB6419
	.uleb128 0x1
	.uleb128 .LEHB38-.LFB6419
	.uleb128 .LEHE38-.LEHB38
	.uleb128 .L429-.LFB6419
	.uleb128 0x3
	.uleb128 .LEHB39-.LFB6419
	.uleb128 .LEHE39-.LEHB39
	.uleb128 .L430-.LFB6419
	.uleb128 0x3
	.uleb128 .LEHB40-.LFB6419
	.uleb128 .LEHE40-.LEHB40
	.uleb128 .L419-.LFB6419
	.uleb128 0x1
	.uleb128 .LEHB41-.LFB6419
	.uleb128 .LEHE41-.LEHB41
	.uleb128 .L427-.LFB6419
	.uleb128 0x3
	.uleb128 .LEHB42-.LFB6419
	.uleb128 .LEHE42-.LEHB42
	.uleb128 .L428-.LFB6419
	.uleb128 0x3
	.uleb128 .LEHB43-.LFB6419
	.uleb128 .LEHE43-.LEHB43
	.uleb128 .L419-.LFB6419
	.uleb128 0x1
	.uleb128 .LEHB44-.LFB6419
	.uleb128 .LEHE44-.LEHB44
	.uleb128 .L425-.LFB6419
	.uleb128 0x3
	.uleb128 .LEHB45-.LFB6419
	.uleb128 .LEHE45-.LEHB45
	.uleb128 .L426-.LFB6419
	.uleb128 0x3
	.uleb128 .LEHB46-.LFB6419
	.uleb128 .LEHE46-.LEHB46
	.uleb128 .L419-.LFB6419
	.uleb128 0x1
	.uleb128 .LEHB47-.LFB6419
	.uleb128 .LEHE47-.LEHB47
	.uleb128 .L433-.LFB6419
	.uleb128 0x3
	.uleb128 .LEHB48-.LFB6419
	.uleb128 .LEHE48-.LEHB48
	.uleb128 .L434-.LFB6419
	.uleb128 0x3
	.uleb128 .LEHB49-.LFB6419
	.uleb128 .LEHE49-.LEHB49
	.uleb128 .L436-.LFB6419
	.uleb128 0x5
	.uleb128 .LEHB50-.LFB6419
	.uleb128 .LEHE50-.LEHB50
	.uleb128 .L434-.LFB6419
	.uleb128 0x3
	.uleb128 .LEHB51-.LFB6419
	.uleb128 .LEHE51-.LEHB51
	.uleb128 .L437-.LFB6419
	.uleb128 0x5
	.uleb128 .LEHB52-.LFB6419
	.uleb128 .LEHE52-.LEHB52
	.uleb128 .L434-.LFB6419
	.uleb128 0x3
	.uleb128 .LEHB53-.LFB6419
	.uleb128 .LEHE53-.LEHB53
	.uleb128 .L419-.LFB6419
	.uleb128 0x1
	.uleb128 .LEHB54-.LFB6419
	.uleb128 .LEHE54-.LEHB54
	.uleb128 .L439-.LFB6419
	.uleb128 0x3
	.uleb128 .LEHB55-.LFB6419
	.uleb128 .LEHE55-.LEHB55
	.uleb128 .L419-.LFB6419
	.uleb128 0x1
	.uleb128 .LEHB56-.LFB6419
	.uleb128 .LEHE56-.LEHB56
	.uleb128 .L438-.LFB6419
	.uleb128 0x3
	.uleb128 .LEHB57-.LFB6419
	.uleb128 .LEHE57-.LEHB57
	.uleb128 .L419-.LFB6419
	.uleb128 0x1
	.uleb128 .LEHB58-.LFB6419
	.uleb128 .LEHE58-.LEHB58
	.uleb128 .L440-.LFB6419
	.uleb128 0x3
	.uleb128 .LEHB59-.LFB6419
	.uleb128 .LEHE59-.LEHB59
	.uleb128 .L441-.LFB6419
	.uleb128 0x3
	.uleb128 .LEHB60-.LFB6419
	.uleb128 .LEHE60-.LEHB60
	.uleb128 .L442-.LFB6419
	.uleb128 0x3
	.uleb128 .LEHB61-.LFB6419
	.uleb128 .LEHE61-.LEHB61
	.uleb128 .L443-.LFB6419
	.uleb128 0x5
	.uleb128 .LEHB62-.LFB6419
	.uleb128 .LEHE62-.LEHB62
	.uleb128 .L442-.LFB6419
	.uleb128 0x3
	.uleb128 .LEHB63-.LFB6419
	.uleb128 .LEHE63-.LEHB63
	.uleb128 .L444-.LFB6419
	.uleb128 0x5
	.uleb128 .LEHB64-.LFB6419
	.uleb128 .LEHE64-.LEHB64
	.uleb128 .L442-.LFB6419
	.uleb128 0x3
	.uleb128 .LEHB65-.LFB6419
	.uleb128 .LEHE65-.LEHB65
	.uleb128 .L419-.LFB6419
	.uleb128 0x1
	.uleb128 .LEHB66-.LFB6419
	.uleb128 .LEHE66-.LEHB66
	.uleb128 .L445-.LFB6419
	.uleb128 0x3
	.uleb128 .LEHB67-.LFB6419
	.uleb128 .LEHE67-.LEHB67
	.uleb128 .L446-.LFB6419
	.uleb128 0x3
	.uleb128 .LEHB68-.LFB6419
	.uleb128 .LEHE68-.LEHB68
	.uleb128 .L447-.LFB6419
	.uleb128 0x3
	.uleb128 .LEHB69-.LFB6419
	.uleb128 .LEHE69-.LEHB69
	.uleb128 .L448-.LFB6419
	.uleb128 0x3
	.uleb128 .LEHB70-.LFB6419
	.uleb128 .LEHE70-.LEHB70
	.uleb128 .L446-.LFB6419
	.uleb128 0x3
	.uleb128 .LEHB71-.LFB6419
	.uleb128 .LEHE71-.LEHB71
	.uleb128 .L419-.LFB6419
	.uleb128 0x1
	.uleb128 .LEHB72-.LFB6419
	.uleb128 .LEHE72-.LEHB72
	.uleb128 .L449-.LFB6419
	.uleb128 0x3
	.uleb128 .LEHB73-.LFB6419
	.uleb128 .LEHE73-.LEHB73
	.uleb128 .L450-.LFB6419
	.uleb128 0x3
	.uleb128 .LEHB74-.LFB6419
	.uleb128 .LEHE74-.LEHB74
	.uleb128 .L451-.LFB6419
	.uleb128 0x3
	.uleb128 .LEHB75-.LFB6419
	.uleb128 .LEHE75-.LEHB75
	.uleb128 .L419-.LFB6419
	.uleb128 0x1
	.uleb128 .LEHB76-.LFB6419
	.uleb128 .LEHE76-.LEHB76
	.uleb128 .L452-.LFB6419
	.uleb128 0x3
	.uleb128 .LEHB77-.LFB6419
	.uleb128 .LEHE77-.LEHB77
	.uleb128 .L419-.LFB6419
	.uleb128 0x1
	.uleb128 .LEHB78-.LFB6419
	.uleb128 .LEHE78-.LEHB78
	.uleb128 .L420-.LFB6419
	.uleb128 0x3
	.uleb128 .LEHB79-.LFB6419
	.uleb128 .LEHE79-.LEHB79
	.uleb128 .L455-.LFB6419
	.uleb128 0x3
	.uleb128 .LEHB80-.LFB6419
	.uleb128 .LEHE80-.LEHB80
	.uleb128 .L456-.LFB6419
	.uleb128 0x3
	.uleb128 .LEHB81-.LFB6419
	.uleb128 .LEHE81-.LEHB81
	.uleb128 .L453-.LFB6419
	.uleb128 0x3
	.uleb128 .LEHB82-.LFB6419
	.uleb128 .LEHE82-.LEHB82
	.uleb128 .L454-.LFB6419
	.uleb128 0x3
	.uleb128 .LEHB83-.LFB6419
	.uleb128 .LEHE83-.LEHB83
	.uleb128 .L419-.LFB6419
	.uleb128 0x1
	.uleb128 .LEHB84-.LFB6419
	.uleb128 .LEHE84-.LEHB84
	.uleb128 .L421-.LFB6419
	.uleb128 0x3
	.uleb128 .LEHB85-.LFB6419
	.uleb128 .LEHE85-.LEHB85
	.uleb128 .L419-.LFB6419
	.uleb128 0x1
	.uleb128 .LEHB86-.LFB6419
	.uleb128 .LEHE86-.LEHB86
	.uleb128 .L422-.LFB6419
	.uleb128 0x3
	.uleb128 .LEHB87-.LFB6419
	.uleb128 .LEHE87-.LEHB87
	.uleb128 .L419-.LFB6419
	.uleb128 0x1
	.uleb128 .LEHB88-.LFB6419
	.uleb128 .LEHE88-.LEHB88
	.uleb128 .L423-.LFB6419
	.uleb128 0x3
	.uleb128 .LEHB89-.LFB6419
	.uleb128 .LEHE89-.LEHB89
	.uleb128 .L439-.LFB6419
	.uleb128 0x3
	.uleb128 .LEHB90-.LFB6419
	.uleb128 .LEHE90-.LEHB90
	.uleb128 .L446-.LFB6419
	.uleb128 0x3
	.uleb128 .LEHB91-.LFB6419
	.uleb128 .LEHE91-.LEHB91
	.uleb128 .L449-.LFB6419
	.uleb128 0x3
	.uleb128 .LEHB92-.LFB6419
	.uleb128 .LEHE92-.LEHB92
	.uleb128 .L434-.LFB6419
	.uleb128 0x3
	.uleb128 .LEHB93-.LFB6419
	.uleb128 .LEHE93-.LEHB93
	.uleb128 .L457-.LFB6419
	.uleb128 0x3
	.uleb128 .LEHB94-.LFB6419
	.uleb128 .LEHE94-.LEHB94
	.uleb128 .L434-.LFB6419
	.uleb128 0x3
	.uleb128 .LEHB95-.LFB6419
	.uleb128 .LEHE95-.LEHB95
	.uleb128 .L435-.LFB6419
	.uleb128 0x3
	.uleb128 .LEHB96-.LFB6419
	.uleb128 .LEHE96-.LEHB96
	.uleb128 .L446-.LFB6419
	.uleb128 0x3
	.uleb128 .LEHB97-.LFB6419
	.uleb128 .LEHE97-.LEHB97
	.uleb128 .L440-.LFB6419
	.uleb128 0x3
	.uleb128 .LEHB98-.LFB6419
	.uleb128 .LEHE98-.LEHB98
	.uleb128 .L452-.LFB6419
	.uleb128 0x3
	.uleb128 .LEHB99-.LFB6419
	.uleb128 .LEHE99-.LEHB99
	.uleb128 .L451-.LFB6419
	.uleb128 0x3
	.uleb128 .LEHB100-.LFB6419
	.uleb128 .LEHE100-.LEHB100
	.uleb128 .L450-.LFB6419
	.uleb128 0x3
	.uleb128 .LEHB101-.LFB6419
	.uleb128 .LEHE101-.LEHB101
	.uleb128 .L434-.LFB6419
	.uleb128 0x3
	.uleb128 .LEHB102-.LFB6419
	.uleb128 .LEHE102-.LEHB102
	.uleb128 .L441-.LFB6419
	.uleb128 0x3
	.uleb128 .LEHB103-.LFB6419
	.uleb128 .LEHE103-.LEHB103
	.uleb128 .L454-.LFB6419
	.uleb128 0x3
	.uleb128 .LEHB104-.LFB6419
	.uleb128 .LEHE104-.LEHB104
	.uleb128 .L434-.LFB6419
	.uleb128 0x3
	.uleb128 .LEHB105-.LFB6419
	.uleb128 .LEHE105-.LEHB105
	.uleb128 .L449-.LFB6419
	.uleb128 0x3
	.uleb128 .LEHB106-.LFB6419
	.uleb128 .LEHE106-.LEHB106
	.uleb128 .L452-.LFB6419
	.uleb128 0x3
	.uleb128 .LEHB107-.LFB6419
	.uleb128 .LEHE107-.LEHB107
	.uleb128 .L446-.LFB6419
	.uleb128 0x3
.LLSDACSE6419:
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0x7d
	.byte	0x1
	.byte	0x7d
	.align 4
	.long	DW.ref._ZTISt9exception-.
.LLSDATT6419:
	.section	.text.startup
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDAC6419
	.type	main.cold, @function
main.cold:
.LFSB6419:
.L292:
	.cfi_def_cfa 6, 16
	.cfi_offset 3, -56
	.cfi_offset 6, -16
	.cfi_offset 12, -48
	.cfi_offset 13, -40
	.cfi_offset 14, -32
	.cfi_offset 15, -24
	movq	%r13, %rdi
	call	_ZNSt6vectorIhSaIhEED1Ev
.L293:
	movq	-1272(%rbp), %rdi
	call	_ZNSt6vectorIhSaIhEED1Ev
.L310:
	movq	-1264(%rbp), %rdi
	movq	%r14, %r12
	call	_ZN7edge_ai3ecs6KernelD1Ev@PLT
	movq	%rbx, %rax
.L282:
	subq	$1, %rax
	jne	.L512
	movq	%r12, %rdi
	call	__cxa_begin_catch@PLT
	leaq	.LC118(%rip), %rsi
	leaq	_ZSt4cerr(%rip), %rdi
	movb	$0, _ZN12_GLOBAL__N_117count_allocationsE(%rip)
	movq	%rax, %rbx
.LEHB108:
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movl	_ZN12_GLOBAL__N_16checksE(%rip), %esi
	movq	%rax, %rdi
	call	_ZNSo9_M_insertImEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC119(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %r14
	movq	(%rbx), %rax
	movq	%rbx, %rdi
	call	*16(%rax)
	movq	%r14, %rdi
	movq	%rax, %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdi
	movl	$10, %esi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c.isra.0
.LEHE108:
	call	__cxa_end_catch@PLT
	movl	$1, %eax
	jmp	.L278
.L309:
	movq	%r13, %rdi
	call	_ZNSt6vectorIhSaIhEED1Ev
	jmp	.L293
.L287:
	movq	%r15, %rdi
	movq	%r13, %r15
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
.L288:
	movq	%r14, %rdi
	movq	%r15, %r12
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	movq	%rbx, %rax
	jmp	.L282
.L280:
	movq	%r15, %rdi
	movq	%r13, %r15
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	jmp	.L288
.L512:
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L513
	movq	%r12, %rdi
.LEHB109:
	call	_Unwind_Resume@PLT
.L513:
	call	__stack_chk_fail@PLT
.L424:
	endbr64
	movq	%rax, %rbx
	call	__cxa_end_catch@PLT
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L514
	movq	%rbx, %rdi
	call	_Unwind_Resume@PLT
.LEHE109:
.L362:
	movq	-1240(%rbp), %rdi
	movq	%r12, %r15
	call	_ZN7edge_ai3ecs6KernelD1Ev@PLT
.L363:
	movq	-1272(%rbp), %rdi
	call	_ZN7edge_ai3ecs6KernelD1Ev@PLT
.L364:
	movq	%r14, %rdi
	movq	%r15, %r12
	call	_ZN7edge_ai3ecs6KernelD1Ev@PLT
	movq	%rbx, %rax
	jmp	.L282
.L390:
	movq	%r15, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	movq	%rbx, %rax
	jmp	.L282
.L305:
	cmpq	$1, %rdx
	jne	.L515
	call	__cxa_begin_catch@PLT
	call	__cxa_end_catch@PLT
	movl	$1, %edi
	jmp	.L307
.L301:
	cmpq	$1, %rdx
	jne	.L516
	call	__cxa_begin_catch@PLT
	call	__cxa_end_catch@PLT
	movl	$1, %edi
	jmp	.L303
.L515:
	movq	%rax, %r14
	jmp	.L293
.L381:
	movq	%r14, %rdi
	call	_ZN7edge_ai3ecs6KernelD1Ev@PLT
.L382:
	movq	-1240(%rbp), %rdi
	call	_ZNSt12_Vector_baseIN7edge_ai9LutSampleESaIS1_EED2Ev
.L380:
	movq	-1256(%rbp), %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	movq	%rbx, %rax
	jmp	.L282
.L324:
	movq	%r13, %rdi
	call	_ZN7edge_ai3ecs6KernelD1Ev@PLT
	movq	%rbx, %rax
	jmp	.L282
.L516:
	movq	%rax, %r14
	jmp	.L293
.L329:
	cmpq	$1, %rdx
	je	.L330
	movq	%rdi, %r12
	movq	%rdx, %r15
.L331:
	movq	%r13, %rdi
	call	_ZN7edge_ai3ecs6KernelD1Ev@PLT
.L338:
	movq	%r14, %rdi
	movq	%r15, %r14
	call	_ZN7edge_ai3ecs6KernelD1Ev@PLT
.L350:
	movq	%rbx, %rdi
	call	_ZN7edge_ai3ecs6KernelD1Ev@PLT
	movq	%r14, %rax
	jmp	.L282
.L347:
	movq	-1264(%rbp), %rdi
	call	_ZNSt6vectorIhSaIhEED1Ev
.L348:
	movq	-1272(%rbp), %rdi
	call	_ZNSt6vectorIhSaIhEED1Ev
.L349:
	movq	%r14, %rdi
	movq	%r15, %r14
	call	_ZN7edge_ai3ecs6KernelD1Ev@PLT
	jmp	.L350
.L378:
	movq	-1248(%rbp), %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
.L379:
	movq	%r15, %rdi
	movq	%r14, %r12
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	jmp	.L380
.L285:
	movq	%r15, %rdi
	movq	%r13, %r15
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	jmp	.L288
.L283:
	movq	%r15, %rdi
	movq	%r13, %r15
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	jmp	.L288
.L330:
	call	__cxa_begin_catch@PLT
	call	__cxa_end_catch@PLT
	movl	$1, %edi
	jmp	.L332
.L371:
	movq	-1240(%rbp), %rdi
	call	_ZN7edge_ai3ecs6KernelD1Ev@PLT
	movq	%rbx, %rax
	jmp	.L282
.L334:
	cmpq	$1, %rdx
	jne	.L517
	call	__cxa_begin_catch@PLT
	call	__cxa_end_catch@PLT
	movl	$1, %edi
	jmp	.L336
.L514:
	call	__stack_chk_fail@PLT
.L517:
	movq	%rdi, %r12
	movq	%rdx, %r15
	jmp	.L331
	.cfi_endproc
.LFE6419:
	.section	.gcc_except_table
	.align 4
.LLSDAC6419:
	.byte	0xff
	.byte	0x9b
	.uleb128 .LLSDATTC6419-.LLSDATTDC6419
.LLSDATTDC6419:
	.byte	0x1
	.uleb128 .LLSDACSEC6419-.LLSDACSBC6419
.LLSDACSBC6419:
	.uleb128 .LEHB108-.LCOLDB120
	.uleb128 .LEHE108-.LEHB108
	.uleb128 .L424-.LCOLDB120
	.uleb128 0
	.uleb128 .LEHB109-.LCOLDB120
	.uleb128 .LEHE109-.LEHB109
	.uleb128 0
	.uleb128 0
.LLSDACSEC6419:
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0x7d
	.byte	0x1
	.byte	0x7d
	.align 4
	.long	DW.ref._ZTISt9exception-.
.LLSDATTC6419:
	.section	.text.unlikely
	.section	.text.startup
	.size	main, .-main
	.section	.text.unlikely
	.size	main.cold, .-main.cold
.LCOLDE120:
	.section	.text.startup
.LHOTE120:
	.local	_ZN12_GLOBAL__N_16checksE
	.comm	_ZN12_GLOBAL__N_16checksE,4,4
	.local	_ZN12_GLOBAL__N_116allocation_countE
	.comm	_ZN12_GLOBAL__N_116allocation_countE,8,8
	.local	_ZN12_GLOBAL__N_117count_allocationsE
	.comm	_ZN12_GLOBAL__N_117count_allocationsE,1,1
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.long	4
	.long	16
	.long	64
	.long	4
	.set	.LC13,.LC61
	.align 16
.LC17:
	.long	19
	.long	0
	.long	0
	.long	0
	.align 16
.LC18:
	.long	0
	.long	0
	.long	1
	.long	2
	.align 16
.LC19:
	.long	-192618600
	.long	19
	.long	0
	.long	25
	.align 16
.LC43:
	.quad	2
	.quad	0
	.align 16
.LC44:
	.quad	1
	.quad	0
	.align 16
.LC56:
	.quad	2
	.quad	1
	.align 16
.LC57:
	.quad	3
	.quad	2
	.set	.LC58,.LC44
	.align 16
.LC59:
	.quad	7
	.quad	3
	.align 16
.LC60:
	.quad	9
	.quad	1
	.align 16
.LC61:
	.long	0
	.long	1
	.long	2
	.long	3
	.align 16
.LC81:
	.long	1
	.long	1
	.long	1
	.long	1
	.align 16
.LC84:
	.long	64
	.long	16
	.long	1024
	.long	8
	.set	.LC86,.LC81
	.align 16
.LC88:
	.long	1
	.long	65
	.long	1
	.long	1
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC97:
	.long	0
	.long	2
	.section	.rodata.cst16
	.align 16
.LC100:
	.long	1
	.long	1
	.long	4
	.long	1
	.section	.rodata.cst8
	.align 8
.LC101:
	.long	0
	.long	-1
	.section	.rodata.cst16
	.align 16
.LC103:
	.quad	2
	.quad	3
	.align 16
.LC104:
	.quad	-1
	.quad	0
	.hidden	DW.ref._ZTISt9exception
	.weak	DW.ref._ZTISt9exception
	.section	.data.rel.local.DW.ref._ZTISt9exception,"awG",@progbits,DW.ref._ZTISt9exception,comdat
	.align 8
	.type	DW.ref._ZTISt9exception, @object
	.size	DW.ref._ZTISt9exception, 8
DW.ref._ZTISt9exception:
	.quad	_ZTISt9exception
	.hidden	DW.ref.__gxx_personality_v0
	.weak	DW.ref.__gxx_personality_v0
	.section	.data.rel.local.DW.ref.__gxx_personality_v0,"awG",@progbits,DW.ref.__gxx_personality_v0,comdat
	.align 8
	.type	DW.ref.__gxx_personality_v0, @object
	.size	DW.ref.__gxx_personality_v0, 8
DW.ref.__gxx_personality_v0:
	.quad	__gxx_personality_v0
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
