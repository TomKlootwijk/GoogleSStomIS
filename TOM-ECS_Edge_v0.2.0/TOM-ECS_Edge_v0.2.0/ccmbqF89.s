	.file	"ecs_tests.cpp"
	.text
.Ltext0:
	.file 0 "/workspace/scratch/8c9842f42a94/edge_ai_v2" "tests/ecs_tests.cpp"
#APP
	.globl _ZSt21ios_base_library_initv
	.globl	__asan_stack_malloc_2
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"2 48 8 4 e:47 80 48 9 <unknown>"
#NO_APP
	.text
	.type	_ZN12_GLOBAL__N_14tinyEm, @function
_ZN12_GLOBAL__N_14tinyEm:
.LASANPC6347:
.LVL0:
.LFB6347:
	.file 1 "tests/ecs_tests.cpp"
	.loc 1 46 37 view -0
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA6347
	.loc 1 46 37 is_stmt 0 view .LVU1
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$216, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rdi, %r14
	movq	%rsi, -248(%rbp)
	leaq	-240(%rbp), %r12
	movq	%r12, %r15
	cmpl	$0, __asan_option_detect_stack_use_after_return(%rip)
	jne	.L12
.LVL1:
.L1:
	.loc 1 46 37 view .LVU2
	leaq	192(%r12), %rbx
	movq	$1102416563, (%r12)
.LVL2:
	.loc 1 46 37 view .LVU3
	leaq	.LC0(%rip), %rax
	movq	%rax, 8(%r12)
	leaq	.LASANPC6347(%rip), %rax
	movq	%rax, 16(%r12)
	movq	%r12, %r13
	shrq	$3, %r13
	movl	$-235802127, 2147450880(%r13)
	movl	$-234819087, 2147450884(%r13)
	movl	$62194, 2147450888(%r13)
	movl	$-202116109, 2147450896(%r13)
	.loc 1 46 37 view .LVU4
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	.loc 1 47 3 is_stmt 1 view .LVU5
	.loc 1 47 32 is_stmt 0 view .LVU6
	pxor	%xmm0, %xmm0
	movaps	%xmm0, -96(%rbx)
	movaps	%xmm0, -80(%rbx)
	movl	$4, -112(%rbx)
	movl	$16, -108(%rbx)
	movl	$64, -104(%rbx)
	movl	$4, -100(%rbx)
	subq	$48, %rsp
	movdqa	-112(%rbx), %xmm1
	movups	%xmm1, (%rsp)
	movdqa	-96(%rbx), %xmm2
	movups	%xmm2, 16(%rsp)
	movdqa	-80(%rbx), %xmm3
	movups	%xmm3, 32(%rsp)
	movq	%r14, %rdi
.LEHB0:
	call	_ZN7edge_ai3ecs6KernelC1ENS0_6ConfigE@PLT
.LVL3:
.LEHE0:
	.loc 1 47 34 is_stmt 1 discriminator 1 view .LVU7
	.loc 1 47 56 is_stmt 0 discriminator 1 view .LVU8
	leaq	48(%r12), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	addq	$48, %rsp
	cmpb	$0, 2147450880(%rax)
	jne	.L13
	movq	%r14, %rdi
.LEHB1:
	call	_ZN7edge_ai3ecs6Kernel13create_entityEv@PLT
.LVL4:
	jmp	.L14
.LVL5:
.L12:
	.loc 1 46 37 view .LVU9
	movl	$160, %edi
.LVL6:
	.loc 1 46 37 view .LVU10
	call	__asan_stack_malloc_2@PLT
.LVL7:
	.loc 1 46 37 view .LVU11
	testq	%rax, %rax
	cmovne	%rax, %r12
	jmp	.L1
.LVL8:
.L13:
	.loc 1 47 56 discriminator 1 view .LVU12
	call	__asan_report_store8@PLT
.LVL9:
.L14:
	movq	%rax, %rsi
	movq	%rax, -144(%rbx)
	.loc 1 47 59 is_stmt 1 discriminator 2 view .LVU13
	.loc 1 47 74 is_stmt 0 discriminator 2 view .LVU14
	movq	-248(%rbp), %rcx
	movl	$0, %edx
	movq	%r14, %rdi
	call	_ZN7edge_ai3ecs6Kernel13set_componentENS0_8EntityIdEtm@PLT
.LVL10:
.LEHE1:
	jmp	.L15
.L9:
	.loc 1 47 74 discriminator 2 view .LVU15
	endbr64
	.loc 1 48 1 view .LVU16
	movq	%rax, %rbx
	movq	%r14, %rdi
	call	_ZN7edge_ai3ecs6KernelD1Ev@PLT
.LVL11:
	call	__asan_handle_no_return@PLT
.LVL12:
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	je	.L7
	call	__stack_chk_fail@PLT
.LVL13:
.L7:
	movq	%rbx, %rdi
.LEHB2:
	call	_Unwind_Resume@PLT
.LVL14:
.LEHE2:
.L15:
	.loc 1 46 37 view .LVU17
	cmpq	%r12, %r15
	jne	.L16
	movq	$0, 2147450880(%r13)
	movl	$0, 2147450888(%r13)
	movl	$0, 2147450896(%r13)
.L3:
	.loc 1 48 1 view .LVU18
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L17
	movq	%r14, %rax
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
.LVL15:
	.loc 1 48 1 view .LVU19
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.LVL16:
.L16:
	.cfi_restore_state
	.loc 1 46 37 view .LVU20
	movq	$1172321806, (%r12)
	movdqa	.LC1(%rip), %xmm0
	movups	%xmm0, 2147450880(%r13)
	movl	$-168430091, 2147450896(%r13)
	movq	248(%r12), %rax
	movb	$0, (%rax)
	jmp	.L3
.L17:
	.loc 1 48 1 view .LVU21
	call	__stack_chk_fail@PLT
.LVL17:
	.cfi_endproc
.LFE6347:
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
	.uleb128 .L9-.LFB6347
	.uleb128 0
	.uleb128 .LEHB2-.LFB6347
	.uleb128 .LEHE2-.LEHB2
	.uleb128 0
	.uleb128 0
.LLSDACSE6347:
	.text
	.size	_ZN12_GLOBAL__N_14tinyEm, .-_ZN12_GLOBAL__N_14tinyEm
	.type	_ZN12_GLOBAL__N_17requireEbPKc, @function
_ZN12_GLOBAL__N_17requireEbPKc:
.LASANPC6340:
.LVL18:
.LFB6340:
	.loc 1 33 49 is_stmt 1 view -0
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA6340
	.loc 1 33 50 view .LVU23
	addl	$1, _ZN12_GLOBAL__N_16checksE(%rip)
	.loc 1 33 59 view .LVU24
	testb	%dil, %dil
	je	.L25
	ret
.L25:
	.loc 1 33 49 is_stmt 0 view .LVU25
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%rsi, %rbx
	.loc 1 33 73 is_stmt 1 discriminator 1 view .LVU26
	.loc 1 33 105 is_stmt 0 discriminator 1 view .LVU27
	movl	$16, %edi
.LVL19:
	.loc 1 33 105 discriminator 1 view .LVU28
	call	__cxa_allocate_exception@PLT
.LVL20:
	.loc 1 33 105 discriminator 1 view .LVU29
	movq	%rax, %r12
	movq	%rbx, %rsi
	movq	%rax, %rdi
.LEHB3:
	call	_ZNSt13runtime_errorC1EPKc@PLT
.LVL21:
.LEHE3:
	.loc 1 33 105 discriminator 4 view .LVU30
	call	__asan_handle_no_return@PLT
.LVL22:
	movq	_ZNSt13runtime_errorD1Ev@GOTPCREL(%rip), %rdx
	leaq	_ZTISt13runtime_error(%rip), %rsi
	movq	%r12, %rdi
.LEHB4:
	call	__cxa_throw@PLT
.LVL23:
.L21:
	endbr64
	.loc 1 33 105 discriminator 3 view .LVU31
	movq	%rax, %rbx
.LVL24:
	.loc 1 33 105 discriminator 3 view .LVU32
	movq	%r12, %rdi
	call	__cxa_free_exception@PLT
.LVL25:
	call	__asan_handle_no_return@PLT
.LVL26:
	movq	%rbx, %rdi
	call	_Unwind_Resume@PLT
.LVL27:
.LEHE4:
	.cfi_endproc
.LFE6340:
	.section	.gcc_except_table
.LLSDA6340:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE6340-.LLSDACSB6340
.LLSDACSB6340:
	.uleb128 .LEHB3-.LFB6340
	.uleb128 .LEHE3-.LEHB3
	.uleb128 .L21-.LFB6340
	.uleb128 0
	.uleb128 .LEHB4-.LFB6340
	.uleb128 .LEHE4-.LEHB4
	.uleb128 0
	.uleb128 0
.LLSDACSE6340:
	.text
	.size	_ZN12_GLOBAL__N_17requireEbPKc, .-_ZN12_GLOBAL__N_17requireEbPKc
	.globl	__asan_stack_malloc_0
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC3:
	.string	"1 32 16 9 <unknown>"
	.text
	.type	_ZN12_GLOBAL__N_19hash_textERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE, @function
_ZN12_GLOBAL__N_19hash_textERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE:
.LASANPC6343:
.LVL28:
.LFB6343:
	.loc 1 39 42 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 39 42 is_stmt 0 view .LVU34
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$120, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rdi, -152(%rbp)
	movq	%rsi, %rbx
	leaq	-144(%rbp), %r12
	movq	%r12, -160(%rbp)
	cmpl	$0, __asan_option_detect_stack_use_after_return(%rip)
	jne	.L48
.LVL29:
.L26:
	.loc 1 39 42 view .LVU35
	leaq	96(%r12), %r13
	movq	$1102416563, (%r12)
.LVL30:
	.loc 1 39 42 view .LVU36
	leaq	.LC3(%rip), %rax
	movq	%rax, 8(%r12)
	leaq	.LASANPC6343(%rip), %rax
	movq	%rax, 16(%r12)
	movq	%r12, %r14
	shrq	$3, %r14
	movl	$-235802127, 2147450880(%r14)
	movl	$-202178560, 2147450884(%r14)
	.loc 1 39 42 view .LVU37
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	.loc 1 40 3 is_stmt 1 view .LVU38
	.loc 1 40 87 is_stmt 0 discriminator 1 view .LVU39
	testq	%rbx, %rbx
	je	.L30
	testb	$7, %bl
	jne	.L30
.L31:
.LVL31:
.LBB1273:
.LBI1273:
	.file 2 "/usr/include/c++/13/bits/basic_string.h"
	.loc 2 1071 7 is_stmt 1 view .LVU40
.LBB1274:
	.loc 2 1072 16 is_stmt 0 view .LVU41
	testq	%rbx, %rbx
	je	.L32
	testb	$7, %bl
	jne	.L32
.L33:
	.loc 2 1072 16 view .LVU42
	leaq	8(%rbx), %rdx
	cmpq	$-8, %rbx
	jnb	.L49
.L34:
	leaq	8(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L50
	movq	8(%rbx), %r15
.LVL32:
	.loc 2 1072 16 view .LVU43
.LBE1274:
.LBE1273:
	.loc 1 40 74 discriminator 3 view .LVU44
	testq	%rbx, %rbx
	je	.L36
	testb	$7, %bl
	jne	.L36
.L37:
.LVL33:
.LBB1276:
.LBI1276:
	.loc 2 2608 7 is_stmt 1 view .LVU45
.LBB1277:
	.loc 2 2609 23 is_stmt 0 view .LVU46
	testq	%rbx, %rbx
	je	.L38
	testb	$7, %bl
	jne	.L38
.L39:
.LVL34:
.LBB1278:
.LBI1278:
	.loc 2 222 7 is_stmt 1 view .LVU47
.LBB1279:
	.loc 2 223 28 is_stmt 0 view .LVU48
	testq	%rbx, %rbx
	je	.L40
	testb	$7, %bl
	jne	.L40
.L41:
	.loc 2 223 28 view .LVU49
	movq	%rbx, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L51
	movq	(%rbx), %rax
.LVL35:
	.loc 2 223 28 view .LVU50
.LBE1279:
.LBE1278:
.LBE1277:
.LBE1276:
.LBB1283:
.LBI1283:
	.file 3 "/usr/include/c++/13/span"
	.loc 3 159 2 is_stmt 1 view .LVU51
.LBB1284:
.LBB1285:
.LBB1286:
.LBI1286:
	.file 4 "/usr/include/c++/13/bits/ptr_traits.h"
	.loc 4 250 5 view .LVU52
	.loc 4 250 5 is_stmt 0 view .LVU53
.LBE1286:
	.loc 3 161 4 discriminator 1 view .LVU54
	leaq	-64(%r13), %rdi
.LVL36:
	.loc 3 161 4 discriminator 1 view .LVU55
	movq	%rdi, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L52
	movq	%rax, -64(%r13)
.LVL37:
.LBB1287:
.LBI1287:
	.loc 3 90 2 is_stmt 1 view .LVU56
.LBB1288:
.LBB1289:
	.loc 3 91 4 is_stmt 0 view .LVU57
	leaq	-56(%r13), %rdi
.LVL38:
	.loc 3 91 4 view .LVU58
	movq	%rdi, %rax
.LVL39:
	.loc 3 91 4 view .LVU59
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L53
	movq	%r15, -56(%r13)
.LVL40:
	.loc 3 91 4 view .LVU60
.LBE1289:
.LBE1288:
.LBE1287:
.LBE1285:
.LBE1284:
.LBE1283:
	.loc 1 40 16 discriminator 6 view .LVU61
	leaq	-64(%r13), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpw	$0, 2147450880(%rax)
	jne	.L54
	movq	-64(%r13), %rsi
	movq	-56(%r13), %rdx
	movq	-152(%rbp), %rdi
	call	_ZN7edge_ai3ecs6sha256ESt4spanIKhLm18446744073709551615EE@PLT
.LVL41:
	.loc 1 39 42 view .LVU62
	cmpq	%r12, -160(%rbp)
	jne	.L55
	movq	$0, 2147450880(%r14)
.L28:
	.loc 1 41 1 view .LVU63
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L56
	movq	-152(%rbp), %rax
	addq	$120, %rsp
	popq	%rbx
.LVL42:
	.loc 1 41 1 view .LVU64
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.LVL43:
.L48:
	.cfi_restore_state
	.loc 1 39 42 view .LVU65
	movl	$64, %edi
.LVL44:
	.loc 1 39 42 view .LVU66
	call	__asan_stack_malloc_0@PLT
.LVL45:
	testq	%rax, %rax
	cmovne	%rax, %r12
	jmp	.L26
.LVL46:
.L30:
	.loc 1 40 87 discriminator 1 view .LVU67
	movq	%rbx, %rsi
	leaq	.Lubsan_data859(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL47:
	jmp	.L31
.LVL48:
.L32:
.LBB1295:
.LBB1275:
	.loc 2 1072 16 view .LVU68
	movq	%rbx, %rsi
	leaq	.Lubsan_data860(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL49:
	jmp	.L33
.L49:
	.loc 2 1072 16 view .LVU69
	movq	%rbx, %rsi
	leaq	.Lubsan_data861(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL50:
	jmp	.L34
.L50:
	.loc 2 1072 16 view .LVU70
	call	__asan_report_load8@PLT
.LVL51:
.L36:
	.loc 2 1072 16 view .LVU71
.LBE1275:
.LBE1295:
	.loc 1 40 74 discriminator 3 view .LVU72
	movq	%rbx, %rsi
	leaq	.Lubsan_data862(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL52:
	jmp	.L37
.LVL53:
.L38:
.LBB1296:
.LBB1282:
	.loc 2 2609 23 view .LVU73
	movq	%rbx, %rsi
	leaq	.Lubsan_data863(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL54:
	jmp	.L39
.LVL55:
.L40:
.LBB1281:
.LBB1280:
	.loc 2 223 28 view .LVU74
	movq	%rbx, %rsi
	leaq	.Lubsan_data864(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL56:
	jmp	.L41
.L51:
	.loc 2 223 28 view .LVU75
	movq	%rbx, %rdi
	call	__asan_report_load8@PLT
.LVL57:
.L52:
	.loc 2 223 28 view .LVU76
.LBE1280:
.LBE1281:
.LBE1282:
.LBE1296:
.LBB1297:
.LBB1294:
.LBB1293:
	.loc 3 161 4 discriminator 1 view .LVU77
	call	__asan_report_store8@PLT
.LVL58:
.L53:
.LBB1292:
.LBB1291:
.LBB1290:
	.loc 3 91 4 view .LVU78
	call	__asan_report_store8@PLT
.LVL59:
.L54:
	.loc 3 91 4 view .LVU79
.LBE1290:
.LBE1291:
.LBE1292:
.LBE1293:
.LBE1294:
.LBE1297:
	.loc 1 40 16 discriminator 6 view .LVU80
	call	__asan_report_load16@PLT
.LVL60:
.L55:
	.loc 1 39 42 view .LVU81
	movq	$1172321806, (%r12)
	movabsq	$-723401728380766731, %rax
	movq	%rax, 2147450880(%r14)
	movq	56(%r12), %rax
	movb	$0, (%rax)
	jmp	.L28
.L56:
	.loc 1 41 1 view .LVU82
	call	__stack_chk_fail@PLT
.LVL61:
	.cfi_endproc
.LFE6343:
	.size	_ZN12_GLOBAL__N_19hash_textERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE, .-_ZN12_GLOBAL__N_19hash_textERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	.globl	__asan_stack_malloc_6
	.section	.rodata.str1.8
	.align 8
.LC4:
	.ascii	"18 48 8 5 k:124 80 8 11 retired:132 112 8 8 pair:136 144 32 "
	.ascii	"9 <unknown> 208 48 9 <unkn"
	.string	"own> 288 48 9 <unknown> 368 48 9 <unknown> 448 48 9 <unknown> 528 48 9 <unknown> 608 48 9 <unknown> 688 48 9 <unknown> 768 48 9 <unknown> 848 48 9 <unknown> 928 184 5 r:126 1184 184 9 <unknown> 1440 184 9 <unknown> 1696 184 9 <unknown> 1952 184 9 <unknown>"
	.globl	__asan_stack_free_6
	.section	.rodata
	.align 32
.LC5:
	.string	"Checked overflow mutated state"
	.zero	33
	.align 32
.LC6:
	.string	"Unsigned wrap contract"
	.zero	41
	.align 32
.LC7:
	.string	"Generation guard failed"
	.zero	40
	.align 32
.LC8:
	.string	"Entity reuse retained stale state"
	.zero	62
	.align 32
.LC9:
	.string	"Exhausted generation reused"
	.zero	36
	.align 32
.LC10:
	.string	"Failed paired transaction partially committed"
	.zero	50
	.text
	.type	_ZN12_GLOBAL__N_127test_lifecycle_and_overflowEv, @function
_ZN12_GLOBAL__N_127test_lifecycle_and_overflowEv:
.LASANPC6369:
.LFB6369:
	.loc 1 123 35 is_stmt 1 view -0
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA6369
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$2280, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	leaq	-2288(%rbp), %r13
	movq	%r13, %r14
	cmpl	$0, __asan_option_detect_stack_use_after_return(%rip)
	jne	.L232
.L57:
	leaq	2240(%r13), %rbx
	movq	$1102416563, 0(%r13)
	leaq	.LC4(%rip), %rax
	movq	%rax, 8(%r13)
	leaq	.LASANPC6369(%rip), %rax
	movq	%rax, 16(%r13)
	movq	%r13, %r12
	shrq	$3, %r12
	movl	$-235802127, 2147450880(%r12)
	movl	$-234819087, 2147450884(%r12)
	movl	$-234818830, 2147450888(%r12)
	movl	$-234818830, 2147450892(%r12)
	movl	$62194, 2147450896(%r12)
	movl	$-219021312, 2147450900(%r12)
	movl	$62194, 2147450904(%r12)
	movl	$-218959118, 2147450912(%r12)
	movl	$-219021312, 2147450920(%r12)
	movl	$62194, 2147450924(%r12)
	movl	$-218959118, 2147450932(%r12)
	movl	$-219021312, 2147450940(%r12)
	movl	$62194, 2147450944(%r12)
	movl	$-218959118, 2147450952(%r12)
	movl	$-219021312, 2147450960(%r12)
	movl	$62194, 2147450964(%r12)
	movl	$-218959118, 2147450972(%r12)
	movl	$-219021312, 2147450980(%r12)
	movl	$62194, 2147450984(%r12)
	movl	$-218959118, 2147450992(%r12)
	movl	$-234881024, 2147451016(%r12)
	movl	$-218959118, 2147451020(%r12)
	movl	$-218959118, 2147451024(%r12)
	movl	$-234881024, 2147451048(%r12)
	movl	$-218959118, 2147451052(%r12)
	movl	$-218959118, 2147451056(%r12)
	movl	$-234881024, 2147451080(%r12)
	movl	$-218959118, 2147451084(%r12)
	movl	$-218959118, 2147451088(%r12)
	movl	$-234881024, 2147451112(%r12)
	movl	$-218959118, 2147451116(%r12)
	movl	$-218959118, 2147451120(%r12)
	movl	$-218103808, 2147451144(%r12)
	movl	$-202116109, 2147451148(%r12)
	movl	$-202116109, 2147451152(%r12)
	.loc 1 123 35 is_stmt 0 view .LVU84
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	.loc 1 124 3 is_stmt 1 view .LVU85
	.loc 1 124 56 is_stmt 0 discriminator 1 view .LVU86
	leaq	48(%r13), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L233
	leaq	-2192(%rbx), %rdi
	movq	$-1, %rsi
.LEHB5:
	call	_ZN12_GLOBAL__N_14tinyEm
.LVL62:
.LEHE5:
	.loc 1 125 3 is_stmt 1 view .LVU87
.LBB1316:
.LBI1316:
	.loc 1 42 7 view .LVU88
.LBB1317:
	.loc 1 44 3 view .LVU89
	.loc 1 44 69 is_stmt 0 view .LVU90
	leaq	-2032(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L234
	movq	$1, -2032(%rbx)
	leaq	-2024(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L63
	cmpb	$3, %al
	jle	.L235
.L63:
	movl	$0, -2024(%rbx)
	leaq	-2020(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L64
	testb	%dl, %dl
	jne	.L236
.L64:
	movl	$0, -2020(%rbx)
	leaq	-2016(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L237
	movq	$1, -2016(%rbx)
	leaq	-2008(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L66
	cmpb	$3, %al
	jle	.L238
.L66:
	movl	$0, -2008(%rbx)
	leaq	-2004(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L67
	testb	%dl, %dl
	jne	.L239
.L67:
	movl	$1, -2004(%rbx)
	leaq	-2000(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L68
	cmpb	$1, %al
	jle	.L240
.L68:
	movw	$3, -2000(%rbx)
	leaq	-1998(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$1, %eax
	cmpb	%dl, %al
	jl	.L69
	testb	%dl, %dl
	jne	.L241
.L69:
	movw	$0, -1998(%rbx)
	leaq	-1996(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L70
	testb	%dl, %dl
	jne	.L242
.L70:
	movl	$0, -1996(%rbx)
	leaq	-1992(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L243
	movq	$1, -1992(%rbx)
.LVL63:
	.loc 1 44 69 view .LVU91
.LBE1317:
.LBE1316:
	.loc 1 125 12 discriminator 3 view .LVU92
	leaq	-2032(%rbx), %rsi
	leaq	-2192(%rbx), %rdi
.LEHB6:
	call	_ZN7edge_ai3ecs6Kernel7enqueueERKNS0_5EventE@PLT
.LVL64:
.LEHE6:
	jmp	.L244
.LVL65:
.L232:
	.loc 1 123 35 view .LVU93
	movl	$2208, %edi
	call	__asan_stack_malloc_6@PLT
.LVL66:
	testq	%rax, %rax
	cmovne	%rax, %r13
	jmp	.L57
.L233:
	.loc 1 124 56 discriminator 1 view .LVU94
	call	__asan_report_store8@PLT
.LVL67:
.L234:
.LBB1319:
.LBB1318:
	.loc 1 44 69 view .LVU95
	call	__asan_report_store8@PLT
.LVL68:
.L235:
	call	__asan_report_store4@PLT
.LVL69:
.L236:
	call	__asan_report_store4@PLT
.LVL70:
.L237:
	call	__asan_report_store8@PLT
.LVL71:
.L238:
	call	__asan_report_store4@PLT
.LVL72:
.L239:
	call	__asan_report_store4@PLT
.LVL73:
.L240:
	call	__asan_report_store2@PLT
.LVL74:
.L241:
	call	__asan_report_store2@PLT
.LVL75:
.L242:
	call	__asan_report_store4@PLT
.LVL76:
.L243:
	call	__asan_report_store8@PLT
.LVL77:
.L244:
	.loc 1 44 69 view .LVU96
.LBE1318:
.LBE1319:
	.loc 1 125 18 discriminator 2 view .LVU97
	leaq	-2032(%rbx), %rax
	shrq	$3, %rax
	movl	$-117901064, 2147450880(%rax)
	movw	$-1800, 2147450884(%rax)
	.loc 1 126 3 is_stmt 1 view .LVU98
	.loc 1 126 8 is_stmt 0 view .LVU99
	leaq	-1312(%rbx), %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	movl	$0, 2147450880(%rdx)
	movl	$0, 2147450884(%rdx)
	movl	$0, 2147450888(%rdx)
	movl	$0, 2147450892(%rdx)
	movl	$0, 2147450896(%rdx)
	movw	$0, 2147450900(%rdx)
	movb	$0, 2147450902(%rdx)
	.loc 1 126 26 discriminator 1 view .LVU100
	leaq	-1129(%rbx), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %edx
	andl	$7, %eax
	cmpb	%al, %dl
	setle	%cl
	testb	%dl, %dl
	setne	%al
	testb	%al, %cl
	jne	.L221
	movl	$0, %eax
	testb	%al, %al
	jne	.L221
	leaq	-1312(%rbx), %rdi
	leaq	-2192(%rbx), %rsi
	movl	$1024, %r8d
	movl	$1000000, %r9d
	movl	$31, %ecx
	movl	$1, %edx
.LEHB7:
	call	_ZN7edge_ai3ecs6Kernel14commit_throughEmNS0_12CapabilitiesENS0_10WorkBudgetE@PLT
.LVL78:
	jmp	.L245
.L221:
	movl	$184, %esi
	call	__asan_report_store_n@PLT
.LVL79:
.L245:
	.loc 1 126 30 is_stmt 1 discriminator 1 view .LVU101
	.loc 1 126 40 is_stmt 0 discriminator 1 view .LVU102
	leaq	-1288(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L246
	.loc 1 126 51 discriminator 6 view .LVU103
	movl	$0, %edi
	.loc 1 126 51 discriminator 1 view .LVU104
	cmpq	$1, -1288(%rbx)
	je	.L247
.L75:
	.loc 1 126 37 discriminator 8 view .LVU105
	movzbl	%dil, %edi
	leaq	.LC5(%rip), %rsi
	call	_ZN12_GLOBAL__N_17requireEbPKc
.LVL80:
	jmp	.L248
.L246:
	.loc 1 126 40 discriminator 1 view .LVU106
	call	__asan_report_load8@PLT
.LVL81:
.L247:
	.loc 1 126 64 discriminator 2 view .LVU107
	leaq	-2192(%rbx), %rdi
	movl	$0, %edx
	movabsq	$4294967296, %rsi
	call	_ZNK7edge_ai3ecs6Kernel9componentENS0_8EntityIdEt@PLT
.LVL82:
.LEHE7:
	.loc 1 126 51 discriminator 4 view .LVU108
	cmpq	$-1, %rax
	sete	%dil
	jmp	.L75
.L248:
	.loc 1 127 3 is_stmt 1 view .LVU109
	.loc 1 127 18 is_stmt 0 view .LVU110
	leaq	-1952(%rbx), %rax
	shrq	$3, %rax
	movl	$0, 2147450880(%rax)
	movw	$0, 2147450884(%rax)
.LVL83:
.LBB1320:
.LBI1320:
	.loc 1 42 7 is_stmt 1 view .LVU111
.LBB1321:
	.loc 1 44 3 view .LVU112
	.loc 1 44 69 is_stmt 0 view .LVU113
	movq	$2, -1952(%rbx)
	leaq	-1944(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L77
	cmpb	$3, %al
	jle	.L249
.L77:
	movl	$0, -1944(%rbx)
	leaq	-1940(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L78
	testb	%dl, %dl
	jne	.L250
.L78:
	movl	$0, -1940(%rbx)
	leaq	-1936(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L251
	movq	$2, -1936(%rbx)
	leaq	-1928(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L80
	cmpb	$3, %al
	jle	.L252
.L80:
	movl	$0, -1928(%rbx)
	leaq	-1924(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L81
	testb	%dl, %dl
	jne	.L253
.L81:
	movl	$1, -1924(%rbx)
	leaq	-1920(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L82
	cmpb	$1, %al
	jle	.L254
.L82:
	movw	$2, -1920(%rbx)
	leaq	-1918(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$1, %eax
	cmpb	%dl, %al
	jl	.L83
	testb	%dl, %dl
	jne	.L255
.L83:
	movw	$0, -1918(%rbx)
	leaq	-1916(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L84
	testb	%dl, %dl
	jne	.L256
.L84:
	movl	$0, -1916(%rbx)
	leaq	-1912(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L257
	movq	$1, -1912(%rbx)
.LVL84:
	.loc 1 44 69 view .LVU114
.LBE1321:
.LBE1320:
	.loc 1 127 12 discriminator 3 view .LVU115
	leaq	-1952(%rbx), %rsi
	leaq	-2192(%rbx), %rdi
.LEHB8:
	call	_ZN7edge_ai3ecs6Kernel7enqueueERKNS0_5EventE@PLT
.LVL85:
.LEHE8:
	jmp	.L258
.LVL86:
.L249:
.LBB1323:
.LBB1322:
	.loc 1 44 69 view .LVU116
	call	__asan_report_store4@PLT
.LVL87:
.L250:
	call	__asan_report_store4@PLT
.LVL88:
.L251:
	call	__asan_report_store8@PLT
.LVL89:
.L252:
	call	__asan_report_store4@PLT
.LVL90:
.L253:
	call	__asan_report_store4@PLT
.LVL91:
.L254:
	call	__asan_report_store2@PLT
.LVL92:
.L255:
	call	__asan_report_store2@PLT
.LVL93:
.L256:
	call	__asan_report_store4@PLT
.LVL94:
.L257:
	call	__asan_report_store8@PLT
.LVL95:
.L258:
	.loc 1 44 69 view .LVU117
.LBE1322:
.LBE1323:
	.loc 1 127 18 discriminator 2 view .LVU118
	leaq	-1952(%rbx), %rax
	shrq	$3, %rax
	movl	$-117901064, 2147450880(%rax)
	movw	$-1800, 2147450884(%rax)
	.loc 1 127 45 is_stmt 1 discriminator 1 view .LVU119
	.loc 1 127 83 is_stmt 0 discriminator 1 view .LVU120
	leaq	-1056(%rbx), %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	movl	$0, 2147450880(%rdx)
	movl	$0, 2147450884(%rdx)
	movl	$0, 2147450888(%rdx)
	movl	$0, 2147450892(%rdx)
	movl	$0, 2147450896(%rdx)
	movw	$0, 2147450900(%rdx)
	movb	$0, 2147450902(%rdx)
	.loc 1 127 69 discriminator 2 view .LVU121
	leaq	-873(%rbx), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %edx
	andl	$7, %eax
	cmpb	%al, %dl
	setle	%cl
	testb	%dl, %dl
	setne	%al
	testb	%al, %cl
	jne	.L222
	movl	$0, %eax
	testb	%al, %al
	jne	.L222
	leaq	-1056(%rbx), %rdi
	leaq	-2192(%rbx), %rsi
	movl	$1024, %r8d
	movl	$1000000, %r9d
	movl	$31, %ecx
	movl	$2, %edx
.LEHB9:
	call	_ZN7edge_ai3ecs6Kernel14commit_throughEmNS0_12CapabilitiesENS0_10WorkBudgetE@PLT
.LVL96:
	jmp	.L259
.L222:
	movl	$184, %esi
	call	__asan_report_store_n@PLT
.LVL97:
.L259:
	.loc 1 127 73 discriminator 4 view .LVU122
	leaq	-1040(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L260
	.loc 1 127 83 discriminator 10 view .LVU123
	movl	$0, %edi
	.loc 1 127 83 discriminator 4 view .LVU124
	cmpq	$1, -1040(%rbx)
	je	.L261
.L89:
	.loc 1 127 52 discriminator 12 view .LVU125
	movzbl	%dil, %edi
	leaq	.LC6(%rip), %rsi
	call	_ZN12_GLOBAL__N_17requireEbPKc
.LVL98:
	jmp	.L262
.L260:
	.loc 1 127 73 discriminator 4 view .LVU126
	call	__asan_report_load8@PLT
.LVL99:
.L261:
	.loc 1 127 96 discriminator 5 view .LVU127
	leaq	-2192(%rbx), %rdi
	movl	$0, %edx
	movabsq	$4294967296, %rsi
	call	_ZNK7edge_ai3ecs6Kernel9componentENS0_8EntityIdEt@PLT
.LVL100:
.LEHE9:
	.loc 1 127 83 discriminator 8 view .LVU128
	testq	%rax, %rax
	sete	%dil
	jmp	.L89
.L262:
	.loc 1 127 69 discriminator 15 view .LVU129
	leaq	-1056(%rbx), %rdx
	shrq	$3, %rdx
	movl	$-117901064, 2147450880(%rdx)
	movl	$-117901064, 2147450884(%rdx)
	movl	$-117901064, 2147450888(%rdx)
	movl	$-117901064, 2147450892(%rdx)
	movl	$-117901064, 2147450896(%rdx)
	movw	$-1800, 2147450900(%rdx)
	movb	$-8, 2147450902(%rdx)
	.loc 1 128 3 is_stmt 1 view .LVU130
	.loc 1 128 18 is_stmt 0 view .LVU131
	leaq	-1872(%rbx), %rax
	shrq	$3, %rax
	movl	$0, 2147450880(%rax)
	movw	$0, 2147450884(%rax)
.LVL101:
.LBB1324:
.LBI1324:
	.loc 1 42 7 is_stmt 1 view .LVU132
.LBB1325:
	.loc 1 44 3 view .LVU133
	.loc 1 44 69 is_stmt 0 view .LVU134
	movq	$3, -1872(%rbx)
	leaq	-1864(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L91
	cmpb	$3, %al
	jle	.L263
.L91:
	movl	$0, -1864(%rbx)
	leaq	-1860(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L92
	testb	%dl, %dl
	jne	.L264
.L92:
	movl	$0, -1860(%rbx)
	leaq	-1856(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L265
	movq	$3, -1856(%rbx)
	leaq	-1848(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L94
	cmpb	$3, %al
	jle	.L266
.L94:
	movl	$0, -1848(%rbx)
	leaq	-1844(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L95
	testb	%dl, %dl
	jne	.L267
.L95:
	movl	$1, -1844(%rbx)
	leaq	-1840(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L96
	cmpb	$1, %al
	jle	.L268
.L96:
	movw	$7, -1840(%rbx)
	leaq	-1838(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$1, %eax
	cmpb	%dl, %al
	jl	.L97
	testb	%dl, %dl
	jne	.L269
.L97:
	movw	$0, -1838(%rbx)
	leaq	-1836(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L98
	testb	%dl, %dl
	jne	.L270
.L98:
	movl	$0, -1836(%rbx)
	leaq	-1832(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L271
	movq	$0, -1832(%rbx)
.LVL102:
	.loc 1 44 69 view .LVU135
.LBE1325:
.LBE1324:
	.loc 1 128 12 discriminator 3 view .LVU136
	leaq	-1872(%rbx), %rsi
	leaq	-2192(%rbx), %rdi
.LEHB10:
	call	_ZN7edge_ai3ecs6Kernel7enqueueERKNS0_5EventE@PLT
.LVL103:
.LEHE10:
	jmp	.L272
.LVL104:
.L263:
.LBB1327:
.LBB1326:
	.loc 1 44 69 view .LVU137
	call	__asan_report_store4@PLT
.LVL105:
.L264:
	call	__asan_report_store4@PLT
.LVL106:
.L265:
	call	__asan_report_store8@PLT
.LVL107:
.L266:
	call	__asan_report_store4@PLT
.LVL108:
.L267:
	call	__asan_report_store4@PLT
.LVL109:
.L268:
	call	__asan_report_store2@PLT
.LVL110:
.L269:
	call	__asan_report_store2@PLT
.LVL111:
.L270:
	call	__asan_report_store4@PLT
.LVL112:
.L271:
	call	__asan_report_store8@PLT
.LVL113:
.L272:
	.loc 1 44 69 view .LVU138
.LBE1326:
.LBE1327:
	.loc 1 128 18 discriminator 2 view .LVU139
	leaq	-1872(%rbx), %rax
	shrq	$3, %rax
	movl	$-117901064, 2147450880(%rax)
	movw	$-1800, 2147450884(%rax)
	.loc 1 128 47 is_stmt 1 discriminator 1 view .LVU140
	.loc 1 128 62 is_stmt 0 discriminator 1 view .LVU141
	leaq	-1792(%rbx), %rax
	shrq	$3, %rax
	movl	$0, 2147450880(%rax)
	movw	$0, 2147450884(%rax)
.LVL114:
.LBB1328:
.LBI1328:
	.loc 1 42 7 is_stmt 1 view .LVU142
.LBB1329:
	.loc 1 44 3 view .LVU143
	.loc 1 44 69 is_stmt 0 view .LVU144
	movq	$4, -1792(%rbx)
	leaq	-1784(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L101
	cmpb	$3, %al
	jle	.L273
.L101:
	movl	$0, -1784(%rbx)
	leaq	-1780(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L102
	testb	%dl, %dl
	jne	.L274
.L102:
	movl	$0, -1780(%rbx)
	leaq	-1776(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L275
	movq	$4, -1776(%rbx)
	leaq	-1768(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L104
	cmpb	$3, %al
	jle	.L276
.L104:
	movl	$0, -1768(%rbx)
	leaq	-1764(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L105
	testb	%dl, %dl
	jne	.L277
.L105:
	movl	$2, -1764(%rbx)
	leaq	-1760(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L106
	cmpb	$1, %al
	jle	.L278
.L106:
	movw	$8, -1760(%rbx)
	leaq	-1758(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$1, %eax
	cmpb	%dl, %al
	jl	.L107
	testb	%dl, %dl
	jne	.L279
.L107:
	movw	$0, -1758(%rbx)
	leaq	-1756(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L108
	testb	%dl, %dl
	jne	.L280
.L108:
	movl	$0, -1756(%rbx)
	leaq	-1752(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L281
	movq	$0, -1752(%rbx)
.LVL115:
	.loc 1 44 69 view .LVU145
.LBE1329:
.LBE1328:
	.loc 1 128 56 discriminator 4 view .LVU146
	leaq	-1792(%rbx), %rsi
	leaq	-2192(%rbx), %rdi
.LEHB11:
	call	_ZN7edge_ai3ecs6Kernel7enqueueERKNS0_5EventE@PLT
.LVL116:
.LEHE11:
	jmp	.L282
.LVL117:
.L273:
.LBB1331:
.LBB1330:
	.loc 1 44 69 view .LVU147
	call	__asan_report_store4@PLT
.LVL118:
.L274:
	call	__asan_report_store4@PLT
.LVL119:
.L275:
	call	__asan_report_store8@PLT
.LVL120:
.L276:
	call	__asan_report_store4@PLT
.LVL121:
.L277:
	call	__asan_report_store4@PLT
.LVL122:
.L278:
	call	__asan_report_store2@PLT
.LVL123:
.L279:
	call	__asan_report_store2@PLT
.LVL124:
.L280:
	call	__asan_report_store4@PLT
.LVL125:
.L281:
	call	__asan_report_store8@PLT
.LVL126:
.L282:
	.loc 1 44 69 view .LVU148
.LBE1330:
.LBE1331:
	.loc 1 128 62 discriminator 4 view .LVU149
	leaq	-1792(%rbx), %rax
	shrq	$3, %rax
	movl	$-117901064, 2147450880(%rax)
	movw	$-1800, 2147450884(%rax)
	.loc 1 129 3 is_stmt 1 view .LVU150
	.loc 1 129 18 is_stmt 0 view .LVU151
	leaq	-1712(%rbx), %rax
	shrq	$3, %rax
	movl	$0, 2147450880(%rax)
	movw	$0, 2147450884(%rax)
.LVL127:
.LBB1332:
.LBI1332:
	.loc 1 42 7 is_stmt 1 view .LVU152
.LBB1333:
	.loc 1 44 3 view .LVU153
	.loc 1 44 69 is_stmt 0 view .LVU154
	movq	$5, -1712(%rbx)
	leaq	-1704(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L111
	cmpb	$3, %al
	jle	.L283
.L111:
	movl	$0, -1704(%rbx)
	leaq	-1700(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L112
	testb	%dl, %dl
	jne	.L284
.L112:
	movl	$0, -1700(%rbx)
	leaq	-1696(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L285
	movq	$5, -1696(%rbx)
	leaq	-1688(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L114
	cmpb	$3, %al
	jle	.L286
.L114:
	movl	$0, -1688(%rbx)
	leaq	-1684(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L115
	testb	%dl, %dl
	jne	.L287
.L115:
	movl	$1, -1684(%rbx)
	leaq	-1680(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L116
	cmpb	$1, %al
	jle	.L288
.L116:
	movw	$1, -1680(%rbx)
	leaq	-1678(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$1, %eax
	cmpb	%dl, %al
	jl	.L117
	testb	%dl, %dl
	jne	.L289
.L117:
	movw	$0, -1678(%rbx)
	leaq	-1676(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L118
	testb	%dl, %dl
	jne	.L290
.L118:
	movl	$0, -1676(%rbx)
	leaq	-1672(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L291
	movq	$99, -1672(%rbx)
.LVL128:
	.loc 1 44 69 view .LVU155
.LBE1333:
.LBE1332:
	.loc 1 129 12 discriminator 3 view .LVU156
	leaq	-1712(%rbx), %rsi
	leaq	-2192(%rbx), %rdi
.LEHB12:
	call	_ZN7edge_ai3ecs6Kernel7enqueueERKNS0_5EventE@PLT
.LVL129:
.LEHE12:
	jmp	.L292
.LVL130:
.L283:
.LBB1335:
.LBB1334:
	.loc 1 44 69 view .LVU157
	call	__asan_report_store4@PLT
.LVL131:
.L284:
	call	__asan_report_store4@PLT
.LVL132:
.L285:
	call	__asan_report_store8@PLT
.LVL133:
.L286:
	call	__asan_report_store4@PLT
.LVL134:
.L287:
	call	__asan_report_store4@PLT
.LVL135:
.L288:
	call	__asan_report_store2@PLT
.LVL136:
.L289:
	call	__asan_report_store2@PLT
.LVL137:
.L290:
	call	__asan_report_store4@PLT
.LVL138:
.L291:
	call	__asan_report_store8@PLT
.LVL139:
.L292:
	.loc 1 44 69 view .LVU158
.LBE1334:
.LBE1335:
	.loc 1 129 18 discriminator 2 view .LVU159
	leaq	-1712(%rbx), %rax
	shrq	$3, %rax
	movl	$-117901064, 2147450880(%rax)
	movw	$-1800, 2147450884(%rax)
	.loc 1 129 48 is_stmt 1 discriminator 1 view .LVU160
	.loc 1 129 66 is_stmt 0 discriminator 1 view .LVU161
	leaq	-800(%rbx), %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	movl	$0, 2147450880(%rdx)
	movl	$0, 2147450884(%rdx)
	movl	$0, 2147450888(%rdx)
	movl	$0, 2147450892(%rdx)
	movl	$0, 2147450896(%rdx)
	movw	$0, 2147450900(%rdx)
	movb	$0, 2147450902(%rdx)
	.loc 1 129 66 discriminator 2 view .LVU162
	leaq	-617(%rbx), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %edx
	andl	$7, %eax
	cmpb	%al, %dl
	setle	%cl
	testb	%dl, %dl
	setne	%al
	testb	%al, %cl
	jne	.L223
	movl	$0, %eax
	testb	%al, %al
	jne	.L223
	leaq	-800(%rbx), %rdi
	leaq	-2192(%rbx), %rsi
	movl	$1024, %r8d
	movl	$1000000, %r9d
	movl	$31, %ecx
	movl	$5, %edx
.LEHB13:
	call	_ZN7edge_ai3ecs6Kernel14commit_throughEmNS0_12CapabilitiesENS0_10WorkBudgetE@PLT
.LVL140:
.LEHE13:
	jmp	.L293
.L223:
	movl	$184, %esi
	call	__asan_report_store_n@PLT
.LVL141:
.L293:
	.loc 1 129 49 discriminator 1 view .LVU163
	leaq	-1312(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %ecx
	leaq	-1129(%rbx), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %edx
	andl	$7, %eax
	cmpb	%al, %dl
	setle	%sil
	testb	%dl, %dl
	setne	%al
	testb	%al, %sil
	jne	.L224
	testb	%cl, %cl
	setne	%dl
	setle	%al
	testb	%al, %dl
	jne	.L224
	movdqa	-800(%rbx), %xmm1
	movaps	%xmm1, -1312(%rbx)
	movdqa	-784(%rbx), %xmm2
	movaps	%xmm2, -1296(%rbx)
	movdqa	-768(%rbx), %xmm3
	movaps	%xmm3, -1280(%rbx)
	movdqa	-752(%rbx), %xmm4
	movaps	%xmm4, -1264(%rbx)
	movdqa	-736(%rbx), %xmm5
	movaps	%xmm5, -1248(%rbx)
	movdqa	-720(%rbx), %xmm6
	movaps	%xmm6, -1232(%rbx)
	movdqa	-704(%rbx), %xmm7
	movaps	%xmm7, -1216(%rbx)
	movdqa	-688(%rbx), %xmm1
	movaps	%xmm1, -1200(%rbx)
	movdqa	-672(%rbx), %xmm2
	movaps	%xmm2, -1184(%rbx)
	movdqa	-656(%rbx), %xmm3
	movaps	%xmm3, -1168(%rbx)
	movdqa	-640(%rbx), %xmm4
	movaps	%xmm4, -1152(%rbx)
	movq	-624(%rbx), %rax
	movq	%rax, -1136(%rbx)
	.loc 1 129 66 discriminator 1 view .LVU164
	leaq	-800(%rbx), %rdx
	shrq	$3, %rdx
	movl	$-117901064, 2147450880(%rdx)
	movl	$-117901064, 2147450884(%rdx)
	movl	$-117901064, 2147450888(%rdx)
	movl	$-117901064, 2147450892(%rdx)
	movl	$-117901064, 2147450896(%rdx)
	movw	$-1800, 2147450900(%rdx)
	movb	$-8, 2147450902(%rdx)
	.loc 1 130 3 is_stmt 1 view .LVU165
	.loc 1 130 13 is_stmt 0 view .LVU166
	leaq	-1296(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L294
	.loc 1 130 23 discriminator 4 view .LVU167
	movl	$0, %edi
	.loc 1 130 23 view .LVU168
	cmpq	$2, -1296(%rbx)
	je	.L295
.L125:
	.loc 1 130 10 discriminator 6 view .LVU169
	movzbl	%dil, %edi
	leaq	.LC7(%rip), %rsi
.LEHB14:
	call	_ZN12_GLOBAL__N_17requireEbPKc
.LVL142:
	jmp	.L296
.L224:
	.loc 1 129 49 discriminator 1 view .LVU170
	movl	$184, %esi
	call	__asan_report_store_n@PLT
.LVL143:
.L294:
	.loc 1 130 13 view .LVU171
	call	__asan_report_load8@PLT
.LVL144:
.L295:
	.loc 1 130 80 discriminator 1 view .LVU172
	leaq	-1216(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L297
	.loc 1 130 23 discriminator 1 view .LVU173
	cmpq	$1, -1216(%rbx)
	sete	%dil
	jmp	.L125
.L297:
	.loc 1 130 80 discriminator 1 view .LVU174
	call	__asan_report_load8@PLT
.LVL145:
.L296:
	.loc 1 131 3 is_stmt 1 view .LVU175
	.loc 1 131 19 is_stmt 0 view .LVU176
	leaq	-2192(%rbx), %rdi
	movabsq	$4294967296, %rsi
	call	_ZNK7edge_ai3ecs6Kernel5aliveENS0_8EntityIdE@PLT
.LVL146:
	.loc 1 131 42 discriminator 1 view .LVU177
	testb	%al, %al
	jne	.L199
	.loc 1 131 35 discriminator 2 view .LVU178
	leaq	-2192(%rbx), %rdi
	movabsq	$8589934592, %rsi
	call	_ZNK7edge_ai3ecs6Kernel5aliveENS0_8EntityIdE@PLT
.LVL147:
	.loc 1 131 26 discriminator 4 view .LVU179
	testb	%al, %al
	je	.L127
	.loc 1 131 60 discriminator 5 view .LVU180
	leaq	-2192(%rbx), %rdi
	movl	$0, %edx
	movabsq	$8589934592, %rsi
	call	_ZNK7edge_ai3ecs6Kernel13has_componentENS0_8EntityIdEt@PLT
.LVL148:
	.loc 1 131 42 discriminator 7 view .LVU181
	xorl	$1, %eax
	jmp	.L127
.L199:
	.loc 1 131 42 discriminator 9 view .LVU182
	movl	$0, %eax
.L127:
	.loc 1 131 10 discriminator 11 view .LVU183
	movzbl	%al, %edi
	leaq	.LC8(%rip), %rsi
	call	_ZN12_GLOBAL__N_17requireEbPKc
.LVL149:
	.loc 1 132 3 is_stmt 1 view .LVU184
	.loc 1 132 10 is_stmt 0 view .LVU185
	leaq	-2160(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movb	$0, 2147450880(%rax)
	.loc 1 132 36 discriminator 1 view .LVU186
	pxor	%xmm0, %xmm0
	movaps	%xmm0, -1376(%rbx)
	movaps	%xmm0, -1360(%rbx)
	movl	$1, -1392(%rbx)
	movl	$1, -1388(%rbx)
	movl	$4, -1384(%rbx)
	movl	$1, -1380(%rbx)
	subq	$48, %rsp
	movdqa	-1392(%rbx), %xmm5
	movups	%xmm5, (%rsp)
	movdqa	-1376(%rbx), %xmm6
	movups	%xmm6, 16(%rsp)
	movdqa	-1360(%rbx), %xmm7
	movups	%xmm7, 32(%rsp)
	.cfi_escape 0x2e,0x30
	call	_ZN7edge_ai3ecs6KernelC1ENS0_6ConfigE@PLT
.LVL150:
.LEHE14:
	addq	$48, %rsp
	.loc 1 132 38 is_stmt 1 discriminator 1 view .LVU187
	.loc 1 132 63 is_stmt 0 discriminator 1 view .LVU188
	leaq	-2160(%rbx), %rdi
	movabsq	$-4294967296, %rsi
.LEHB15:
	.cfi_escape 0x2e,0
	call	_ZN7edge_ai3ecs6Kernel17initialize_entityENS0_8EntityIdE@PLT
.LVL151:
.LEHE15:
	.loc 1 133 3 is_stmt 1 view .LVU189
	.loc 1 133 24 is_stmt 0 view .LVU190
	leaq	-1632(%rbx), %rax
	shrq	$3, %rax
	movl	$0, 2147450880(%rax)
	movw	$0, 2147450884(%rax)
.LVL152:
.LBB1336:
.LBI1336:
	.loc 1 42 7 is_stmt 1 view .LVU191
.LBB1337:
	.loc 1 44 3 view .LVU192
	.loc 1 44 69 is_stmt 0 view .LVU193
	movq	$1, -1632(%rbx)
	leaq	-1624(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L129
	cmpb	$3, %al
	jle	.L298
.L129:
	movl	$0, -1624(%rbx)
	leaq	-1620(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L130
	testb	%dl, %dl
	jne	.L299
.L130:
	movl	$0, -1620(%rbx)
	leaq	-1616(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L300
	movq	$1, -1616(%rbx)
	leaq	-1608(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L132
	cmpb	$3, %al
	jle	.L301
.L132:
	movl	$0, -1608(%rbx)
	leaq	-1604(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L133
	testb	%dl, %dl
	jne	.L302
.L133:
	movl	$-1, -1604(%rbx)
	leaq	-1600(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L134
	cmpb	$1, %al
	jle	.L303
.L134:
	movw	$7, -1600(%rbx)
	leaq	-1598(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$1, %eax
	cmpb	%dl, %al
	jl	.L135
	testb	%dl, %dl
	jne	.L304
.L135:
	movw	$0, -1598(%rbx)
	leaq	-1596(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L136
	testb	%dl, %dl
	jne	.L305
.L136:
	movl	$0, -1596(%rbx)
	leaq	-1592(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L306
	movq	$0, -1592(%rbx)
.LVL153:
	.loc 1 44 69 view .LVU194
.LBE1337:
.LBE1336:
	.loc 1 133 18 discriminator 3 view .LVU195
	leaq	-1632(%rbx), %rsi
	leaq	-2160(%rbx), %rdi
.LEHB16:
	call	_ZN7edge_ai3ecs6Kernel7enqueueERKNS0_5EventE@PLT
.LVL154:
.LEHE16:
	jmp	.L307
.LVL155:
.L298:
.LBB1339:
.LBB1338:
	.loc 1 44 69 view .LVU196
	call	__asan_report_store4@PLT
.LVL156:
.L299:
	call	__asan_report_store4@PLT
.LVL157:
.L300:
	call	__asan_report_store8@PLT
.LVL158:
.L301:
	call	__asan_report_store4@PLT
.LVL159:
.L302:
	call	__asan_report_store4@PLT
.LVL160:
.L303:
	call	__asan_report_store2@PLT
.LVL161:
.L304:
	call	__asan_report_store2@PLT
.LVL162:
.L305:
	call	__asan_report_store4@PLT
.LVL163:
.L306:
	call	__asan_report_store8@PLT
.LVL164:
.L307:
	.loc 1 44 69 view .LVU197
.LBE1338:
.LBE1339:
	.loc 1 133 24 discriminator 2 view .LVU198
	leaq	-1632(%rbx), %rax
	shrq	$3, %rax
	movl	$-117901064, 2147450880(%rax)
	movw	$-1800, 2147450884(%rax)
	.loc 1 134 3 is_stmt 1 view .LVU199
	.loc 1 134 24 is_stmt 0 view .LVU200
	leaq	-1552(%rbx), %rax
	shrq	$3, %rax
	movl	$0, 2147450880(%rax)
	movw	$0, 2147450884(%rax)
.LVL165:
.LBB1340:
.LBI1340:
	.loc 1 42 7 is_stmt 1 view .LVU201
.LBB1341:
	.loc 1 44 3 view .LVU202
	.loc 1 44 69 is_stmt 0 view .LVU203
	movq	$2, -1552(%rbx)
	leaq	-1544(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L139
	cmpb	$3, %al
	jle	.L308
.L139:
	movl	$0, -1544(%rbx)
	leaq	-1540(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L140
	testb	%dl, %dl
	jne	.L309
.L140:
	movl	$0, -1540(%rbx)
	leaq	-1536(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L310
	movq	$2, -1536(%rbx)
	leaq	-1528(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L142
	cmpb	$3, %al
	jle	.L311
.L142:
	movl	$0, -1528(%rbx)
	leaq	-1524(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L143
	testb	%dl, %dl
	jne	.L312
.L143:
	movl	$-1, -1524(%rbx)
	leaq	-1520(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L144
	cmpb	$1, %al
	jle	.L313
.L144:
	movw	$8, -1520(%rbx)
	leaq	-1518(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$1, %eax
	cmpb	%dl, %al
	jl	.L145
	testb	%dl, %dl
	jne	.L314
.L145:
	movw	$0, -1518(%rbx)
	leaq	-1516(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L146
	testb	%dl, %dl
	jne	.L315
.L146:
	movl	$0, -1516(%rbx)
	leaq	-1512(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L316
	movq	$0, -1512(%rbx)
.LVL166:
	.loc 1 44 69 view .LVU204
.LBE1341:
.LBE1340:
	.loc 1 134 18 discriminator 3 view .LVU205
	leaq	-1552(%rbx), %rsi
	leaq	-2160(%rbx), %rdi
.LEHB17:
	call	_ZN7edge_ai3ecs6Kernel7enqueueERKNS0_5EventE@PLT
.LVL167:
.LEHE17:
	jmp	.L317
.LVL168:
.L308:
.LBB1343:
.LBB1342:
	.loc 1 44 69 view .LVU206
	call	__asan_report_store4@PLT
.LVL169:
.L309:
	call	__asan_report_store4@PLT
.LVL170:
.L310:
	call	__asan_report_store8@PLT
.LVL171:
.L311:
	call	__asan_report_store4@PLT
.LVL172:
.L312:
	call	__asan_report_store4@PLT
.LVL173:
.L313:
	call	__asan_report_store2@PLT
.LVL174:
.L314:
	call	__asan_report_store2@PLT
.LVL175:
.L315:
	call	__asan_report_store4@PLT
.LVL176:
.L316:
	call	__asan_report_store8@PLT
.LVL177:
.L317:
	.loc 1 44 69 view .LVU207
.LBE1342:
.LBE1343:
	.loc 1 134 24 discriminator 2 view .LVU208
	leaq	-1552(%rbx), %rax
	shrq	$3, %rax
	movl	$-117901064, 2147450880(%rax)
	movw	$-1800, 2147450884(%rax)
	.loc 1 134 69 is_stmt 1 discriminator 1 view .LVU209
	.loc 1 134 93 is_stmt 0 discriminator 1 view .LVU210
	leaq	-544(%rbx), %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	movl	$0, 2147450880(%rdx)
	movl	$0, 2147450884(%rdx)
	movl	$0, 2147450888(%rdx)
	movl	$0, 2147450892(%rdx)
	movl	$0, 2147450896(%rdx)
	movw	$0, 2147450900(%rdx)
	movb	$0, 2147450902(%rdx)
	.loc 1 134 93 discriminator 2 view .LVU211
	leaq	-361(%rbx), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %edx
	andl	$7, %eax
	cmpb	%al, %dl
	setle	%cl
	testb	%dl, %dl
	setne	%al
	testb	%al, %cl
	jne	.L225
	movl	$0, %eax
	testb	%al, %al
	jne	.L225
	leaq	-544(%rbx), %rdi
	leaq	-2160(%rbx), %rsi
	movl	$1024, %r8d
	movl	$1000000, %r9d
	movl	$31, %ecx
	movl	$2, %edx
.LEHB18:
	call	_ZN7edge_ai3ecs6Kernel14commit_throughEmNS0_12CapabilitiesENS0_10WorkBudgetE@PLT
.LVL178:
.LEHE18:
	jmp	.L318
.L225:
	movl	$184, %esi
	call	__asan_report_store_n@PLT
.LVL179:
.L318:
	.loc 1 134 70 discriminator 1 view .LVU212
	leaq	-1312(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %ecx
	leaq	-1129(%rbx), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %edx
	andl	$7, %eax
	cmpb	%al, %dl
	setle	%sil
	testb	%dl, %dl
	setne	%al
	testb	%al, %sil
	jne	.L226
	testb	%cl, %cl
	setne	%dl
	setle	%al
	testb	%al, %dl
	jne	.L226
	movdqa	-544(%rbx), %xmm0
	movaps	%xmm0, -1312(%rbx)
	movdqa	-528(%rbx), %xmm1
	movaps	%xmm1, -1296(%rbx)
	movdqa	-512(%rbx), %xmm2
	movaps	%xmm2, -1280(%rbx)
	movdqa	-496(%rbx), %xmm3
	movaps	%xmm3, -1264(%rbx)
	movdqa	-480(%rbx), %xmm4
	movaps	%xmm4, -1248(%rbx)
	movdqa	-464(%rbx), %xmm5
	movaps	%xmm5, -1232(%rbx)
	movdqa	-448(%rbx), %xmm6
	movaps	%xmm6, -1216(%rbx)
	movdqa	-432(%rbx), %xmm7
	movaps	%xmm7, -1200(%rbx)
	movdqa	-416(%rbx), %xmm0
	movaps	%xmm0, -1184(%rbx)
	movdqa	-400(%rbx), %xmm1
	movaps	%xmm1, -1168(%rbx)
	movdqa	-384(%rbx), %xmm2
	movaps	%xmm2, -1152(%rbx)
	movq	-368(%rbx), %rax
	movq	%rax, -1136(%rbx)
	.loc 1 134 93 discriminator 1 view .LVU213
	leaq	-544(%rbx), %rdx
	shrq	$3, %rdx
	movl	$-117901064, 2147450880(%rdx)
	movl	$-117901064, 2147450884(%rdx)
	movl	$-117901064, 2147450888(%rdx)
	movl	$-117901064, 2147450892(%rdx)
	movl	$-117901064, 2147450896(%rdx)
	movw	$-1800, 2147450900(%rdx)
	movb	$-8, 2147450902(%rdx)
	.loc 1 135 3 is_stmt 1 view .LVU214
	.loc 1 135 13 is_stmt 0 view .LVU215
	leaq	-1296(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L319
	.loc 1 135 38 view .LVU216
	cmpq	$1, -1296(%rbx)
	jne	.L200
	.loc 1 135 27 discriminator 1 view .LVU217
	leaq	-1288(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L320
	.loc 1 135 38 discriminator 7 view .LVU218
	movl	$0, %edi
	.loc 1 135 23 discriminator 1 view .LVU219
	cmpq	$1, -1288(%rbx)
	jne	.L153
	.loc 1 135 54 discriminator 3 view .LVU220
	leaq	-2160(%rbx), %rdi
	movabsq	$-4294967296, %rsi
.LEHB19:
	call	_ZNK7edge_ai3ecs6Kernel5aliveENS0_8EntityIdE@PLT
.LVL180:
	jmp	.L321
.L226:
	.loc 1 134 70 discriminator 1 view .LVU221
	movl	$184, %esi
	call	__asan_report_store_n@PLT
.LVL181:
.L319:
	.loc 1 135 13 view .LVU222
	call	__asan_report_load8@PLT
.LVL182:
.L320:
	.loc 1 135 27 discriminator 1 view .LVU223
	call	__asan_report_load8@PLT
.LVL183:
.L321:
	.loc 1 135 38 discriminator 5 view .LVU224
	xorl	$1, %eax
	movl	%eax, %edi
	jmp	.L153
.L200:
	.loc 1 135 38 discriminator 7 view .LVU225
	movl	$0, %edi
.L153:
	.loc 1 135 10 discriminator 9 view .LVU226
	movzbl	%dil, %edi
	leaq	.LC9(%rip), %rsi
	call	_ZN12_GLOBAL__N_17requireEbPKc
.LVL184:
	.loc 1 136 3 is_stmt 1 view .LVU227
	.loc 1 136 8 is_stmt 0 view .LVU228
	leaq	-2128(%rbx), %rax
	shrq	$3, %rax
	movb	$0, 2147450880(%rax)
	.loc 1 136 19 discriminator 1 view .LVU229
	leaq	-2128(%rbx), %rdi
	movl	$7, %esi
	call	_ZN12_GLOBAL__N_14tinyEm
.LVL185:
.LEHE19:
	.loc 1 136 21 is_stmt 1 discriminator 1 view .LVU230
	.loc 1 136 34 is_stmt 0 discriminator 1 view .LVU231
	movq	$2, -2320(%rbp)
	movq	$3, -2312(%rbp)
	movq	$-1, -2304(%rbp)
	movq	$0, -2296(%rbp)
	leaq	-2128(%rbx), %rdi
	subq	$32, %rsp
	movdqa	-2320(%rbp), %xmm3
	movups	%xmm3, (%rsp)
	movdqa	-2304(%rbp), %xmm4
	movups	%xmm4, 16(%rsp)
	movabsq	$4294967296, %rsi
.LEHB20:
	.cfi_escape 0x2e,0x20
	call	_ZN7edge_ai3ecs6Kernel8set_ruleENS0_8EntityIdENS0_4RuleE@PLT
.LVL186:
.LEHE20:
	addq	$32, %rsp
	.loc 1 137 3 is_stmt 1 view .LVU232
	.loc 1 137 21 is_stmt 0 view .LVU233
	leaq	-1472(%rbx), %rax
	shrq	$3, %rax
	movl	$0, 2147450880(%rax)
	movw	$0, 2147450884(%rax)
.LVL187:
.LBB1344:
.LBI1344:
	.loc 1 42 7 is_stmt 1 view .LVU234
.LBB1345:
	.loc 1 44 3 view .LVU235
	.loc 1 44 69 is_stmt 0 view .LVU236
	movq	$1, -1472(%rbx)
	leaq	-1464(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L157
	cmpb	$3, %al
	jle	.L322
.L157:
	movl	$0, -1464(%rbx)
	leaq	-1460(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L158
	testb	%dl, %dl
	jne	.L323
.L158:
	movl	$0, -1460(%rbx)
	leaq	-1456(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L324
	movq	$1, -1456(%rbx)
	leaq	-1448(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L160
	cmpb	$3, %al
	jle	.L325
.L160:
	movl	$0, -1448(%rbx)
	leaq	-1444(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L161
	testb	%dl, %dl
	jne	.L326
.L161:
	movl	$1, -1444(%rbx)
	leaq	-1440(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L162
	cmpb	$1, %al
	jle	.L327
.L162:
	movw	$6, -1440(%rbx)
	leaq	-1438(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$1, %eax
	cmpb	%dl, %al
	jl	.L163
	testb	%dl, %dl
	jne	.L328
.L163:
	movw	$0, -1438(%rbx)
	leaq	-1436(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L164
	testb	%dl, %dl
	jne	.L329
.L164:
	movl	$0, -1436(%rbx)
	leaq	-1432(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L330
	movq	$9, -1432(%rbx)
.LVL188:
	.loc 1 44 69 view .LVU237
.LBE1345:
.LBE1344:
	.loc 1 137 15 discriminator 3 view .LVU238
	leaq	-1472(%rbx), %rsi
	leaq	-2128(%rbx), %rdi
.LEHB21:
	.cfi_escape 0x2e,0
	call	_ZN7edge_ai3ecs6Kernel7enqueueERKNS0_5EventE@PLT
.LVL189:
.LEHE21:
	jmp	.L331
.LVL190:
.L322:
.LBB1347:
.LBB1346:
	.loc 1 44 69 view .LVU239
	call	__asan_report_store4@PLT
.LVL191:
.L323:
	call	__asan_report_store4@PLT
.LVL192:
.L324:
	call	__asan_report_store8@PLT
.LVL193:
.L325:
	call	__asan_report_store4@PLT
.LVL194:
.L326:
	call	__asan_report_store4@PLT
.LVL195:
.L327:
	call	__asan_report_store2@PLT
.LVL196:
.L328:
	call	__asan_report_store2@PLT
.LVL197:
.L329:
	call	__asan_report_store4@PLT
.LVL198:
.L330:
	call	__asan_report_store8@PLT
.LVL199:
.L331:
	.loc 1 44 69 view .LVU240
.LBE1346:
.LBE1347:
	.loc 1 137 21 discriminator 2 view .LVU241
	leaq	-1472(%rbx), %rax
	shrq	$3, %rax
	movl	$-117901064, 2147450880(%rax)
	movw	$-1800, 2147450884(%rax)
	.loc 1 137 55 is_stmt 1 discriminator 1 view .LVU242
	.loc 1 137 76 is_stmt 0 discriminator 1 view .LVU243
	leaq	-288(%rbx), %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	movl	$0, 2147450880(%rdx)
	movl	$0, 2147450884(%rdx)
	movl	$0, 2147450888(%rdx)
	movl	$0, 2147450892(%rdx)
	movl	$0, 2147450896(%rdx)
	movw	$0, 2147450900(%rdx)
	movb	$0, 2147450902(%rdx)
	.loc 1 137 76 discriminator 2 view .LVU244
	leaq	-105(%rbx), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %edx
	andl	$7, %eax
	cmpb	%al, %dl
	setle	%cl
	testb	%dl, %dl
	setne	%al
	testb	%al, %cl
	jne	.L227
	movl	$0, %eax
	testb	%al, %al
	jne	.L227
	leaq	-288(%rbx), %rdi
	leaq	-2128(%rbx), %rsi
	movl	$1024, %r8d
	movl	$1000000, %r9d
	movl	$31, %ecx
	movl	$1, %edx
.LEHB22:
	call	_ZN7edge_ai3ecs6Kernel14commit_throughEmNS0_12CapabilitiesENS0_10WorkBudgetE@PLT
.LVL200:
.LEHE22:
	jmp	.L332
.L227:
	movl	$184, %esi
	call	__asan_report_store_n@PLT
.LVL201:
.L332:
	.loc 1 137 56 discriminator 1 view .LVU245
	leaq	-1312(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %ecx
	leaq	-1129(%rbx), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %edx
	andl	$7, %eax
	cmpb	%al, %dl
	setle	%sil
	testb	%dl, %dl
	setne	%al
	testb	%al, %sil
	jne	.L228
	testb	%cl, %cl
	setne	%dl
	setle	%al
	testb	%al, %dl
	jne	.L228
	movdqa	-288(%rbx), %xmm5
	movaps	%xmm5, -1312(%rbx)
	movdqa	-272(%rbx), %xmm6
	movaps	%xmm6, -1296(%rbx)
	movdqa	-256(%rbx), %xmm7
	movaps	%xmm7, -1280(%rbx)
	movdqa	-240(%rbx), %xmm0
	movaps	%xmm0, -1264(%rbx)
	movdqa	-224(%rbx), %xmm1
	movaps	%xmm1, -1248(%rbx)
	movdqa	-208(%rbx), %xmm2
	movaps	%xmm2, -1232(%rbx)
	movdqa	-192(%rbx), %xmm3
	movaps	%xmm3, -1216(%rbx)
	movdqa	-176(%rbx), %xmm4
	movaps	%xmm4, -1200(%rbx)
	movdqa	-160(%rbx), %xmm5
	movaps	%xmm5, -1184(%rbx)
	movdqa	-144(%rbx), %xmm6
	movaps	%xmm6, -1168(%rbx)
	movdqa	-128(%rbx), %xmm7
	movaps	%xmm7, -1152(%rbx)
	movq	-112(%rbx), %rax
	movq	%rax, -1136(%rbx)
	.loc 1 137 76 discriminator 1 view .LVU246
	leaq	-288(%rbx), %rdx
	shrq	$3, %rdx
	movl	$-117901064, 2147450880(%rdx)
	movl	$-117901064, 2147450884(%rdx)
	movl	$-117901064, 2147450888(%rdx)
	movl	$-117901064, 2147450892(%rdx)
	movl	$-117901064, 2147450896(%rdx)
	movw	$-1800, 2147450900(%rdx)
	movb	$-8, 2147450902(%rdx)
	.loc 1 138 3 is_stmt 1 view .LVU247
	.loc 1 138 13 is_stmt 0 view .LVU248
	leaq	-1288(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L333
	.loc 1 138 52 view .LVU249
	movl	$0, %r15d
	.loc 1 138 52 discriminator 10 view .LVU250
	movl	$0, %edi
	.loc 1 138 52 view .LVU251
	cmpq	$1, -1288(%rbx)
	je	.L334
.L171:
	.loc 1 138 10 discriminator 12 view .LVU252
	movzbl	%dil, %edi
	leaq	.LC10(%rip), %rsi
.LEHB23:
	call	_ZN12_GLOBAL__N_17requireEbPKc
.LVL202:
.LEHE23:
	jmp	.L335
.L228:
	.loc 1 137 56 discriminator 1 view .LVU253
	movl	$184, %esi
	call	__asan_report_store_n@PLT
.LVL203:
.L333:
	.loc 1 138 13 view .LVU254
	call	__asan_report_load8@PLT
.LVL204:
.L334:
	.loc 1 138 40 discriminator 1 view .LVU255
	leaq	-2128(%rbx), %rdi
	movl	$0, %edx
	movabsq	$4294967296, %rsi
.LEHB24:
	call	_ZNK7edge_ai3ecs6Kernel9componentENS0_8EntityIdEt@PLT
.LVL205:
.LEHE24:
	.loc 1 138 24 discriminator 4 view .LVU256
	cmpq	$7, %rax
	je	.L336
	.loc 1 138 52 view .LVU257
	movl	$0, %r15d
	.loc 1 138 52 discriminator 10 view .LVU258
	movl	$0, %edi
	jmp	.L171
.L336:
	.loc 1 138 52 discriminator 5 view .LVU259
	leaq	-2096(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movl	$0, 2147450880(%rax)
	.loc 1 138 63 discriminator 1 view .LVU260
	leaq	-2065(%rbx), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %edx
	andl	$7, %eax
	cmpb	%al, %dl
	setle	%cl
	testb	%dl, %dl
	setne	%al
	testb	%al, %cl
	jne	.L229
	movl	$0, %eax
	testb	%al, %al
	jne	.L229
	leaq	-2096(%rbx), %rdi
	leaq	-2128(%rbx), %rsi
	movabsq	$4294967296, %rdx
.LEHB25:
	call	_ZNK7edge_ai3ecs6Kernel4ruleENS0_8EntityIdE@PLT
.LVL206:
.LEHE25:
	jmp	.L337
.L229:
	movl	$32, %esi
	call	__asan_report_store_n@PLT
.LVL207:
.L337:
	.loc 1 138 71 discriminator 8 view .LVU261
	leaq	-2096(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L338
	.loc 1 138 52 discriminator 8 view .LVU262
	cmpq	$2, -2096(%rbx)
	sete	%dil
	.loc 1 138 52 discriminator 1 view .LVU263
	movl	$1, %r15d
	jmp	.L171
.L338:
	.loc 1 138 71 discriminator 8 view .LVU264
	call	__asan_report_load8@PLT
.LVL208:
.L335:
	.loc 1 138 63 discriminator 14 view .LVU265
	testb	%r15b, %r15b
	je	.L175
	.loc 1 138 63 discriminator 15 view .LVU266
	leaq	-2096(%rbx), %rax
	shrq	$3, %rax
	movl	$-117901064, 2147450880(%rax)
.L175:
	.loc 1 139 1 view .LVU267
	leaq	-2128(%rbx), %rdi
	call	_ZN7edge_ai3ecs6KernelD1Ev@PLT
.LVL209:
	.loc 1 139 1 discriminator 1 view .LVU268
	leaq	-2160(%rbx), %rdi
	call	_ZN7edge_ai3ecs6KernelD1Ev@PLT
.LVL210:
	.loc 1 139 1 discriminator 2 view .LVU269
	leaq	-2192(%rbx), %rdi
	call	_ZN7edge_ai3ecs6KernelD1Ev@PLT
.LVL211:
	.loc 1 123 35 view .LVU270
	cmpq	%r13, %r14
	jne	.L339
	leaq	2147450880(%r12), %rcx
	movl	$0, %eax
	movq	$0, 2147450880(%r12)
	movq	$0, 2147450980(%r12)
	leaq	2147450888(%r12), %rdi
	andq	$-8, %rdi
	subq	%rdi, %rcx
	addl	$108, %ecx
	shrl	$3, %ecx
	movl	%ecx, %ecx
	rep stosq
	movl	$0, 2147450992(%r12)
	leaq	2147451016(%r12), %rcx
	movq	$0, 2147451016(%r12)
	movq	$0, 2147451148(%r12)
	leaq	2147451024(%r12), %rdi
	andq	$-8, %rdi
	subq	%rdi, %rcx
	addl	$140, %ecx
	shrl	$3, %ecx
	movl	%ecx, %ecx
	rep stosq
.L59:
	.loc 1 139 1 view .LVU271
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L340
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
.LVL212:
.L204:
	.cfi_restore_state
	.loc 1 139 1 view .LVU272
	endbr64
	.loc 1 125 18 discriminator 1 view .LVU273
	leaq	-2032(%rbx), %rdx
	shrq	$3, %rdx
	movl	$-117901064, 2147450880(%rdx)
	movw	$-1800, 2147450884(%rdx)
	movq	%rax, %r12
.L177:
	.loc 1 139 1 view .LVU274
	leaq	-2192(%rbx), %rdi
	call	_ZN7edge_ai3ecs6KernelD1Ev@PLT
.LVL213:
	call	__asan_handle_no_return@PLT
.LVL214:
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	je	.L194
	call	__stack_chk_fail@PLT
.LVL215:
.L206:
	.loc 1 139 1 view .LVU275
	endbr64
	.loc 1 127 18 discriminator 1 view .LVU276
	leaq	-1952(%rbx), %rdx
	shrq	$3, %rdx
	movl	$-117901064, 2147450880(%rdx)
	movw	$-1800, 2147450884(%rdx)
	movq	%rax, %r12
	jmp	.L177
.L207:
	endbr64
	.loc 1 127 69 discriminator 16 view .LVU277
	leaq	-1056(%rbx), %rcx
	shrq	$3, %rcx
	movl	$-117901064, 2147450880(%rcx)
	movl	$-117901064, 2147450884(%rcx)
	movl	$-117901064, 2147450888(%rcx)
	movl	$-117901064, 2147450892(%rcx)
	movl	$-117901064, 2147450896(%rcx)
	movw	$-1800, 2147450900(%rcx)
	movb	$-8, 2147450902(%rcx)
	movq	%rax, %r12
	jmp	.L177
.LVL216:
.L208:
	.loc 1 127 69 discriminator 16 view .LVU278
	endbr64
	.loc 1 128 18 discriminator 1 view .LVU279
	leaq	-1872(%rbx), %rdx
	shrq	$3, %rdx
	movl	$-117901064, 2147450880(%rdx)
	movw	$-1800, 2147450884(%rdx)
	movq	%rax, %r12
	jmp	.L177
.LVL217:
.L209:
	.loc 1 128 18 discriminator 1 view .LVU280
	endbr64
	.loc 1 128 62 discriminator 3 view .LVU281
	leaq	-1792(%rbx), %rdx
	shrq	$3, %rdx
	movl	$-117901064, 2147450880(%rdx)
	movw	$-1800, 2147450884(%rdx)
	movq	%rax, %r12
	jmp	.L177
.LVL218:
.L210:
	.loc 1 128 62 discriminator 3 view .LVU282
	endbr64
	.loc 1 129 18 discriminator 1 view .LVU283
	leaq	-1712(%rbx), %rdx
	shrq	$3, %rdx
	movl	$-117901064, 2147450880(%rdx)
	movw	$-1800, 2147450884(%rdx)
	movq	%rax, %r12
	jmp	.L177
.L211:
	endbr64
	.loc 1 129 66 discriminator 3 view .LVU284
	leaq	-800(%rbx), %rcx
	shrq	$3, %rcx
	movl	$-117901064, 2147450880(%rcx)
	movl	$-117901064, 2147450884(%rcx)
	movl	$-117901064, 2147450888(%rcx)
	movl	$-117901064, 2147450892(%rcx)
	movl	$-117901064, 2147450896(%rcx)
	movw	$-1800, 2147450900(%rcx)
	movb	$-8, 2147450902(%rcx)
	movq	%rax, %r12
	jmp	.L177
.LVL219:
.L213:
	.loc 1 129 66 discriminator 3 view .LVU285
	endbr64
	.loc 1 133 24 discriminator 1 view .LVU286
	movq	%rax, %r12
	leaq	-1632(%rbx), %rax
	shrq	$3, %rax
	movl	$-117901064, 2147450880(%rax)
	movw	$-1800, 2147450884(%rax)
.LVL220:
.L185:
	.loc 1 139 1 view .LVU287
	leaq	-2160(%rbx), %rdi
	call	_ZN7edge_ai3ecs6KernelD1Ev@PLT
.LVL221:
	jmp	.L177
.LVL222:
.L214:
	.loc 1 139 1 view .LVU288
	endbr64
	.loc 1 134 24 discriminator 1 view .LVU289
	movq	%rax, %r12
	leaq	-1552(%rbx), %rax
	shrq	$3, %rax
	movl	$-117901064, 2147450880(%rax)
	movw	$-1800, 2147450884(%rax)
	jmp	.L185
.L215:
	endbr64
	.loc 1 134 93 discriminator 3 view .LVU290
	movq	%rax, %r12
	leaq	-544(%rbx), %rdx
	shrq	$3, %rdx
	movl	$-117901064, 2147450880(%rdx)
	movl	$-117901064, 2147450884(%rdx)
	movl	$-117901064, 2147450888(%rdx)
	movl	$-117901064, 2147450892(%rdx)
	movl	$-117901064, 2147450896(%rdx)
	movw	$-1800, 2147450900(%rdx)
	movb	$-8, 2147450902(%rdx)
	jmp	.L185
.LVL223:
.L217:
	.loc 1 134 93 discriminator 3 view .LVU291
	endbr64
	.loc 1 137 21 discriminator 1 view .LVU292
	movq	%rax, %r12
	leaq	-1472(%rbx), %rax
	shrq	$3, %rax
	movl	$-117901064, 2147450880(%rax)
	movw	$-1800, 2147450884(%rax)
.LVL224:
.L189:
	.loc 1 139 1 view .LVU293
	leaq	-2128(%rbx), %rdi
	call	_ZN7edge_ai3ecs6KernelD1Ev@PLT
.LVL225:
	jmp	.L185
.LVL226:
.L218:
	.loc 1 139 1 view .LVU294
	endbr64
	.loc 1 137 76 discriminator 3 view .LVU295
	movq	%rax, %r12
	leaq	-288(%rbx), %rdx
	shrq	$3, %rdx
	movl	$-117901064, 2147450880(%rdx)
	movl	$-117901064, 2147450884(%rdx)
	movl	$-117901064, 2147450888(%rdx)
	movl	$-117901064, 2147450892(%rdx)
	movl	$-117901064, 2147450896(%rdx)
	movw	$-1800, 2147450900(%rdx)
	movb	$-8, 2147450902(%rdx)
	jmp	.L189
.L219:
	endbr64
	.loc 1 138 63 discriminator 13 view .LVU296
	movq	%rax, %r12
	testb	%r15b, %r15b
	je	.L189
.L193:
	.loc 1 138 63 discriminator 16 view .LVU297
	leaq	-2096(%rbx), %rax
	shrq	$3, %rax
	movl	$-117901064, 2147450880(%rax)
	jmp	.L189
.L220:
	endbr64
	movq	%rax, %r12
	jmp	.L193
.LVL227:
.L216:
	.loc 1 138 63 discriminator 16 view .LVU298
	endbr64
	.loc 1 139 1 view .LVU299
	movq	%rax, %r12
	jmp	.L189
.LVL228:
.L212:
	.loc 1 139 1 view .LVU300
	endbr64
	movq	%rax, %r12
	jmp	.L185
.LVL229:
.L205:
	.loc 1 139 1 view .LVU301
	endbr64
	movq	%rax, %r12
	jmp	.L177
.L194:
	movq	%r12, %rdi
.LEHB26:
	call	_Unwind_Resume@PLT
.LVL230:
.LEHE26:
.L339:
	.loc 1 123 35 view .LVU302
	movq	$1172321806, 0(%r13)
	movq	%r14, %rdx
	movl	$2208, %esi
	movq	%r13, %rdi
	call	__asan_stack_free_6@PLT
.LVL231:
	jmp	.L59
.L340:
	.loc 1 139 1 view .LVU303
	call	__stack_chk_fail@PLT
.LVL232:
	.cfi_endproc
.LFE6369:
	.section	.gcc_except_table
.LLSDA6369:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE6369-.LLSDACSB6369
.LLSDACSB6369:
	.uleb128 .LEHB5-.LFB6369
	.uleb128 .LEHE5-.LEHB5
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB6-.LFB6369
	.uleb128 .LEHE6-.LEHB6
	.uleb128 .L204-.LFB6369
	.uleb128 0
	.uleb128 .LEHB7-.LFB6369
	.uleb128 .LEHE7-.LEHB7
	.uleb128 .L205-.LFB6369
	.uleb128 0
	.uleb128 .LEHB8-.LFB6369
	.uleb128 .LEHE8-.LEHB8
	.uleb128 .L206-.LFB6369
	.uleb128 0
	.uleb128 .LEHB9-.LFB6369
	.uleb128 .LEHE9-.LEHB9
	.uleb128 .L207-.LFB6369
	.uleb128 0
	.uleb128 .LEHB10-.LFB6369
	.uleb128 .LEHE10-.LEHB10
	.uleb128 .L208-.LFB6369
	.uleb128 0
	.uleb128 .LEHB11-.LFB6369
	.uleb128 .LEHE11-.LEHB11
	.uleb128 .L209-.LFB6369
	.uleb128 0
	.uleb128 .LEHB12-.LFB6369
	.uleb128 .LEHE12-.LEHB12
	.uleb128 .L210-.LFB6369
	.uleb128 0
	.uleb128 .LEHB13-.LFB6369
	.uleb128 .LEHE13-.LEHB13
	.uleb128 .L211-.LFB6369
	.uleb128 0
	.uleb128 .LEHB14-.LFB6369
	.uleb128 .LEHE14-.LEHB14
	.uleb128 .L205-.LFB6369
	.uleb128 0
	.uleb128 .LEHB15-.LFB6369
	.uleb128 .LEHE15-.LEHB15
	.uleb128 .L212-.LFB6369
	.uleb128 0
	.uleb128 .LEHB16-.LFB6369
	.uleb128 .LEHE16-.LEHB16
	.uleb128 .L213-.LFB6369
	.uleb128 0
	.uleb128 .LEHB17-.LFB6369
	.uleb128 .LEHE17-.LEHB17
	.uleb128 .L214-.LFB6369
	.uleb128 0
	.uleb128 .LEHB18-.LFB6369
	.uleb128 .LEHE18-.LEHB18
	.uleb128 .L215-.LFB6369
	.uleb128 0
	.uleb128 .LEHB19-.LFB6369
	.uleb128 .LEHE19-.LEHB19
	.uleb128 .L212-.LFB6369
	.uleb128 0
	.uleb128 .LEHB20-.LFB6369
	.uleb128 .LEHE20-.LEHB20
	.uleb128 .L216-.LFB6369
	.uleb128 0
	.uleb128 .LEHB21-.LFB6369
	.uleb128 .LEHE21-.LEHB21
	.uleb128 .L217-.LFB6369
	.uleb128 0
	.uleb128 .LEHB22-.LFB6369
	.uleb128 .LEHE22-.LEHB22
	.uleb128 .L218-.LFB6369
	.uleb128 0
	.uleb128 .LEHB23-.LFB6369
	.uleb128 .LEHE23-.LEHB23
	.uleb128 .L219-.LFB6369
	.uleb128 0
	.uleb128 .LEHB24-.LFB6369
	.uleb128 .LEHE24-.LEHB24
	.uleb128 .L216-.LFB6369
	.uleb128 0
	.uleb128 .LEHB25-.LFB6369
	.uleb128 .LEHE25-.LEHB25
	.uleb128 .L220-.LFB6369
	.uleb128 0
	.uleb128 .LEHB26-.LFB6369
	.uleb128 .LEHE26-.LEHB26
	.uleb128 0
	.uleb128 0
.LLSDACSE6369:
	.text
	.size	_ZN12_GLOBAL__N_127test_lifecycle_and_overflowEv, .-_ZN12_GLOBAL__N_127test_lifecycle_and_overflowEv
	.globl	_Znwm
	.type	_Znwm, @function
_Znwm:
.LASANPC6334:
.LVL233:
.LFB6334:
	.loc 1 19 37 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 19 37 is_stmt 0 view .LVU305
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%rdi, %rbx
	.loc 1 20 3 is_stmt 1 view .LVU306
	movzbl	_ZN12_GLOBAL__N_117count_allocationsE(%rip), %r12d
	cmpb	$1, %r12b
	ja	.L363
.LVL234:
.L342:
	.loc 1 20 3 is_stmt 0 view .LVU307
	testb	$1, %r12b
	je	.L343
	.loc 1 20 24 is_stmt 1 discriminator 1 view .LVU308
	addq	$1, _ZN12_GLOBAL__N_116allocation_countE(%rip)
.L343:
	.loc 1 21 3 view .LVU309
.LBB1355:
	.loc 1 21 25 is_stmt 0 discriminator 4 view .LVU310
	testq	%rbx, %rbx
	movl	$1, %eax
	cmovne	%rbx, %rax
	movq	%rax, %rdi
	call	malloc@PLT
.LVL235:
	.loc 1 21 3 discriminator 1 view .LVU311
	testq	%rax, %rax
	je	.L364
.LBE1355:
	.loc 1 23 1 view .LVU312
	popq	%rbx
.LVL236:
	.loc 1 23 1 view .LVU313
	popq	%r12
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.LVL237:
.L363:
	.cfi_restore_state
	.loc 1 20 3 view .LVU314
	movzbl	%r12b, %esi
	leaq	.Lubsan_data849(%rip), %rdi
	call	__ubsan_handle_load_invalid_value@PLT
.LVL238:
	jmp	.L342
.LVL239:
.L364:
	.loc 1 22 3 is_stmt 1 view .LVU315
	.loc 1 22 24 is_stmt 0 view .LVU316
	movl	$8, %edi
	call	__cxa_allocate_exception@PLT
.LVL240:
	.loc 1 22 24 view .LVU317
	movq	%rax, %rbx
.LVL241:
.LBB1356:
.LBI1356:
	.file 5 "/usr/include/c++/13/new"
	.loc 5 58 5 is_stmt 1 view .LVU318
.LBB1357:
	.loc 5 58 25 is_stmt 0 view .LVU319
	testq	%rax, %rax
	je	.L345
	testb	$7, %al
	je	.L346
.L345:
	movq	%rbx, %rsi
	leaq	.Lubsan_data886(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL242:
.L346:
	.loc 5 58 25 view .LVU320
	movq	%rbx, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	je	.L347
	movq	%rbx, %rdi
	call	__asan_report_store8@PLT
.LVL243:
.L347:
	movq	$0, (%rbx)
.LBB1358:
	testq	%rbx, %rbx
	je	.L348
	testb	$7, %bl
	je	.L349
.L348:
	movq	%rbx, %rsi
	leaq	.Lubsan_data887(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL244:
.L349:
	.loc 5 58 25 view .LVU321
	testq	%rbx, %rbx
	je	.L350
	testb	$7, %bl
	je	.L351
.L350:
	movq	%rbx, %rsi
	leaq	.Lubsan_data888(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL245:
.L351:
.LBB1359:
.LBI1359:
	.file 6 "/usr/include/c++/13/bits/exception.h"
	.loc 6 62 5 is_stmt 1 view .LVU322
.LBB1360:
	.loc 6 62 34 is_stmt 0 view .LVU323
	testq	%rbx, %rbx
	je	.L352
	testb	$7, %bl
	je	.L353
.L352:
	.loc 6 62 34 view .LVU324
	movq	%rbx, %rsi
	leaq	.Lubsan_data889(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL246:
.L353:
	.loc 6 62 34 view .LVU325
	movq	%rbx, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	je	.L354
	movq	%rbx, %rdi
	call	__asan_report_store8@PLT
.LVL247:
.L354:
	movq	$0, (%rbx)
.LBB1361:
	leaq	_ZTVSt9exception(%rip), %rax
	cmpq	$-16, %rax
	jb	.L355
	leaq	16(%rax), %rdx
	movq	%rax, %rsi
	leaq	.Lubsan_data890(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL248:
.L355:
	testq	%rbx, %rbx
	je	.L356
	testb	$7, %bl
	je	.L357
.L356:
	movq	%rbx, %rsi
	leaq	.Lubsan_data891(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL249:
.L357:
	.loc 6 62 34 view .LVU326
	leaq	16+_ZTVSt9exception(%rip), %rax
	movq	%rax, (%rbx)
.LVL250:
	.loc 6 62 34 view .LVU327
.LBE1361:
.LBE1360:
.LBE1359:
	.loc 5 58 25 discriminator 2 view .LVU328
	leaq	_ZTVSt9bad_alloc(%rip), %rax
	cmpq	$-16, %rax
	jb	.L358
	leaq	16(%rax), %rdx
	movq	%rax, %rsi
	leaq	.Lubsan_data892(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL251:
.L358:
	testq	%rbx, %rbx
	je	.L359
	testb	$7, %bl
	je	.L360
.L359:
	movq	%rbx, %rsi
	leaq	.Lubsan_data893(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL252:
.L360:
	.loc 5 58 25 discriminator 2 view .LVU329
	leaq	16+_ZTVSt9bad_alloc(%rip), %rax
	movq	%rax, (%rbx)
.LVL253:
	.loc 5 58 25 discriminator 2 view .LVU330
.LBE1358:
.LBE1357:
.LBE1356:
	.loc 1 22 24 discriminator 2 view .LVU331
	call	__asan_handle_no_return@PLT
.LVL254:
	movq	_ZNSt9bad_allocD1Ev@GOTPCREL(%rip), %rdx
	leaq	_ZTISt9bad_alloc(%rip), %rsi
	movq	%rbx, %rdi
	call	__cxa_throw@PLT
.LVL255:
	.cfi_endproc
.LFE6334:
	.size	_Znwm, .-_Znwm
	.globl	_Znam
	.type	_Znam, @function
_Znam:
.LASANPC6335:
.LVL256:
.LFB6335:
	.loc 1 24 39 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 24 39 is_stmt 0 view .LVU333
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	.loc 1 24 40 is_stmt 1 view .LVU334
	.loc 1 24 61 is_stmt 0 view .LVU335
	call	_Znwm
.LVL257:
	.loc 1 24 68 view .LVU336
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6335:
	.size	_Znam, .-_Znam
	.globl	_ZdlPv
	.type	_ZdlPv, @function
_ZdlPv:
.LASANPC6336:
.LVL258:
.LFB6336:
	.loc 1 25 38 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 25 38 is_stmt 0 view .LVU338
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	.loc 1 25 39 is_stmt 1 view .LVU339
	.loc 1 25 48 is_stmt 0 view .LVU340
	call	free@PLT
.LVL259:
	.loc 1 25 52 view .LVU341
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6336:
	.size	_ZdlPv, .-_ZdlPv
	.globl	_ZdaPv
	.type	_ZdaPv, @function
_ZdaPv:
.LASANPC6337:
.LVL260:
.LFB6337:
	.loc 1 26 40 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 26 40 is_stmt 0 view .LVU343
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	.loc 1 26 41 is_stmt 1 view .LVU344
	.loc 1 26 50 is_stmt 0 view .LVU345
	call	free@PLT
.LVL261:
	.loc 1 26 54 view .LVU346
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6337:
	.size	_ZdaPv, .-_ZdaPv
	.globl	_ZdlPvm
	.type	_ZdlPvm, @function
_ZdlPvm:
.LASANPC6338:
.LVL262:
.LFB6338:
	.loc 1 27 50 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 27 50 is_stmt 0 view .LVU348
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	.loc 1 27 51 is_stmt 1 view .LVU349
	.loc 1 27 60 is_stmt 0 view .LVU350
	call	free@PLT
.LVL263:
	.loc 1 27 64 view .LVU351
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6338:
	.size	_ZdlPvm, .-_ZdlPvm
	.globl	_ZdaPvm
	.type	_ZdaPvm, @function
_ZdaPvm:
.LASANPC6339:
.LVL264:
.LFB6339:
	.loc 1 28 52 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 28 52 is_stmt 0 view .LVU353
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	.loc 1 28 53 is_stmt 1 view .LVU354
	.loc 1 28 62 is_stmt 0 view .LVU355
	call	free@PLT
.LVL265:
	.loc 1 28 66 view .LVU356
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6339:
	.size	_ZdaPvm, .-_ZdaPvm
	.section	.rodata._ZNSt6vectorIhSaIhEEC1ERKS1_.str1.8,"aMS",@progbits,1
	.align 8
.LC11:
	.string	"5 48 1 9 <unknown> 64 8 9 <unknown> 96 8 9 <unknown> 128 8 4 __it 160 8 4 __it"
	.section	.text._ZNSt6vectorIhSaIhEEC1ERKS1_,"axG",@progbits,_ZNSt6vectorIhSaIhEEC1ERKS1_,comdat
	.align 2
	.weak	_ZNSt6vectorIhSaIhEEC1ERKS1_
	.type	_ZNSt6vectorIhSaIhEEC1ERKS1_, @function
_ZNSt6vectorIhSaIhEEC1ERKS1_:
.LASANPC6393:
.LVL266:
.LFB6393:
	.file 7 "/usr/include/c++/13/bits/stl_vector.h"
	.loc 7 601 7 is_stmt 1 view -0
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA6393
	.loc 7 601 7 is_stmt 0 view .LVU358
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$264, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	movq	%rsi, %r12
	leaq	-272(%rbp), %r15
	movq	%r15, -304(%rbp)
	cmpl	$0, __asan_option_detect_stack_use_after_return(%rip)
	jne	.L517
.LVL267:
.L375:
	.loc 7 601 7 view .LVU359
	leaq	224(%r15), %r13
	movq	$1102416563, (%r15)
	leaq	.LC11(%rip), %rax
	movq	%rax, 8(%r15)
	leaq	.LASANPC6393(%rip), %rax
	movq	%rax, 16(%r15)
	movq	%r15, %r14
	shrq	$3, %r14
	movl	$-235802127, 2147450880(%r14)
	movl	$-234753551, 2147450884(%r14)
	movl	$-218959360, 2147450888(%r14)
	movl	$-218959360, 2147450892(%r14)
	movl	$-218959360, 2147450896(%r14)
	movl	$-202116352, 2147450900(%r14)
	.loc 7 601 7 view .LVU360
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
.LBB1436:
	.loc 7 603 61 view .LVU361
	testq	%rbx, %rbx
	je	.L379
	testb	$7, %bl
	jne	.L379
.L380:
	testq	%rbx, %rbx
	je	.L381
	testb	$7, %bl
	jne	.L381
.L382:
	.loc 7 603 58 discriminator 2 view .LVU362
	testq	%r12, %r12
	je	.L383
	testb	$7, %r12b
	jne	.L383
.L384:
	testq	%r12, %r12
	je	.L385
	testb	$7, %r12b
	jne	.L385
.L386:
	.loc 7 603 58 discriminator 3 view .LVU363
	testq	%r12, %r12
	je	.L387
	testb	$7, %r12b
	jne	.L387
.L388:
.LVL268:
.LBB1437:
.LBI1437:
	.loc 7 306 7 is_stmt 1 view .LVU364
.LBB1438:
	.loc 7 307 22 is_stmt 0 view .LVU365
	testq	%r12, %r12
	je	.L389
	testb	$7, %r12b
	jne	.L389
.L390:
	.loc 7 307 22 discriminator 1 view .LVU366
	testq	%r12, %r12
	je	.L391
	testb	$7, %r12b
	jne	.L391
.L392:
.LVL269:
	.loc 7 307 22 discriminator 1 view .LVU367
.LBE1438:
.LBE1437:
	.loc 7 603 61 discriminator 4 view .LVU368
	testq	%r12, %r12
	je	.L518
.L393:
.LVL270:
.LBB1440:
.LBI1440:
	.file 8 "/usr/include/c++/13/ext/alloc_traits.h"
	.loc 8 97 29 is_stmt 1 view .LVU369
.LBB1441:
	.loc 8 98 67 is_stmt 0 view .LVU370
	testq	%r12, %r12
	je	.L519
.L394:
.LVL271:
.LBB1442:
.LBI1442:
	.file 9 "/usr/include/c++/13/bits/alloc_traits.h"
	.loc 9 587 7 is_stmt 1 view .LVU371
.LBB1443:
	.loc 9 588 16 is_stmt 0 view .LVU372
	testq	%r12, %r12
	je	.L520
.L395:
.LVL272:
.LBB1444:
.LBI1444:
	.file 10 "/usr/include/c++/13/bits/allocator.h"
	.loc 10 167 7 is_stmt 1 view .LVU373
.LBB1445:
	.loc 10 168 34 is_stmt 0 discriminator 1 view .LVU374
	testq	%r12, %r12
	je	.L521
.L396:
.LVL273:
.LBB1446:
.LBI1446:
	.file 11 "/usr/include/c++/13/bits/new_allocator.h"
	.loc 11 92 7 is_stmt 1 view .LVU375
	.loc 11 92 7 is_stmt 0 view .LVU376
.LBE1446:
.LBE1445:
.LBE1444:
.LBE1443:
.LBE1442:
.LBE1441:
.LBE1440:
	.loc 7 602 23 view .LVU377
	testq	%r12, %r12
	je	.L397
	testb	$7, %r12b
	jne	.L397
.L398:
.LVL274:
.LBB1452:
.LBI1452:
	.loc 7 992 7 is_stmt 1 view .LVU378
.LBB1453:
	.loc 7 993 40 is_stmt 0 view .LVU379
	testq	%r12, %r12
	je	.L399
	testb	$7, %r12b
	jne	.L399
.L400:
	.loc 7 993 40 view .LVU380
	leaq	8(%r12), %rdx
	cmpq	$-8, %r12
	jnb	.L522
.L401:
	leaq	8(%r12), %rax
	movq	%rax, -296(%rbp)
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L523
	movq	8(%r12), %rax
	movq	%rax, -280(%rbp)
	.loc 7 993 66 view .LVU381
	testq	%r12, %r12
	je	.L403
	testb	$7, %r12b
	jne	.L403
.L404:
	movq	%r12, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L524
	.loc 7 993 50 view .LVU382
	movq	-280(%rbp), %rax
	subq	(%r12), %rax
	movq	%rax, -288(%rbp)
.LVL275:
	.loc 7 993 50 view .LVU383
.LBE1453:
.LBE1452:
.LBB1455:
.LBI1455:
	.loc 7 333 7 is_stmt 1 view .LVU384
.LBB1456:
	.loc 7 334 9 is_stmt 0 view .LVU385
	testq	%rbx, %rbx
	je	.L406
	testb	$7, %bl
	jne	.L406
.LVL276:
.L407:
.LBB1457:
.LBI1457:
	.loc 7 146 2 is_stmt 1 view .LVU386
.LBB1458:
	.loc 7 147 22 is_stmt 0 view .LVU387
	testq	%rbx, %rbx
	je	.L525
.L408:
.LVL277:
.LBB1459:
.LBI1459:
	.loc 10 167 7 is_stmt 1 view .LVU388
.LBB1460:
	.loc 10 168 34 is_stmt 0 view .LVU389
	testq	%rbx, %rbx
	je	.L526
.L409:
.LVL278:
.LBB1461:
.LBI1461:
	.loc 11 92 7 is_stmt 1 view .LVU390
	.loc 11 92 7 is_stmt 0 view .LVU391
.LBE1461:
.LBE1460:
.LBE1459:
	.loc 7 147 22 discriminator 3 view .LVU392
	testq	%rbx, %rbx
	je	.L410
	testb	$7, %bl
	jne	.L410
.L411:
.LVL279:
.LBB1463:
.LBI1463:
	.loc 7 99 2 is_stmt 1 view .LVU393
.LBB1464:
	.loc 7 100 4 is_stmt 0 view .LVU394
	testq	%rbx, %rbx
	je	.L412
	testb	$7, %bl
	jne	.L412
.L413:
	movq	%rbx, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L527
	movq	$0, (%rbx)
	.loc 7 100 16 view .LVU395
	testq	%rbx, %rbx
	je	.L415
	testb	$7, %bl
	jne	.L415
.L416:
	leaq	8(%rbx), %rdx
	cmpq	$-8, %rbx
	jnb	.L528
.L417:
	leaq	8(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L529
	movq	$0, 8(%rbx)
	.loc 7 100 29 view .LVU396
	testq	%rbx, %rbx
	je	.L419
	testb	$7, %bl
	jne	.L419
.L420:
	leaq	16(%rbx), %rdx
	cmpq	$-16, %rbx
	jnb	.L530
.L421:
	leaq	16(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L531
	movq	$0, 16(%rbx)
.LVL280:
	.loc 7 100 29 view .LVU397
.LBE1464:
.LBE1463:
.LBE1458:
.LBE1457:
	.loc 7 335 26 view .LVU398
	testq	%rbx, %rbx
	je	.L423
	testb	$7, %bl
	jne	.L423
.L424:
.LVL281:
.LBB1469:
.LBI1469:
	.loc 7 396 7 is_stmt 1 view .LVU399
.LBB1470:
	.loc 7 398 44 is_stmt 0 view .LVU400
	testq	%rbx, %rbx
	je	.L425
	testb	$7, %bl
	jne	.L425
.L426:
.LVL282:
.LBB1471:
.LBI1471:
	.loc 7 378 7 is_stmt 1 view .LVU401
.LBB1472:
	.loc 7 381 18 is_stmt 0 view .LVU402
	cmpq	$0, -288(%rbp)
	je	.L513
	.loc 7 381 34 discriminator 1 view .LVU403
	testq	%rbx, %rbx
	je	.L428
	testb	$7, %bl
	jne	.L428
.L429:
	.loc 7 381 33 discriminator 1 view .LVU404
	testq	%rbx, %rbx
	je	.L532
.L430:
.LVL283:
.LBB1473:
.LBI1473:
	.loc 9 481 7 is_stmt 1 view .LVU405
.LBB1474:
	.loc 9 482 28 is_stmt 0 view .LVU406
	testq	%rbx, %rbx
	je	.L533
.L431:
.LVL284:
.LBB1475:
.LBI1475:
	.loc 10 189 7 is_stmt 1 view .LVU407
.LBB1476:
	.loc 10 198 40 is_stmt 0 view .LVU408
	testq	%rbx, %rbx
	je	.L534
.L432:
.LVL285:
.LBB1477:
.LBI1477:
	.loc 11 126 7 is_stmt 1 view .LVU409
.LBB1478:
	.loc 11 134 46 is_stmt 0 view .LVU410
	testq	%rbx, %rbx
	je	.L535
.L433:
	.loc 11 134 2 discriminator 3 view .LVU411
	cmpq	$0, -288(%rbp)
	js	.L536
	.loc 11 151 48 view .LVU412
	movq	-288(%rbp), %rdi
.LEHB27:
	call	_Znwm
.LVL286:
	jmp	.L537
.LVL287:
.L517:
	.loc 11 151 48 view .LVU413
.LBE1478:
.LBE1477:
.LBE1476:
.LBE1475:
.LBE1474:
.LBE1473:
.LBE1472:
.LBE1471:
.LBE1470:
.LBE1469:
.LBE1456:
.LBE1455:
.LBE1436:
	.loc 7 601 7 view .LVU414
	movl	$192, %edi
	call	__asan_stack_malloc_2@PLT
.LVL288:
	.loc 7 601 7 view .LVU415
	testq	%rax, %rax
	cmovne	%rax, %r15
	jmp	.L375
.L379:
.LBB1565:
	.loc 7 603 61 view .LVU416
	movq	%rbx, %rsi
	leaq	.Lubsan_data894(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL289:
	jmp	.L380
.L381:
	.loc 7 603 61 view .LVU417
	movq	%rbx, %rsi
	leaq	.Lubsan_data895(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL290:
	jmp	.L382
.L383:
	.loc 7 603 58 discriminator 2 view .LVU418
	movq	%r12, %rsi
	leaq	.Lubsan_data896(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL291:
	jmp	.L384
.L385:
	.loc 7 603 58 discriminator 2 view .LVU419
	movq	%r12, %rsi
	leaq	.Lubsan_data897(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL292:
	jmp	.L386
.L387:
	.loc 7 603 58 discriminator 3 view .LVU420
	movq	%r12, %rsi
	leaq	.Lubsan_data898(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL293:
	jmp	.L388
.LVL294:
.L389:
.LBB1509:
.LBB1439:
	.loc 7 307 22 view .LVU421
	movq	%r12, %rsi
	leaq	.Lubsan_data899(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL295:
	jmp	.L390
.L391:
	.loc 7 307 22 discriminator 1 view .LVU422
	movq	%r12, %rsi
	leaq	.Lubsan_data900(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL296:
	jmp	.L392
.LVL297:
.L518:
	.loc 7 307 22 discriminator 1 view .LVU423
.LBE1439:
.LBE1509:
	.loc 7 603 61 discriminator 4 view .LVU424
	movl	$0, %esi
	leaq	.Lubsan_data901(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL298:
	jmp	.L393
.LVL299:
.L519:
.LBB1510:
.LBB1451:
	.loc 8 98 67 view .LVU425
	movl	$0, %esi
	leaq	.Lubsan_data902(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL300:
	jmp	.L394
.LVL301:
.L520:
.LBB1450:
.LBB1449:
	.loc 9 588 16 view .LVU426
	movl	$0, %esi
	leaq	.Lubsan_data904(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL302:
	jmp	.L395
.LVL303:
.L521:
.LBB1448:
.LBB1447:
	.loc 10 168 34 discriminator 1 view .LVU427
	movl	$0, %esi
	leaq	.Lubsan_data906(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL304:
	jmp	.L396
.LVL305:
.L397:
	.loc 10 168 34 discriminator 1 view .LVU428
.LBE1447:
.LBE1448:
.LBE1449:
.LBE1450:
.LBE1451:
.LBE1510:
	.loc 7 602 23 view .LVU429
	movq	%r12, %rsi
	leaq	.Lubsan_data907(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL306:
	jmp	.L398
.LVL307:
.L399:
.LBB1511:
.LBB1454:
	.loc 7 993 40 view .LVU430
	movq	%r12, %rsi
	leaq	.Lubsan_data908(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL308:
	jmp	.L400
.L522:
	.loc 7 993 40 view .LVU431
	movq	%r12, %rsi
	leaq	.Lubsan_data909(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL309:
	jmp	.L401
.L523:
	.loc 7 993 40 view .LVU432
	movq	-296(%rbp), %rdi
	call	__asan_report_load8@PLT
.LVL310:
.L403:
	.loc 7 993 66 view .LVU433
	movq	%r12, %rsi
	leaq	.Lubsan_data910(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL311:
	jmp	.L404
.L524:
	.loc 7 993 66 view .LVU434
	movq	%r12, %rdi
	call	__asan_report_load8@PLT
.LVL312:
.L406:
	.loc 7 993 66 view .LVU435
.LBE1454:
.LBE1511:
.LBB1512:
.LBB1507:
	.loc 7 334 9 view .LVU436
	movq	%rbx, %rsi
	leaq	.Lubsan_data911(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL313:
	.loc 7 334 9 view .LVU437
	jmp	.L407
.LVL314:
.L525:
.LBB1500:
.LBB1468:
	.loc 7 147 22 view .LVU438
	movl	$0, %esi
	leaq	.Lubsan_data913(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL315:
	jmp	.L408
.LVL316:
.L526:
.LBB1466:
.LBB1462:
	.loc 10 168 34 view .LVU439
	movl	$0, %esi
	leaq	.Lubsan_data915(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL317:
	jmp	.L409
.LVL318:
.L410:
	.loc 10 168 34 view .LVU440
.LBE1462:
.LBE1466:
	.loc 7 147 22 discriminator 3 view .LVU441
	movq	%rbx, %rsi
	leaq	.Lubsan_data917(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL319:
	jmp	.L411
.LVL320:
.L412:
.LBB1467:
.LBB1465:
	.loc 7 100 4 view .LVU442
	movq	%rbx, %rsi
	leaq	.Lubsan_data918(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL321:
	jmp	.L413
.L527:
	.loc 7 100 4 view .LVU443
	movq	%rbx, %rdi
	call	__asan_report_store8@PLT
.LVL322:
.L415:
	.loc 7 100 16 view .LVU444
	movq	%rbx, %rsi
	leaq	.Lubsan_data919(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL323:
	jmp	.L416
.L528:
	.loc 7 100 16 view .LVU445
	movq	%rbx, %rsi
	leaq	.Lubsan_data920(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL324:
	jmp	.L417
.L529:
	.loc 7 100 16 view .LVU446
	call	__asan_report_store8@PLT
.LVL325:
.L419:
	.loc 7 100 29 view .LVU447
	movq	%rbx, %rsi
	leaq	.Lubsan_data921(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL326:
	jmp	.L420
.L530:
	.loc 7 100 29 view .LVU448
	movq	%rbx, %rsi
	leaq	.Lubsan_data922(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL327:
	jmp	.L421
.L531:
	.loc 7 100 29 view .LVU449
	call	__asan_report_store8@PLT
.LVL328:
.L423:
	.loc 7 100 29 view .LVU450
.LBE1465:
.LBE1467:
.LBE1468:
.LBE1500:
	.loc 7 335 26 view .LVU451
	movq	%rbx, %rsi
	leaq	.Lubsan_data923(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL329:
	jmp	.L424
.LVL330:
.L425:
.LBB1501:
.LBB1497:
	.loc 7 398 44 view .LVU452
	movq	%rbx, %rsi
	leaq	.Lubsan_data924(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL331:
	jmp	.L426
.LVL332:
.L428:
.LBB1494:
.LBB1491:
	.loc 7 381 34 discriminator 1 view .LVU453
	movq	%rbx, %rsi
	leaq	.Lubsan_data925(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL333:
	jmp	.L429
.L532:
	.loc 7 381 33 discriminator 1 view .LVU454
	movl	$0, %esi
	leaq	.Lubsan_data926(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL334:
	jmp	.L430
.LVL335:
.L533:
.LBB1489:
.LBB1487:
	.loc 9 482 28 view .LVU455
	movl	$0, %esi
	leaq	.Lubsan_data927(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL336:
	jmp	.L431
.LVL337:
.L534:
.LBB1485:
.LBB1483:
	.loc 10 198 40 view .LVU456
	movl	$0, %esi
	leaq	.Lubsan_data928(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL338:
	jmp	.L432
.LVL339:
.L535:
.LBB1481:
.LBB1479:
	.loc 11 134 46 view .LVU457
	movl	$0, %esi
	leaq	.Lubsan_data929(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL340:
	jmp	.L433
.L536:
	.loc 11 140 28 view .LVU458
	call	__asan_handle_no_return@PLT
.LVL341:
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L538
	call	_ZSt17__throw_bad_allocv@PLT
.LVL342:
.LEHE27:
.L514:
	endbr64
.LBE1479:
.LBE1481:
.LBE1483:
.LBE1485:
.LBE1487:
.LBE1489:
.LBE1491:
.LBE1494:
.LBE1497:
.LBE1501:
	.loc 7 334 9 view .LVU459
	movq	%rax, %r12
.LVL343:
	.loc 7 334 9 view .LVU460
	testq	%rbx, %rbx
	je	.L492
	testb	$7, %bl
	je	.L493
.L492:
	movq	%rbx, %rsi
	leaq	.Lubsan_data962(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL344:
.L493:
	.loc 7 335 33 view .LVU461
	testq	%rbx, %rbx
	je	.L494
	testb	$7, %bl
	je	.L495
.L494:
	movq	%rbx, %rsi
	leaq	.Lubsan_data963(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL345:
.L495:
.LBB1502:
.LBI1502:
	.loc 7 133 14 is_stmt 1 view .LVU462
.LBB1503:
	testq	%rbx, %rbx
	jne	.L496
	movl	$0, %esi
	leaq	.Lubsan_data964(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL346:
.L496:
.LBB1504:
.LBI1504:
	.loc 10 184 7 view .LVU463
	.loc 10 184 7 is_stmt 0 view .LVU464
	call	__asan_handle_no_return@PLT
.LVL347:
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	je	.L497
	call	__stack_chk_fail@PLT
.LVL348:
.L538:
	.loc 10 184 7 view .LVU465
.LBE1504:
.LBE1503:
.LBE1502:
.LBB1505:
.LBB1498:
.LBB1495:
.LBB1492:
.LBB1490:
.LBB1488:
.LBB1486:
.LBB1484:
.LBB1482:
.LBB1480:
	.loc 11 140 28 view .LVU466
	call	__stack_chk_fail@PLT
.LVL349:
.L537:
	.loc 11 151 48 view .LVU467
	movq	%rax, -280(%rbp)
.LVL350:
.L427:
	.loc 11 151 48 view .LVU468
.LBE1480:
.LBE1482:
.LBE1484:
.LBE1486:
.LBE1488:
.LBE1490:
.LBE1492:
.LBE1495:
	.loc 7 398 25 discriminator 2 view .LVU469
	testq	%rbx, %rbx
	je	.L436
	testb	$7, %bl
	jne	.L436
.L437:
	movq	%rbx, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L539
	movq	-280(%rbp), %rax
	movq	%rax, (%rbx)
	.loc 7 399 42 view .LVU470
	testq	%rbx, %rbx
	je	.L439
	testb	$7, %bl
	jne	.L439
.L440:
	.loc 7 399 26 view .LVU471
	testq	%rbx, %rbx
	je	.L441
	testb	$7, %bl
	jne	.L441
.L442:
	leaq	8(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L540
	movq	-280(%rbp), %rax
	movq	%rax, 8(%rbx)
	.loc 7 400 50 view .LVU472
	testq	%rbx, %rbx
	je	.L444
	testb	$7, %bl
	jne	.L444
.L445:
	.loc 7 400 59 view .LVU473
	movq	-280(%rbp), %rcx
	movq	-288(%rbp), %rax
	leaq	(%rcx,%rax), %rdx
	testq	%rax, %rax
	js	.L446
	cmpq	%rcx, %rdx
	jnb	.L447
.L448:
	movq	-280(%rbp), %rsi
	leaq	.Lubsan_data934(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL351:
	jmp	.L447
.LVL352:
.L513:
.LBB1496:
.LBB1493:
	.loc 7 381 18 discriminator 2 view .LVU474
	movq	$0, -280(%rbp)
	jmp	.L427
.LVL353:
.L436:
	.loc 7 381 18 discriminator 2 view .LVU475
.LBE1493:
.LBE1496:
	.loc 7 398 25 discriminator 2 view .LVU476
	movq	%rbx, %rsi
	leaq	.Lubsan_data930(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL354:
	jmp	.L437
.L539:
	.loc 7 398 25 discriminator 2 view .LVU477
	movq	%rbx, %rdi
	call	__asan_report_store8@PLT
.LVL355:
.L439:
	.loc 7 399 42 view .LVU478
	movq	%rbx, %rsi
	leaq	.Lubsan_data931(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL356:
	jmp	.L440
.L441:
	.loc 7 399 26 view .LVU479
	movq	%rbx, %rsi
	leaq	.Lubsan_data932(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL357:
	jmp	.L442
.L540:
	.loc 7 399 26 view .LVU480
	call	__asan_report_store8@PLT
.LVL358:
.L444:
	.loc 7 400 50 view .LVU481
	movq	%rbx, %rsi
	leaq	.Lubsan_data933(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL359:
	jmp	.L445
.L446:
	.loc 7 400 59 view .LVU482
	cmpq	%rdx, -280(%rbp)
	jb	.L448
.L447:
	movq	-280(%rbp), %rax
	movq	-288(%rbp), %rsi
	addq	%rsi, %rax
	movq	%rax, -280(%rbp)
	.loc 7 400 34 view .LVU483
	testq	%rbx, %rbx
	je	.L449
	testb	$7, %bl
	jne	.L449
.L450:
	leaq	16(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L541
	movq	-280(%rbp), %rax
	movq	%rax, 16(%rbx)
.LVL360:
	.loc 7 400 34 view .LVU484
.LBE1498:
.LBE1505:
.LBE1507:
.LBE1512:
.LBB1513:
.LBI1513:
	.loc 10 184 7 is_stmt 1 view .LVU485
.LBE1513:
	.loc 7 603 61 is_stmt 0 discriminator 1 view .LVU486
	leaq	-176(%r13), %rax
.LVL361:
	.loc 7 603 61 discriminator 1 view .LVU487
	shrq	$3, %rax
.LVL362:
	.loc 7 603 61 discriminator 1 view .LVU488
	movb	$-8, 2147450880(%rax)
	.loc 7 608 30 view .LVU489
	testq	%rbx, %rbx
	je	.L452
	testb	$7, %bl
	jne	.L452
.L453:
	testq	%rbx, %rbx
	je	.L454
	testb	$7, %bl
	jne	.L454
.L455:
.LVL363:
.LBB1514:
.LBI1514:
	.loc 7 301 7 is_stmt 1 view .LVU490
.LBB1515:
	.loc 7 302 22 is_stmt 0 view .LVU491
	testq	%rbx, %rbx
	je	.L456
	testb	$7, %bl
	jne	.L456
.L457:
	testq	%rbx, %rbx
	je	.L542
.L458:
.LVL364:
	.loc 7 302 22 view .LVU492
.LBE1515:
.LBE1514:
	.loc 7 606 31 view .LVU493
	testq	%rbx, %rbx
	je	.L543
.L459:
	.loc 7 606 31 discriminator 1 view .LVU494
	testq	%rbx, %rbx
	je	.L460
	testb	$7, %bl
	jne	.L460
.L461:
	movq	%rbx, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L544
	movq	(%rbx), %rax
	movq	%rax, -280(%rbp)
	.loc 7 606 52 discriminator 1 view .LVU495
	testq	%r12, %r12
	je	.L463
	testb	$7, %r12b
	jne	.L463
.L464:
.LVL365:
.LBB1517:
.LBI1517:
	.loc 7 903 7 is_stmt 1 view .LVU496
.LBB1518:
	.loc 7 904 16 is_stmt 0 view .LVU497
	leaq	-128(%r13), %rax
	shrq	$3, %rax
	movb	$0, 2147450880(%rax)
	.loc 7 904 45 discriminator 1 view .LVU498
	testq	%r12, %r12
	je	.L465
	testb	$7, %r12b
	jne	.L465
.L466:
	.loc 7 904 45 discriminator 1 view .LVU499
	movq	-296(%rbp), %rax
	testq	%rax, %rax
	je	.L467
	testb	$7, %al
	jne	.L467
.L468:
	.loc 7 904 45 discriminator 2 view .LVU500
	testq	%r12, %r12
	je	.L469
	testb	$7, %r12b
	jne	.L469
.L470:
.LVL366:
.LBB1519:
.LBI1519:
	.file 12 "/usr/include/c++/13/bits/stl_iterator.h"
	.loc 12 1076 7 is_stmt 1 view .LVU501
.LBB1520:
.LBB1521:
	.loc 12 1077 9 is_stmt 0 view .LVU502
	movq	-296(%rbp), %rax
	testq	%rax, %rax
	je	.L471
	testb	$7, %al
	jne	.L471
.L472:
	.loc 12 1077 9 view .LVU503
	leaq	8(%r12), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L545
	movq	8(%r12), %rax
	movq	%rax, -288(%rbp)
	leaq	-128(%r13), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L546
	movq	-288(%rbp), %rax
	movq	%rax, -128(%r13)
.LVL367:
	.loc 12 1077 9 view .LVU504
.LBE1521:
.LBE1520:
.LBE1519:
	.loc 7 904 16 discriminator 1 view .LVU505
	leaq	-128(%r13), %rax
	shrq	$3, %rax
	movb	$-8, 2147450880(%rax)
.LVL368:
	.loc 7 904 16 discriminator 1 view .LVU506
.LBE1518:
.LBE1517:
	.loc 7 606 41 discriminator 3 view .LVU507
	testq	%r12, %r12
	je	.L475
	testb	$7, %r12b
	jne	.L475
.L476:
.LVL369:
.LBB1526:
.LBI1526:
	.loc 7 883 7 is_stmt 1 view .LVU508
.LBB1527:
	.loc 7 884 16 is_stmt 0 view .LVU509
	leaq	-160(%r13), %rax
	shrq	$3, %rax
	movb	$0, 2147450880(%rax)
	.loc 7 884 45 discriminator 1 view .LVU510
	testq	%r12, %r12
	je	.L477
	testb	$7, %r12b
	jne	.L477
.L478:
	.loc 7 884 45 discriminator 1 view .LVU511
	testq	%r12, %r12
	je	.L479
	testb	$7, %r12b
	jne	.L479
.L480:
	.loc 7 884 45 discriminator 2 view .LVU512
	testq	%r12, %r12
	je	.L481
	testb	$7, %r12b
	jne	.L481
.L482:
.LVL370:
.LBB1528:
.LBI1528:
	.loc 12 1076 7 is_stmt 1 view .LVU513
.LBB1529:
.LBB1530:
	.loc 12 1077 9 is_stmt 0 view .LVU514
	testq	%r12, %r12
	je	.L483
	testb	$7, %r12b
	jne	.L483
.L484:
	.loc 12 1077 9 view .LVU515
	movq	%r12, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L547
	movq	(%r12), %r12
.LVL371:
	.loc 12 1077 9 view .LVU516
	leaq	-160(%r13), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L548
	movq	%r12, -160(%r13)
.LVL372:
	.loc 12 1077 9 view .LVU517
.LBE1530:
.LBE1529:
.LBE1528:
	.loc 7 884 16 discriminator 1 view .LVU518
	leaq	-160(%r13), %rax
	shrq	$3, %rax
	movb	$-8, 2147450880(%rax)
.LVL373:
	.loc 7 884 16 discriminator 1 view .LVU519
.LBE1527:
.LBE1526:
.LBB1535:
.LBI1535:
	.file 13 "/usr/include/c++/13/bits/stl_uninitialized.h"
	.loc 13 366 5 is_stmt 1 view .LVU520
.LBB1536:
.LBI1536:
	.loc 13 163 5 view .LVU521
.LBB1537:
.LBB1538:
.LBI1538:
	.loc 13 145 9 view .LVU522
.LBB1539:
.LBI1539:
	.file 14 "/usr/include/c++/13/bits/stl_algobase.h"
	.loc 14 624 5 view .LVU523
.LBB1540:
.LBI1540:
	.loc 14 538 5 view .LVU524
	leaq	-96(%r13), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L549
	movq	-288(%rbp), %rax
	movq	%rax, -96(%r13)
.LBB1541:
.LBI1541:
	.loc 12 1357 5 view .LVU525
	leaq	-64(%r13), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L550
	movq	%r12, -64(%r13)
.LBE1541:
.LBB1542:
.LBI1542:
	.loc 12 1357 5 view .LVU526
.LVL374:
	.loc 12 1357 5 is_stmt 0 view .LVU527
.LBE1542:
.LBB1543:
.LBI1543:
	.loc 14 532 5 is_stmt 1 view .LVU528
.LBB1544:
.LBI1544:
	.loc 14 497 5 view .LVU529
.LBB1545:
.LBB1546:
.LBI1546:
	.loc 14 433 2 view .LVU530
.LBB1547:
	.loc 14 435 20 is_stmt 0 view .LVU531
	movq	-288(%rbp), %r13
.LVL375:
	.loc 14 435 20 view .LVU532
	subq	%r12, %r13
.LVL376:
	.loc 14 436 4 discriminator 1 view .LVU533
	cmpq	$1, %r13
	jle	.L551
	.loc 14 437 23 view .LVU534
	cmpq	$0, -280(%rbp)
	je	.L552
.LVL377:
.L498:
	.loc 14 437 23 view .LVU535
	testq	%r12, %r12
	je	.L553
.L499:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	-280(%rbp), %rdi
	call	memmove@PLT
.LVL378:
.L500:
	.loc 14 441 22 view .LVU536
	movq	-280(%rbp), %rax
	leaq	(%rax,%r13), %rdx
	testq	%r13, %r13
	js	.L505
	cmpq	%rax, %rdx
	jnb	.L506
.L507:
	movq	-280(%rbp), %rsi
	leaq	.Lubsan_data967(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL379:
	jmp	.L506
.LVL380:
.L449:
	.loc 14 441 22 view .LVU537
.LBE1547:
.LBE1546:
.LBE1545:
.LBE1544:
.LBE1543:
.LBE1540:
.LBE1539:
.LBE1538:
.LBE1537:
.LBE1536:
.LBE1535:
.LBB1560:
.LBB1508:
.LBB1506:
.LBB1499:
	.loc 7 400 34 view .LVU538
	movq	%rbx, %rsi
	leaq	.Lubsan_data935(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL381:
	jmp	.L450
.L541:
	.loc 7 400 34 view .LVU539
	call	__asan_report_store8@PLT
.LVL382:
.L452:
	.loc 7 400 34 view .LVU540
.LBE1499:
.LBE1506:
.LBE1508:
.LBE1560:
	.loc 7 608 30 view .LVU541
	movq	%rbx, %rsi
	leaq	.Lubsan_data936(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL383:
	jmp	.L453
.L454:
	.loc 7 608 30 view .LVU542
	movq	%rbx, %rsi
	leaq	.Lubsan_data937(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL384:
	jmp	.L455
.LVL385:
.L456:
.LBB1561:
.LBB1516:
	.loc 7 302 22 view .LVU543
	movq	%rbx, %rsi
	leaq	.Lubsan_data938(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL386:
	jmp	.L457
.L542:
	.loc 7 302 22 view .LVU544
	movl	$0, %esi
	leaq	.Lubsan_data939(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL387:
	jmp	.L458
.LVL388:
.L543:
	.loc 7 302 22 view .LVU545
.LBE1516:
.LBE1561:
	.loc 7 606 31 view .LVU546
	movl	$0, %esi
	leaq	.Lubsan_data940(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL389:
	jmp	.L459
.L460:
	.loc 7 606 31 discriminator 1 view .LVU547
	movq	%rbx, %rsi
	leaq	.Lubsan_data941(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL390:
	jmp	.L461
.L544:
	.loc 7 606 31 discriminator 1 view .LVU548
	movq	%rbx, %rdi
	call	__asan_report_load8@PLT
.LVL391:
.L463:
	.loc 7 606 52 discriminator 1 view .LVU549
	movq	%r12, %rsi
	leaq	.Lubsan_data942(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL392:
	jmp	.L464
.LVL393:
.L465:
.LBB1562:
.LBB1525:
	.loc 7 904 45 discriminator 1 view .LVU550
	movq	%r12, %rsi
	leaq	.Lubsan_data943(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL394:
	jmp	.L466
.L467:
	.loc 7 904 45 discriminator 1 view .LVU551
	movq	-296(%rbp), %rsi
	leaq	.Lubsan_data944(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL395:
	jmp	.L468
.L469:
	.loc 7 904 45 discriminator 2 view .LVU552
	movq	%r12, %rsi
	leaq	.Lubsan_data945(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL396:
	jmp	.L470
.LVL397:
.L471:
.LBB1524:
.LBB1523:
.LBB1522:
	.loc 12 1077 9 view .LVU553
	movq	-296(%rbp), %rsi
	leaq	.Lubsan_data946(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL398:
	.loc 12 1077 9 view .LVU554
	jmp	.L472
.L545:
	.loc 12 1077 9 view .LVU555
	call	__asan_report_load8@PLT
.LVL399:
.L546:
	.loc 12 1077 9 view .LVU556
	call	__asan_report_store8@PLT
.LVL400:
.L475:
	.loc 12 1077 9 view .LVU557
.LBE1522:
.LBE1523:
.LBE1524:
.LBE1525:
.LBE1562:
	.loc 7 606 41 discriminator 3 view .LVU558
	movq	%r12, %rsi
	leaq	.Lubsan_data948(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL401:
	jmp	.L476
.LVL402:
.L477:
.LBB1563:
.LBB1534:
	.loc 7 884 45 discriminator 1 view .LVU559
	movq	%r12, %rsi
	leaq	.Lubsan_data949(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL403:
	jmp	.L478
.L479:
	.loc 7 884 45 discriminator 1 view .LVU560
	movq	%r12, %rsi
	leaq	.Lubsan_data950(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL404:
	jmp	.L480
.L481:
	.loc 7 884 45 discriminator 2 view .LVU561
	movq	%r12, %rsi
	leaq	.Lubsan_data951(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL405:
	jmp	.L482
.LVL406:
.L483:
.LBB1533:
.LBB1532:
.LBB1531:
	.loc 12 1077 9 view .LVU562
	movq	%r12, %rsi
	leaq	.Lubsan_data952(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL407:
	jmp	.L484
.L547:
	.loc 12 1077 9 view .LVU563
	movq	%r12, %rdi
	call	__asan_report_load8@PLT
.LVL408:
.L548:
	.loc 12 1077 9 view .LVU564
	call	__asan_report_store8@PLT
.LVL409:
.L549:
	.loc 12 1077 9 view .LVU565
	call	__asan_report_store8@PLT
.LVL410:
.L550:
	.loc 12 1077 9 view .LVU566
	call	__asan_report_store8@PLT
.LVL411:
.L497:
	.loc 12 1077 9 view .LVU567
	movq	%r12, %rdi
.LEHB28:
	call	_Unwind_Resume@PLT
.LVL412:
.LEHE28:
.L552:
	.loc 12 1077 9 view .LVU568
.LBE1531:
.LBE1532:
.LBE1533:
.LBE1534:
.LBE1563:
.LBB1564:
.LBB1559:
.LBB1558:
.LBB1557:
.LBB1556:
.LBB1555:
.LBB1554:
.LBB1553:
.LBB1552:
.LBB1551:
.LBB1550:
	.loc 14 437 23 view .LVU569
	leaq	.Lubsan_data853(%rip), %rdi
.LVL413:
	.loc 14 437 23 view .LVU570
	call	__ubsan_handle_nonnull_arg@PLT
.LVL414:
	jmp	.L498
.L553:
	.loc 14 437 23 view .LVU571
	leaq	.Lubsan_data854(%rip), %rdi
	call	__ubsan_handle_nonnull_arg@PLT
.LVL415:
	jmp	.L499
.L551:
	.loc 14 438 9 view .LVU572
	jne	.L500
.LVL416:
.LBB1548:
.LBI1548:
	.loc 14 397 2 is_stmt 1 view .LVU573
.LBB1549:
	.loc 14 398 10 is_stmt 0 view .LVU574
	testq	%r12, %r12
	je	.L554
.L501:
	.loc 14 398 10 view .LVU575
	movq	%r12, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	movq	%r12, %rdx
	andl	$7, %edx
	cmpb	%dl, %al
	jg	.L502
	testb	%al, %al
	jne	.L555
.L502:
	movzbl	(%r12), %r12d
.LVL417:
	.loc 14 398 10 view .LVU576
	cmpq	$0, -280(%rbp)
	je	.L556
.L503:
	movq	-280(%rbp), %rcx
	movq	%rcx, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	andl	$7, %ecx
	cmpb	%cl, %al
	jg	.L504
	testb	%al, %al
	jne	.L557
.L504:
	movq	-280(%rbp), %rax
	movb	%r12b, (%rax)
.LVL418:
	.loc 14 398 21 view .LVU577
	jmp	.L500
.LVL419:
.L554:
	.loc 14 398 10 view .LVU578
	movl	$0, %esi
	leaq	.Lubsan_data965(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL420:
	jmp	.L501
.L555:
	.loc 14 398 10 view .LVU579
	movq	%r12, %rdi
	call	__asan_report_load1@PLT
.LVL421:
.L556:
	.loc 14 398 10 view .LVU580
	movl	$0, %esi
	leaq	.Lubsan_data966(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL422:
	jmp	.L503
.L557:
	movq	-280(%rbp), %rdi
	call	__asan_report_store1@PLT
.LVL423:
.L505:
	.loc 14 398 10 view .LVU581
.LBE1549:
.LBE1548:
	.loc 14 441 22 view .LVU582
	cmpq	%rdx, -280(%rbp)
	jb	.L507
.L506:
	movq	-280(%rbp), %rax
	addq	%r13, %rax
	movq	%rax, %r13
.LVL424:
	.loc 14 441 22 view .LVU583
.LBE1550:
.LBE1551:
.LBE1552:
.LBE1553:
.LBE1554:
.LBE1555:
.LBE1556:
.LBE1557:
.LBE1558:
.LBE1559:
.LBE1564:
	.loc 7 605 26 view .LVU584
	testq	%rbx, %rbx
	je	.L508
	testb	$7, %bl
	jne	.L508
.L509:
	leaq	8(%rbx), %rdx
	cmpq	$-8, %rbx
	jnb	.L558
.L510:
	leaq	8(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L559
	movq	%r13, 8(%rbx)
.LBE1565:
	.loc 7 601 7 view .LVU585
	cmpq	%r15, -304(%rbp)
	jne	.L560
	pxor	%xmm0, %xmm0
	movups	%xmm0, 2147450880(%r14)
.LVL425:
	.loc 7 601 7 view .LVU586
	movq	$0, 2147450896(%r14)
.L377:
	.loc 7 609 7 view .LVU587
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L561
	addq	$264, %rsp
	popq	%rbx
.LVL426:
	.loc 7 609 7 view .LVU588
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
.LVL427:
	.loc 7 609 7 view .LVU589
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.LVL428:
.L508:
	.cfi_restore_state
.LBB1566:
	.loc 7 605 26 view .LVU590
	movq	%rbx, %rsi
	leaq	.Lubsan_data968(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL429:
	jmp	.L509
.L558:
	.loc 7 605 26 view .LVU591
	movq	%rbx, %rsi
	leaq	.Lubsan_data969(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL430:
	jmp	.L510
.L559:
	.loc 7 605 26 view .LVU592
	call	__asan_report_store8@PLT
.LVL431:
.L560:
	.loc 7 605 26 view .LVU593
.LBE1566:
	.loc 7 601 7 view .LVU594
	movq	$1172321806, (%r15)
.LVL432:
	.loc 7 601 7 view .LVU595
	movdqa	.LC1(%rip), %xmm0
	movups	%xmm0, 2147450880(%r14)
	movabsq	$-723401728380766731, %rax
	movq	%rax, 2147450896(%r14)
	movq	248(%r15), %rax
	movb	$0, (%rax)
	jmp	.L377
.L561:
	.loc 7 609 7 view .LVU596
	call	__stack_chk_fail@PLT
.LVL433:
	.cfi_endproc
.LFE6393:
	.section	.gcc_except_table
.LLSDA6393:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE6393-.LLSDACSB6393
.LLSDACSB6393:
	.uleb128 .LEHB27-.LFB6393
	.uleb128 .LEHE27-.LEHB27
	.uleb128 .L514-.LFB6393
	.uleb128 0
	.uleb128 .LEHB28-.LFB6393
	.uleb128 .LEHE28-.LEHB28
	.uleb128 0
	.uleb128 0
.LLSDACSE6393:
	.section	.text._ZNSt6vectorIhSaIhEEC1ERKS1_,"axG",@progbits,_ZNSt6vectorIhSaIhEEC1ERKS1_,comdat
	.size	_ZNSt6vectorIhSaIhEEC1ERKS1_, .-_ZNSt6vectorIhSaIhEEC1ERKS1_
	.globl	__asan_stack_malloc_3
	.section	.rodata._ZNSt6vectorIhSaIhEEaSERKS1_.str1.8,"aMS",@progbits,1
	.align 8
.LC12:
	.string	"15 32 8 9 <unknown> 64 8 9 <unknown> 96 8 9 <unknown> 128 8 9 <unknown> 160 8 9 <unknown> 192 8 9 <unknown> 224 8 4 __it 256 8 4 __it 288 8 4 __it 320 8 4 __it 352 8 4 __it 384 8 10 __from:210 416 8 4 __it 448 8 9 <unknown> 480 8 9 <unknown>"
	.section	.text._ZNSt6vectorIhSaIhEEaSERKS1_,"axG",@progbits,_ZNSt6vectorIhSaIhEEaSERKS1_,comdat
	.align 2
	.weak	_ZNSt6vectorIhSaIhEEaSERKS1_
	.type	_ZNSt6vectorIhSaIhEEaSERKS1_, @function
_ZNSt6vectorIhSaIhEEaSERKS1_:
.LASANPC6415:
.LVL434:
.LFB6415:
	.file 15 "/usr/include/c++/13/bits/vector.tcc"
	.loc 15 210 5 is_stmt 1 view -0
	.cfi_startproc
	.loc 15 210 5 is_stmt 0 view .LVU598
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$616, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	movq	%rsi, %r13
	leaq	-592(%rbp), %r15
	movq	%r15, -608(%rbp)
	cmpl	$0, __asan_option_detect_stack_use_after_return(%rip)
	jne	.L839
.LVL435:
.L562:
	.loc 15 210 5 view .LVU599
	leaq	544(%r15), %r14
	movq	$1102416563, (%r15)
	leaq	.LC12(%rip), %rax
	movq	%rax, 8(%r15)
	leaq	.LASANPC6415(%rip), %rax
	movq	%rax, 16(%r15)
	movq	%r15, %r12
	shrq	$3, %r12
	movl	$-235802127, 2147450880(%r12)
	movl	$-218959360, 2147450884(%r12)
	movl	$-218959360, 2147450888(%r12)
	movl	$-218959360, 2147450892(%r12)
	movl	$-218959360, 2147450896(%r12)
	movl	$-218959360, 2147450900(%r12)
	movl	$-218959360, 2147450904(%r12)
	movl	$-218959360, 2147450908(%r12)
	movl	$-218959360, 2147450912(%r12)
	movl	$-218959360, 2147450916(%r12)
	movl	$-218959360, 2147450920(%r12)
	movl	$-218959360, 2147450924(%r12)
	movl	$-218959360, 2147450928(%r12)
	movl	$-218959360, 2147450932(%r12)
	movl	$-218959360, 2147450936(%r12)
	movl	$-202116352, 2147450940(%r12)
	.loc 15 210 5 view .LVU600
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
.LBB1718:
	.loc 15 213 7 view .LVU601
	cmpq	%rbx, %r13
	je	.L566
.LBB1719:
	.loc 15 235 37 view .LVU602
	testq	%r13, %r13
	je	.L567
	testb	$7, %r13b
	jne	.L567
.L568:
.LVL436:
.LBB1720:
.LBI1720:
	.loc 7 992 7 is_stmt 1 view .LVU603
.LBB1721:
	.loc 7 993 40 is_stmt 0 view .LVU604
	testq	%r13, %r13
	je	.L569
	testb	$7, %r13b
	jne	.L569
.L570:
	.loc 7 993 40 view .LVU605
	leaq	8(%r13), %rdx
	cmpq	$-8, %r13
	jnb	.L840
.L571:
	leaq	8(%r13), %rax
	movq	%rax, -624(%rbp)
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L841
	movq	8(%r13), %rax
	movq	%rax, -600(%rbp)
	.loc 7 993 66 view .LVU606
	testq	%r13, %r13
	je	.L573
	testb	$7, %r13b
	jne	.L573
.L574:
	movq	%r13, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L842
	movq	0(%r13), %rax
	movq	%rax, -640(%rbp)
	.loc 7 993 50 view .LVU607
	movq	-600(%rbp), %rcx
	subq	%rax, %rcx
	movq	%rcx, -600(%rbp)
.LVL437:
	.loc 7 993 50 view .LVU608
.LBE1721:
.LBE1720:
.LBB1723:
	.loc 15 236 25 view .LVU609
	testq	%rbx, %rbx
	je	.L576
	testb	$7, %bl
	jne	.L576
.LVL438:
.L577:
.LBB1724:
.LBI1724:
	.loc 7 1078 7 is_stmt 1 view .LVU610
.LBB1725:
	.loc 7 1079 40 is_stmt 0 view .LVU611
	testq	%rbx, %rbx
	je	.L578
	testb	$7, %bl
	jne	.L578
.L579:
	.loc 7 1079 40 view .LVU612
	leaq	16(%rbx), %rdx
	cmpq	$-16, %rbx
	jnb	.L843
.L580:
	leaq	16(%rbx), %rax
	movq	%rax, -648(%rbp)
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L844
	movq	16(%rbx), %rax
	movq	%rax, -632(%rbp)
	.loc 7 1080 21 view .LVU613
	testq	%rbx, %rbx
	je	.L582
	testb	$7, %bl
	jne	.L582
.L583:
	movq	%rbx, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L845
	movq	(%rbx), %rcx
	movq	%rcx, -616(%rbp)
.LVL439:
	.loc 7 1080 5 view .LVU614
	movq	-632(%rbp), %rax
	subq	%rcx, %rax
.LBE1725:
.LBE1724:
	.loc 15 236 4 discriminator 2 view .LVU615
	movq	-600(%rbp), %rsi
	cmpq	%rsi, %rax
	jnb	.L585
.LBB1727:
	.loc 15 238 44 view .LVU616
	testq	%rbx, %rbx
	je	.L586
	testb	$7, %bl
	jne	.L586
.L587:
	.loc 15 239 17 view .LVU617
	testq	%r13, %r13
	je	.L588
	testb	$7, %r13b
	jne	.L588
.L589:
.LVL440:
.LBB1728:
.LBI1728:
	.loc 7 903 7 is_stmt 1 view .LVU618
.LBB1729:
	.loc 7 904 45 is_stmt 0 discriminator 1 view .LVU619
	testq	%r13, %r13
	je	.L590
	testb	$7, %r13b
	jne	.L590
.L591:
	.loc 7 904 45 discriminator 1 view .LVU620
	movq	-624(%rbp), %rax
	testq	%rax, %rax
	je	.L592
	testb	$7, %al
	jne	.L592
.L593:
	.loc 7 904 45 discriminator 2 view .LVU621
	testq	%r13, %r13
	je	.L594
	testb	$7, %r13b
	jne	.L594
.L595:
.LVL441:
.LBB1730:
.LBI1730:
	.loc 12 1076 7 is_stmt 1 view .LVU622
.LBB1731:
.LBB1732:
	.loc 12 1077 9 is_stmt 0 view .LVU623
	movq	-624(%rbp), %rax
	testq	%rax, %rax
	je	.L596
	testb	$7, %al
	jne	.L596
.L597:
	.loc 12 1077 9 view .LVU624
	leaq	8(%r13), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L846
	movq	8(%r13), %rax
	movq	%rax, -624(%rbp)
.LVL442:
	.loc 12 1077 9 view .LVU625
	leaq	-480(%r14), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L847
	movq	-624(%rbp), %rax
	movq	%rax, -480(%r14)
.LVL443:
	.loc 12 1077 9 view .LVU626
.LBE1732:
.LBE1731:
.LBE1730:
	.loc 7 904 16 discriminator 1 view .LVU627
	leaq	-480(%r14), %rax
	shrq	$3, %rax
	movb	$-8, 2147450880(%rax)
.LVL444:
	.loc 7 904 16 discriminator 1 view .LVU628
.LBE1729:
.LBE1728:
	.loc 15 238 62 discriminator 2 view .LVU629
	testq	%r13, %r13
	je	.L600
	testb	$7, %r13b
	jne	.L600
.L601:
.LVL445:
.LBB1737:
.LBI1737:
	.loc 7 883 7 is_stmt 1 view .LVU630
.LBB1738:
	.loc 7 884 16 is_stmt 0 view .LVU631
	leaq	-512(%r14), %rax
	shrq	$3, %rax
	movb	$0, 2147450880(%rax)
	.loc 7 884 45 discriminator 1 view .LVU632
	testq	%r13, %r13
	je	.L602
	testb	$7, %r13b
	jne	.L602
.L603:
	.loc 7 884 45 discriminator 1 view .LVU633
	testq	%r13, %r13
	je	.L604
	testb	$7, %r13b
	jne	.L604
.L605:
	.loc 7 884 45 discriminator 2 view .LVU634
	testq	%r13, %r13
	je	.L606
	testb	$7, %r13b
	jne	.L606
.L607:
.LVL446:
.LBB1739:
.LBI1739:
	.loc 12 1076 7 is_stmt 1 view .LVU635
.LBB1740:
.LBB1741:
	.loc 12 1077 9 is_stmt 0 view .LVU636
	testq	%r13, %r13
	je	.L608
	testb	$7, %r13b
	jne	.L608
.L609:
	.loc 12 1077 9 view .LVU637
	movq	%r13, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L848
	movq	0(%r13), %rax
	movq	%rax, -616(%rbp)
	leaq	-512(%r14), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L849
	movq	-616(%rbp), %rax
	movq	%rax, -512(%r14)
.LVL447:
	.loc 12 1077 9 view .LVU638
.LBE1741:
.LBE1740:
.LBE1739:
	.loc 7 884 16 discriminator 1 view .LVU639
	leaq	-512(%r14), %rax
	shrq	$3, %rax
	movb	$-8, 2147450880(%rax)
.LVL448:
	.loc 7 884 16 discriminator 1 view .LVU640
.LBE1738:
.LBE1737:
.LBB1746:
.LBI1746:
	.loc 7 1616 2 is_stmt 1 view .LVU641
.LBB1747:
	.loc 7 1619 40 is_stmt 0 view .LVU642
	testq	%rbx, %rbx
	je	.L612
	testb	$7, %bl
	jne	.L612
.L613:
	.loc 7 1619 40 view .LVU643
	testq	%rbx, %rbx
	je	.L614
	testb	$7, %bl
	jne	.L614
.L615:
.LVL449:
.LBB1748:
.LBI1748:
	.loc 7 378 7 is_stmt 1 view .LVU644
.LBB1749:
	.loc 7 381 34 is_stmt 0 discriminator 1 view .LVU645
	testq	%rbx, %rbx
	je	.L616
	testb	$7, %bl
	jne	.L616
.L617:
	.loc 7 381 33 discriminator 1 view .LVU646
	testq	%rbx, %rbx
	je	.L850
.L618:
.LVL450:
.LBB1750:
.LBI1750:
	.loc 9 481 7 is_stmt 1 view .LVU647
.LBB1751:
	.loc 9 482 28 is_stmt 0 view .LVU648
	testq	%rbx, %rbx
	je	.L851
.L619:
.LVL451:
.LBB1752:
.LBI1752:
	.loc 10 189 7 is_stmt 1 view .LVU649
.LBB1753:
	.loc 10 198 40 is_stmt 0 view .LVU650
	testq	%rbx, %rbx
	je	.L852
.L620:
.LVL452:
.LBB1754:
.LBI1754:
	.loc 11 126 7 is_stmt 1 view .LVU651
.LBB1755:
	.loc 11 134 46 is_stmt 0 view .LVU652
	testq	%rbx, %rbx
	je	.L853
.L621:
	.loc 11 134 2 discriminator 3 view .LVU653
	cmpq	$0, -600(%rbp)
	js	.L854
	.loc 11 151 48 view .LVU654
	movq	-600(%rbp), %rdi
	call	_Znwm
.LVL453:
	movq	%rax, %r13
.LVL454:
	.loc 11 151 48 view .LVU655
.LBE1755:
.LBE1754:
.LBE1753:
.LBE1752:
.LBE1751:
.LBE1750:
.LBE1749:
.LBE1748:
	.loc 7 1623 27 view .LVU656
	testq	%rbx, %rbx
	je	.L624
	testb	$7, %bl
	jne	.L624
.LVL455:
.L625:
	.loc 7 1623 27 view .LVU657
	testq	%rbx, %rbx
	je	.L626
	testb	$7, %bl
	jne	.L626
.L627:
.LVL456:
.LBB1763:
.LBI1763:
	.loc 7 301 7 is_stmt 1 view .LVU658
.LBB1764:
	.loc 7 302 22 is_stmt 0 view .LVU659
	testq	%rbx, %rbx
	je	.L628
	testb	$7, %bl
	jne	.L628
.L629:
	testq	%rbx, %rbx
	je	.L855
.L630:
.LVL457:
	.loc 7 302 22 view .LVU660
.LBE1764:
.LBE1763:
	.loc 7 1622 35 view .LVU661
	testq	%rbx, %rbx
	je	.L856
.L631:
.LVL458:
.LBB1766:
.LBI1766:
	.loc 13 366 5 is_stmt 1 view .LVU662
.LBB1767:
.LBI1767:
	.loc 13 163 5 view .LVU663
.LBB1768:
.LBB1769:
.LBI1769:
	.loc 13 145 9 view .LVU664
.LBB1770:
.LBI1770:
	.loc 14 624 5 view .LVU665
.LBB1771:
.LBI1771:
	.loc 14 538 5 view .LVU666
	leaq	-320(%r14), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L857
	movq	-624(%rbp), %rax
	movq	%rax, -320(%r14)
.LBB1772:
.LBI1772:
	.loc 12 1357 5 view .LVU667
	leaq	-288(%r14), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L858
	movq	-616(%rbp), %rax
	movq	%rax, -288(%r14)
.LBE1772:
.LBB1773:
.LBI1773:
	.loc 12 1357 5 view .LVU668
.LVL459:
	.loc 12 1357 5 is_stmt 0 view .LVU669
.LBE1773:
.LBB1774:
.LBI1774:
	.loc 14 532 5 is_stmt 1 view .LVU670
.LBB1775:
.LBI1775:
	.loc 14 497 5 view .LVU671
.LBB1776:
.LBB1777:
.LBI1777:
	.loc 14 433 2 view .LVU672
.LBB1778:
	.loc 14 435 20 is_stmt 0 view .LVU673
	movq	-624(%rbp), %r14
	subq	%rax, %r14
.LVL460:
	.loc 14 436 4 discriminator 1 view .LVU674
	cmpq	$1, %r14
	jle	.L634
	.loc 14 437 23 view .LVU675
	testq	%r13, %r13
	je	.L859
.L635:
	.loc 14 437 23 view .LVU676
	cmpq	$0, -616(%rbp)
	je	.L860
.L636:
	movq	%r14, %rdx
	movq	-616(%rbp), %rsi
	movq	%r13, %rdi
	call	memmove@PLT
.LVL461:
.L637:
	.loc 14 441 22 view .LVU677
	leaq	(%r14,%r13), %rdx
	testq	%r14, %r14
	js	.L642
	cmpq	%r13, %rdx
	jnb	.L643
.L644:
	movq	%r13, %rsi
	leaq	.Lubsan_data1013(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL462:
	jmp	.L643
.LVL463:
.L839:
	.loc 14 441 22 view .LVU678
.LBE1778:
.LBE1777:
.LBE1776:
.LBE1775:
.LBE1774:
.LBE1771:
.LBE1770:
.LBE1769:
.LBE1768:
.LBE1767:
.LBE1766:
.LBE1747:
.LBE1746:
.LBE1727:
.LBE1723:
.LBE1719:
.LBE1718:
	.loc 15 210 5 view .LVU679
	movl	$512, %edi
	call	__asan_stack_malloc_3@PLT
.LVL464:
	.loc 15 210 5 view .LVU680
	testq	%rax, %rax
	cmovne	%rax, %r15
	jmp	.L562
.L567:
.LBB1946:
.LBB1944:
	.loc 15 235 37 view .LVU681
	movq	%r13, %rsi
	leaq	.Lubsan_data970(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL465:
	jmp	.L568
.LVL466:
.L569:
.LBB1941:
.LBB1722:
	.loc 7 993 40 view .LVU682
	movq	%r13, %rsi
	leaq	.Lubsan_data971(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL467:
	jmp	.L570
.L840:
	.loc 7 993 40 view .LVU683
	movq	%r13, %rsi
	leaq	.Lubsan_data972(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL468:
	jmp	.L571
.L841:
	.loc 7 993 40 view .LVU684
	movq	-624(%rbp), %rdi
	call	__asan_report_load8@PLT
.LVL469:
.L573:
	.loc 7 993 66 view .LVU685
	movq	%r13, %rsi
	leaq	.Lubsan_data973(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL470:
	jmp	.L574
.L842:
	.loc 7 993 66 view .LVU686
	movq	%r13, %rdi
	call	__asan_report_load8@PLT
.LVL471:
.L576:
	.loc 7 993 66 view .LVU687
.LBE1722:
.LBE1941:
.LBB1942:
	.loc 15 236 25 view .LVU688
	movq	%rbx, %rsi
	leaq	.Lubsan_data974(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL472:
	.loc 15 236 25 view .LVU689
	jmp	.L577
.LVL473:
.L578:
.LBB1817:
.LBB1726:
	.loc 7 1079 40 view .LVU690
	movq	%rbx, %rsi
	leaq	.Lubsan_data975(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL474:
	jmp	.L579
.L843:
	.loc 7 1079 40 view .LVU691
	movq	%rbx, %rsi
	leaq	.Lubsan_data976(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL475:
	jmp	.L580
.L844:
	.loc 7 1079 40 view .LVU692
	movq	-648(%rbp), %rdi
	call	__asan_report_load8@PLT
.LVL476:
.L582:
	.loc 7 1080 21 view .LVU693
	movq	%rbx, %rsi
	leaq	.Lubsan_data977(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL477:
	jmp	.L583
.L845:
	.loc 7 1080 21 view .LVU694
	movq	%rbx, %rdi
	call	__asan_report_load8@PLT
.LVL478:
.L586:
	.loc 7 1080 21 view .LVU695
.LBE1726:
.LBE1817:
.LBB1818:
	.loc 15 238 44 view .LVU696
	movq	%rbx, %rsi
	leaq	.Lubsan_data978(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL479:
	jmp	.L587
.L588:
	.loc 15 239 17 view .LVU697
	movq	%r13, %rsi
	leaq	.Lubsan_data979(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL480:
	jmp	.L589
.LVL481:
.L590:
.LBB1795:
.LBB1736:
	.loc 7 904 45 discriminator 1 view .LVU698
	movq	%r13, %rsi
	leaq	.Lubsan_data980(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL482:
	jmp	.L591
.L592:
	.loc 7 904 45 discriminator 1 view .LVU699
	movq	-624(%rbp), %rsi
	leaq	.Lubsan_data981(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL483:
	jmp	.L593
.L594:
	.loc 7 904 45 discriminator 2 view .LVU700
	movq	%r13, %rsi
	leaq	.Lubsan_data982(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL484:
	jmp	.L595
.LVL485:
.L596:
.LBB1735:
.LBB1734:
.LBB1733:
	.loc 12 1077 9 view .LVU701
	movq	-624(%rbp), %rsi
	leaq	.Lubsan_data983(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL486:
	.loc 12 1077 9 view .LVU702
	jmp	.L597
.L846:
	.loc 12 1077 9 view .LVU703
	call	__asan_report_load8@PLT
.LVL487:
.L847:
	.loc 12 1077 9 view .LVU704
	call	__asan_report_store8@PLT
.LVL488:
.L600:
	.loc 12 1077 9 view .LVU705
.LBE1733:
.LBE1734:
.LBE1735:
.LBE1736:
.LBE1795:
	.loc 15 238 62 discriminator 2 view .LVU706
	movq	%r13, %rsi
	leaq	.Lubsan_data985(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL489:
	jmp	.L601
.LVL490:
.L602:
.LBB1796:
.LBB1745:
	.loc 7 884 45 discriminator 1 view .LVU707
	movq	%r13, %rsi
	leaq	.Lubsan_data986(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL491:
	jmp	.L603
.L604:
	.loc 7 884 45 discriminator 1 view .LVU708
	movq	%r13, %rsi
	leaq	.Lubsan_data987(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL492:
	jmp	.L605
.L606:
	.loc 7 884 45 discriminator 2 view .LVU709
	movq	%r13, %rsi
	leaq	.Lubsan_data988(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL493:
	jmp	.L607
.LVL494:
.L608:
.LBB1744:
.LBB1743:
.LBB1742:
	.loc 12 1077 9 view .LVU710
	movq	%r13, %rsi
	leaq	.Lubsan_data989(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL495:
	jmp	.L609
.L848:
	.loc 12 1077 9 view .LVU711
	movq	%r13, %rdi
	call	__asan_report_load8@PLT
.LVL496:
.L849:
	.loc 12 1077 9 view .LVU712
	call	__asan_report_store8@PLT
.LVL497:
.L612:
	.loc 12 1077 9 view .LVU713
.LBE1742:
.LBE1743:
.LBE1744:
.LBE1745:
.LBE1796:
.LBB1797:
.LBB1794:
	.loc 7 1619 40 view .LVU714
	movq	%rbx, %rsi
	leaq	.Lubsan_data991(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL498:
	jmp	.L613
.L614:
	.loc 7 1619 40 view .LVU715
	movq	%rbx, %rsi
	leaq	.Lubsan_data992(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL499:
	jmp	.L615
.LVL500:
.L616:
.LBB1791:
.LBB1762:
	.loc 7 381 34 discriminator 1 view .LVU716
	movq	%rbx, %rsi
	leaq	.Lubsan_data993(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL501:
	jmp	.L617
.L850:
	.loc 7 381 33 discriminator 1 view .LVU717
	movl	$0, %esi
	leaq	.Lubsan_data994(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL502:
	jmp	.L618
.LVL503:
.L851:
.LBB1761:
.LBB1760:
	.loc 9 482 28 view .LVU718
	movl	$0, %esi
	leaq	.Lubsan_data995(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL504:
	jmp	.L619
.LVL505:
.L852:
.LBB1759:
.LBB1758:
	.loc 10 198 40 view .LVU719
	movl	$0, %esi
	leaq	.Lubsan_data996(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL506:
	jmp	.L620
.LVL507:
.L853:
.LBB1757:
.LBB1756:
	.loc 11 134 46 view .LVU720
	movl	$0, %esi
	leaq	.Lubsan_data997(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL508:
	jmp	.L621
.L854:
	.loc 11 140 28 view .LVU721
	call	__asan_handle_no_return@PLT
.LVL509:
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L861
	call	_ZSt17__throw_bad_allocv@PLT
.LVL510:
.L861:
	call	__stack_chk_fail@PLT
.LVL511:
.L624:
	.loc 11 140 28 view .LVU722
.LBE1756:
.LBE1757:
.LBE1758:
.LBE1759:
.LBE1760:
.LBE1761:
.LBE1762:
.LBE1791:
	.loc 7 1623 27 view .LVU723
	movq	%rbx, %rsi
	leaq	.Lubsan_data998(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL512:
	.loc 7 1623 27 view .LVU724
	jmp	.L625
.L626:
	.loc 7 1623 27 view .LVU725
	movq	%rbx, %rsi
	leaq	.Lubsan_data999(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL513:
	jmp	.L627
.LVL514:
.L628:
.LBB1792:
.LBB1765:
	.loc 7 302 22 view .LVU726
	movq	%rbx, %rsi
	leaq	.Lubsan_data1000(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL515:
	jmp	.L629
.L855:
	.loc 7 302 22 view .LVU727
	movl	$0, %esi
	leaq	.Lubsan_data1001(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL516:
	jmp	.L630
.LVL517:
.L856:
	.loc 7 302 22 view .LVU728
.LBE1765:
.LBE1792:
	.loc 7 1622 35 view .LVU729
	movl	$0, %esi
	leaq	.Lubsan_data1002(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL518:
	jmp	.L631
.LVL519:
.L857:
	.loc 7 1622 35 view .LVU730
	call	__asan_report_store8@PLT
.LVL520:
.L858:
	.loc 7 1622 35 view .LVU731
	call	__asan_report_store8@PLT
.LVL521:
.L859:
.LBB1793:
.LBB1790:
.LBB1789:
.LBB1788:
.LBB1787:
.LBB1786:
.LBB1785:
.LBB1784:
.LBB1783:
.LBB1782:
.LBB1781:
	.loc 14 437 23 view .LVU732
	leaq	.Lubsan_data853(%rip), %rdi
	call	__ubsan_handle_nonnull_arg@PLT
.LVL522:
	.loc 14 437 23 view .LVU733
	jmp	.L635
.L860:
	.loc 14 437 23 view .LVU734
	leaq	.Lubsan_data854(%rip), %rdi
	call	__ubsan_handle_nonnull_arg@PLT
.LVL523:
	jmp	.L636
.LVL524:
.L634:
	.loc 14 438 9 view .LVU735
	jne	.L637
.LVL525:
.LBB1779:
.LBI1779:
	.loc 14 397 2 is_stmt 1 view .LVU736
.LBB1780:
	.loc 14 398 10 is_stmt 0 view .LVU737
	cmpq	$0, -616(%rbp)
	je	.L862
.LVL526:
.L638:
	.loc 14 398 10 view .LVU738
	movq	-616(%rbp), %rcx
	movq	%rcx, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	andl	$7, %ecx
	cmpb	%cl, %al
	jg	.L639
	testb	%al, %al
	jne	.L863
.L639:
	movq	-616(%rbp), %rax
	movzbl	(%rax), %eax
	movb	%al, -616(%rbp)
.LVL527:
	.loc 14 398 10 view .LVU739
	testq	%r13, %r13
	je	.L864
.L640:
	movq	%r13, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	movq	%r13, %rdx
	andl	$7, %edx
	cmpb	%dl, %al
	jg	.L641
	testb	%al, %al
	jne	.L865
.L641:
	movzbl	-616(%rbp), %eax
	movb	%al, 0(%r13)
.LVL528:
	.loc 14 398 21 view .LVU740
	jmp	.L637
.LVL529:
.L862:
	.loc 14 398 10 view .LVU741
	movl	$0, %esi
	leaq	.Lubsan_data1011(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL530:
	.loc 14 398 10 view .LVU742
	jmp	.L638
.L863:
	.loc 14 398 10 view .LVU743
	movq	-616(%rbp), %rdi
	call	__asan_report_load1@PLT
.LVL531:
.L864:
	.loc 14 398 10 view .LVU744
	movl	$0, %esi
	leaq	.Lubsan_data1012(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL532:
	jmp	.L640
.L865:
	.loc 14 398 10 view .LVU745
	movq	%r13, %rdi
	call	__asan_report_store1@PLT
.LVL533:
.L642:
	.loc 14 398 10 view .LVU746
.LBE1780:
.LBE1779:
	.loc 14 441 22 view .LVU747
	cmpq	%rdx, %r13
	jb	.L644
.L643:
.LVL534:
	.loc 14 441 22 view .LVU748
.LBE1781:
.LBE1782:
.LBE1783:
.LBE1784:
.LBE1785:
.LBE1786:
.LBE1787:
.LBE1788:
.LBE1789:
.LBE1790:
.LBE1793:
.LBE1794:
.LBE1797:
	.loc 15 241 27 view .LVU749
	testq	%rbx, %rbx
	je	.L645
	testb	$7, %bl
	jne	.L645
.L646:
	.loc 15 241 27 view .LVU750
	testq	%rbx, %rbx
	je	.L647
	testb	$7, %bl
	jne	.L647
.L648:
.LVL535:
.LBB1798:
.LBI1798:
	.loc 7 301 7 is_stmt 1 view .LVU751
.LBB1799:
	.loc 7 302 22 is_stmt 0 view .LVU752
	testq	%rbx, %rbx
	je	.L649
	testb	$7, %bl
	jne	.L649
.L650:
	testq	%rbx, %rbx
	je	.L866
.L651:
.LVL536:
	.loc 7 302 22 view .LVU753
.LBE1799:
.LBE1798:
	.loc 15 240 21 view .LVU754
	testq	%rbx, %rbx
	je	.L867
.L652:
	.loc 15 240 21 discriminator 1 view .LVU755
	testq	%rbx, %rbx
	je	.L653
	testb	$7, %bl
	jne	.L653
.L654:
	.loc 15 242 21 view .LVU756
	testq	%rbx, %rbx
	je	.L655
	testb	$7, %bl
	jne	.L655
.L656:
	testq	%rbx, %rbx
	je	.L657
	testb	$7, %bl
	jne	.L657
.L658:
	.loc 15 243 22 view .LVU757
	testq	%rbx, %rbx
	je	.L659
	testb	$7, %bl
	jne	.L659
.L660:
	.loc 15 244 24 view .LVU758
	testq	%rbx, %rbx
	je	.L661
	testb	$7, %bl
	jne	.L661
.L662:
	movq	%rbx, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L868
	movq	(%rbx), %r14
	.loc 15 242 21 view .LVU759
	testq	%rbx, %rbx
	je	.L664
	testb	$7, %bl
	jne	.L664
.L665:
.LVL537:
.LBB1801:
.LBI1801:
	.loc 7 386 7 is_stmt 1 view .LVU760
.LBB1802:
	.loc 7 389 2 is_stmt 0 view .LVU761
	testq	%r14, %r14
	je	.L666
	.loc 7 390 20 view .LVU762
	testq	%rbx, %rbx
	je	.L667
	testb	$7, %bl
	jne	.L667
.L668:
	.loc 7 390 19 view .LVU763
	testq	%rbx, %rbx
	je	.L869
.L669:
.LVL538:
.LBB1803:
.LBI1803:
	.loc 9 516 7 is_stmt 1 view .LVU764
.LBB1804:
	.loc 9 517 23 is_stmt 0 view .LVU765
	testq	%rbx, %rbx
	je	.L870
.L670:
.LVL539:
.LBB1805:
.LBI1805:
	.loc 10 203 7 is_stmt 1 view .LVU766
.LBB1806:
	.loc 10 210 35 is_stmt 0 view .LVU767
	testq	%rbx, %rbx
	je	.L871
.L671:
.LVL540:
.LBB1807:
.LBI1807:
	.loc 11 156 7 is_stmt 1 view .LVU768
.LBB1808:
.LBI1808:
	.loc 1 27 6 view .LVU769
.LBB1809:
	.loc 1 27 51 view .LVU770
	.loc 1 27 60 is_stmt 0 view .LVU771
	movq	%r14, %rdi
	call	free@PLT
.LVL541:
.L666:
	.loc 1 27 60 view .LVU772
.LBE1809:
.LBE1808:
.LBE1807:
.LBE1806:
.LBE1805:
.LBE1804:
.LBE1803:
.LBE1802:
.LBE1801:
	.loc 15 245 31 view .LVU773
	testq	%rbx, %rbx
	je	.L672
	testb	$7, %bl
	jne	.L672
.L673:
	movq	%rbx, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L872
	movq	%r13, (%rbx)
	.loc 15 246 56 view .LVU774
	testq	%rbx, %rbx
	je	.L675
	.loc 15 246 56 view .LVU775
	testb	$7, %bl
	jne	.L675
.L676:
	.loc 15 246 65 view .LVU776
	movq	-600(%rbp), %rax
	leaq	0(%r13,%rax), %rdx
	testq	%rax, %rax
	js	.L677
	cmpq	%r13, %rdx
	jnb	.L678
.L679:
	movq	%r13, %rsi
	leaq	.Lubsan_data1031(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL542:
	jmp	.L678
.L645:
	.loc 15 241 27 view .LVU777
	movq	%rbx, %rsi
	leaq	.Lubsan_data1014(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL543:
	jmp	.L646
.L647:
	.loc 15 241 27 view .LVU778
	movq	%rbx, %rsi
	leaq	.Lubsan_data1015(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL544:
	jmp	.L648
.LVL545:
.L649:
.LBB1815:
.LBB1800:
	.loc 7 302 22 view .LVU779
	movq	%rbx, %rsi
	leaq	.Lubsan_data1016(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL546:
	jmp	.L650
.L866:
	.loc 7 302 22 view .LVU780
	movl	$0, %esi
	leaq	.Lubsan_data1017(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL547:
	jmp	.L651
.LVL548:
.L867:
	.loc 7 302 22 view .LVU781
.LBE1800:
.LBE1815:
	.loc 15 240 21 view .LVU782
	movl	$0, %esi
	leaq	.Lubsan_data1018(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL549:
	jmp	.L652
.L653:
	.loc 15 240 21 discriminator 1 view .LVU783
	movq	%rbx, %rsi
	leaq	.Lubsan_data1019(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL550:
	jmp	.L654
.L655:
	.loc 15 242 21 view .LVU784
	movq	%rbx, %rsi
	leaq	.Lubsan_data1020(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL551:
	jmp	.L656
.L657:
	.loc 15 242 21 view .LVU785
	movq	%rbx, %rsi
	leaq	.Lubsan_data1021(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL552:
	jmp	.L658
.L659:
	.loc 15 243 22 view .LVU786
	movq	%rbx, %rsi
	leaq	.Lubsan_data1022(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL553:
	jmp	.L660
.L661:
	.loc 15 244 24 view .LVU787
	movq	%rbx, %rsi
	leaq	.Lubsan_data1023(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL554:
	jmp	.L662
.L868:
	.loc 15 244 24 view .LVU788
	movq	%rbx, %rdi
	call	__asan_report_load8@PLT
.LVL555:
.L664:
	.loc 15 242 21 view .LVU789
	movq	%rbx, %rsi
	leaq	.Lubsan_data1024(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL556:
	jmp	.L665
.LVL557:
.L667:
.LBB1816:
.LBB1814:
	.loc 7 390 20 view .LVU790
	movq	%rbx, %rsi
	leaq	.Lubsan_data1025(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL558:
	jmp	.L668
.L869:
	.loc 7 390 19 view .LVU791
	movl	$0, %esi
	leaq	.Lubsan_data1026(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL559:
	jmp	.L669
.LVL560:
.L870:
.LBB1813:
.LBB1812:
	.loc 9 517 23 view .LVU792
	movl	$0, %esi
	leaq	.Lubsan_data1027(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL561:
	jmp	.L670
.LVL562:
.L871:
.LBB1811:
.LBB1810:
	.loc 10 210 35 view .LVU793
	movl	$0, %esi
	leaq	.Lubsan_data1028(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL563:
	jmp	.L671
.LVL564:
.L672:
	.loc 10 210 35 view .LVU794
.LBE1810:
.LBE1811:
.LBE1812:
.LBE1813:
.LBE1814:
.LBE1816:
	.loc 15 245 31 view .LVU795
	movq	%rbx, %rsi
	leaq	.Lubsan_data1029(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL565:
	jmp	.L673
.L872:
	.loc 15 245 31 view .LVU796
	movq	%rbx, %rdi
	call	__asan_report_store8@PLT
.LVL566:
.L675:
	.loc 15 246 56 view .LVU797
	movq	%rbx, %rsi
	leaq	.Lubsan_data1030(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL567:
	jmp	.L676
.L677:
	.loc 15 246 65 view .LVU798
	cmpq	%rdx, %r13
	jb	.L679
.L678:
	.loc 15 246 65 view .LVU799
	movq	-600(%rbp), %rax
	addq	%rax, %r13
.LVL568:
	.loc 15 246 40 view .LVU800
	testq	%rbx, %rbx
	je	.L680
	testb	$7, %bl
	jne	.L680
.L681:
	movq	-648(%rbp), %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L873
	movq	%r13, 16(%rbx)
.LVL569:
.L683:
	.loc 15 246 40 view .LVU801
.LBE1818:
.LBE1942:
	.loc 15 262 44 view .LVU802
	testq	%rbx, %rbx
	je	.L826
	testb	$7, %bl
	jne	.L826
.L827:
	movq	%rbx, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L874
	movq	(%rbx), %r13
	.loc 15 262 53 view .LVU803
	movq	-600(%rbp), %rax
	leaq	0(%r13,%rax), %rdx
	testq	%rax, %rax
	js	.L829
	cmpq	%r13, %rdx
	jnb	.L830
.L831:
	movq	%r13, %rsi
	leaq	.Lubsan_data1113(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL570:
	jmp	.L830
.LVL571:
.L680:
.LBB1943:
.LBB1819:
	.loc 15 246 40 view .LVU804
	movq	%rbx, %rsi
	leaq	.Lubsan_data1032(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL572:
	jmp	.L681
.L873:
	.loc 15 246 40 view .LVU805
	movq	-648(%rbp), %rdi
	call	__asan_report_store8@PLT
.LVL573:
.L585:
	.loc 15 246 40 view .LVU806
.LBE1819:
	.loc 15 248 17 view .LVU807
	testq	%rbx, %rbx
	je	.L684
	testb	$7, %bl
	jne	.L684
.L685:
.LVL574:
.LBB1820:
.LBI1820:
	.loc 7 992 7 is_stmt 1 view .LVU808
.LBB1821:
	.loc 7 993 40 is_stmt 0 view .LVU809
	testq	%rbx, %rbx
	je	.L686
	testb	$7, %bl
	jne	.L686
.L687:
	.loc 7 993 40 view .LVU810
	leaq	8(%rbx), %rax
	movq	%rax, -648(%rbp)
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L875
	movq	8(%rbx), %rax
	movq	%rax, -632(%rbp)
	.loc 7 993 66 view .LVU811
	testq	%rbx, %rbx
	je	.L689
	testb	$7, %bl
	jne	.L689
.L690:
	.loc 7 993 50 view .LVU812
	movq	-632(%rbp), %rax
	movq	-616(%rbp), %rsi
	subq	%rsi, %rax
	movq	%rax, -632(%rbp)
.LVL575:
	.loc 7 993 50 view .LVU813
.LBE1821:
.LBE1820:
	.loc 15 248 9 discriminator 2 view .LVU814
	movq	-600(%rbp), %rsi
	cmpq	%rsi, %rax
	jb	.L691
	.loc 15 251 34 view .LVU815
	testq	%rbx, %rbx
	je	.L692
	testb	$7, %bl
	jne	.L692
.L693:
	testq	%rbx, %rbx
	je	.L694
	testb	$7, %bl
	jne	.L694
.L695:
.LVL576:
.LBB1823:
.LBI1823:
	.loc 7 301 7 is_stmt 1 view .LVU816
.LBB1824:
	.loc 7 302 22 is_stmt 0 view .LVU817
	testq	%rbx, %rbx
	je	.L696
	testb	$7, %bl
	jne	.L696
.L697:
	.loc 7 302 22 view .LVU818
	testq	%rbx, %rbx
	je	.L876
.L698:
.LVL577:
	.loc 7 302 22 view .LVU819
.LBE1824:
.LBE1823:
	.loc 15 250 21 view .LVU820
	testq	%rbx, %rbx
	je	.L877
.L699:
	.loc 15 251 11 view .LVU821
	testq	%rbx, %rbx
	je	.L700
	testb	$7, %bl
	jne	.L700
.L701:
.LVL578:
.LBB1826:
.LBI1826:
	.loc 7 893 7 is_stmt 1 view .LVU822
.LBB1827:
	.loc 7 894 39 is_stmt 0 discriminator 1 view .LVU823
	testq	%rbx, %rbx
	je	.L702
	testb	$7, %bl
	jne	.L702
.L703:
	.loc 7 894 39 discriminator 1 view .LVU824
	movq	-648(%rbp), %rax
	testq	%rax, %rax
	je	.L704
	testb	$7, %al
	jne	.L704
.L705:
.LVL579:
.LBB1828:
.LBI1828:
	.loc 12 1076 7 is_stmt 1 view .LVU825
.LBB1829:
.LBB1830:
	.loc 12 1077 9 is_stmt 0 view .LVU826
	movq	-648(%rbp), %rax
	testq	%rax, %rax
	je	.L706
	testb	$7, %al
	jne	.L706
.L707:
	.loc 12 1077 9 view .LVU827
	leaq	8(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L878
	movq	8(%rbx), %rax
	leaq	-352(%r14), %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L879
	movq	%rax, -352(%r14)
.LVL580:
	.loc 12 1077 9 view .LVU828
.LBE1830:
.LBE1829:
.LBE1828:
	.loc 7 894 16 discriminator 1 view .LVU829
	leaq	-352(%r14), %rax
	shrq	$3, %rax
	movb	$-8, 2147450880(%rax)
.LVL581:
	.loc 7 894 16 discriminator 1 view .LVU830
.LBE1827:
.LBE1826:
	.loc 15 250 61 discriminator 2 view .LVU831
	testq	%rbx, %rbx
	je	.L710
	testb	$7, %bl
	jne	.L710
.L711:
.LVL582:
.LBB1835:
.LBI1835:
	.loc 7 873 7 is_stmt 1 view .LVU832
.LBB1836:
	.loc 7 874 16 is_stmt 0 view .LVU833
	leaq	-384(%r14), %rax
	shrq	$3, %rax
	movb	$0, 2147450880(%rax)
	.loc 7 874 39 discriminator 1 view .LVU834
	testq	%rbx, %rbx
	je	.L712
	testb	$7, %bl
	jne	.L712
.L713:
	.loc 7 874 39 discriminator 1 view .LVU835
	testq	%rbx, %rbx
	je	.L714
	testb	$7, %bl
	jne	.L714
.L715:
.LVL583:
.LBB1837:
.LBI1837:
	.loc 12 1076 7 is_stmt 1 view .LVU836
.LBB1838:
.LBB1839:
	.loc 12 1077 9 is_stmt 0 view .LVU837
	testq	%rbx, %rbx
	je	.L716
	testb	$7, %bl
	jne	.L716
.L717:
	.loc 12 1077 9 view .LVU838
	movq	%rbx, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L880
	movq	(%rbx), %rax
	movq	%rax, -616(%rbp)
	leaq	-384(%r14), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L881
	movq	-616(%rbp), %rax
	movq	%rax, -384(%r14)
.LVL584:
	.loc 12 1077 9 view .LVU839
.LBE1839:
.LBE1838:
.LBE1837:
	.loc 7 874 16 discriminator 1 view .LVU840
	leaq	-384(%r14), %rax
	shrq	$3, %rax
	movb	$-8, 2147450880(%rax)
.LVL585:
	.loc 7 874 16 discriminator 1 view .LVU841
.LBE1836:
.LBE1835:
	.loc 15 250 52 discriminator 4 view .LVU842
	testq	%r13, %r13
	je	.L720
	testb	$7, %r13b
	jne	.L720
.L721:
.LVL586:
.LBB1844:
.LBI1844:
	.loc 7 903 7 is_stmt 1 view .LVU843
.LBB1845:
	.loc 7 904 16 is_stmt 0 view .LVU844
	leaq	-416(%r14), %rax
	shrq	$3, %rax
	movb	$0, 2147450880(%rax)
	.loc 7 904 45 discriminator 1 view .LVU845
	testq	%r13, %r13
	je	.L722
	testb	$7, %r13b
	jne	.L722
.L723:
	.loc 7 904 45 discriminator 1 view .LVU846
	movq	-624(%rbp), %rax
	testq	%rax, %rax
	je	.L724
	testb	$7, %al
	jne	.L724
.L725:
	.loc 7 904 45 discriminator 2 view .LVU847
	testq	%r13, %r13
	je	.L726
	testb	$7, %r13b
	jne	.L726
.L727:
.LVL587:
.LBB1846:
.LBI1846:
	.loc 12 1076 7 is_stmt 1 view .LVU848
.LBB1847:
.LBB1848:
	.loc 12 1077 9 is_stmt 0 view .LVU849
	movq	-624(%rbp), %rax
	testq	%rax, %rax
	je	.L728
	testb	$7, %al
	jne	.L728
.L729:
	.loc 12 1077 9 view .LVU850
	leaq	8(%r13), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L882
	movq	8(%r13), %rax
	movq	%rax, -632(%rbp)
	leaq	-416(%r14), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L883
	movq	-632(%rbp), %rax
	movq	%rax, -416(%r14)
.LVL588:
	.loc 12 1077 9 view .LVU851
.LBE1848:
.LBE1847:
.LBE1846:
	.loc 7 904 16 discriminator 1 view .LVU852
	leaq	-416(%r14), %rax
	shrq	$3, %rax
	movb	$-8, 2147450880(%rax)
.LVL589:
	.loc 7 904 16 discriminator 1 view .LVU853
.LBE1845:
.LBE1844:
	.loc 15 250 41 discriminator 6 view .LVU854
	testq	%r13, %r13
	je	.L732
	testb	$7, %r13b
	jne	.L732
.L733:
.LVL590:
.LBB1853:
.LBI1853:
	.loc 7 883 7 is_stmt 1 view .LVU855
.LBB1854:
	.loc 7 884 16 is_stmt 0 view .LVU856
	leaq	-448(%r14), %rax
	shrq	$3, %rax
	movb	$0, 2147450880(%rax)
	.loc 7 884 45 discriminator 1 view .LVU857
	testq	%r13, %r13
	je	.L734
	testb	$7, %r13b
	jne	.L734
.L735:
	.loc 7 884 45 discriminator 1 view .LVU858
	testq	%r13, %r13
	je	.L736
	testb	$7, %r13b
	jne	.L736
.L737:
	.loc 7 884 45 discriminator 2 view .LVU859
	testq	%r13, %r13
	je	.L738
	testb	$7, %r13b
	jne	.L738
.L739:
.LVL591:
.LBB1855:
.LBI1855:
	.loc 12 1076 7 is_stmt 1 view .LVU860
.LBB1856:
.LBB1857:
	.loc 12 1077 9 is_stmt 0 view .LVU861
	testq	%r13, %r13
	je	.L740
	testb	$7, %r13b
	jne	.L740
.L741:
	.loc 12 1077 9 view .LVU862
	movq	%r13, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L884
	movq	0(%r13), %rax
	movq	%rax, -624(%rbp)
	leaq	-448(%r14), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L885
	movq	-624(%rbp), %rax
	movq	%rax, -448(%r14)
.LVL592:
	.loc 12 1077 9 view .LVU863
.LBE1857:
.LBE1856:
.LBE1855:
	.loc 7 884 16 discriminator 1 view .LVU864
	leaq	-448(%r14), %rax
	shrq	$3, %rax
	movb	$-8, 2147450880(%rax)
.LVL593:
	.loc 7 884 16 discriminator 1 view .LVU865
.LBE1854:
.LBE1853:
.LBB1862:
.LBI1862:
	.loc 14 624 5 is_stmt 1 view .LVU866
.LBB1863:
.LBI1863:
	.loc 14 538 5 view .LVU867
	leaq	-256(%r14), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L886
	movq	-616(%rbp), %rax
	movq	%rax, -256(%r14)
.LBB1864:
.LBI1864:
	.loc 12 1357 5 view .LVU868
	leaq	-224(%r14), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L887
	movq	-632(%rbp), %rax
	movq	%rax, -224(%r14)
.LBE1864:
.LBB1865:
.LBI1865:
	.loc 12 1357 5 view .LVU869
	leaq	-192(%r14), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L888
	movq	-624(%rbp), %rax
	movq	%rax, -192(%r14)
.LBE1865:
.LBB1866:
.LBI1866:
	.loc 12 1357 5 view .LVU870
.LVL594:
	.loc 12 1357 5 is_stmt 0 view .LVU871
.LBE1866:
.LBB1867:
.LBI1867:
	.loc 14 532 5 is_stmt 1 view .LVU872
.LBB1868:
.LBI1868:
	.loc 14 497 5 view .LVU873
.LBB1869:
.LBB1870:
.LBI1870:
	.loc 14 433 2 view .LVU874
.LBB1871:
	.loc 14 435 20 is_stmt 0 view .LVU875
	movq	-632(%rbp), %r13
.LVL595:
	.loc 14 435 20 view .LVU876
	subq	%rax, %r13
.LVL596:
	.loc 14 436 4 discriminator 1 view .LVU877
	cmpq	$1, %r13
	jle	.L747
	.loc 14 437 23 view .LVU878
	cmpq	$0, -616(%rbp)
	je	.L889
.L748:
	.loc 14 437 23 view .LVU879
	cmpq	$0, -624(%rbp)
	je	.L890
.L749:
	movq	%r13, %rdx
	movq	-624(%rbp), %rsi
	movq	-616(%rbp), %rdi
	call	memmove@PLT
.LVL597:
.L750:
	.loc 14 441 22 view .LVU880
	movq	-616(%rbp), %rax
	leaq	(%rax,%r13), %rdx
	testq	%r13, %r13
	js	.L755
	cmpq	%rax, %rdx
	jnb	.L756
.L757:
	movq	-616(%rbp), %rsi
	leaq	.Lubsan_data1077(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL598:
	jmp	.L756
.LVL599:
.L684:
	.loc 14 441 22 view .LVU881
.LBE1871:
.LBE1870:
.LBE1869:
.LBE1868:
.LBE1867:
.LBE1863:
.LBE1862:
	.loc 15 248 17 view .LVU882
	movq	%rbx, %rsi
	leaq	.Lubsan_data1033(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL600:
	jmp	.L685
.LVL601:
.L686:
.LBB1893:
.LBB1822:
	.loc 7 993 40 view .LVU883
	movq	%rbx, %rsi
	leaq	.Lubsan_data1034(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL602:
	jmp	.L687
.L875:
	.loc 7 993 40 view .LVU884
	movq	-648(%rbp), %rdi
	call	__asan_report_load8@PLT
.LVL603:
.L689:
	.loc 7 993 66 view .LVU885
	movq	%rbx, %rsi
	leaq	.Lubsan_data1035(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL604:
	jmp	.L690
.LVL605:
.L692:
	.loc 7 993 66 view .LVU886
.LBE1822:
.LBE1893:
	.loc 15 251 34 view .LVU887
	movq	%rbx, %rsi
	leaq	.Lubsan_data1036(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL606:
	jmp	.L693
.L694:
	.loc 15 251 34 view .LVU888
	movq	%rbx, %rsi
	leaq	.Lubsan_data1037(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL607:
	jmp	.L695
.LVL608:
.L696:
.LBB1894:
.LBB1825:
	.loc 7 302 22 view .LVU889
	movq	%rbx, %rsi
	leaq	.Lubsan_data1038(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL609:
	jmp	.L697
.L876:
	.loc 7 302 22 view .LVU890
	movl	$0, %esi
	leaq	.Lubsan_data1039(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL610:
	jmp	.L698
.LVL611:
.L877:
	.loc 7 302 22 view .LVU891
.LBE1825:
.LBE1894:
	.loc 15 250 21 view .LVU892
	movl	$0, %esi
	leaq	.Lubsan_data1040(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL612:
	jmp	.L699
.L700:
	.loc 15 251 11 view .LVU893
	movq	%rbx, %rsi
	leaq	.Lubsan_data1041(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL613:
	jmp	.L701
.LVL614:
.L702:
.LBB1895:
.LBB1834:
	.loc 7 894 39 discriminator 1 view .LVU894
	movq	%rbx, %rsi
	leaq	.Lubsan_data1042(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL615:
	jmp	.L703
.L704:
	.loc 7 894 39 discriminator 1 view .LVU895
	movq	-648(%rbp), %rsi
	leaq	.Lubsan_data1043(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL616:
	jmp	.L705
.LVL617:
.L706:
.LBB1833:
.LBB1832:
.LBB1831:
	.loc 12 1077 9 view .LVU896
	movq	-648(%rbp), %rsi
	leaq	.Lubsan_data1044(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL618:
	.loc 12 1077 9 view .LVU897
	jmp	.L707
.L878:
	.loc 12 1077 9 view .LVU898
	call	__asan_report_load8@PLT
.LVL619:
.L879:
	.loc 12 1077 9 view .LVU899
	call	__asan_report_store8@PLT
.LVL620:
.L710:
	.loc 12 1077 9 view .LVU900
.LBE1831:
.LBE1832:
.LBE1833:
.LBE1834:
.LBE1895:
	.loc 15 250 61 discriminator 2 view .LVU901
	movq	%rbx, %rsi
	leaq	.Lubsan_data1046(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL621:
	jmp	.L711
.LVL622:
.L712:
.LBB1896:
.LBB1843:
	.loc 7 874 39 discriminator 1 view .LVU902
	movq	%rbx, %rsi
	leaq	.Lubsan_data1047(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL623:
	jmp	.L713
.L714:
	.loc 7 874 39 discriminator 1 view .LVU903
	movq	%rbx, %rsi
	leaq	.Lubsan_data1048(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL624:
	jmp	.L715
.LVL625:
.L716:
.LBB1842:
.LBB1841:
.LBB1840:
	.loc 12 1077 9 view .LVU904
	movq	%rbx, %rsi
	leaq	.Lubsan_data1049(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL626:
	jmp	.L717
.L880:
	.loc 12 1077 9 view .LVU905
	movq	%rbx, %rdi
	call	__asan_report_load8@PLT
.LVL627:
.L881:
	.loc 12 1077 9 view .LVU906
	call	__asan_report_store8@PLT
.LVL628:
.L720:
	.loc 12 1077 9 view .LVU907
.LBE1840:
.LBE1841:
.LBE1842:
.LBE1843:
.LBE1896:
	.loc 15 250 52 discriminator 4 view .LVU908
	movq	%r13, %rsi
	leaq	.Lubsan_data1051(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL629:
	jmp	.L721
.LVL630:
.L722:
.LBB1897:
.LBB1852:
	.loc 7 904 45 discriminator 1 view .LVU909
	movq	%r13, %rsi
	leaq	.Lubsan_data1052(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL631:
	jmp	.L723
.L724:
	.loc 7 904 45 discriminator 1 view .LVU910
	movq	-624(%rbp), %rsi
	leaq	.Lubsan_data1053(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL632:
	jmp	.L725
.L726:
	.loc 7 904 45 discriminator 2 view .LVU911
	movq	%r13, %rsi
	leaq	.Lubsan_data1054(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL633:
	jmp	.L727
.LVL634:
.L728:
.LBB1851:
.LBB1850:
.LBB1849:
	.loc 12 1077 9 view .LVU912
	movq	-624(%rbp), %rsi
	leaq	.Lubsan_data1055(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL635:
	.loc 12 1077 9 view .LVU913
	jmp	.L729
.L882:
	.loc 12 1077 9 view .LVU914
	call	__asan_report_load8@PLT
.LVL636:
.L883:
	.loc 12 1077 9 view .LVU915
	call	__asan_report_store8@PLT
.LVL637:
.L732:
	.loc 12 1077 9 view .LVU916
.LBE1849:
.LBE1850:
.LBE1851:
.LBE1852:
.LBE1897:
	.loc 15 250 41 discriminator 6 view .LVU917
	movq	%r13, %rsi
	leaq	.Lubsan_data1057(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL638:
	jmp	.L733
.LVL639:
.L734:
.LBB1898:
.LBB1861:
	.loc 7 884 45 discriminator 1 view .LVU918
	movq	%r13, %rsi
	leaq	.Lubsan_data1058(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL640:
	jmp	.L735
.L736:
	.loc 7 884 45 discriminator 1 view .LVU919
	movq	%r13, %rsi
	leaq	.Lubsan_data1059(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL641:
	jmp	.L737
.L738:
	.loc 7 884 45 discriminator 2 view .LVU920
	movq	%r13, %rsi
	leaq	.Lubsan_data1060(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL642:
	jmp	.L739
.LVL643:
.L740:
.LBB1860:
.LBB1859:
.LBB1858:
	.loc 12 1077 9 view .LVU921
	movq	%r13, %rsi
	leaq	.Lubsan_data1061(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL644:
	jmp	.L741
.L884:
	.loc 12 1077 9 view .LVU922
	movq	%r13, %rdi
	call	__asan_report_load8@PLT
.LVL645:
.L885:
	.loc 12 1077 9 view .LVU923
	call	__asan_report_store8@PLT
.LVL646:
.L886:
	.loc 12 1077 9 view .LVU924
	call	__asan_report_store8@PLT
.LVL647:
.L887:
	.loc 12 1077 9 view .LVU925
	call	__asan_report_store8@PLT
.LVL648:
.L888:
	.loc 12 1077 9 view .LVU926
	call	__asan_report_store8@PLT
.LVL649:
.L889:
	.loc 12 1077 9 view .LVU927
.LBE1858:
.LBE1859:
.LBE1860:
.LBE1861:
.LBE1898:
.LBB1899:
.LBB1892:
.LBB1878:
.LBB1877:
.LBB1876:
.LBB1875:
.LBB1874:
	.loc 14 437 23 view .LVU928
	leaq	.Lubsan_data853(%rip), %rdi
	call	__ubsan_handle_nonnull_arg@PLT
.LVL650:
	.loc 14 437 23 view .LVU929
	jmp	.L748
.L890:
	leaq	.Lubsan_data854(%rip), %rdi
	call	__ubsan_handle_nonnull_arg@PLT
.LVL651:
	jmp	.L749
.LVL652:
.L747:
	.loc 14 438 9 view .LVU930
	jne	.L750
.LVL653:
.LBB1872:
.LBI1872:
	.loc 14 397 2 is_stmt 1 view .LVU931
.LBB1873:
	.loc 14 398 10 is_stmt 0 view .LVU932
	cmpq	$0, -624(%rbp)
	je	.L891
.LVL654:
.L751:
	.loc 14 398 10 view .LVU933
	movq	-624(%rbp), %rcx
	movq	%rcx, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	andl	$7, %ecx
	cmpb	%cl, %al
	jg	.L752
	testb	%al, %al
	jne	.L892
.L752:
	movq	-624(%rbp), %rax
	movzbl	(%rax), %eax
	movb	%al, -624(%rbp)
.LVL655:
	.loc 14 398 10 view .LVU934
	cmpq	$0, -616(%rbp)
	je	.L893
.L753:
	movq	-616(%rbp), %rcx
	movq	%rcx, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	andl	$7, %ecx
	cmpb	%cl, %al
	jg	.L754
	testb	%al, %al
	jne	.L894
.L754:
	movq	-616(%rbp), %rax
	movzbl	-624(%rbp), %ecx
	movb	%cl, (%rax)
.LVL656:
	.loc 14 398 21 view .LVU935
	jmp	.L750
.LVL657:
.L891:
	.loc 14 398 10 view .LVU936
	movl	$0, %esi
	leaq	.Lubsan_data1075(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL658:
	.loc 14 398 10 view .LVU937
	jmp	.L751
.L892:
	movq	-624(%rbp), %rdi
	call	__asan_report_load1@PLT
.LVL659:
.L893:
	.loc 14 398 10 view .LVU938
	movl	$0, %esi
	leaq	.Lubsan_data1076(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL660:
	jmp	.L753
.L894:
	movq	-616(%rbp), %rdi
	call	__asan_report_store1@PLT
.LVL661:
.L755:
	.loc 14 398 10 view .LVU939
.LBE1873:
.LBE1872:
	.loc 14 441 22 view .LVU940
	cmpq	%rdx, -616(%rbp)
	jb	.L757
.L756:
	movq	-616(%rbp), %rax
	addq	%r13, %rax
	movq	%rax, -624(%rbp)
.LVL662:
	.loc 14 441 22 view .LVU941
	leaq	-160(%r14), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L895
	movq	-616(%rbp), %rax
	movq	%rax, -160(%r14)
.LVL663:
	.loc 14 441 22 view .LVU942
.LBE1874:
.LBE1875:
.LBE1876:
.LBE1877:
.LBE1878:
.LBB1879:
.LBI1879:
	.loc 14 331 5 is_stmt 1 view .LVU943
	leaq	-128(%r14), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L896
	leaq	-160(%r14), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L897
	movq	-160(%r14), %rax
	movq	%rax, -128(%r14)
.LBB1880:
.LBB1881:
.LBI1881:
	.loc 12 1357 5 view .LVU944
.LVL664:
	.loc 12 1357 5 is_stmt 0 view .LVU945
.LBE1881:
.LBB1882:
.LBI1882:
	.loc 12 1147 7 is_stmt 1 view .LVU946
.LBB1883:
	.loc 12 1148 16 is_stmt 0 view .LVU947
	leaq	-64(%r14), %rax
	shrq	$3, %rax
	movb	$0, 2147450880(%rax)
	.loc 12 1148 45 discriminator 1 view .LVU948
	leaq	-96(%r14), %rax
	shrq	$3, %rax
	movb	$0, 2147450880(%rax)
	.loc 12 1148 45 discriminator 2 view .LVU949
	movq	-616(%rbp), %rax
	leaq	(%rax,%r13), %rdx
	testq	%r13, %r13
	js	.L761
	cmpq	%rax, %rdx
	jnb	.L762
.L763:
	.loc 12 1148 45 discriminator 2 view .LVU950
	movq	-616(%rbp), %rsi
	leaq	.Lubsan_data1083(%rip), %rdi
.LVL665:
	.loc 12 1148 45 discriminator 2 view .LVU951
	call	__ubsan_handle_pointer_overflow@PLT
.LVL666:
	jmp	.L762
.LVL667:
.L895:
	.loc 12 1148 45 discriminator 2 view .LVU952
	call	__asan_report_store8@PLT
.LVL668:
.L896:
	.loc 12 1148 45 discriminator 2 view .LVU953
	call	__asan_report_store8@PLT
.LVL669:
.L897:
	call	__asan_report_load8@PLT
.LVL670:
.L761:
	.loc 12 1148 45 discriminator 2 view .LVU954
	cmpq	%rdx, -616(%rbp)
	jb	.L763
.LVL671:
.L762:
	.loc 12 1148 45 discriminator 2 view .LVU955
	leaq	-96(%r14), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L898
	movq	-624(%rbp), %rax
	movq	%rax, -96(%r14)
.LVL672:
.LBB1884:
.LBI1884:
	.loc 12 1076 7 is_stmt 1 view .LVU956
.LBB1885:
.LBB1886:
	.loc 12 1077 9 is_stmt 0 view .LVU957
	leaq	-64(%r14), %rdi
.LVL673:
	.loc 12 1077 9 view .LVU958
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L899
	movq	-624(%rbp), %rax
	movq	%rax, -64(%r14)
.LVL674:
	.loc 12 1077 9 view .LVU959
.LBE1886:
.LBE1885:
.LBE1884:
	.loc 12 1148 45 discriminator 1 view .LVU960
	leaq	-96(%r14), %rax
	shrq	$3, %rax
	movb	$-8, 2147450880(%rax)
	.loc 12 1148 16 discriminator 2 view .LVU961
	subq	$64, %r14
.LVL675:
	.loc 12 1148 16 discriminator 2 view .LVU962
	shrq	$3, %r14
	movb	$-8, 2147450880(%r14)
.LVL676:
	.loc 12 1148 16 discriminator 2 view .LVU963
.LBE1883:
.LBE1882:
	.loc 14 332 57 view .LVU964
	jmp	.L683
.LVL677:
.L898:
.LBB1891:
.LBB1890:
	.loc 12 1148 45 discriminator 2 view .LVU965
	call	__asan_report_store8@PLT
.LVL678:
.L899:
.LBB1889:
.LBB1888:
.LBB1887:
	.loc 12 1077 9 view .LVU966
	call	__asan_report_store8@PLT
.LVL679:
.L691:
	.loc 12 1077 9 view .LVU967
.LBE1887:
.LBE1888:
.LBE1889:
.LBE1890:
.LBE1891:
.LBE1880:
.LBE1879:
.LBE1892:
.LBE1899:
	.loc 15 255 17 view .LVU968
	testq	%rbx, %rbx
	je	.L766
	testb	$7, %bl
	jne	.L766
.L767:
	.loc 15 255 52 view .LVU969
	testq	%r13, %r13
	je	.L768
	testb	$7, %r13b
	jne	.L768
.L769:
	.loc 15 255 67 view .LVU970
	testq	%rbx, %rbx
	je	.L770
	testb	$7, %bl
	jne	.L770
.L771:
.LVL680:
.LBB1900:
.LBI1900:
	.loc 7 992 7 is_stmt 1 view .LVU971
.LBB1901:
	.loc 7 993 40 is_stmt 0 view .LVU972
	testq	%rbx, %rbx
	je	.L772
	testb	$7, %bl
	jne	.L772
.L773:
	.loc 7 993 66 view .LVU973
	testq	%rbx, %rbx
	je	.L774
	testb	$7, %bl
	jne	.L774
.L775:
.LVL681:
	.loc 7 993 66 view .LVU974
.LBE1901:
.LBE1900:
	.loc 15 255 17 discriminator 2 view .LVU975
	movq	-640(%rbp), %rcx
	movq	-632(%rbp), %rax
	leaq	(%rcx,%rax), %rdx
	testq	%rax, %rax
	js	.L776
	cmpq	%rcx, %rdx
	jnb	.L777
.L778:
	movq	-640(%rbp), %rsi
	leaq	.Lubsan_data1092(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL682:
	jmp	.L777
.L766:
	.loc 15 255 17 view .LVU976
	movq	%rbx, %rsi
	leaq	.Lubsan_data1087(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL683:
	jmp	.L767
.L768:
	.loc 15 255 52 view .LVU977
	movq	%r13, %rsi
	leaq	.Lubsan_data1088(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL684:
	jmp	.L769
.L770:
	.loc 15 255 67 view .LVU978
	movq	%rbx, %rsi
	leaq	.Lubsan_data1089(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL685:
	jmp	.L771
.LVL686:
.L772:
.LBB1903:
.LBB1902:
	.loc 7 993 40 view .LVU979
	movq	%rbx, %rsi
	leaq	.Lubsan_data1090(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL687:
	jmp	.L773
.L774:
	.loc 7 993 66 view .LVU980
	movq	%rbx, %rsi
	leaq	.Lubsan_data1091(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL688:
	jmp	.L775
.LVL689:
.L776:
	.loc 7 993 66 view .LVU981
.LBE1902:
.LBE1903:
	.loc 15 255 17 discriminator 2 view .LVU982
	cmpq	%rdx, -640(%rbp)
	jb	.L778
.L777:
	.loc 15 255 30 discriminator 2 view .LVU983
	testq	%r13, %r13
	je	.L779
	testb	$7, %r13b
	jne	.L779
.L780:
.LVL690:
.LBB1904:
.LBI1904:
	.loc 14 624 5 is_stmt 1 view .LVU984
.LBB1905:
.LBI1905:
	.loc 14 538 5 view .LVU985
.LBB1906:
.LBI1906:
	.loc 14 532 5 view .LVU986
.LBB1907:
.LBI1907:
	.loc 14 497 5 view .LVU987
.LBB1908:
.LBB1909:
.LBI1909:
	.loc 14 433 2 view .LVU988
.LBB1910:
	.loc 14 436 4 is_stmt 0 discriminator 1 view .LVU989
	cmpq	$1, -632(%rbp)
	jle	.L781
	.loc 14 437 23 view .LVU990
	cmpq	$0, -616(%rbp)
	je	.L900
.L782:
	cmpq	$0, -640(%rbp)
	je	.L901
.L783:
	movq	-632(%rbp), %rdx
	movq	-640(%rbp), %rsi
	movq	-616(%rbp), %rdi
	call	memmove@PLT
.LVL691:
.L784:
	.loc 14 441 22 view .LVU991
	movq	-616(%rbp), %rsi
	movq	-632(%rbp), %rax
	leaq	(%rsi,%rax), %rdx
	testq	%rax, %rax
	js	.L789
	cmpq	%rsi, %rdx
	jnb	.L790
.L791:
	movq	-616(%rbp), %rsi
	leaq	.Lubsan_data1096(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL692:
	jmp	.L790
.LVL693:
.L779:
	.loc 14 441 22 view .LVU992
.LBE1910:
.LBE1909:
.LBE1908:
.LBE1907:
.LBE1906:
.LBE1905:
.LBE1904:
	.loc 15 255 30 discriminator 2 view .LVU993
	movq	%r13, %rsi
	leaq	.Lubsan_data1093(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL694:
	jmp	.L780
.LVL695:
.L900:
.LBB1919:
.LBB1918:
.LBB1917:
.LBB1916:
.LBB1915:
.LBB1914:
.LBB1913:
	.loc 14 437 23 view .LVU994
	leaq	.Lubsan_data855(%rip), %rdi
	call	__ubsan_handle_nonnull_arg@PLT
.LVL696:
	jmp	.L782
.L901:
	leaq	.Lubsan_data856(%rip), %rdi
	call	__ubsan_handle_nonnull_arg@PLT
.LVL697:
	jmp	.L783
.L781:
	.loc 14 438 9 view .LVU995
	cmpq	$1, -632(%rbp)
	jne	.L784
.LVL698:
.LBB1911:
.LBI1911:
	.loc 14 397 2 is_stmt 1 view .LVU996
.LBB1912:
	.loc 14 398 10 is_stmt 0 view .LVU997
	cmpq	$0, -640(%rbp)
	je	.L902
.L785:
	movq	-640(%rbp), %rcx
	movq	%rcx, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	andl	$7, %ecx
	cmpb	%cl, %al
	jg	.L786
	testb	%al, %al
	jne	.L903
.L786:
	movq	-640(%rbp), %rax
	movzbl	(%rax), %r14d
	cmpq	$0, -616(%rbp)
	je	.L904
.L787:
	movq	-616(%rbp), %rcx
	movq	%rcx, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	andl	$7, %ecx
	cmpb	%cl, %al
	jg	.L788
	testb	%al, %al
	jne	.L905
.L788:
	movq	-616(%rbp), %rax
	movb	%r14b, (%rax)
.LVL699:
	.loc 14 398 21 view .LVU998
	jmp	.L784
.LVL700:
.L902:
	.loc 14 398 10 view .LVU999
	movl	$0, %esi
	leaq	.Lubsan_data1094(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL701:
	jmp	.L785
.L903:
	movq	-640(%rbp), %rdi
	call	__asan_report_load1@PLT
.LVL702:
.L904:
	movl	$0, %esi
	leaq	.Lubsan_data1095(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL703:
	jmp	.L787
.L905:
	movq	-616(%rbp), %rdi
	call	__asan_report_store1@PLT
.LVL704:
.L789:
	.loc 14 398 10 view .LVU1000
.LBE1912:
.LBE1911:
	.loc 14 441 22 view .LVU1001
	cmpq	%rdx, -616(%rbp)
	jb	.L791
.L790:
.LVL705:
	.loc 14 441 22 view .LVU1002
.LBE1913:
.LBE1914:
.LBE1915:
.LBE1916:
.LBE1917:
.LBE1918:
.LBE1919:
	.loc 15 260 27 view .LVU1003
	testq	%rbx, %rbx
	je	.L792
	testb	$7, %bl
	jne	.L792
.L793:
	testq	%rbx, %rbx
	je	.L794
	testb	$7, %bl
	jne	.L794
.L795:
.LVL706:
.LBB1920:
.LBI1920:
	.loc 7 301 7 is_stmt 1 view .LVU1004
.LBB1921:
	.loc 7 302 22 is_stmt 0 view .LVU1005
	testq	%rbx, %rbx
	je	.L796
	testb	$7, %bl
	jne	.L796
.L797:
	testq	%rbx, %rbx
	je	.L906
.L798:
.LVL707:
	.loc 7 302 22 view .LVU1006
.LBE1921:
.LBE1920:
	.loc 15 257 35 view .LVU1007
	testq	%rbx, %rbx
	je	.L907
.L799:
	.loc 15 257 35 discriminator 1 view .LVU1008
	testq	%rbx, %rbx
	je	.L800
	testb	$7, %bl
	jne	.L800
.L801:
	movq	8(%rbx), %r14
	.loc 15 258 20 view .LVU1009
	testq	%r13, %r13
	je	.L802
	testb	$7, %r13b
	jne	.L802
.L803:
	movq	8(%r13), %rax
	movq	%rax, -624(%rbp)
	.loc 15 257 48 view .LVU1010
	testq	%r13, %r13
	je	.L804
	testb	$7, %r13b
	jne	.L804
.L805:
	movq	0(%r13), %r13
.LVL708:
	.loc 15 257 63 view .LVU1011
	testq	%rbx, %rbx
	je	.L806
	testb	$7, %bl
	jne	.L806
.L807:
.LVL709:
.LBB1923:
.LBI1923:
	.loc 7 992 7 is_stmt 1 view .LVU1012
.LBB1924:
	.loc 7 993 40 is_stmt 0 view .LVU1013
	testq	%rbx, %rbx
	je	.L808
	testb	$7, %bl
	jne	.L808
.L809:
	.loc 7 993 66 view .LVU1014
	testq	%rbx, %rbx
	je	.L810
	testb	$7, %bl
	jne	.L810
.L811:
	.loc 7 993 50 view .LVU1015
	movq	%r14, %rax
	subq	(%rbx), %rax
	movq	%rax, -616(%rbp)
.LVL710:
	.loc 7 993 50 view .LVU1016
.LBE1924:
.LBE1923:
	.loc 15 257 35 discriminator 2 view .LVU1017
	leaq	0(%r13,%rax), %rdx
	js	.L812
	cmpq	%r13, %rdx
	jnb	.L813
.L814:
	movq	%r13, %rsi
	leaq	.Lubsan_data1108(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL711:
	jmp	.L813
.LVL712:
.L792:
	.loc 15 260 27 view .LVU1018
	movq	%rbx, %rsi
	leaq	.Lubsan_data1097(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL713:
	jmp	.L793
.L794:
	.loc 15 260 27 view .LVU1019
	movq	%rbx, %rsi
	leaq	.Lubsan_data1098(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL714:
	jmp	.L795
.LVL715:
.L796:
.LBB1926:
.LBB1922:
	.loc 7 302 22 view .LVU1020
	movq	%rbx, %rsi
	leaq	.Lubsan_data1099(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL716:
	jmp	.L797
.L906:
	.loc 7 302 22 view .LVU1021
	movl	$0, %esi
	leaq	.Lubsan_data1100(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL717:
	jmp	.L798
.LVL718:
.L907:
	.loc 7 302 22 view .LVU1022
.LBE1922:
.LBE1926:
	.loc 15 257 35 view .LVU1023
	movl	$0, %esi
	leaq	.Lubsan_data1101(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL719:
	jmp	.L799
.L800:
	.loc 15 257 35 discriminator 1 view .LVU1024
	movq	%rbx, %rsi
	leaq	.Lubsan_data1102(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL720:
	jmp	.L801
.L802:
	.loc 15 258 20 view .LVU1025
	movq	%r13, %rsi
	leaq	.Lubsan_data1103(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL721:
	jmp	.L803
.L804:
	.loc 15 257 48 view .LVU1026
	movq	%r13, %rsi
	leaq	.Lubsan_data1104(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL722:
	jmp	.L805
.LVL723:
.L806:
	.loc 15 257 63 view .LVU1027
	movq	%rbx, %rsi
	leaq	.Lubsan_data1105(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL724:
	jmp	.L807
.LVL725:
.L808:
.LBB1927:
.LBB1925:
	.loc 7 993 40 view .LVU1028
	movq	%rbx, %rsi
	leaq	.Lubsan_data1106(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL726:
	jmp	.L809
.L810:
	.loc 7 993 66 view .LVU1029
	movq	%rbx, %rsi
	leaq	.Lubsan_data1107(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL727:
	jmp	.L811
.LVL728:
.L812:
	.loc 7 993 66 view .LVU1030
.LBE1925:
.LBE1927:
	.loc 15 257 35 discriminator 2 view .LVU1031
	cmpq	%rdx, %r13
	jb	.L814
.L813:
	movq	-616(%rbp), %rax
	addq	%r13, %rax
	movq	%rax, -616(%rbp)
.LVL729:
.LBB1928:
.LBI1928:
	.loc 13 366 5 is_stmt 1 view .LVU1032
.LBB1929:
.LBI1929:
	.loc 13 163 5 view .LVU1033
.LBB1930:
.LBB1931:
.LBI1931:
	.loc 13 145 9 view .LVU1034
.LBB1932:
.LBI1932:
	.loc 14 624 5 view .LVU1035
.LBB1933:
.LBI1933:
	.loc 14 538 5 view .LVU1036
.LBB1934:
.LBI1934:
	.loc 14 532 5 view .LVU1037
.LBB1935:
.LBI1935:
	.loc 14 497 5 view .LVU1038
.LBB1936:
.LBB1937:
.LBI1937:
	.loc 14 433 2 view .LVU1039
.LBB1938:
	.loc 14 435 20 is_stmt 0 view .LVU1040
	movq	-624(%rbp), %r13
	subq	%rax, %r13
.LVL730:
	.loc 14 436 4 discriminator 1 view .LVU1041
	cmpq	$1, %r13
	jle	.L815
	.loc 14 437 23 view .LVU1042
	testq	%r14, %r14
	je	.L908
.LVL731:
.L816:
	.loc 14 437 23 view .LVU1043
	cmpq	$0, -616(%rbp)
	je	.L909
.L817:
	movq	%r13, %rdx
	movq	-616(%rbp), %rsi
	movq	%r14, %rdi
	call	memmove@PLT
.LVL732:
.L818:
	.loc 14 441 22 view .LVU1044
	leaq	0(%r13,%r14), %rdx
	testq	%r13, %r13
	js	.L823
	cmpq	%r14, %rdx
	jnb	.L683
	jmp	.L825
.LVL733:
.L908:
	.loc 14 437 23 view .LVU1045
	leaq	.Lubsan_data855(%rip), %rdi
	call	__ubsan_handle_nonnull_arg@PLT
.LVL734:
	.loc 14 437 23 view .LVU1046
	jmp	.L816
.L909:
	.loc 14 437 23 view .LVU1047
	leaq	.Lubsan_data856(%rip), %rdi
	call	__ubsan_handle_nonnull_arg@PLT
.LVL735:
	jmp	.L817
.LVL736:
.L815:
	.loc 14 438 9 view .LVU1048
	jne	.L818
.LVL737:
.LBB1939:
.LBI1939:
	.loc 14 397 2 is_stmt 1 view .LVU1049
.LBB1940:
	.loc 14 398 10 is_stmt 0 view .LVU1050
	cmpq	$0, -616(%rbp)
	je	.L910
.LVL738:
.L819:
	.loc 14 398 10 view .LVU1051
	movq	-616(%rbp), %rcx
	movq	%rcx, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	andl	$7, %ecx
	cmpb	%cl, %al
	jg	.L820
	testb	%al, %al
	jne	.L911
.L820:
	movq	-616(%rbp), %rax
	movzbl	(%rax), %eax
	movb	%al, -616(%rbp)
.LVL739:
	.loc 14 398 10 view .LVU1052
	testq	%r14, %r14
	je	.L912
.L821:
	movq	%r14, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	movq	%r14, %rdx
	andl	$7, %edx
	cmpb	%dl, %al
	jg	.L822
	testb	%al, %al
	jne	.L913
.L822:
	movzbl	-616(%rbp), %eax
	movb	%al, (%r14)
.LVL740:
	.loc 14 398 21 view .LVU1053
	jmp	.L818
.LVL741:
.L910:
	.loc 14 398 10 view .LVU1054
	movl	$0, %esi
	leaq	.Lubsan_data1109(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL742:
	.loc 14 398 10 view .LVU1055
	jmp	.L819
.L911:
	.loc 14 398 10 view .LVU1056
	movq	-616(%rbp), %rdi
	call	__asan_report_load1@PLT
.LVL743:
.L912:
	.loc 14 398 10 view .LVU1057
	movl	$0, %esi
	leaq	.Lubsan_data1110(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL744:
	jmp	.L821
.L913:
	.loc 14 398 10 view .LVU1058
	movq	%r14, %rdi
	call	__asan_report_store1@PLT
.LVL745:
.L823:
	.loc 14 398 10 view .LVU1059
.LBE1940:
.LBE1939:
	.loc 14 441 22 view .LVU1060
	cmpq	%rdx, %r14
	jnb	.L683
.L825:
	.loc 14 441 22 view .LVU1061
	movq	%r14, %rsi
	leaq	.Lubsan_data1111(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL746:
	jmp	.L683
.LVL747:
.L826:
	.loc 14 441 22 view .LVU1062
.LBE1938:
.LBE1937:
.LBE1936:
.LBE1935:
.LBE1934:
.LBE1933:
.LBE1932:
.LBE1931:
.LBE1930:
.LBE1929:
.LBE1928:
.LBE1943:
	.loc 15 262 44 view .LVU1063
	movq	%rbx, %rsi
	leaq	.Lubsan_data1112(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL748:
	jmp	.L827
.L874:
	.loc 15 262 44 view .LVU1064
	movq	%rbx, %rdi
	call	__asan_report_load8@PLT
.LVL749:
.L829:
	.loc 15 262 53 view .LVU1065
	cmpq	%rdx, %r13
	jb	.L831
.L830:
	movq	-600(%rbp), %rax
	addq	%rax, %r13
	.loc 15 262 28 view .LVU1066
	testq	%rbx, %rbx
	je	.L832
	testb	$7, %bl
	jne	.L832
.L833:
	leaq	8(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L914
	movq	%r13, 8(%rbx)
.LVL750:
.L566:
	.loc 15 262 28 view .LVU1067
.LBE1944:
.LBE1946:
	.loc 15 264 15 view .LVU1068
	testq	%rbx, %rbx
	je	.L835
	testb	$7, %bl
	jne	.L835
.L836:
	.loc 15 210 5 view .LVU1069
	cmpq	%r15, -608(%rbp)
	jne	.L915
	pxor	%xmm0, %xmm0
	movups	%xmm0, 2147450880(%r12)
	movups	%xmm0, 2147450896(%r12)
	movups	%xmm0, 2147450912(%r12)
	movups	%xmm0, 2147450928(%r12)
.L564:
	.loc 15 265 5 view .LVU1070
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L916
	movq	%rbx, %rax
	addq	$616, %rsp
	popq	%rbx
.LVL751:
	.loc 15 265 5 view .LVU1071
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.LVL752:
.L832:
	.cfi_restore_state
.LBB1947:
.LBB1945:
	.loc 15 262 28 view .LVU1072
	movq	%rbx, %rsi
	leaq	.Lubsan_data1114(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL753:
	jmp	.L833
.L914:
	.loc 15 262 28 view .LVU1073
	call	__asan_report_store8@PLT
.LVL754:
.L835:
	.loc 15 262 28 view .LVU1074
.LBE1945:
.LBE1947:
	.loc 15 264 15 view .LVU1075
	movq	%rbx, %rsi
	leaq	.Lubsan_data1115(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL755:
	jmp	.L836
.L915:
	.loc 15 210 5 view .LVU1076
	movq	$1172321806, (%r15)
	movdqa	.LC1(%rip), %xmm0
	movups	%xmm0, 2147450880(%r12)
	movups	%xmm0, 2147450896(%r12)
	movups	%xmm0, 2147450912(%r12)
	movups	%xmm0, 2147450928(%r12)
	movq	504(%r15), %rax
	movb	$0, (%rax)
	jmp	.L564
.L916:
	.loc 15 265 5 view .LVU1077
	call	__stack_chk_fail@PLT
.LVL756:
	.cfi_endproc
.LFE6415:
	.size	_ZNSt6vectorIhSaIhEEaSERKS1_, .-_ZNSt6vectorIhSaIhEEaSERKS1_
	.globl	__asan_stack_malloc_1
	.section	.rodata._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_.str1.8,"aMS",@progbits,1
	.align 8
.LC13:
	.string	"3 48 1 9 <unknown> 64 8 6 __dnew 96 8 7 __guard"
	.section	.rodata
	.align 32
.LC14:
	.string	"basic_string: construction from null is not valid"
	.zero	46
	.section	.text._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_,"axG",@progbits,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC5IS3_EEPKcRKS3_,comdat
	.align 2
	.weak	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_
	.type	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_, @function
_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_:
.LASANPC6725:
.LVL757:
.LFB6725:
	.loc 2 641 7 is_stmt 1 view -0
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA6725
	.loc 2 641 7 is_stmt 0 view .LVU1079
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$200, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	movq	%rsi, -216(%rbp)
	movq	%rdx, %r13
	leaq	-208(%rbp), %r14
	movq	%r14, -232(%rbp)
	cmpl	$0, __asan_option_detect_stack_use_after_return(%rip)
	jne	.L1071
.LVL758:
.L917:
	.loc 2 641 7 view .LVU1080
	leaq	160(%r14), %r12
	movq	$1102416563, (%r14)
.LVL759:
	.loc 2 641 7 view .LVU1081
	leaq	.LC13(%rip), %rax
	movq	%rax, 8(%r14)
	leaq	.LASANPC6725(%rip), %rax
	movq	%rax, 16(%r14)
	movq	%r14, %r15
	shrq	$3, %r15
	movl	$-235802127, 2147450880(%r15)
	movl	$-234753551, 2147450884(%r15)
	movl	$-218959360, 2147450888(%r15)
	movl	$-202116352, 2147450892(%r15)
	.loc 2 641 7 view .LVU1082
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
.LBB2044:
	.loc 2 642 9 view .LVU1083
	testq	%rbx, %rbx
	je	.L921
	testb	$7, %bl
	jne	.L921
.L922:
	testq	%rbx, %rbx
	je	.L923
	testb	$7, %bl
	jne	.L923
.L924:
	.loc 2 642 34 discriminator 1 view .LVU1084
	testq	%rbx, %rbx
	je	.L925
	testb	$7, %bl
	jne	.L925
.L926:
.LVL760:
.LBB2045:
.LBI2045:
	.loc 2 227 7 is_stmt 1 view .LVU1085
.LBB2046:
	.loc 2 230 51 is_stmt 0 view .LVU1086
	testq	%rbx, %rbx
	je	.L927
	testb	$7, %bl
	jne	.L927
.L928:
	.loc 2 230 51 view .LVU1087
	leaq	16(%rbx), %rdx
	cmpq	$-16, %rbx
	jnb	.L1072
.L929:
	movq	%rbx, %rax
	addq	$16, %rax
	movq	%rax, -224(%rbp)
	je	.L1073
.L930:
.LVL761:
	.loc 2 230 51 view .LVU1088
.LBE2046:
.LBE2045:
.LBB2048:
.LBI2048:
	.loc 2 188 2 is_stmt 1 view .LVU1089
.LBB2049:
	.loc 2 189 35 is_stmt 0 view .LVU1090
	testq	%rbx, %rbx
	je	.L1074
.L931:
.LVL762:
.LBB2050:
.LBI2050:
	.loc 10 167 7 is_stmt 1 view .LVU1091
.LBB2051:
	.loc 10 168 34 is_stmt 0 view .LVU1092
	testq	%rbx, %rbx
	je	.L1075
.L932:
	.loc 10 168 34 discriminator 1 view .LVU1093
	testq	%r13, %r13
	je	.L1076
.L933:
.LVL763:
.LBB2052:
.LBI2052:
	.loc 11 92 7 is_stmt 1 view .LVU1094
	.loc 11 92 7 is_stmt 0 view .LVU1095
.LBE2052:
.LBE2051:
.LBE2050:
	.loc 2 189 25 discriminator 2 view .LVU1096
	testq	%rbx, %rbx
	je	.L934
	testb	$7, %bl
	jne	.L934
.L935:
	movq	%rbx, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1077
	movq	-224(%rbp), %rax
	movq	%rax, (%rbx)
.LVL764:
	.loc 2 189 25 discriminator 2 view .LVU1097
.LBE2049:
.LBE2048:
.LBB2056:
	.loc 2 645 2 view .LVU1098
	cmpq	$0, -216(%rbp)
	je	.L1078
.LVL765:
.LBB2057:
.LBI2057:
	.file 16 "/usr/include/c++/13/bits/char_traits.h"
	.loc 16 393 7 is_stmt 1 view .LVU1099
.LBB2058:
	.loc 16 396 2 view .LVU1100
	.loc 16 399 2 view .LVU1101
	.loc 16 399 25 is_stmt 0 view .LVU1102
	movq	-216(%rbp), %rdi
	call	strlen@PLT
.LVL766:
	movq	%rax, %r13
.LVL767:
	.loc 16 399 25 view .LVU1103
.LBE2058:
.LBE2057:
	.loc 2 648 16 discriminator 1 view .LVU1104
	movq	-216(%rbp), %rdx
	addq	%rax, %rdx
	jc	.L1079
.L939:
.LVL768:
	.loc 2 649 14 view .LVU1105
	testq	%rbx, %rbx
	je	.L940
	testb	$7, %bl
	jne	.L940
.L941:
.LVL769:
.LBB2059:
.LBI2059:
	.file 17 "/usr/include/c++/13/bits/basic_string.tcc"
	.loc 17 221 7 is_stmt 1 view .LVU1106
.LBB2060:
	.loc 17 225 12 is_stmt 0 discriminator 1 view .LVU1107
	leaq	-96(%r12), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1080
	movq	%r13, -96(%r12)
	.loc 17 227 2 view .LVU1108
	cmpq	$15, %r13
	ja	.L1081
	.loc 17 233 21 view .LVU1109
	testq	%rbx, %rbx
	je	.L983
	testb	$7, %bl
	jne	.L983
.L984:
.LVL770:
.LBB2061:
.LBI2061:
	.loc 17 239 13 is_stmt 1 view .LVU1110
.LBB2062:
.LBB2063:
	.loc 17 239 41 is_stmt 0 view .LVU1111
	leaq	-64(%r12), %rdi
.LVL771:
	.loc 17 239 41 view .LVU1112
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1082
	movq	%rbx, -64(%r12)
.LVL772:
	.loc 17 239 41 view .LVU1113
.LBE2063:
.LBE2062:
.LBE2061:
	.loc 17 247 29 view .LVU1114
	testq	%rbx, %rbx
	je	.L986
	.loc 17 247 29 view .LVU1115
	testb	$7, %bl
	jne	.L986
.L987:
.LVL773:
.LBB2070:
.LBI2070:
	.loc 2 222 7 is_stmt 1 view .LVU1116
.LBB2071:
	.loc 2 223 28 is_stmt 0 view .LVU1117
	testq	%rbx, %rbx
	je	.L988
	testb	$7, %bl
	jne	.L988
.L989:
	.loc 2 223 28 view .LVU1118
	movq	%rbx, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1083
	movq	(%rbx), %rax
	movq	%rax, -224(%rbp)
.LVL774:
	.loc 2 223 28 view .LVU1119
.LBE2071:
.LBE2070:
.LBB2075:
.LBI2075:
	.loc 2 482 7 is_stmt 1 view .LVU1120
.LBB2076:
.LBI2076:
	.loc 2 425 7 view .LVU1121
.LBB2077:
	.loc 2 427 2 is_stmt 0 view .LVU1122
	cmpq	$1, %r13
	je	.L1084
.LVL775:
.LBB2078:
.LBI2078:
	.loc 16 427 7 is_stmt 1 view .LVU1123
.LBB2079:
	.loc 16 429 2 view .LVU1124
	testq	%r13, %r13
	je	.L998
	jmp	.L982
.LVL776:
.L1071:
	.loc 16 429 2 is_stmt 0 view .LVU1125
.LBE2079:
.LBE2078:
.LBE2077:
.LBE2076:
.LBE2075:
.LBE2060:
.LBE2059:
.LBE2056:
.LBE2044:
	.loc 2 641 7 view .LVU1126
	movl	$128, %edi
	call	__asan_stack_malloc_1@PLT
.LVL777:
	.loc 2 641 7 view .LVU1127
	testq	%rax, %rax
	cmovne	%rax, %r14
	jmp	.L917
.LVL778:
.L921:
.LBB2220:
	.loc 2 642 9 view .LVU1128
	movq	%rbx, %rsi
	leaq	.Lubsan_data1117(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL779:
	jmp	.L922
.L923:
	.loc 2 642 9 view .LVU1129
	movq	%rbx, %rsi
	leaq	.Lubsan_data1118(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL780:
	jmp	.L924
.L925:
	.loc 2 642 34 discriminator 1 view .LVU1130
	movq	%rbx, %rsi
	leaq	.Lubsan_data1119(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL781:
	jmp	.L926
.LVL782:
.L927:
.LBB2211:
.LBB2047:
	.loc 2 230 51 view .LVU1131
	movq	%rbx, %rsi
	leaq	.Lubsan_data1120(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL783:
	jmp	.L928
.L1072:
	.loc 2 230 51 view .LVU1132
	movq	%rbx, %rsi
	leaq	.Lubsan_data1121(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL784:
	jmp	.L929
.L1073:
	.loc 2 230 51 view .LVU1133
	movl	$0, %esi
	leaq	.Lubsan_data1122(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL785:
	jmp	.L930
.LVL786:
.L1074:
	.loc 2 230 51 view .LVU1134
.LBE2047:
.LBE2211:
.LBB2212:
.LBB2055:
	.loc 2 189 35 view .LVU1135
	movl	$0, %esi
	leaq	.Lubsan_data1123(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL787:
	jmp	.L931
.LVL788:
.L1075:
.LBB2054:
.LBB2053:
	.loc 10 168 34 view .LVU1136
	movl	$0, %esi
	leaq	.Lubsan_data1124(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL789:
	jmp	.L932
.L1076:
	.loc 10 168 34 discriminator 1 view .LVU1137
	movl	$0, %esi
	leaq	.Lubsan_data1125(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL790:
	jmp	.L933
.LVL791:
.L934:
	.loc 10 168 34 discriminator 1 view .LVU1138
.LBE2053:
.LBE2054:
	.loc 2 189 25 discriminator 2 view .LVU1139
	movq	%rbx, %rsi
	leaq	.Lubsan_data1126(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL792:
	jmp	.L935
.L1077:
	.loc 2 189 25 discriminator 2 view .LVU1140
	movq	%rbx, %rdi
	call	__asan_report_store8@PLT
.LVL793:
.L1078:
	.loc 2 189 25 discriminator 2 view .LVU1141
.LBE2055:
.LBE2212:
.LBB2213:
	.loc 2 646 28 view .LVU1142
	call	__asan_handle_no_return@PLT
.LVL794:
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L1085
	leaq	.LC14(%rip), %rdi
.LEHB29:
	call	_ZSt19__throw_logic_errorPKc@PLT
.LVL795:
.LEHE29:
.L1068:
	endbr64
.LBE2213:
	.loc 2 642 9 view .LVU1143
	movq	%rax, %r12
	jmp	.L1044
.L1085:
.LBB2214:
	.loc 2 646 28 view .LVU1144
	call	__stack_chk_fail@PLT
.LVL796:
.L1079:
	.loc 2 648 16 discriminator 1 view .LVU1145
	movq	-216(%rbp), %rsi
	leaq	.Lubsan_data1127(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL797:
	jmp	.L939
.LVL798:
.L940:
	.loc 2 649 14 view .LVU1146
	movq	%rbx, %rsi
	leaq	.Lubsan_data1128(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL799:
	jmp	.L941
.LVL800:
.L1080:
.LBB2208:
.LBB2205:
	.loc 17 225 12 discriminator 1 view .LVU1147
	call	__asan_report_store8@PLT
.LVL801:
.L1081:
	.loc 17 229 13 view .LVU1148
	testq	%rbx, %rbx
	je	.L944
	testb	$7, %bl
	jne	.L944
.L945:
	.loc 17 229 23 discriminator 1 view .LVU1149
	testq	%rbx, %rbx
	je	.L946
	testb	$7, %bl
	jne	.L946
.L947:
.LVL802:
.LBB2092:
.LBI2092:
	.loc 17 138 5 is_stmt 1 view .LVU1150
.LBB2093:
	.loc 17 143 32 is_stmt 0 view .LVU1151
	testq	%rbx, %rbx
	je	.L948
	testb	$7, %bl
	jne	.L948
.L949:
.LVL803:
.LBB2094:
.LBI2094:
	.loc 2 1084 7 is_stmt 1 view .LVU1152
.LBB2095:
	.loc 2 1085 57 is_stmt 0 view .LVU1153
	testq	%rbx, %rbx
	je	.L950
	testb	$7, %bl
	jne	.L950
.L951:
.LVL804:
.LBB2096:
.LBI2096:
	.loc 2 341 7 is_stmt 1 view .LVU1154
.LBB2097:
	.loc 2 342 16 is_stmt 0 view .LVU1155
	testq	%rbx, %rbx
	je	.L952
	testb	$7, %bl
	jne	.L952
.L953:
	.loc 2 342 16 view .LVU1156
	testq	%rbx, %rbx
	je	.L1086
.L954:
	.loc 2 342 16 discriminator 1 view .LVU1157
	testq	%rbx, %rbx
	je	.L955
	testb	$7, %bl
	jne	.L955
.L956:
.LVL805:
	.loc 2 342 16 discriminator 1 view .LVU1158
.LBE2097:
.LBE2096:
	.loc 2 1085 40 discriminator 2 view .LVU1159
	testq	%rbx, %rbx
	je	.L1087
.L957:
.LVL806:
	.loc 2 1085 40 discriminator 2 view .LVU1160
.LBE2095:
.LBE2094:
	.loc 17 159 25 view .LVU1161
	leaq	1(%r13), %rax
	movq	%rax, -240(%rbp)
	.loc 17 159 42 view .LVU1162
	testq	%rbx, %rbx
	je	.L958
	testb	$7, %bl
	jne	.L958
.L959:
.LVL807:
.LBB2101:
.LBI2101:
	.loc 2 336 7 is_stmt 1 view .LVU1163
.LBB2102:
	.loc 2 337 16 is_stmt 0 view .LVU1164
	testq	%rbx, %rbx
	je	.L960
	testb	$7, %bl
	jne	.L960
.L961:
	.loc 2 337 16 view .LVU1165
	testq	%rbx, %rbx
	je	.L1088
.L962:
.LVL808:
	.loc 2 337 16 view .LVU1166
.LBE2102:
.LBE2101:
	.loc 17 159 25 discriminator 2 view .LVU1167
	testq	%rbx, %rbx
	je	.L1089
.L963:
.LVL809:
.LBB2104:
.LBI2104:
	.loc 2 124 7 is_stmt 1 view .LVU1168
.LBB2105:
	.loc 2 126 39 is_stmt 0 view .LVU1169
	testq	%rbx, %rbx
	je	.L1090
.L964:
.LVL810:
.LBB2106:
.LBI2106:
	.loc 9 481 7 is_stmt 1 view .LVU1170
.LBB2107:
	.loc 9 482 28 is_stmt 0 view .LVU1171
	testq	%rbx, %rbx
	je	.L1091
.L965:
.LVL811:
.LBB2108:
.LBI2108:
	.loc 10 189 7 is_stmt 1 view .LVU1172
.LBB2109:
	.loc 10 198 40 is_stmt 0 view .LVU1173
	testq	%rbx, %rbx
	je	.L1092
.L966:
.LVL812:
.LBB2110:
.LBI2110:
	.loc 11 126 7 is_stmt 1 view .LVU1174
.LBB2111:
	.loc 11 134 46 is_stmt 0 view .LVU1175
	testq	%rbx, %rbx
	je	.L1093
.L967:
	.loc 11 151 48 view .LVU1176
	movq	-240(%rbp), %rdi
.LEHB30:
	call	_Znwm
.LVL813:
.LEHE30:
	jmp	.L1094
.LVL814:
.L944:
	.loc 11 151 48 view .LVU1177
.LBE2111:
.LBE2110:
.LBE2109:
.LBE2108:
.LBE2107:
.LBE2106:
.LBE2105:
.LBE2104:
.LBE2093:
.LBE2092:
	.loc 17 229 13 view .LVU1178
	movq	%rbx, %rsi
	leaq	.Lubsan_data1129(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL815:
	jmp	.L945
.L946:
	.loc 17 229 23 discriminator 1 view .LVU1179
	movq	%rbx, %rsi
	leaq	.Lubsan_data1130(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL816:
	jmp	.L947
.LVL817:
.L948:
.LBB2123:
.LBB2122:
	.loc 17 143 32 view .LVU1180
	movq	%rbx, %rsi
	leaq	.Lubsan_data1132(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL818:
	jmp	.L949
.LVL819:
.L950:
.LBB2119:
.LBB2100:
	.loc 2 1085 57 view .LVU1181
	movq	%rbx, %rsi
	leaq	.Lubsan_data1133(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL820:
	jmp	.L951
.LVL821:
.L952:
.LBB2099:
.LBB2098:
	.loc 2 342 16 view .LVU1182
	movq	%rbx, %rsi
	leaq	.Lubsan_data1134(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL822:
	jmp	.L953
.L1086:
	.loc 2 342 16 view .LVU1183
	movl	$0, %esi
	leaq	.Lubsan_data1135(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL823:
	jmp	.L954
.L955:
	.loc 2 342 16 discriminator 1 view .LVU1184
	movq	%rbx, %rsi
	leaq	.Lubsan_data1136(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL824:
	jmp	.L956
.LVL825:
.L1087:
	.loc 2 342 16 discriminator 1 view .LVU1185
.LBE2098:
.LBE2099:
	.loc 2 1085 40 discriminator 2 view .LVU1186
	movl	$0, %esi
	leaq	.Lubsan_data1137(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL826:
	jmp	.L957
.LVL827:
.L958:
	.loc 2 1085 40 discriminator 2 view .LVU1187
.LBE2100:
.LBE2119:
	.loc 17 159 42 view .LVU1188
	movq	%rbx, %rsi
	leaq	.Lubsan_data1141(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL828:
	jmp	.L959
.LVL829:
.L960:
.LBB2120:
.LBB2103:
	.loc 2 337 16 view .LVU1189
	movq	%rbx, %rsi
	leaq	.Lubsan_data1142(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL830:
	jmp	.L961
.L1088:
	.loc 2 337 16 view .LVU1190
	movl	$0, %esi
	leaq	.Lubsan_data1143(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL831:
	jmp	.L962
.LVL832:
.L1089:
	.loc 2 337 16 view .LVU1191
.LBE2103:
.LBE2120:
	.loc 17 159 25 discriminator 2 view .LVU1192
	movl	$0, %esi
	leaq	.Lubsan_data1144(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL833:
	jmp	.L963
.LVL834:
.L1090:
.LBB2121:
.LBB2118:
	.loc 2 126 39 view .LVU1193
	movl	$0, %esi
	leaq	.Lubsan_data1145(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL835:
	jmp	.L964
.LVL836:
.L1091:
.LBB2117:
.LBB2116:
	.loc 9 482 28 view .LVU1194
	movl	$0, %esi
	leaq	.Lubsan_data1146(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL837:
	jmp	.L965
.LVL838:
.L1092:
.LBB2115:
.LBB2114:
	.loc 10 198 40 view .LVU1195
	movl	$0, %esi
	leaq	.Lubsan_data1147(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL839:
	jmp	.L966
.LVL840:
.L1093:
.LBB2113:
.LBB2112:
	.loc 11 134 46 view .LVU1196
	movl	$0, %esi
	leaq	.Lubsan_data1148(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL841:
	jmp	.L967
.L1094:
	.loc 11 151 48 view .LVU1197
	movq	%rax, -240(%rbp)
.LVL842:
	.loc 11 151 48 view .LVU1198
.LBE2112:
.LBE2113:
.LBE2114:
.LBE2115:
.LBE2116:
.LBE2117:
.LBE2118:
.LBE2121:
.LBE2122:
.LBE2123:
.LBB2124:
.LBI2124:
	.loc 2 212 7 is_stmt 1 view .LVU1199
.LBB2125:
	.loc 2 213 26 is_stmt 0 view .LVU1200
	testq	%rbx, %rbx
	je	.L968
	testb	$7, %bl
	jne	.L968
.LVL843:
.L969:
	.loc 2 213 26 view .LVU1201
	movq	%rbx, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1095
	movq	-240(%rbp), %rax
	movq	%rax, (%rbx)
.LVL844:
	.loc 2 213 26 view .LVU1202
.LBE2125:
.LBE2124:
	.loc 17 230 17 view .LVU1203
	testq	%rbx, %rbx
	je	.L971
	testb	$7, %bl
	jne	.L971
.L972:
	.loc 17 230 17 discriminator 1 view .LVU1204
	leaq	-96(%r12), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1096
	movq	-96(%r12), %rax
	movq	%rax, -240(%rbp)
.LVL845:
.LBB2127:
.LBI2127:
	.loc 2 249 7 is_stmt 1 view .LVU1205
.LBB2128:
	.loc 2 250 31 is_stmt 0 view .LVU1206
	testq	%rbx, %rbx
	je	.L974
	testb	$7, %bl
	jne	.L974
.LVL846:
.L975:
	.loc 2 250 31 view .LVU1207
	movq	-224(%rbp), %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1097
	movq	-240(%rbp), %rax
	movq	%rax, 16(%rbx)
.LVL847:
	.loc 2 250 31 view .LVU1208
.LBE2128:
.LBE2127:
.LBB2130:
	.loc 17 239 13 is_stmt 1 view .LVU1209
.LBB2067:
.LBB2064:
	.loc 17 239 41 is_stmt 0 view .LVU1210
	leaq	-64(%r12), %rdi
.LVL848:
	.loc 17 239 41 view .LVU1211
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1098
	movq	%rbx, -64(%r12)
.LVL849:
	.loc 17 239 41 view .LVU1212
.LBE2064:
.LBE2067:
.LBE2130:
	.loc 17 247 29 view .LVU1213
	testq	%rbx, %rbx
	je	.L978
	.loc 17 247 29 view .LVU1214
	testb	$7, %bl
	jne	.L978
.L979:
.LVL850:
.LBB2131:
	.loc 2 222 7 is_stmt 1 view .LVU1215
.LBB2072:
	.loc 2 223 28 is_stmt 0 view .LVU1216
	testq	%rbx, %rbx
	je	.L980
	testb	$7, %bl
	jne	.L980
.L981:
	.loc 2 223 28 view .LVU1217
	movq	(%rbx), %rax
	movq	%rax, -224(%rbp)
.LVL851:
	.loc 2 223 28 view .LVU1218
.LBE2072:
.LBE2131:
.LBB2132:
	.loc 2 482 7 is_stmt 1 view .LVU1219
.LBB2090:
	.loc 2 425 7 view .LVU1220
.L982:
.LBB2088:
.LBB2082:
.LBB2080:
	.loc 16 432 2 view .LVU1221
	.loc 16 435 2 view .LVU1222
	.loc 16 435 49 is_stmt 0 view .LVU1223
	cmpq	$0, -224(%rbp)
	je	.L1099
.L999:
	.loc 16 435 49 view .LVU1224
	movq	%r13, %rdx
	movq	-216(%rbp), %rsi
	movq	-224(%rbp), %rdi
	call	memcpy@PLT
.LVL852:
.L998:
	.loc 16 435 49 view .LVU1225
.LBE2080:
.LBE2082:
.LBE2088:
.LBE2090:
.LBE2132:
	.loc 17 249 21 view .LVU1226
	leaq	-64(%r12), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1100
	movq	$0, -64(%r12)
	.loc 17 251 15 view .LVU1227
	testq	%rbx, %rbx
	je	.L1001
	testb	$7, %bl
	jne	.L1001
.L1002:
	.loc 17 251 15 discriminator 1 view .LVU1228
	movq	-96(%r12), %r13
.LVL853:
.LBB2133:
.LBI2133:
	.loc 2 254 7 is_stmt 1 view .LVU1229
.LBB2134:
	.loc 2 256 11 is_stmt 0 view .LVU1230
	testq	%rbx, %rbx
	je	.L1003
	testb	$7, %bl
	jne	.L1003
.L1004:
.LVL854:
.LBB2135:
.LBI2135:
	.loc 2 217 7 is_stmt 1 view .LVU1231
.LBB2136:
	.loc 2 218 26 is_stmt 0 view .LVU1232
	testq	%rbx, %rbx
	je	.L1005
	testb	$7, %bl
	jne	.L1005
.L1006:
	.loc 2 218 26 view .LVU1233
	leaq	8(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1101
	movq	%r13, 8(%rbx)
.LVL855:
	.loc 2 218 26 view .LVU1234
.LBE2136:
.LBE2135:
	.loc 2 257 21 discriminator 1 view .LVU1235
	leaq	-112(%r12), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L1008
	.loc 2 257 21 discriminator 1 view .LVU1236
	jle	.L1102
.L1008:
	movb	$0, -112(%r12)
	.loc 2 257 29 discriminator 1 view .LVU1237
	testq	%rbx, %rbx
	je	.L1009
	testb	$7, %bl
	jne	.L1009
.L1010:
.LVL856:
.LBB2138:
.LBI2138:
	.loc 2 222 7 is_stmt 1 view .LVU1238
.LBB2139:
	.loc 2 223 28 is_stmt 0 view .LVU1239
	testq	%rbx, %rbx
	je	.L1011
	testb	$7, %bl
	jne	.L1011
.L1012:
	.loc 2 223 28 view .LVU1240
	movq	%rbx, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1103
	movq	(%rbx), %rbx
.LVL857:
	.loc 2 223 28 view .LVU1241
.LBE2139:
.LBE2138:
	.loc 2 257 31 discriminator 3 view .LVU1242
	leaq	(%rbx,%r13), %rdx
	testq	%r13, %r13
	js	.L1014
	cmpq	%rbx, %rdx
	jnb	.L1015
.L1016:
	movq	%rbx, %rsi
	leaq	.Lubsan_data1168(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL858:
	jmp	.L1015
.LVL859:
.L968:
	.loc 2 257 31 discriminator 3 view .LVU1243
.LBE2134:
.LBE2133:
.LBB2149:
.LBB2126:
	.loc 2 213 26 view .LVU1244
	movq	%rbx, %rsi
	leaq	.Lubsan_data1149(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL860:
	.loc 2 213 26 view .LVU1245
	jmp	.L969
.L1095:
	.loc 2 213 26 view .LVU1246
	movq	%rbx, %rdi
	call	__asan_report_store8@PLT
.LVL861:
.L971:
	.loc 2 213 26 view .LVU1247
.LBE2126:
.LBE2149:
	.loc 17 230 17 view .LVU1248
	movq	%rbx, %rsi
	leaq	.Lubsan_data1150(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL862:
	jmp	.L972
.L1096:
	.loc 17 230 17 discriminator 1 view .LVU1249
	call	__asan_report_load8@PLT
.LVL863:
.L974:
.LBB2150:
.LBB2129:
	.loc 2 250 31 view .LVU1250
	movq	%rbx, %rsi
	leaq	.Lubsan_data1151(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL864:
	.loc 2 250 31 view .LVU1251
	jmp	.L975
.L1097:
	.loc 2 250 31 view .LVU1252
	movq	-224(%rbp), %rdi
	call	__asan_report_store8@PLT
.LVL865:
.L1098:
	.loc 2 250 31 view .LVU1253
.LBE2129:
.LBE2150:
.LBB2151:
.LBB2068:
.LBB2065:
	.loc 17 239 41 view .LVU1254
	call	__asan_report_store8@PLT
.LVL866:
.L978:
	.loc 17 239 41 view .LVU1255
.LBE2065:
.LBE2068:
.LBE2151:
	.loc 17 247 29 view .LVU1256
	movq	%rbx, %rsi
	leaq	.Lubsan_data1153(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL867:
	jmp	.L979
.LVL868:
.L980:
.LBB2152:
.LBB2073:
	.loc 2 223 28 view .LVU1257
	movq	%rbx, %rsi
	leaq	.Lubsan_data1154(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL869:
	jmp	.L981
.LVL870:
.L983:
	.loc 2 223 28 view .LVU1258
.LBE2073:
.LBE2152:
	.loc 17 233 21 view .LVU1259
	movq	%rbx, %rsi
	leaq	.Lubsan_data1155(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL871:
	jmp	.L984
.LVL872:
.L1082:
.LBB2153:
.LBB2069:
.LBB2066:
	.loc 17 239 41 view .LVU1260
	call	__asan_report_store8@PLT
.LVL873:
.L986:
	.loc 17 239 41 view .LVU1261
.LBE2066:
.LBE2069:
.LBE2153:
	.loc 17 247 29 view .LVU1262
	movq	%rbx, %rsi
	leaq	.Lubsan_data1157(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL874:
	jmp	.L987
.LVL875:
.L988:
.LBB2154:
.LBB2074:
	.loc 2 223 28 view .LVU1263
	movq	%rbx, %rsi
	leaq	.Lubsan_data1158(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL876:
	jmp	.L989
.L1083:
	.loc 2 223 28 view .LVU1264
	movq	%rbx, %rdi
	call	__asan_report_load8@PLT
.LVL877:
.L1084:
	.loc 2 223 28 view .LVU1265
.LBE2074:
.LBE2154:
.LBB2155:
.LBB2091:
.LBB2089:
	.loc 2 428 23 view .LVU1266
	cmpq	$0, -216(%rbp)
	je	.L1104
.LVL878:
.L992:
	.loc 2 428 23 discriminator 1 view .LVU1267
	cmpq	$0, -224(%rbp)
	je	.L1105
.L993:
.LVL879:
.LBB2083:
.LBI2083:
	.loc 16 351 7 is_stmt 1 view .LVU1268
.LBB2084:
	.loc 16 354 2 view .LVU1269
	.loc 16 358 2 view .LVU1270
	.loc 16 358 9 is_stmt 0 view .LVU1271
	cmpq	$0, -216(%rbp)
	je	.L1106
.L994:
	movq	-216(%rbp), %rcx
	movq	%rcx, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	andl	$7, %ecx
	cmpb	%cl, %al
	jg	.L995
	testb	%al, %al
	jne	.L1107
.L995:
	movq	-216(%rbp), %rax
	movzbl	(%rax), %r13d
.LVL880:
	.loc 16 358 7 view .LVU1272
	cmpq	$0, -224(%rbp)
	je	.L1108
.L996:
	movq	-224(%rbp), %rcx
	movq	%rcx, %rdi
	movq	%rcx, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	andl	$7, %ecx
	cmpb	%cl, %al
	jg	.L997
	testb	%al, %al
	jne	.L1109
.L997:
	movq	-224(%rbp), %rax
	movb	%r13b, (%rax)
.LVL881:
	.loc 16 359 7 view .LVU1273
	jmp	.L998
.LVL882:
.L1104:
	.loc 16 359 7 view .LVU1274
.LBE2084:
.LBE2083:
	.loc 2 428 23 view .LVU1275
	movl	$0, %esi
	leaq	.Lubsan_data1159(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL883:
	.loc 2 428 23 view .LVU1276
	jmp	.L992
.L1105:
	.loc 2 428 23 discriminator 1 view .LVU1277
	movl	$0, %esi
	leaq	.Lubsan_data1160(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL884:
	jmp	.L993
.LVL885:
.L1106:
.LBB2086:
.LBB2085:
	.loc 16 358 9 view .LVU1278
	movl	$0, %esi
	leaq	.Lubsan_data1161(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL886:
	jmp	.L994
.L1107:
	movq	-216(%rbp), %rdi
	call	__asan_report_load1@PLT
.LVL887:
.L1108:
	.loc 16 358 7 view .LVU1279
	movl	$0, %esi
	leaq	.Lubsan_data1162(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL888:
	jmp	.L996
.L1109:
	call	__asan_report_store1@PLT
.LVL889:
.L1099:
	.loc 16 358 7 view .LVU1280
.LBE2085:
.LBE2086:
.LBB2087:
.LBB2081:
	.loc 16 435 49 view .LVU1281
	leaq	.Lubsan_data846(%rip), %rdi
	call	__ubsan_handle_nonnull_arg@PLT
.LVL890:
	jmp	.L999
.LVL891:
.L1100:
	.loc 16 435 49 view .LVU1282
.LBE2081:
.LBE2087:
.LBE2089:
.LBE2091:
.LBE2155:
	.loc 17 249 21 view .LVU1283
	call	__asan_report_store8@PLT
.LVL892:
.L1001:
	.loc 17 251 15 view .LVU1284
	movq	%rbx, %rsi
	leaq	.Lubsan_data1163(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL893:
	jmp	.L1002
.LVL894:
.L1003:
.LBB2156:
.LBB2147:
	.loc 2 256 11 view .LVU1285
	movq	%rbx, %rsi
	leaq	.Lubsan_data1164(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL895:
	jmp	.L1004
.LVL896:
.L1005:
.LBB2141:
.LBB2137:
	.loc 2 218 26 view .LVU1286
	movq	%rbx, %rsi
	leaq	.Lubsan_data1165(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL897:
	jmp	.L1006
.L1101:
	.loc 2 218 26 view .LVU1287
	call	__asan_report_store8@PLT
.LVL898:
.L1102:
	.loc 2 218 26 view .LVU1288
.LBE2137:
.LBE2141:
	.loc 2 257 21 discriminator 1 view .LVU1289
	call	__asan_report_store1@PLT
.LVL899:
.L1009:
	.loc 2 257 29 discriminator 1 view .LVU1290
	movq	%rbx, %rsi
	leaq	.Lubsan_data1166(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL900:
	jmp	.L1010
.LVL901:
.L1011:
.LBB2142:
.LBB2140:
	.loc 2 223 28 view .LVU1291
	movq	%rbx, %rsi
	leaq	.Lubsan_data1167(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL902:
	jmp	.L1012
.L1103:
	.loc 2 223 28 view .LVU1292
	movq	%rbx, %rdi
	call	__asan_report_load8@PLT
.LVL903:
.L1014:
	.loc 2 223 28 view .LVU1293
.LBE2140:
.LBE2142:
	.loc 2 257 31 discriminator 3 view .LVU1294
	cmpq	%rdx, %rbx
	jb	.L1016
.L1015:
	addq	%r13, %rbx
	je	.L1110
.L1017:
.LVL904:
.LBB2143:
.LBI2143:
	.loc 16 351 7 is_stmt 1 view .LVU1295
.LBB2144:
	.loc 16 354 2 view .LVU1296
	.loc 16 358 2 view .LVU1297
	.loc 16 358 7 is_stmt 0 view .LVU1298
	testq	%rbx, %rbx
	je	.L1111
.L1018:
	.loc 16 358 7 view .LVU1299
	movq	%rbx, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	movq	%rbx, %rdx
	andl	$7, %edx
	cmpb	%dl, %al
	jg	.L1019
	testb	%al, %al
	jne	.L1112
.L1019:
	movb	$0, (%rbx)
.LVL905:
	.loc 16 358 7 view .LVU1300
.LBE2144:
.LBE2143:
	.loc 2 257 21 discriminator 5 view .LVU1301
	leaq	-112(%r12), %rax
	shrq	$3, %rax
	movb	$-8, 2147450880(%rax)
.LVL906:
	.loc 2 257 21 discriminator 5 view .LVU1302
.LBE2147:
.LBE2156:
.LBB2157:
.LBI2157:
	.loc 17 242 4 is_stmt 1 view .LVU1303
.LBB2158:
	.loc 17 242 20 is_stmt 0 view .LVU1304
	leaq	-64(%r12), %rdi
.LVL907:
	.loc 17 242 20 view .LVU1305
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1113
	movq	-64(%r12), %rbx
	.loc 17 242 16 view .LVU1306
	testq	%rbx, %rbx
	je	.L920
	.loc 17 242 54 discriminator 1 view .LVU1307
	je	.L1022
	testb	$7, %bl
	jne	.L1022
.LVL908:
.L1023:
.LBB2159:
.LBI2159:
	.loc 2 280 7 is_stmt 1 view .LVU1308
.LBB2160:
	.loc 2 282 18 is_stmt 0 view .LVU1309
	testq	%rbx, %rbx
	je	.L1024
	testb	$7, %bl
	jne	.L1024
.L1025:
.LVL909:
.LBB2161:
.LBI2161:
	.loc 2 262 7 is_stmt 1 view .LVU1310
.LBB2162:
	.loc 2 264 13 is_stmt 0 view .LVU1311
	testq	%rbx, %rbx
	je	.L1026
	testb	$7, %bl
	jne	.L1026
.L1027:
.LVL910:
.LBB2163:
.LBI2163:
	.loc 2 222 7 is_stmt 1 view .LVU1312
.LBB2164:
	.loc 2 223 28 is_stmt 0 view .LVU1313
	testq	%rbx, %rbx
	je	.L1028
	testb	$7, %bl
	jne	.L1028
.L1029:
	.loc 2 223 28 view .LVU1314
	movq	%rbx, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1114
	movq	(%rbx), %r12
.LVL911:
	.loc 2 223 28 view .LVU1315
.LBE2164:
.LBE2163:
	.loc 2 264 32 discriminator 2 view .LVU1316
	testq	%rbx, %rbx
	je	.L1031
	testb	$7, %bl
	jne	.L1031
.L1032:
.LVL912:
.LBB2166:
.LBI2166:
	.loc 2 238 7 is_stmt 1 view .LVU1317
.LBB2167:
	.loc 2 241 57 is_stmt 0 view .LVU1318
	testq	%rbx, %rbx
	je	.L1033
	testb	$7, %bl
	jne	.L1033
.L1034:
	.loc 2 241 57 view .LVU1319
	leaq	16(%rbx), %rdx
	cmpq	$-16, %rbx
	jnb	.L1115
.L1035:
	movq	%rbx, %r13
	addq	$16, %r13
	je	.L1116
.L1036:
	.loc 2 241 57 discriminator 1 view .LVU1320
	testq	%rbx, %rbx
	je	.L1037
	testb	$7, %bl
	jne	.L1037
.L1038:
.LVL913:
	.loc 2 241 57 discriminator 1 view .LVU1321
.LBE2167:
.LBE2166:
	.loc 2 264 2 discriminator 4 view .LVU1322
	cmpq	%r13, %r12
	je	.L1117
.LVL914:
	.loc 2 264 2 discriminator 4 view .LVU1323
.LBE2162:
.LBE2161:
	.loc 2 283 14 view .LVU1324
	testq	%rbx, %rbx
	je	.L1051
	testb	$7, %bl
	jne	.L1051
.L1052:
	.loc 2 283 14 discriminator 1 view .LVU1325
	testq	%rbx, %rbx
	je	.L1053
	testb	$7, %bl
	jne	.L1053
.L1054:
.LVL915:
.LBB2172:
.LBI2172:
	.loc 2 288 7 is_stmt 1 view .LVU1326
.LBB2173:
	.loc 2 289 62 is_stmt 0 view .LVU1327
	testq	%rbx, %rbx
	je	.L1055
	testb	$7, %bl
	jne	.L1055
.LVL916:
.L1056:
.LBB2174:
.LBI2174:
	.loc 2 222 7 is_stmt 1 view .LVU1328
.LBB2175:
	.loc 2 223 28 is_stmt 0 view .LVU1329
	testq	%rbx, %rbx
	je	.L1057
	testb	$7, %bl
	jne	.L1057
.L1058:
.LVL917:
	.loc 2 223 28 view .LVU1330
.LBE2175:
.LBE2174:
	.loc 2 289 51 discriminator 2 view .LVU1331
	testq	%rbx, %rbx
	je	.L1059
	testb	$7, %bl
	jne	.L1059
.L1060:
.LVL918:
.LBB2177:
.LBI2177:
	.loc 2 336 7 is_stmt 1 view .LVU1332
.LBB2178:
	.loc 2 337 16 is_stmt 0 view .LVU1333
	testq	%rbx, %rbx
	je	.L1061
	testb	$7, %bl
	jne	.L1061
.L1062:
	.loc 2 337 16 view .LVU1334
	testq	%rbx, %rbx
	je	.L1118
.L1063:
.LVL919:
	.loc 2 337 16 view .LVU1335
.LBE2178:
.LBE2177:
	.loc 2 289 34 discriminator 4 view .LVU1336
	testq	%rbx, %rbx
	je	.L1119
.L1064:
.LVL920:
.LBB2180:
.LBI2180:
	.loc 9 516 7 is_stmt 1 view .LVU1337
.LBB2181:
	.loc 9 517 23 is_stmt 0 view .LVU1338
	testq	%rbx, %rbx
	je	.L1120
.L1065:
.LVL921:
.LBB2182:
.LBI2182:
	.loc 10 203 7 is_stmt 1 view .LVU1339
.LBB2183:
	.loc 10 210 35 is_stmt 0 view .LVU1340
	testq	%rbx, %rbx
	je	.L1121
.L1066:
.LVL922:
.LBB2184:
.LBI2184:
	.loc 11 156 7 is_stmt 1 view .LVU1341
.LBB2185:
.LBI2185:
	.loc 1 27 6 view .LVU1342
.LBB2186:
	.loc 1 27 51 view .LVU1343
	.loc 1 27 60 is_stmt 0 view .LVU1344
	movq	%r12, %rdi
	call	free@PLT
.LVL923:
.L920:
	.loc 1 27 60 view .LVU1345
.LBE2186:
.LBE2185:
.LBE2184:
.LBE2183:
.LBE2182:
.LBE2181:
.LBE2180:
.LBE2173:
.LBE2172:
.LBE2160:
.LBE2159:
.LBE2158:
.LBE2157:
.LBE2205:
.LBE2208:
.LBE2214:
.LBE2220:
	.loc 2 641 7 view .LVU1346
	cmpq	%r14, -232(%rbp)
	jne	.L1122
	pxor	%xmm0, %xmm0
	movups	%xmm0, 2147450880(%r15)
.LVL924:
.L919:
	.loc 2 650 7 view .LVU1347
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L1123
	addq	$200, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
.LVL925:
	.loc 2 650 7 view .LVU1348
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.LVL926:
.L1110:
	.cfi_restore_state
.LBB2221:
.LBB2215:
.LBB2209:
.LBB2206:
.LBB2202:
.LBB2148:
	.loc 2 257 31 discriminator 3 view .LVU1349
	movl	$0, %esi
	leaq	.Lubsan_data1169(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL927:
	jmp	.L1017
.LVL928:
.L1111:
.LBB2146:
.LBB2145:
	.loc 16 358 7 view .LVU1350
	movl	$0, %esi
	leaq	.Lubsan_data1171(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL929:
	jmp	.L1018
.L1112:
	.loc 16 358 7 view .LVU1351
	movq	%rbx, %rdi
	call	__asan_report_store1@PLT
.LVL930:
.L1113:
	.loc 16 358 7 view .LVU1352
.LBE2145:
.LBE2146:
.LBE2148:
.LBE2202:
.LBB2203:
.LBB2200:
	.loc 17 242 20 view .LVU1353
	call	__asan_report_load8@PLT
.LVL931:
.L1022:
	.loc 17 242 54 discriminator 1 view .LVU1354
	movq	%rbx, %rsi
	leaq	.Lubsan_data1174(%rip), %rdi
.LVL932:
	.loc 17 242 54 discriminator 1 view .LVU1355
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL933:
	jmp	.L1023
.LVL934:
.L1024:
.LBB2198:
.LBB2196:
	.loc 2 282 18 view .LVU1356
	movq	%rbx, %rsi
	leaq	.Lubsan_data1175(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL935:
	jmp	.L1025
.LVL936:
.L1026:
.LBB2194:
.LBB2171:
	.loc 2 264 13 view .LVU1357
	movq	%rbx, %rsi
	leaq	.Lubsan_data1176(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL937:
	jmp	.L1027
.LVL938:
.L1028:
.LBB2169:
.LBB2165:
	.loc 2 223 28 view .LVU1358
	movq	%rbx, %rsi
	leaq	.Lubsan_data1177(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL939:
	jmp	.L1029
.L1114:
	.loc 2 223 28 view .LVU1359
	movq	%rbx, %rdi
	call	__asan_report_load8@PLT
.LVL940:
.L1031:
	.loc 2 223 28 view .LVU1360
.LBE2165:
.LBE2169:
	.loc 2 264 32 discriminator 2 view .LVU1361
	movq	%rbx, %rsi
	leaq	.Lubsan_data1178(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL941:
	jmp	.L1032
.LVL942:
.L1033:
.LBB2170:
.LBB2168:
	.loc 2 241 57 view .LVU1362
	movq	%rbx, %rsi
	leaq	.Lubsan_data1179(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL943:
	jmp	.L1034
.L1115:
	.loc 2 241 57 view .LVU1363
	movq	%rbx, %rsi
	leaq	.Lubsan_data1180(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL944:
	jmp	.L1035
.L1116:
	.loc 2 241 57 view .LVU1364
	movl	$0, %esi
	leaq	.Lubsan_data1181(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL945:
	jmp	.L1036
.L1037:
	.loc 2 241 57 discriminator 1 view .LVU1365
	movq	%rbx, %rsi
	leaq	.Lubsan_data1182(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL946:
	jmp	.L1038
.LVL947:
.L1117:
	.loc 2 241 57 discriminator 1 view .LVU1366
.LBE2168:
.LBE2170:
	.loc 2 266 10 view .LVU1367
	testq	%rbx, %rbx
	je	.L1040
	testb	$7, %bl
	jne	.L1040
.L1041:
	leaq	8(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1124
	.loc 2 266 6 view .LVU1368
	cmpq	$15, 8(%rbx)
	jbe	.L920
	.loc 2 267 29 view .LVU1369
	call	__asan_handle_no_return@PLT
.LVL948:
	leaq	.Lubsan_data693(%rip), %rdi
	call	__ubsan_handle_builtin_unreachable@PLT
.LVL949:
.L1040:
	.loc 2 266 10 view .LVU1370
	movq	%rbx, %rsi
	leaq	.Lubsan_data1183(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL950:
	jmp	.L1041
.L1124:
	.loc 2 266 10 view .LVU1371
	call	__asan_report_load8@PLT
.LVL951:
.L1069:
	.loc 2 266 10 view .LVU1372
	endbr64
.LBE2171:
.LBE2194:
.LBE2196:
.LBE2198:
.LBE2200:
.LBE2203:
	movq	%rax, %rdx
	leaq	-96(%r12), %rax
	shrq	$3, %rax
	movb	$-8, 2147450880(%rax)
	leaq	-64(%r12), %rax
	shrq	$3, %rax
	movb	$-8, 2147450880(%rax)
	movq	%rdx, %r12
.LVL952:
.L1044:
	.loc 2 266 10 view .LVU1373
.LBE2206:
.LBE2209:
.LBE2215:
	.loc 2 642 9 view .LVU1374
	testq	%rbx, %rbx
	je	.L1045
	testb	$7, %bl
	je	.L1046
.L1045:
	movq	%rbx, %rsi
	leaq	.Lubsan_data1184(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL953:
.L1046:
	.loc 2 650 7 view .LVU1375
	testq	%rbx, %rbx
	je	.L1047
	testb	$7, %bl
	je	.L1048
.L1047:
	movq	%rbx, %rsi
	leaq	.Lubsan_data1185(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL954:
.L1048:
.LBB2216:
.LBI2216:
	.loc 2 181 14 is_stmt 1 view .LVU1376
.LBB2217:
	testq	%rbx, %rbx
	jne	.L1049
	movl	$0, %esi
	leaq	.Lubsan_data1186(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL955:
.L1049:
.LBB2218:
.LBI2218:
	.loc 10 184 7 view .LVU1377
	.loc 10 184 7 is_stmt 0 view .LVU1378
	call	__asan_handle_no_return@PLT
.LVL956:
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	je	.L1050
	call	__stack_chk_fail@PLT
.LVL957:
.L1050:
	movq	%r12, %rdi
.LEHB31:
	call	_Unwind_Resume@PLT
.LVL958:
.LEHE31:
.L1051:
	.loc 10 184 7 view .LVU1379
.LBE2218:
.LBE2217:
.LBE2216:
.LBB2219:
.LBB2210:
.LBB2207:
.LBB2204:
.LBB2201:
.LBB2199:
.LBB2197:
	.loc 2 283 14 view .LVU1380
	movq	%rbx, %rsi
	leaq	.Lubsan_data1187(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL959:
	jmp	.L1052
.L1053:
	.loc 2 283 14 discriminator 1 view .LVU1381
	movq	%rbx, %rsi
	leaq	.Lubsan_data1188(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL960:
	jmp	.L1054
.LVL961:
.L1055:
.LBB2195:
.LBB2193:
	.loc 2 289 62 view .LVU1382
	movq	%rbx, %rsi
	leaq	.Lubsan_data1189(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL962:
	.loc 2 289 62 view .LVU1383
	jmp	.L1056
.LVL963:
.L1057:
.LBB2190:
.LBB2176:
	.loc 2 223 28 view .LVU1384
	movq	%rbx, %rsi
	leaq	.Lubsan_data1190(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL964:
	jmp	.L1058
.LVL965:
.L1059:
	.loc 2 223 28 view .LVU1385
.LBE2176:
.LBE2190:
	.loc 2 289 51 discriminator 2 view .LVU1386
	movq	%rbx, %rsi
	leaq	.Lubsan_data1191(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL966:
	jmp	.L1060
.LVL967:
.L1061:
.LBB2191:
.LBB2179:
	.loc 2 337 16 view .LVU1387
	movq	%rbx, %rsi
	leaq	.Lubsan_data1192(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL968:
	jmp	.L1062
.L1118:
	.loc 2 337 16 view .LVU1388
	movl	$0, %esi
	leaq	.Lubsan_data1193(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL969:
	jmp	.L1063
.LVL970:
.L1119:
	.loc 2 337 16 view .LVU1389
.LBE2179:
.LBE2191:
	.loc 2 289 34 discriminator 4 view .LVU1390
	movl	$0, %esi
	leaq	.Lubsan_data1194(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL971:
	jmp	.L1064
.LVL972:
.L1120:
.LBB2192:
.LBB2189:
	.loc 9 517 23 view .LVU1391
	movl	$0, %esi
	leaq	.Lubsan_data1195(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL973:
	jmp	.L1065
.LVL974:
.L1121:
.LBB2188:
.LBB2187:
	.loc 10 210 35 view .LVU1392
	movl	$0, %esi
	leaq	.Lubsan_data1196(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL975:
	jmp	.L1066
.LVL976:
.L1122:
	.loc 10 210 35 view .LVU1393
.LBE2187:
.LBE2188:
.LBE2189:
.LBE2192:
.LBE2193:
.LBE2195:
.LBE2197:
.LBE2199:
.LBE2201:
.LBE2204:
.LBE2207:
.LBE2210:
.LBE2219:
.LBE2221:
	.loc 2 641 7 view .LVU1394
	movq	$1172321806, (%r14)
.LVL977:
	.loc 2 641 7 view .LVU1395
	movdqa	.LC1(%rip), %xmm0
	movups	%xmm0, 2147450880(%r15)
	movq	120(%r14), %rax
	movb	$0, (%rax)
	jmp	.L919
.L1123:
	.loc 2 650 7 view .LVU1396
	call	__stack_chk_fail@PLT
.LVL978:
	.cfi_endproc
.LFE6725:
	.section	.gcc_except_table
.LLSDA6725:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE6725-.LLSDACSB6725
.LLSDACSB6725:
	.uleb128 .LEHB29-.LFB6725
	.uleb128 .LEHE29-.LEHB29
	.uleb128 .L1068-.LFB6725
	.uleb128 0
	.uleb128 .LEHB30-.LFB6725
	.uleb128 .LEHE30-.LEHB30
	.uleb128 .L1069-.LFB6725
	.uleb128 0
	.uleb128 .LEHB31-.LFB6725
	.uleb128 .LEHE31-.LEHB31
	.uleb128 0
	.uleb128 0
.LLSDACSE6725:
	.section	.text._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_,"axG",@progbits,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC5IS3_EEPKcRKS3_,comdat
	.size	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_, .-_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_
	.weak	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_
	.set	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_
	.section	.text._ZNSt19istreambuf_iteratorIcSt11char_traitsIcEEC2ERSi,"axG",@progbits,_ZNSt19istreambuf_iteratorIcSt11char_traitsIcEEC5ERSi,comdat
	.align 2
	.weak	_ZNSt19istreambuf_iteratorIcSt11char_traitsIcEEC2ERSi
	.type	_ZNSt19istreambuf_iteratorIcSt11char_traitsIcEEC2ERSi, @function
_ZNSt19istreambuf_iteratorIcSt11char_traitsIcEEC2ERSi:
.LASANPC6831:
.LVL979:
.LFB6831:
	.file 18 "/usr/include/c++/13/bits/streambuf_iterator.h"
	.loc 18 133 7 is_stmt 1 view -0
	.cfi_startproc
	.loc 18 133 7 is_stmt 0 view .LVU1398
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$8, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rdi, %r12
	movq	%rsi, %rbx
	.loc 18 133 7 view .LVU1399
	testq	%rdi, %rdi
	je	.L1126
	testb	$7, %dil
	jne	.L1126
.LVL980:
.L1127:
.LBB2225:
	.loc 18 134 26 view .LVU1400
	testq	%rbx, %rbx
	je	.L1128
	testb	$7, %bl
	jne	.L1128
.L1129:
	movq	%rbx, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1186
	movq	(%rbx), %r13
	movabsq	$-8664976708444, %rax
	xorq	%r13, %rax
	movabsq	$-7070675565921424023, %rcx
	imulq	%rcx, %rax
	movq	%rax, %rdx
	salq	$47, %rdx
	xorq	%r13, %rax
	xorq	%rdx, %rax
	imulq	%rcx, %rax
	movq	%rax, %rdx
	salq	$47, %rdx
	xorq	%rax, %rdx
	imulq	%rcx, %rdx
	movq	%rdx, %rcx
	andl	$127, %ecx
	leaq	__ubsan_vptr_type_cache(%rip), %rax
	cmpq	%rdx, (%rax,%rcx,8)
	jne	.L1187
.L1131:
	.loc 18 134 26 discriminator 1 view .LVU1401
	testq	%rbx, %rbx
	je	.L1132
	testb	$7, %bl
	jne	.L1132
.L1133:
	leaq	-24(%r13), %rdx
	cmpq	$24, %r13
	jb	.L1188
.L1134:
	movq	%r13, %r15
	subq	$24, %r15
	je	.L1135
	testb	$7, %r15b
	jne	.L1135
.L1136:
	leaq	-24(%r13), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1189
	movq	-24(%r13), %r14
	leaq	(%rbx,%r14), %rdx
	testq	%r14, %r14
	js	.L1138
	cmpq	%rbx, %rdx
	jnb	.L1139
.L1140:
	movq	%rbx, %rsi
	leaq	.Lubsan_data1203(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL981:
	jmp	.L1139
.LVL982:
.L1126:
	.loc 18 134 26 discriminator 1 view .LVU1402
.LBE2225:
	.loc 18 133 7 view .LVU1403
	movq	%r12, %rsi
	leaq	.Lubsan_data1197(%rip), %rdi
.LVL983:
	.loc 18 133 7 view .LVU1404
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL984:
	jmp	.L1127
.L1128:
.LBB2230:
	.loc 18 134 26 view .LVU1405
	movq	%rbx, %rsi
	leaq	.Lubsan_data1198(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL985:
	jmp	.L1129
.L1186:
	.loc 18 134 26 view .LVU1406
	movq	%rbx, %rdi
	call	__asan_report_load8@PLT
.LVL986:
.L1187:
	.loc 18 134 26 view .LVU1407
	movq	%rbx, %rsi
	leaq	.Lubsan_data1199(%rip), %rdi
	call	__ubsan_handle_dynamic_type_cache_miss@PLT
.LVL987:
	jmp	.L1131
.L1132:
	.loc 18 134 26 discriminator 1 view .LVU1408
	movq	%rbx, %rsi
	leaq	.Lubsan_data1200(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL988:
	jmp	.L1133
.L1188:
	.loc 18 134 26 discriminator 1 view .LVU1409
	movq	%r13, %rsi
	leaq	.Lubsan_data1201(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL989:
	jmp	.L1134
.L1135:
	movq	%r15, %rsi
	leaq	.Lubsan_data1202(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL990:
	jmp	.L1136
.L1189:
	call	__asan_report_load8@PLT
.LVL991:
.L1138:
	.loc 18 134 26 discriminator 1 view .LVU1410
	cmpq	%rdx, %rbx
	jb	.L1140
.L1139:
	.loc 18 134 26 discriminator 1 view .LVU1411
	movq	%rbx, %r13
	addq	%r14, %r13
	je	.L1141
	testb	$7, %r13b
	jne	.L1141
.L1142:
	.loc 18 134 26 discriminator 2 view .LVU1412
	testq	%rbx, %rbx
	je	.L1143
	testb	$7, %bl
	jne	.L1143
.L1144:
	.loc 18 134 26 discriminator 3 view .LVU1413
	testq	%rbx, %rbx
	je	.L1145
	testb	$7, %bl
	jne	.L1145
.L1146:
	testq	%r15, %r15
	je	.L1147
	testb	$7, %r15b
	jne	.L1147
.L1148:
	leaq	(%rbx,%r14), %rdx
	testq	%r14, %r14
	js	.L1149
	cmpq	%rbx, %rdx
	jnb	.L1150
.L1151:
	movq	%rbx, %rsi
	leaq	.Lubsan_data1208(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL992:
	jmp	.L1150
.L1141:
	.loc 18 134 26 discriminator 1 view .LVU1414
	movq	%r13, %rsi
	leaq	.Lubsan_data1204(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL993:
	jmp	.L1142
.L1143:
	.loc 18 134 26 discriminator 2 view .LVU1415
	movq	%rbx, %rsi
	leaq	.Lubsan_data1205(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL994:
	jmp	.L1144
.L1145:
	.loc 18 134 26 discriminator 3 view .LVU1416
	movq	%rbx, %rsi
	leaq	.Lubsan_data1206(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL995:
	jmp	.L1146
.L1147:
	.loc 18 134 26 discriminator 3 view .LVU1417
	movq	%r15, %rsi
	leaq	.Lubsan_data1207(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL996:
	jmp	.L1148
.L1149:
	.loc 18 134 26 discriminator 3 view .LVU1418
	cmpq	%rdx, %rbx
	jb	.L1151
.L1150:
	.loc 18 134 26 discriminator 4 view .LVU1419
	testq	%rbx, %rbx
	je	.L1152
	testb	$7, %bl
	jne	.L1152
.L1153:
	testq	%r15, %r15
	je	.L1154
	testb	$7, %r15b
	jne	.L1154
.L1155:
	leaq	(%rbx,%r14), %rdx
	testq	%r14, %r14
	js	.L1156
	cmpq	%rbx, %rdx
	jnb	.L1157
.L1158:
	movq	%rbx, %rsi
	leaq	.Lubsan_data1211(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL997:
	jmp	.L1157
.L1152:
	.loc 18 134 26 discriminator 4 view .LVU1420
	movq	%rbx, %rsi
	leaq	.Lubsan_data1209(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL998:
	jmp	.L1153
.L1154:
	.loc 18 134 26 discriminator 4 view .LVU1421
	movq	%r15, %rsi
	leaq	.Lubsan_data1210(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL999:
	jmp	.L1155
.L1156:
	.loc 18 134 26 discriminator 4 view .LVU1422
	cmpq	%rdx, %rbx
	jb	.L1158
.L1157:
	.loc 18 134 26 discriminator 4 view .LVU1423
	testq	%r13, %r13
	je	.L1159
	testb	$7, %r13b
	jne	.L1159
.L1160:
	movq	%r13, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1190
	movq	0(%r13), %rcx
	movabsq	$8135312701535973029, %rdx
	xorq	%rcx, %rdx
	movabsq	$-7070675565921424023, %rsi
	imulq	%rsi, %rdx
	movq	%rdx, %rax
	salq	$47, %rax
	xorq	%rdx, %rcx
	xorq	%rcx, %rax
	imulq	%rsi, %rax
	movq	%rax, %rdx
	salq	$47, %rdx
	xorq	%rax, %rdx
	imulq	%rsi, %rdx
	movq	%rdx, %rcx
	andl	$127, %ecx
	leaq	__ubsan_vptr_type_cache(%rip), %rax
	cmpq	%rdx, (%rax,%rcx,8)
	jne	.L1191
.L1162:
	.loc 18 134 26 discriminator 5 view .LVU1424
	testq	%rbx, %rbx
	je	.L1163
	testb	$7, %bl
	jne	.L1163
.L1164:
	.loc 18 134 26 discriminator 6 view .LVU1425
	testq	%rbx, %rbx
	je	.L1165
	testb	$7, %bl
	jne	.L1165
.L1166:
	testq	%r15, %r15
	je	.L1167
	testb	$7, %r15b
	jne	.L1167
.L1168:
	leaq	(%rbx,%r14), %rdx
	testq	%r14, %r14
	js	.L1169
	cmpq	%rbx, %rdx
	jnb	.L1170
.L1171:
	movq	%rbx, %rsi
	leaq	.Lubsan_data1217(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL1000:
	jmp	.L1170
.L1159:
	.loc 18 134 26 discriminator 4 view .LVU1426
	movq	%r13, %rsi
	leaq	.Lubsan_data1212(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1001:
	jmp	.L1160
.L1190:
	movq	%r13, %rdi
	call	__asan_report_load8@PLT
.LVL1002:
.L1191:
	movq	%r13, %rsi
	leaq	.Lubsan_data1213(%rip), %rdi
	call	__ubsan_handle_dynamic_type_cache_miss@PLT
.LVL1003:
	jmp	.L1162
.L1163:
	.loc 18 134 26 discriminator 5 view .LVU1427
	movq	%rbx, %rsi
	leaq	.Lubsan_data1214(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1004:
	jmp	.L1164
.L1165:
	.loc 18 134 26 discriminator 6 view .LVU1428
	movq	%rbx, %rsi
	leaq	.Lubsan_data1215(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1005:
	jmp	.L1166
.L1167:
	.loc 18 134 26 discriminator 6 view .LVU1429
	movq	%r15, %rsi
	leaq	.Lubsan_data1216(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1006:
	jmp	.L1168
.L1169:
	.loc 18 134 26 discriminator 6 view .LVU1430
	cmpq	%rdx, %rbx
	jb	.L1171
.L1170:
.LVL1007:
.LBB2226:
.LBI2226:
	.file 19 "/usr/include/c++/13/bits/basic_ios.h"
	.loc 19 321 7 is_stmt 1 view .LVU1431
.LBB2227:
	.loc 19 322 16 is_stmt 0 view .LVU1432
	testq	%r13, %r13
	je	.L1172
	testb	$7, %r13b
	jne	.L1172
.L1173:
	.loc 19 322 16 discriminator 1 view .LVU1433
	testq	%r13, %r13
	je	.L1174
	testb	$7, %r13b
	jne	.L1174
.L1175:
	leaq	232(%r13), %rdx
	cmpq	$-232, %r13
	jnb	.L1192
.L1176:
	leaq	232(%r13), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1193
	movq	232(%r13), %rbx
.LVL1008:
	.loc 19 322 16 discriminator 1 view .LVU1434
.LBE2227:
.LBE2226:
	.loc 18 134 9 discriminator 7 view .LVU1435
	testq	%r12, %r12
	je	.L1178
	testb	$7, %r12b
	jne	.L1178
.L1179:
	movq	%r12, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1194
	movq	%rbx, (%r12)
	.loc 18 134 31 discriminator 7 view .LVU1436
	testq	%r12, %r12
	je	.L1181
	testb	$7, %r12b
	jne	.L1181
.L1182:
	leaq	8(%r12), %rdx
	cmpq	$-8, %r12
	jnb	.L1195
.L1183:
	leaq	8(%r12), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L1184
	cmpb	$3, %al
	jle	.L1196
.L1184:
	movl	$-1, 8(%r12)
.LBE2230:
	.loc 18 134 58 view .LVU1437
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
.LVL1009:
	.loc 18 134 58 view .LVU1438
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.LVL1010:
.L1172:
	.cfi_restore_state
.LBB2231:
.LBB2229:
.LBB2228:
	.loc 19 322 16 view .LVU1439
	movq	%r13, %rsi
	leaq	.Lubsan_data1218(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1011:
	jmp	.L1173
.L1174:
	.loc 19 322 16 discriminator 1 view .LVU1440
	movq	%r13, %rsi
	leaq	.Lubsan_data1219(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1012:
	jmp	.L1175
.L1192:
	.loc 19 322 16 discriminator 1 view .LVU1441
	movq	%r13, %rsi
	leaq	.Lubsan_data1220(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL1013:
	jmp	.L1176
.L1193:
	.loc 19 322 16 discriminator 1 view .LVU1442
	call	__asan_report_load8@PLT
.LVL1014:
.L1178:
	.loc 19 322 16 discriminator 1 view .LVU1443
.LBE2228:
.LBE2229:
	.loc 18 134 9 discriminator 7 view .LVU1444
	movq	%r12, %rsi
	leaq	.Lubsan_data1221(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1015:
	jmp	.L1179
.L1194:
	.loc 18 134 9 discriminator 7 view .LVU1445
	movq	%r12, %rdi
	call	__asan_report_store8@PLT
.LVL1016:
.L1181:
	.loc 18 134 31 discriminator 7 view .LVU1446
	movq	%r12, %rsi
	leaq	.Lubsan_data1222(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1017:
	jmp	.L1182
.L1195:
	.loc 18 134 31 discriminator 7 view .LVU1447
	movq	%r12, %rsi
	leaq	.Lubsan_data1223(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL1018:
	jmp	.L1183
.L1196:
	.loc 18 134 31 discriminator 7 view .LVU1448
	call	__asan_report_store4@PLT
.LVL1019:
.LBE2231:
	.cfi_endproc
.LFE6831:
	.size	_ZNSt19istreambuf_iteratorIcSt11char_traitsIcEEC2ERSi, .-_ZNSt19istreambuf_iteratorIcSt11char_traitsIcEEC2ERSi
	.weak	_ZNSt19istreambuf_iteratorIcSt11char_traitsIcEEC1ERSi
	.set	_ZNSt19istreambuf_iteratorIcSt11char_traitsIcEEC1ERSi,_ZNSt19istreambuf_iteratorIcSt11char_traitsIcEEC2ERSi
	.section	.text._ZNSt6vectorIhSaIhEED2Ev,"axG",@progbits,_ZNSt6vectorIhSaIhEED5Ev,comdat
	.align 2
	.weak	_ZNSt6vectorIhSaIhEED2Ev
	.type	_ZNSt6vectorIhSaIhEED2Ev, @function
_ZNSt6vectorIhSaIhEED2Ev:
.LASANPC6847:
.LVL1020:
.LFB6847:
	.loc 7 733 7 is_stmt 1 view -0
	.cfi_startproc
	.loc 7 733 7 is_stmt 0 view .LVU1450
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%rdi, %rbx
.LBB2255:
	.loc 7 736 28 view .LVU1451
	testq	%rdi, %rdi
	je	.L1198
	testb	$7, %dil
	jne	.L1198
.LVL1021:
.L1199:
	.loc 7 736 28 view .LVU1452
	testq	%rbx, %rbx
	je	.L1200
	testb	$7, %bl
	jne	.L1200
.L1201:
.LVL1022:
.LBB2256:
.LBI2256:
	.loc 7 301 7 is_stmt 1 view .LVU1453
.LBB2257:
	.loc 7 302 22 is_stmt 0 view .LVU1454
	testq	%rbx, %rbx
	je	.L1202
	testb	$7, %bl
	jne	.L1202
.L1203:
	testq	%rbx, %rbx
	je	.L1233
.L1204:
.LVL1023:
	.loc 7 302 22 view .LVU1455
.LBE2257:
.LBE2256:
	.loc 7 735 15 view .LVU1456
	testq	%rbx, %rbx
	je	.L1234
.L1205:
	.loc 7 735 15 discriminator 1 view .LVU1457
	testq	%rbx, %rbx
	je	.L1206
	testb	$7, %bl
	jne	.L1206
.L1207:
	leaq	8(%rbx), %rdx
	cmpq	$-8, %rbx
	jnb	.L1235
.L1208:
.LVL1024:
.LBB2259:
.LBI2259:
	.loc 9 945 5 is_stmt 1 view .LVU1458
	.loc 9 945 5 is_stmt 0 view .LVU1459
.LBE2259:
	.loc 7 738 7 view .LVU1460
	testq	%rbx, %rbx
	je	.L1209
	testb	$7, %bl
	jne	.L1209
.L1210:
	testq	%rbx, %rbx
	je	.L1211
	testb	$7, %bl
	jne	.L1211
.L1212:
.LVL1025:
.LBB2260:
.LBI2260:
	.loc 7 367 7 is_stmt 1 view .LVU1461
.LBB2261:
	.loc 7 369 15 is_stmt 0 view .LVU1462
	testq	%rbx, %rbx
	je	.L1213
	testb	$7, %bl
	jne	.L1213
.L1214:
	.loc 7 370 17 view .LVU1463
	testq	%rbx, %rbx
	je	.L1215
	testb	$7, %bl
	jne	.L1215
.L1216:
	leaq	16(%rbx), %rdx
	cmpq	$-16, %rbx
	jnb	.L1236
.L1217:
	.loc 7 370 45 view .LVU1464
	testq	%rbx, %rbx
	je	.L1218
	testb	$7, %bl
	jne	.L1218
.L1219:
	movq	%rbx, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1237
	movq	(%rbx), %r12
	.loc 7 369 15 view .LVU1465
	testq	%rbx, %rbx
	je	.L1221
	testb	$7, %bl
	jne	.L1221
.L1222:
.LVL1026:
.LBB2262:
.LBI2262:
	.loc 7 386 7 is_stmt 1 view .LVU1466
.LBB2263:
	.loc 7 389 2 is_stmt 0 view .LVU1467
	testq	%r12, %r12
	je	.L1223
	.loc 7 390 20 view .LVU1468
	testq	%rbx, %rbx
	je	.L1224
	testb	$7, %bl
	jne	.L1224
.L1225:
	.loc 7 390 19 view .LVU1469
	testq	%rbx, %rbx
	je	.L1238
.L1226:
.LVL1027:
.LBB2264:
.LBI2264:
	.loc 9 516 7 is_stmt 1 view .LVU1470
.LBB2265:
	.loc 9 517 23 is_stmt 0 view .LVU1471
	testq	%rbx, %rbx
	je	.L1239
.L1227:
.LVL1028:
.LBB2266:
.LBI2266:
	.loc 10 203 7 is_stmt 1 view .LVU1472
.LBB2267:
	.loc 10 210 35 is_stmt 0 view .LVU1473
	testq	%rbx, %rbx
	je	.L1240
.L1228:
.LVL1029:
.LBB2268:
.LBI2268:
	.loc 11 156 7 is_stmt 1 view .LVU1474
.LBB2269:
.LBI2269:
	.loc 1 27 6 view .LVU1475
.LBB2270:
	.loc 1 27 51 view .LVU1476
	.loc 1 27 60 is_stmt 0 view .LVU1477
	movq	%r12, %rdi
	call	free@PLT
.LVL1030:
.L1223:
	.loc 1 27 60 view .LVU1478
.LBE2270:
.LBE2269:
.LBE2268:
.LBE2267:
.LBE2266:
.LBE2265:
.LBE2264:
.LBE2263:
.LBE2262:
	.loc 7 371 7 view .LVU1479
	testq	%rbx, %rbx
	je	.L1229
	testb	$7, %bl
	jne	.L1229
.L1230:
.LVL1031:
.LBB2276:
.LBI2276:
	.loc 7 133 14 is_stmt 1 view .LVU1480
.LBB2277:
	testq	%rbx, %rbx
	je	.L1241
.LVL1032:
.L1197:
	.loc 7 133 14 is_stmt 0 view .LVU1481
.LBE2277:
.LBE2276:
.LBE2261:
.LBE2260:
.LBE2255:
	.loc 7 738 7 view .LVU1482
	popq	%rbx
.LVL1033:
	.loc 7 738 7 view .LVU1483
	popq	%r12
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.LVL1034:
.L1198:
	.cfi_restore_state
.LBB2285:
	.loc 7 736 28 view .LVU1484
	movq	%rbx, %rsi
	leaq	.Lubsan_data1224(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1035:
	jmp	.L1199
.L1200:
	.loc 7 736 28 view .LVU1485
	movq	%rbx, %rsi
	leaq	.Lubsan_data1225(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1036:
	jmp	.L1201
.LVL1037:
.L1202:
.LBB2283:
.LBB2258:
	.loc 7 302 22 view .LVU1486
	movq	%rbx, %rsi
	leaq	.Lubsan_data1226(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1038:
	jmp	.L1203
.L1233:
	.loc 7 302 22 view .LVU1487
	movl	$0, %esi
	leaq	.Lubsan_data1227(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1039:
	jmp	.L1204
.LVL1040:
.L1234:
	.loc 7 302 22 view .LVU1488
.LBE2258:
.LBE2283:
	.loc 7 735 15 view .LVU1489
	movl	$0, %esi
	leaq	.Lubsan_data1228(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1041:
	jmp	.L1205
.L1206:
	.loc 7 735 15 discriminator 1 view .LVU1490
	movq	%rbx, %rsi
	leaq	.Lubsan_data1229(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1042:
	jmp	.L1207
.L1235:
	.loc 7 735 15 discriminator 1 view .LVU1491
	movq	%rbx, %rsi
	leaq	.Lubsan_data1230(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL1043:
	jmp	.L1208
.L1209:
	.loc 7 738 7 view .LVU1492
	movq	%rbx, %rsi
	leaq	.Lubsan_data1231(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1044:
	jmp	.L1210
.L1211:
	.loc 7 738 7 view .LVU1493
	movq	%rbx, %rsi
	leaq	.Lubsan_data1232(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1045:
	jmp	.L1212
.LVL1046:
.L1213:
.LBB2284:
.LBB2282:
	.loc 7 369 15 view .LVU1494
	movq	%rbx, %rsi
	leaq	.Lubsan_data1233(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1047:
	jmp	.L1214
.L1215:
	.loc 7 370 17 view .LVU1495
	movq	%rbx, %rsi
	leaq	.Lubsan_data1234(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1048:
	jmp	.L1216
.L1236:
	.loc 7 370 17 view .LVU1496
	movq	%rbx, %rsi
	leaq	.Lubsan_data1235(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL1049:
	jmp	.L1217
.L1218:
	.loc 7 370 45 view .LVU1497
	movq	%rbx, %rsi
	leaq	.Lubsan_data1236(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1050:
	jmp	.L1219
.L1237:
	.loc 7 370 45 view .LVU1498
	movq	%rbx, %rdi
	call	__asan_report_load8@PLT
.LVL1051:
.L1221:
	.loc 7 369 15 view .LVU1499
	movq	%rbx, %rsi
	leaq	.Lubsan_data1237(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1052:
	jmp	.L1222
.LVL1053:
.L1224:
.LBB2280:
.LBB2275:
	.loc 7 390 20 view .LVU1500
	movq	%rbx, %rsi
	leaq	.Lubsan_data1238(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1054:
	jmp	.L1225
.L1238:
	.loc 7 390 19 view .LVU1501
	movl	$0, %esi
	leaq	.Lubsan_data1239(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1055:
	jmp	.L1226
.LVL1056:
.L1239:
.LBB2274:
.LBB2273:
	.loc 9 517 23 view .LVU1502
	movl	$0, %esi
	leaq	.Lubsan_data1240(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1057:
	jmp	.L1227
.LVL1058:
.L1240:
.LBB2272:
.LBB2271:
	.loc 10 210 35 view .LVU1503
	movl	$0, %esi
	leaq	.Lubsan_data1241(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1059:
	jmp	.L1228
.LVL1060:
.L1229:
	.loc 10 210 35 view .LVU1504
.LBE2271:
.LBE2272:
.LBE2273:
.LBE2274:
.LBE2275:
.LBE2280:
	.loc 7 371 7 view .LVU1505
	movq	%rbx, %rsi
	leaq	.Lubsan_data1242(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1061:
	jmp	.L1230
.LVL1062:
.L1241:
.LBB2281:
.LBB2279:
	.loc 7 133 14 view .LVU1506
	movl	$0, %esi
	leaq	.Lubsan_data1243(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1063:
.LBB2278:
.LBI2278:
	.loc 10 184 7 is_stmt 1 view .LVU1507
	.loc 10 184 7 is_stmt 0 view .LVU1508
.LBE2278:
.LBE2279:
.LBE2281:
.LBE2282:
.LBE2284:
.LBE2285:
	.loc 7 738 7 view .LVU1509
	jmp	.L1197
	.cfi_endproc
.LFE6847:
	.size	_ZNSt6vectorIhSaIhEED2Ev, .-_ZNSt6vectorIhSaIhEED2Ev
	.weak	_ZNSt6vectorIhSaIhEED1Ev
	.set	_ZNSt6vectorIhSaIhEED1Ev,_ZNSt6vectorIhSaIhEED2Ev
	.section	.text._ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_,"axG",@progbits,_ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_,comdat
	.weak	_ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_
	.type	_ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_, @function
_ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_:
.LASANPC6853:
.LVL1064:
.LFB6853:
	.loc 2 3727 5 is_stmt 1 view -0
	.cfi_startproc
	.loc 2 3727 5 is_stmt 0 view .LVU1511
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$8, %rsp
	.cfi_offset 13, -24
	.cfi_offset 12, -32
	.cfi_offset 3, -40
	movq	%rdi, %rbx
	movq	%rsi, %r12
	.loc 2 3730 24 view .LVU1512
	testq	%rdi, %rdi
	je	.L1243
	testb	$7, %dil
	jne	.L1243
.LVL1065:
.L1244:
.LBB2298:
.LBI2298:
	.loc 2 1071 7 is_stmt 1 view .LVU1513
.LBB2299:
	.loc 2 1072 16 is_stmt 0 view .LVU1514
	testq	%rbx, %rbx
	je	.L1245
	testb	$7, %bl
	jne	.L1245
.L1246:
	.loc 2 1072 16 view .LVU1515
	leaq	8(%rbx), %rdx
	cmpq	$-8, %rbx
	jnb	.L1268
.L1247:
	leaq	8(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1269
	movq	8(%rbx), %r13
.LVL1066:
	.loc 2 1072 16 view .LVU1516
.LBE2299:
.LBE2298:
.LBB2301:
.LBI2301:
	.loc 16 393 7 is_stmt 1 view .LVU1517
.LBB2302:
	.loc 16 396 2 view .LVU1518
	.loc 16 399 2 view .LVU1519
	.loc 16 399 25 is_stmt 0 view .LVU1520
	testq	%r12, %r12
	je	.L1270
.L1249:
	.loc 16 399 25 view .LVU1521
	movq	%r12, %rdi
	call	strlen@PLT
.LVL1067:
	movq	%rax, %rdx
.LVL1068:
	.loc 16 399 25 view .LVU1522
.LBE2302:
.LBE2301:
	.loc 2 3731 9 discriminator 4 view .LVU1523
	movl	$0, %eax
	.loc 2 3731 9 view .LVU1524
	cmpq	%rdx, %r13
	je	.L1271
.LVL1069:
.L1242:
	.loc 2 3732 5 view .LVU1525
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
.LVL1070:
	.loc 2 3732 5 view .LVU1526
	popq	%r13
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.LVL1071:
.L1243:
	.cfi_restore_state
	.loc 2 3730 24 view .LVU1527
	movq	%rbx, %rsi
.LVL1072:
	.loc 2 3730 24 view .LVU1528
	leaq	.Lubsan_data1244(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1073:
	jmp	.L1244
.LVL1074:
.L1245:
.LBB2304:
.LBB2300:
	.loc 2 1072 16 view .LVU1529
	movq	%rbx, %rsi
	leaq	.Lubsan_data1245(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1075:
	jmp	.L1246
.L1268:
	.loc 2 1072 16 view .LVU1530
	movq	%rbx, %rsi
	leaq	.Lubsan_data1246(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL1076:
	jmp	.L1247
.L1269:
	.loc 2 1072 16 view .LVU1531
	call	__asan_report_load8@PLT
.LVL1077:
.L1270:
	.loc 2 1072 16 view .LVU1532
.LBE2300:
.LBE2304:
.LBB2305:
.LBB2303:
	.loc 16 399 25 view .LVU1533
	leaq	.Lubsan_data844(%rip), %rdi
	call	__ubsan_handle_nonnull_arg@PLT
.LVL1078:
	jmp	.L1249
.LVL1079:
.L1271:
	.loc 16 399 25 view .LVU1534
.LBE2303:
.LBE2305:
	.loc 2 3731 61 discriminator 1 view .LVU1535
	testq	%rbx, %rbx
	je	.L1251
	testb	$7, %bl
	jne	.L1251
.L1252:
.LVL1080:
.LBB2306:
.LBI2306:
	.loc 2 1071 7 is_stmt 1 view .LVU1536
.LBB2307:
	.loc 2 1072 16 is_stmt 0 view .LVU1537
	testq	%rbx, %rbx
	je	.L1253
	testb	$7, %bl
	jne	.L1253
.L1254:
	.loc 2 1072 16 view .LVU1538
	movq	8(%rbx), %r13
.LVL1081:
	.loc 2 1072 16 view .LVU1539
.LBE2307:
.LBE2306:
	.loc 2 3731 40 discriminator 2 view .LVU1540
	testq	%rbx, %rbx
	je	.L1255
	testb	$7, %bl
	jne	.L1255
.L1256:
.LVL1082:
.LBB2309:
.LBI2309:
	.loc 2 2608 7 is_stmt 1 view .LVU1541
.LBB2310:
	.loc 2 2609 23 is_stmt 0 view .LVU1542
	testq	%rbx, %rbx
	je	.L1257
	testb	$7, %bl
	jne	.L1257
.L1258:
.LVL1083:
.LBB2311:
.LBI2311:
	.loc 2 222 7 is_stmt 1 view .LVU1543
.LBB2312:
	.loc 2 223 28 is_stmt 0 view .LVU1544
	testq	%rbx, %rbx
	je	.L1259
	testb	$7, %bl
	jne	.L1259
.L1260:
.LVL1084:
	.loc 2 223 28 view .LVU1545
.LBE2312:
.LBE2311:
.LBE2310:
.LBE2309:
.LBB2319:
.LBI2319:
	.loc 16 374 7 is_stmt 1 view .LVU1546
.LBB2320:
	.loc 16 376 2 view .LVU1547
	testq	%r13, %r13
	je	.L1266
.LBE2320:
.LBE2319:
.LBB2323:
.LBB2317:
.LBB2315:
.LBB2313:
	.loc 2 223 28 is_stmt 0 view .LVU1548
	movq	%rbx, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1272
	movq	(%rbx), %rbx
.LVL1085:
	.loc 2 223 28 view .LVU1549
.LBE2313:
.LBE2315:
.LBE2317:
.LBE2323:
.LBB2324:
.LBB2321:
	.loc 16 379 2 is_stmt 1 view .LVU1550
	.loc 16 389 2 view .LVU1551
	.loc 16 389 25 is_stmt 0 view .LVU1552
	testq	%rbx, %rbx
	je	.L1273
.L1263:
	.loc 16 389 25 view .LVU1553
	testq	%r12, %r12
	je	.L1274
.L1264:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	memcmp@PLT
.LVL1086:
.L1261:
	.loc 16 389 25 view .LVU1554
.LBE2321:
.LBE2324:
	.loc 2 3731 9 discriminator 5 view .LVU1555
	testl	%eax, %eax
	sete	%al
	jmp	.L1242
.LVL1087:
.L1251:
	.loc 2 3731 61 discriminator 1 view .LVU1556
	movq	%rbx, %rsi
	leaq	.Lubsan_data1247(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1088:
	jmp	.L1252
.LVL1089:
.L1253:
.LBB2325:
.LBB2308:
	.loc 2 1072 16 view .LVU1557
	movq	%rbx, %rsi
	leaq	.Lubsan_data1248(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1090:
	jmp	.L1254
.LVL1091:
.L1255:
	.loc 2 1072 16 view .LVU1558
.LBE2308:
.LBE2325:
	.loc 2 3731 40 discriminator 2 view .LVU1559
	movq	%rbx, %rsi
	leaq	.Lubsan_data1249(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1092:
	jmp	.L1256
.LVL1093:
.L1257:
.LBB2326:
.LBB2318:
	.loc 2 2609 23 view .LVU1560
	movq	%rbx, %rsi
	leaq	.Lubsan_data1250(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1094:
	jmp	.L1258
.LVL1095:
.L1259:
.LBB2316:
.LBB2314:
	.loc 2 223 28 view .LVU1561
	movq	%rbx, %rsi
	leaq	.Lubsan_data1251(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1096:
	jmp	.L1260
.LVL1097:
.L1272:
	.loc 2 223 28 view .LVU1562
	movq	%rbx, %rdi
	call	__asan_report_load8@PLT
.LVL1098:
.L1273:
	.loc 2 223 28 view .LVU1563
.LBE2314:
.LBE2316:
.LBE2318:
.LBE2326:
.LBB2327:
.LBB2322:
	.loc 16 389 25 view .LVU1564
	leaq	.Lubsan_data842(%rip), %rdi
	call	__ubsan_handle_nonnull_arg@PLT
.LVL1099:
	jmp	.L1263
.L1274:
	.loc 16 389 25 view .LVU1565
	leaq	.Lubsan_data843(%rip), %rdi
	call	__ubsan_handle_nonnull_arg@PLT
.LVL1100:
	jmp	.L1264
.LVL1101:
.L1266:
	.loc 16 377 11 view .LVU1566
	movl	$0, %eax
	jmp	.L1261
.LBE2322:
.LBE2327:
	.cfi_endproc
.LFE6853:
	.size	_ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_, .-_ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_
	.section	.rodata._ZSteqIhSaIhEEbRKSt6vectorIT_T0_ES6_.str1.8,"aMS",@progbits,1
	.align 8
.LC15:
	.string	"6 32 8 9 <unknown> 64 8 9 <unknown> 96 8 9 <unknown> 128 8 4 __it 160 8 4 __it 192 8 4 __it"
	.section	.text._ZSteqIhSaIhEEbRKSt6vectorIT_T0_ES6_,"axG",@progbits,_ZSteqIhSaIhEEbRKSt6vectorIT_T0_ES6_,comdat
	.weak	_ZSteqIhSaIhEEbRKSt6vectorIT_T0_ES6_
	.type	_ZSteqIhSaIhEEbRKSt6vectorIT_T0_ES6_, @function
_ZSteqIhSaIhEEbRKSt6vectorIT_T0_ES6_:
.LASANPC6854:
.LVL1102:
.LFB6854:
	.loc 7 2040 5 is_stmt 1 view -0
	.cfi_startproc
	.loc 7 2040 5 is_stmt 0 view .LVU1568
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$296, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	movq	%rsi, %r12
	leaq	-304(%rbp), %r14
	movq	%r14, -328(%rbp)
	cmpl	$0, __asan_option_detect_stack_use_after_return(%rip)
	jne	.L1343
.LVL1103:
.L1275:
	.loc 7 2040 5 view .LVU1569
	leaq	256(%r14), %r15
	movq	$1102416563, (%r14)
	leaq	.LC15(%rip), %rax
	movq	%rax, 8(%r14)
	leaq	.LASANPC6854(%rip), %rax
	movq	%rax, 16(%r14)
	movq	%r14, %r13
	shrq	$3, %r13
	movl	$-235802127, 2147450880(%r13)
	movl	$-218959360, 2147450884(%r13)
	movl	$-218959360, 2147450888(%r13)
	movl	$-218959360, 2147450892(%r13)
	movl	$-218959360, 2147450896(%r13)
	movl	$-218959360, 2147450900(%r13)
	movl	$-202116352, 2147450904(%r13)
	.loc 7 2040 5 view .LVU1570
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	.loc 7 2041 23 view .LVU1571
	testq	%rbx, %rbx
	je	.L1279
	testb	$7, %bl
	jne	.L1279
.L1280:
.LVL1104:
.LBB2370:
.LBI2370:
	.loc 7 992 7 is_stmt 1 view .LVU1572
.LBB2371:
	.loc 7 993 40 is_stmt 0 view .LVU1573
	testq	%rbx, %rbx
	je	.L1281
	testb	$7, %bl
	jne	.L1281
.L1282:
	.loc 7 993 40 view .LVU1574
	leaq	8(%rbx), %rdx
	cmpq	$-8, %rbx
	jnb	.L1344
.L1283:
	leaq	8(%rbx), %rax
	movq	%rax, -336(%rbp)
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1345
	movq	8(%rbx), %rax
	movq	%rax, -312(%rbp)
	.loc 7 993 66 view .LVU1575
	testq	%rbx, %rbx
	je	.L1285
	testb	$7, %bl
	jne	.L1285
.L1286:
	movq	%rbx, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1346
	.loc 7 993 50 view .LVU1576
	movq	-312(%rbp), %rax
	subq	(%rbx), %rax
	movq	%rax, -320(%rbp)
.LVL1105:
	.loc 7 993 50 view .LVU1577
.LBE2371:
.LBE2370:
	.loc 7 2041 37 discriminator 2 view .LVU1578
	testq	%r12, %r12
	je	.L1288
	testb	$7, %r12b
	jne	.L1288
.L1289:
.LVL1106:
.LBB2373:
.LBI2373:
	.loc 7 992 7 is_stmt 1 view .LVU1579
.LBB2374:
	.loc 7 993 40 is_stmt 0 view .LVU1580
	testq	%r12, %r12
	je	.L1290
	testb	$7, %r12b
	jne	.L1290
.L1291:
	.loc 7 993 40 view .LVU1581
	leaq	8(%r12), %rdx
	cmpq	$-8, %r12
	jnb	.L1347
.L1292:
	leaq	8(%r12), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1348
	movq	8(%r12), %rax
	movq	%rax, -312(%rbp)
	.loc 7 993 66 view .LVU1582
	testq	%r12, %r12
	je	.L1294
	testb	$7, %r12b
	jne	.L1294
.L1295:
	movq	%r12, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1349
.LVL1107:
	.loc 7 993 50 view .LVU1583
	movq	-312(%rbp), %rax
	subq	(%r12), %rax
.LBE2374:
.LBE2373:
	.loc 7 2042 8 discriminator 4 view .LVU1584
	movl	$0, %edx
	.loc 7 2042 8 view .LVU1585
	movq	-320(%rbp), %rcx
	cmpq	%rcx, %rax
	je	.L1350
.LVL1108:
.L1278:
	.loc 7 2040 5 view .LVU1586
	cmpq	%r14, -328(%rbp)
	jne	.L1351
	pxor	%xmm0, %xmm0
	movups	%xmm0, 2147450880(%r13)
.LVL1109:
	.loc 7 2040 5 view .LVU1587
	movups	%xmm0, 2147450892(%r13)
.L1277:
	.loc 7 2042 61 view .LVU1588
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L1352
	movl	%edx, %eax
	addq	$296, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.LVL1110:
.L1343:
	.cfi_restore_state
	.loc 7 2040 5 view .LVU1589
	movl	$224, %edi
	call	__asan_stack_malloc_2@PLT
.LVL1111:
	.loc 7 2040 5 view .LVU1590
	testq	%rax, %rax
	cmovne	%rax, %r14
	jmp	.L1275
.L1279:
	.loc 7 2041 23 view .LVU1591
	movq	%rbx, %rsi
	leaq	.Lubsan_data1252(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1112:
	jmp	.L1280
.LVL1113:
.L1281:
.LBB2376:
.LBB2372:
	.loc 7 993 40 view .LVU1592
	movq	%rbx, %rsi
	leaq	.Lubsan_data1253(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1114:
	jmp	.L1282
.L1344:
	.loc 7 993 40 view .LVU1593
	movq	%rbx, %rsi
	leaq	.Lubsan_data1254(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL1115:
	jmp	.L1283
.L1345:
	.loc 7 993 40 view .LVU1594
	movq	-336(%rbp), %rdi
	call	__asan_report_load8@PLT
.LVL1116:
.L1285:
	.loc 7 993 66 view .LVU1595
	movq	%rbx, %rsi
	leaq	.Lubsan_data1255(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1117:
	jmp	.L1286
.L1346:
	.loc 7 993 66 view .LVU1596
	movq	%rbx, %rdi
	call	__asan_report_load8@PLT
.LVL1118:
.L1288:
	.loc 7 993 66 view .LVU1597
.LBE2372:
.LBE2376:
	.loc 7 2041 37 discriminator 2 view .LVU1598
	movq	%r12, %rsi
	leaq	.Lubsan_data1256(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1119:
	jmp	.L1289
.LVL1120:
.L1290:
.LBB2377:
.LBB2375:
	.loc 7 993 40 view .LVU1599
	movq	%r12, %rsi
	leaq	.Lubsan_data1257(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1121:
	jmp	.L1291
.L1347:
	.loc 7 993 40 view .LVU1600
	movq	%r12, %rsi
	leaq	.Lubsan_data1258(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL1122:
	jmp	.L1292
.L1348:
	.loc 7 993 40 view .LVU1601
	call	__asan_report_load8@PLT
.LVL1123:
.L1294:
	.loc 7 993 66 view .LVU1602
	movq	%r12, %rsi
	leaq	.Lubsan_data1259(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1124:
	jmp	.L1295
.L1349:
	.loc 7 993 66 view .LVU1603
	movq	%r12, %rdi
	call	__asan_report_load8@PLT
.LVL1125:
.L1350:
	.loc 7 993 66 view .LVU1604
.LBE2375:
.LBE2377:
	.loc 7 2042 55 discriminator 1 view .LVU1605
	testq	%r12, %r12
	je	.L1298
	testb	$7, %r12b
	jne	.L1298
.L1299:
.LVL1126:
.LBB2378:
.LBI2378:
	.loc 7 883 7 is_stmt 1 view .LVU1606
.LBB2379:
	.loc 7 884 45 is_stmt 0 discriminator 1 view .LVU1607
	testq	%r12, %r12
	je	.L1300
	testb	$7, %r12b
	jne	.L1300
.L1301:
	.loc 7 884 45 discriminator 1 view .LVU1608
	testq	%r12, %r12
	je	.L1302
	testb	$7, %r12b
	jne	.L1302
.L1303:
	.loc 7 884 45 discriminator 2 view .LVU1609
	testq	%r12, %r12
	je	.L1304
	testb	$7, %r12b
	jne	.L1304
.L1305:
.LVL1127:
.LBB2380:
.LBI2380:
	.loc 12 1076 7 is_stmt 1 view .LVU1610
.LBB2381:
.LBB2382:
	.loc 12 1077 9 is_stmt 0 view .LVU1611
	testq	%r12, %r12
	je	.L1306
	testb	$7, %r12b
	jne	.L1306
.L1307:
	.loc 12 1077 9 view .LVU1612
	movq	%r12, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1353
	movq	(%r12), %rax
	movq	%rax, -312(%rbp)
	leaq	-160(%r15), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1354
	movq	-312(%rbp), %rax
	movq	%rax, -160(%r15)
.LVL1128:
	.loc 12 1077 9 view .LVU1613
.LBE2382:
.LBE2381:
.LBE2380:
	.loc 7 884 16 discriminator 1 view .LVU1614
	leaq	-160(%r15), %rax
	shrq	$3, %rax
	movb	$-8, 2147450880(%rax)
.LVL1129:
	.loc 7 884 16 discriminator 1 view .LVU1615
.LBE2379:
.LBE2378:
	.loc 7 2042 42 discriminator 2 view .LVU1616
	testq	%rbx, %rbx
	je	.L1310
	testb	$7, %bl
	jne	.L1310
.L1311:
.LVL1130:
.LBB2387:
.LBI2387:
	.loc 7 903 7 is_stmt 1 view .LVU1617
.LBB2388:
	.loc 7 904 16 is_stmt 0 view .LVU1618
	leaq	-192(%r15), %rax
	shrq	$3, %rax
	movb	$0, 2147450880(%rax)
	.loc 7 904 45 discriminator 1 view .LVU1619
	testq	%rbx, %rbx
	je	.L1312
	testb	$7, %bl
	jne	.L1312
.L1313:
	.loc 7 904 45 discriminator 1 view .LVU1620
	movq	-336(%rbp), %rax
	testq	%rax, %rax
	je	.L1314
	testb	$7, %al
	jne	.L1314
.L1315:
	.loc 7 904 45 discriminator 2 view .LVU1621
	testq	%rbx, %rbx
	je	.L1316
	testb	$7, %bl
	jne	.L1316
.L1317:
.LVL1131:
.LBB2389:
.LBI2389:
	.loc 12 1076 7 is_stmt 1 view .LVU1622
.LBB2390:
.LBB2391:
	.loc 12 1077 9 is_stmt 0 view .LVU1623
	movq	-336(%rbp), %rax
	testq	%rax, %rax
	je	.L1318
	testb	$7, %al
	jne	.L1318
.L1319:
	.loc 12 1077 9 view .LVU1624
	leaq	8(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1355
	movq	8(%rbx), %r12
.LVL1132:
	.loc 12 1077 9 view .LVU1625
	leaq	-192(%r15), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1356
	movq	%r12, -192(%r15)
.LVL1133:
	.loc 12 1077 9 view .LVU1626
.LBE2391:
.LBE2390:
.LBE2389:
	.loc 7 904 16 discriminator 1 view .LVU1627
	leaq	-192(%r15), %rax
	shrq	$3, %rax
	movb	$-8, 2147450880(%rax)
.LVL1134:
	.loc 7 904 16 discriminator 1 view .LVU1628
.LBE2388:
.LBE2387:
	.loc 7 2042 31 discriminator 4 view .LVU1629
	testq	%rbx, %rbx
	je	.L1322
	testb	$7, %bl
	jne	.L1322
.L1323:
.LVL1135:
.LBB2396:
.LBI2396:
	.loc 7 883 7 is_stmt 1 view .LVU1630
.LBB2397:
	.loc 7 884 16 is_stmt 0 view .LVU1631
	leaq	-224(%r15), %rax
	shrq	$3, %rax
	movb	$0, 2147450880(%rax)
	.loc 7 884 45 discriminator 1 view .LVU1632
	testq	%rbx, %rbx
	je	.L1324
	testb	$7, %bl
	jne	.L1324
.L1325:
	.loc 7 884 45 discriminator 1 view .LVU1633
	testq	%rbx, %rbx
	je	.L1326
	testb	$7, %bl
	jne	.L1326
.L1327:
	.loc 7 884 45 discriminator 2 view .LVU1634
	testq	%rbx, %rbx
	je	.L1328
	testb	$7, %bl
	jne	.L1328
.L1329:
.LVL1136:
.LBB2398:
.LBI2398:
	.loc 12 1076 7 is_stmt 1 view .LVU1635
.LBB2399:
.LBB2400:
	.loc 12 1077 9 is_stmt 0 view .LVU1636
	testq	%rbx, %rbx
	je	.L1330
	testb	$7, %bl
	jne	.L1330
.L1331:
	.loc 12 1077 9 view .LVU1637
	movq	%rbx, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1357
	movq	(%rbx), %rbx
.LVL1137:
	.loc 12 1077 9 view .LVU1638
	leaq	-224(%r15), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1358
	movq	%rbx, -224(%r15)
.LVL1138:
	.loc 12 1077 9 view .LVU1639
.LBE2400:
.LBE2399:
.LBE2398:
	.loc 7 884 16 discriminator 1 view .LVU1640
	leaq	-224(%r15), %rax
	shrq	$3, %rax
	movb	$-8, 2147450880(%rax)
.LVL1139:
	.loc 7 884 16 discriminator 1 view .LVU1641
.LBE2397:
.LBE2396:
.LBB2405:
.LBI2405:
	.loc 14 1547 5 is_stmt 1 view .LVU1642
.LBB2406:
.LBI2406:
	.loc 14 1225 5 view .LVU1643
	leaq	-128(%r15), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1359
	movq	-312(%rbp), %rax
	movq	%rax, -128(%r15)
.LBB2407:
.LBI2407:
	.loc 12 1357 5 view .LVU1644
	leaq	-96(%r15), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1360
	movq	%r12, -96(%r15)
.LBE2407:
.LBB2408:
.LBI2408:
	.loc 12 1357 5 view .LVU1645
	leaq	-64(%r15), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1361
	.loc 12 1357 5 is_stmt 0 view .LVU1646
	movq	%rbx, -64(%r15)
.LBE2408:
.LBB2409:
.LBI2409:
	.loc 12 1357 5 is_stmt 1 view .LVU1647
.LVL1140:
	.loc 12 1357 5 is_stmt 0 view .LVU1648
.LBE2409:
.LBB2410:
.LBI2410:
	.loc 14 1213 5 is_stmt 1 view .LVU1649
.LBB2411:
.LBB2412:
.LBI2412:
	.loc 14 1182 2 view .LVU1650
.LBB2413:
	.loc 14 1186 11 is_stmt 0 view .LVU1651
	movl	$1, %edx
.LBB2414:
	.loc 14 1184 4 view .LVU1652
	subq	%rbx, %r12
.LVL1141:
	.loc 14 1184 4 view .LVU1653
	je	.L1278
.LVL1142:
.LBB2415:
.LBI2415:
	.loc 14 93 5 is_stmt 1 view .LVU1654
.LBB2416:
	.loc 14 108 25 is_stmt 0 view .LVU1655
	testq	%rbx, %rbx
	je	.L1362
.LVL1143:
.L1337:
	.loc 14 108 25 view .LVU1656
	cmpq	$0, -312(%rbp)
	je	.L1363
.L1338:
	movq	%r12, %rdx
	movq	-312(%rbp), %rsi
	movq	%rbx, %rdi
	call	memcmp@PLT
.LVL1144:
	.loc 14 108 25 view .LVU1657
.LBE2416:
.LBE2415:
	.loc 14 1185 53 discriminator 1 view .LVU1658
	testl	%eax, %eax
	sete	%dl
	.loc 14 1185 53 view .LVU1659
	jmp	.L1278
.LVL1145:
.L1298:
	.loc 14 1185 53 view .LVU1660
.LBE2414:
.LBE2413:
.LBE2412:
.LBE2411:
.LBE2410:
.LBE2406:
.LBE2405:
	.loc 7 2042 55 discriminator 1 view .LVU1661
	movq	%r12, %rsi
	leaq	.Lubsan_data1260(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1146:
	jmp	.L1299
.LVL1147:
.L1300:
.LBB2425:
.LBB2386:
	.loc 7 884 45 discriminator 1 view .LVU1662
	movq	%r12, %rsi
	leaq	.Lubsan_data1261(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1148:
	jmp	.L1301
.L1302:
	.loc 7 884 45 discriminator 1 view .LVU1663
	movq	%r12, %rsi
	leaq	.Lubsan_data1262(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1149:
	jmp	.L1303
.L1304:
	.loc 7 884 45 discriminator 2 view .LVU1664
	movq	%r12, %rsi
	leaq	.Lubsan_data1263(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1150:
	jmp	.L1305
.LVL1151:
.L1306:
.LBB2385:
.LBB2384:
.LBB2383:
	.loc 12 1077 9 view .LVU1665
	movq	%r12, %rsi
	leaq	.Lubsan_data1264(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1152:
	jmp	.L1307
.L1353:
	.loc 12 1077 9 view .LVU1666
	movq	%r12, %rdi
	call	__asan_report_load8@PLT
.LVL1153:
.L1354:
	.loc 12 1077 9 view .LVU1667
	call	__asan_report_store8@PLT
.LVL1154:
.L1310:
	.loc 12 1077 9 view .LVU1668
.LBE2383:
.LBE2384:
.LBE2385:
.LBE2386:
.LBE2425:
	.loc 7 2042 42 discriminator 2 view .LVU1669
	movq	%rbx, %rsi
	leaq	.Lubsan_data1266(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1155:
	jmp	.L1311
.LVL1156:
.L1312:
.LBB2426:
.LBB2395:
	.loc 7 904 45 discriminator 1 view .LVU1670
	movq	%rbx, %rsi
	leaq	.Lubsan_data1267(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1157:
	jmp	.L1313
.L1314:
	.loc 7 904 45 discriminator 1 view .LVU1671
	movq	-336(%rbp), %rsi
	leaq	.Lubsan_data1268(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1158:
	jmp	.L1315
.L1316:
	.loc 7 904 45 discriminator 2 view .LVU1672
	movq	%rbx, %rsi
	leaq	.Lubsan_data1269(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1159:
	jmp	.L1317
.LVL1160:
.L1318:
.LBB2394:
.LBB2393:
.LBB2392:
	.loc 12 1077 9 view .LVU1673
	movq	-336(%rbp), %rsi
	leaq	.Lubsan_data1270(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1161:
	.loc 12 1077 9 view .LVU1674
	jmp	.L1319
.L1355:
	.loc 12 1077 9 view .LVU1675
	call	__asan_report_load8@PLT
.LVL1162:
.L1356:
	.loc 12 1077 9 view .LVU1676
	call	__asan_report_store8@PLT
.LVL1163:
.L1322:
	.loc 12 1077 9 view .LVU1677
.LBE2392:
.LBE2393:
.LBE2394:
.LBE2395:
.LBE2426:
	.loc 7 2042 31 discriminator 4 view .LVU1678
	movq	%rbx, %rsi
	leaq	.Lubsan_data1272(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1164:
	jmp	.L1323
.LVL1165:
.L1324:
.LBB2427:
.LBB2404:
	.loc 7 884 45 discriminator 1 view .LVU1679
	movq	%rbx, %rsi
	leaq	.Lubsan_data1273(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1166:
	jmp	.L1325
.L1326:
	.loc 7 884 45 discriminator 1 view .LVU1680
	movq	%rbx, %rsi
	leaq	.Lubsan_data1274(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1167:
	jmp	.L1327
.L1328:
	.loc 7 884 45 discriminator 2 view .LVU1681
	movq	%rbx, %rsi
	leaq	.Lubsan_data1275(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1168:
	jmp	.L1329
.LVL1169:
.L1330:
.LBB2403:
.LBB2402:
.LBB2401:
	.loc 12 1077 9 view .LVU1682
	movq	%rbx, %rsi
	leaq	.Lubsan_data1276(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1170:
	jmp	.L1331
.L1357:
	.loc 12 1077 9 view .LVU1683
	movq	%rbx, %rdi
	call	__asan_report_load8@PLT
.LVL1171:
.L1358:
	.loc 12 1077 9 view .LVU1684
	call	__asan_report_store8@PLT
.LVL1172:
.L1359:
	.loc 12 1077 9 view .LVU1685
	call	__asan_report_store8@PLT
.LVL1173:
.L1360:
	.loc 12 1077 9 view .LVU1686
	call	__asan_report_store8@PLT
.LVL1174:
.L1361:
	.loc 12 1077 9 view .LVU1687
	call	__asan_report_store8@PLT
.LVL1175:
.L1362:
	.loc 12 1077 9 view .LVU1688
.LBE2401:
.LBE2402:
.LBE2403:
.LBE2404:
.LBE2427:
.LBB2428:
.LBB2424:
.LBB2423:
.LBB2422:
.LBB2421:
.LBB2420:
.LBB2419:
.LBB2418:
.LBB2417:
	.loc 14 108 25 view .LVU1689
	leaq	.Lubsan_data851(%rip), %rdi
	call	__ubsan_handle_nonnull_arg@PLT
.LVL1176:
	.loc 14 108 25 view .LVU1690
	jmp	.L1337
.L1363:
	.loc 14 108 25 view .LVU1691
	leaq	.Lubsan_data852(%rip), %rdi
	call	__ubsan_handle_nonnull_arg@PLT
.LVL1177:
	jmp	.L1338
.LVL1178:
.L1351:
	.loc 14 108 25 view .LVU1692
.LBE2417:
.LBE2418:
.LBE2419:
.LBE2420:
.LBE2421:
.LBE2422:
.LBE2423:
.LBE2424:
.LBE2428:
	.loc 7 2040 5 view .LVU1693
	movq	$1172321806, (%r14)
.LVL1179:
	.loc 7 2040 5 view .LVU1694
	movdqa	.LC1(%rip), %xmm0
	movups	%xmm0, 2147450880(%r13)
	movups	%xmm0, 2147450892(%r13)
	movq	248(%r14), %rax
	movb	$0, (%rax)
	jmp	.L1277
.L1352:
	.loc 7 2042 61 view .LVU1695
	call	__stack_chk_fail@PLT
.LVL1180:
	.cfi_endproc
.LFE6854:
	.size	_ZSteqIhSaIhEEbRKSt6vectorIT_T0_ES6_, .-_ZSteqIhSaIhEEbRKSt6vectorIT_T0_ES6_
	.section	.text._ZNSt6vectorIN7edge_ai9LutSampleESaIS1_EED2Ev,"axG",@progbits,_ZNSt6vectorIN7edge_ai9LutSampleESaIS1_EED5Ev,comdat
	.align 2
	.weak	_ZNSt6vectorIN7edge_ai9LutSampleESaIS1_EED2Ev
	.type	_ZNSt6vectorIN7edge_ai9LutSampleESaIS1_EED2Ev, @function
_ZNSt6vectorIN7edge_ai9LutSampleESaIS1_EED2Ev:
.LASANPC6866:
.LVL1181:
.LFB6866:
	.loc 7 733 7 is_stmt 1 view -0
	.cfi_startproc
	.loc 7 733 7 is_stmt 0 view .LVU1697
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%rdi, %rbx
.LBB2449:
	.loc 7 736 28 view .LVU1698
	testq	%rdi, %rdi
	je	.L1365
	testb	$7, %dil
	jne	.L1365
.LVL1182:
.L1366:
	.loc 7 736 28 view .LVU1699
	testq	%rbx, %rbx
	je	.L1367
	testb	$7, %bl
	jne	.L1367
.L1368:
.LVL1183:
.LBB2450:
.LBI2450:
	.loc 7 301 7 is_stmt 1 view .LVU1700
.LBB2451:
	.loc 7 302 22 is_stmt 0 view .LVU1701
	testq	%rbx, %rbx
	je	.L1369
	testb	$7, %bl
	jne	.L1369
.L1370:
	testq	%rbx, %rbx
	je	.L1400
.L1371:
.LVL1184:
	.loc 7 302 22 view .LVU1702
.LBE2451:
.LBE2450:
	.loc 7 735 15 view .LVU1703
	testq	%rbx, %rbx
	je	.L1401
.L1372:
	.loc 7 735 15 discriminator 1 view .LVU1704
	testq	%rbx, %rbx
	je	.L1373
	testb	$7, %bl
	jne	.L1373
.L1374:
	leaq	8(%rbx), %rdx
	cmpq	$-8, %rbx
	jnb	.L1402
.L1375:
.LVL1185:
.LBB2453:
.LBI2453:
	.loc 9 945 5 is_stmt 1 view .LVU1705
	.loc 9 945 5 is_stmt 0 view .LVU1706
.LBE2453:
	.loc 7 738 7 view .LVU1707
	testq	%rbx, %rbx
	je	.L1376
	testb	$7, %bl
	jne	.L1376
.L1377:
	testq	%rbx, %rbx
	je	.L1378
	testb	$7, %bl
	jne	.L1378
.L1379:
.LVL1186:
.LBB2454:
.LBI2454:
	.loc 7 367 7 is_stmt 1 view .LVU1708
.LBB2455:
	.loc 7 369 15 is_stmt 0 view .LVU1709
	testq	%rbx, %rbx
	je	.L1380
	testb	$7, %bl
	jne	.L1380
.L1381:
	.loc 7 370 17 view .LVU1710
	testq	%rbx, %rbx
	je	.L1382
	testb	$7, %bl
	jne	.L1382
.L1383:
	leaq	16(%rbx), %rdx
	cmpq	$-16, %rbx
	jnb	.L1403
.L1384:
	.loc 7 370 45 view .LVU1711
	testq	%rbx, %rbx
	je	.L1385
	testb	$7, %bl
	jne	.L1385
.L1386:
	movq	%rbx, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1404
	movq	(%rbx), %r12
	.loc 7 369 15 view .LVU1712
	testq	%rbx, %rbx
	je	.L1388
	testb	$7, %bl
	jne	.L1388
.L1389:
.LVL1187:
.LBB2456:
.LBI2456:
	.loc 7 386 7 is_stmt 1 view .LVU1713
.LBB2457:
	.loc 7 389 2 is_stmt 0 view .LVU1714
	testq	%r12, %r12
	je	.L1390
	.loc 7 390 20 view .LVU1715
	testq	%rbx, %rbx
	je	.L1391
	testb	$7, %bl
	jne	.L1391
.L1392:
	.loc 7 390 19 view .LVU1716
	testq	%rbx, %rbx
	je	.L1405
.L1393:
.LVL1188:
.LBB2458:
.LBI2458:
	.loc 9 516 7 is_stmt 1 view .LVU1717
.LBB2459:
	.loc 9 517 23 is_stmt 0 view .LVU1718
	testq	%rbx, %rbx
	je	.L1406
.L1394:
.LVL1189:
.LBB2460:
.LBI2460:
	.loc 10 203 7 is_stmt 1 view .LVU1719
.LBB2461:
	.loc 10 210 35 is_stmt 0 view .LVU1720
	testq	%rbx, %rbx
	je	.L1407
.L1395:
.LVL1190:
.LBB2462:
.LBI2462:
	.loc 11 156 7 is_stmt 1 view .LVU1721
.LBB2463:
.LBI2463:
	.loc 1 27 6 view .LVU1722
.LBB2464:
	.loc 1 27 51 view .LVU1723
	.loc 1 27 60 is_stmt 0 view .LVU1724
	movq	%r12, %rdi
	call	free@PLT
.LVL1191:
.L1390:
	.loc 1 27 60 view .LVU1725
.LBE2464:
.LBE2463:
.LBE2462:
.LBE2461:
.LBE2460:
.LBE2459:
.LBE2458:
.LBE2457:
.LBE2456:
	.loc 7 371 7 view .LVU1726
	testq	%rbx, %rbx
	je	.L1396
	testb	$7, %bl
	jne	.L1396
.L1397:
.LVL1192:
.LBB2470:
.LBI2470:
	.loc 7 133 14 is_stmt 1 view .LVU1727
.LBB2471:
	testq	%rbx, %rbx
	je	.L1408
.LVL1193:
.L1364:
	.loc 7 133 14 is_stmt 0 view .LVU1728
.LBE2471:
.LBE2470:
.LBE2455:
.LBE2454:
.LBE2449:
	.loc 7 738 7 view .LVU1729
	popq	%rbx
.LVL1194:
	.loc 7 738 7 view .LVU1730
	popq	%r12
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.LVL1195:
.L1365:
	.cfi_restore_state
.LBB2479:
	.loc 7 736 28 view .LVU1731
	movq	%rbx, %rsi
	leaq	.Lubsan_data1290(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1196:
	jmp	.L1366
.L1367:
	.loc 7 736 28 view .LVU1732
	movq	%rbx, %rsi
	leaq	.Lubsan_data1291(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1197:
	jmp	.L1368
.LVL1198:
.L1369:
.LBB2477:
.LBB2452:
	.loc 7 302 22 view .LVU1733
	movq	%rbx, %rsi
	leaq	.Lubsan_data1292(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1199:
	jmp	.L1370
.L1400:
	.loc 7 302 22 view .LVU1734
	movl	$0, %esi
	leaq	.Lubsan_data1293(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1200:
	jmp	.L1371
.LVL1201:
.L1401:
	.loc 7 302 22 view .LVU1735
.LBE2452:
.LBE2477:
	.loc 7 735 15 view .LVU1736
	movl	$0, %esi
	leaq	.Lubsan_data1294(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1202:
	jmp	.L1372
.L1373:
	.loc 7 735 15 discriminator 1 view .LVU1737
	movq	%rbx, %rsi
	leaq	.Lubsan_data1295(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1203:
	jmp	.L1374
.L1402:
	.loc 7 735 15 discriminator 1 view .LVU1738
	movq	%rbx, %rsi
	leaq	.Lubsan_data1296(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL1204:
	jmp	.L1375
.L1376:
	.loc 7 738 7 view .LVU1739
	movq	%rbx, %rsi
	leaq	.Lubsan_data1297(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1205:
	jmp	.L1377
.L1378:
	.loc 7 738 7 view .LVU1740
	movq	%rbx, %rsi
	leaq	.Lubsan_data1298(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1206:
	jmp	.L1379
.LVL1207:
.L1380:
.LBB2478:
.LBB2476:
	.loc 7 369 15 view .LVU1741
	movq	%rbx, %rsi
	leaq	.Lubsan_data1299(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1208:
	jmp	.L1381
.L1382:
	.loc 7 370 17 view .LVU1742
	movq	%rbx, %rsi
	leaq	.Lubsan_data1300(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1209:
	jmp	.L1383
.L1403:
	.loc 7 370 17 view .LVU1743
	movq	%rbx, %rsi
	leaq	.Lubsan_data1301(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL1210:
	jmp	.L1384
.L1385:
	.loc 7 370 45 view .LVU1744
	movq	%rbx, %rsi
	leaq	.Lubsan_data1302(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1211:
	jmp	.L1386
.L1404:
	.loc 7 370 45 view .LVU1745
	movq	%rbx, %rdi
	call	__asan_report_load8@PLT
.LVL1212:
.L1388:
	.loc 7 369 15 view .LVU1746
	movq	%rbx, %rsi
	leaq	.Lubsan_data1303(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1213:
	jmp	.L1389
.LVL1214:
.L1391:
.LBB2474:
.LBB2469:
	.loc 7 390 20 view .LVU1747
	movq	%rbx, %rsi
	leaq	.Lubsan_data1304(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1215:
	jmp	.L1392
.L1405:
	.loc 7 390 19 view .LVU1748
	movl	$0, %esi
	leaq	.Lubsan_data1305(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1216:
	jmp	.L1393
.LVL1217:
.L1406:
.LBB2468:
.LBB2467:
	.loc 9 517 23 view .LVU1749
	movl	$0, %esi
	leaq	.Lubsan_data1306(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1218:
	jmp	.L1394
.LVL1219:
.L1407:
.LBB2466:
.LBB2465:
	.loc 10 210 35 view .LVU1750
	movl	$0, %esi
	leaq	.Lubsan_data1307(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1220:
	jmp	.L1395
.LVL1221:
.L1396:
	.loc 10 210 35 view .LVU1751
.LBE2465:
.LBE2466:
.LBE2467:
.LBE2468:
.LBE2469:
.LBE2474:
	.loc 7 371 7 view .LVU1752
	movq	%rbx, %rsi
	leaq	.Lubsan_data1308(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1222:
	jmp	.L1397
.LVL1223:
.L1408:
.LBB2475:
.LBB2473:
	.loc 7 133 14 view .LVU1753
	movl	$0, %esi
	leaq	.Lubsan_data1309(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1224:
.LBB2472:
.LBI2472:
	.loc 10 184 7 is_stmt 1 view .LVU1754
	.loc 10 184 7 is_stmt 0 view .LVU1755
.LBE2472:
.LBE2473:
.LBE2475:
.LBE2476:
.LBE2478:
.LBE2479:
	.loc 7 738 7 view .LVU1756
	jmp	.L1364
	.cfi_endproc
.LFE6866:
	.size	_ZNSt6vectorIN7edge_ai9LutSampleESaIS1_EED2Ev, .-_ZNSt6vectorIN7edge_ai9LutSampleESaIS1_EED2Ev
	.weak	_ZNSt6vectorIN7edge_ai9LutSampleESaIS1_EED1Ev
	.set	_ZNSt6vectorIN7edge_ai9LutSampleESaIS1_EED1Ev,_ZNSt6vectorIN7edge_ai9LutSampleESaIS1_EED2Ev
	.section	.text._ZNSt4spanIKhLm18446744073709551615EEC2IRKSt6vectorIhSaIhEEEEOT_,"axG",@progbits,_ZNSt4spanIKhLm18446744073709551615EEC5IRKSt6vectorIhSaIhEEEEOT_,comdat
	.align 2
	.weak	_ZNSt4spanIKhLm18446744073709551615EEC2IRKSt6vectorIhSaIhEEEEOT_
	.type	_ZNSt4spanIKhLm18446744073709551615EEC2IRKSt6vectorIhSaIhEEEEOT_, @function
_ZNSt4spanIKhLm18446744073709551615EEC2IRKSt6vectorIhSaIhEEEEOT_:
.LASANPC6874:
.LVL1225:
.LFB6874:
	.loc 3 215 2 is_stmt 1 view -0
	.cfi_startproc
	.loc 3 215 2 is_stmt 0 view .LVU1758
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	.cfi_offset 14, -24
	.cfi_offset 13, -32
	.cfi_offset 12, -40
	.cfi_offset 3, -48
	movq	%rdi, %r12
	movq	%rsi, %rbx
.LBB2496:
	.loc 3 218 53 view .LVU1759
	testq	%rdi, %rdi
	je	.L1410
	testb	$7, %dil
	jne	.L1410
.LVL1226:
.L1411:
.LBB2497:
.LBI2497:
	.file 20 "/usr/include/c++/13/bits/ranges_base.h"
	.loc 20 354 2 is_stmt 1 view .LVU1760
.LBB2498:
	.loc 20 359 21 is_stmt 0 view .LVU1761
	testq	%rbx, %rbx
	je	.L1412
	testb	$7, %bl
	jne	.L1412
.L1413:
.LVL1227:
.LBB2499:
.LBI2499:
	.loc 7 992 7 is_stmt 1 view .LVU1762
.LBB2500:
	.loc 7 993 40 is_stmt 0 view .LVU1763
	testq	%rbx, %rbx
	je	.L1414
	testb	$7, %bl
	jne	.L1414
.L1415:
	.loc 7 993 40 view .LVU1764
	leaq	8(%rbx), %rdx
	cmpq	$-8, %rbx
	jnb	.L1439
.L1416:
	leaq	8(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1440
	movq	8(%rbx), %r13
	.loc 7 993 66 view .LVU1765
	testq	%rbx, %rbx
	je	.L1418
	testb	$7, %bl
	jne	.L1418
.L1419:
	movq	%rbx, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1441
	movq	(%rbx), %r14
	.loc 7 993 50 view .LVU1766
	subq	%r14, %r13
.LVL1228:
	.loc 7 993 50 view .LVU1767
.LBE2500:
.LBE2499:
.LBE2498:
.LBE2497:
.LBB2504:
.LBI2504:
	.loc 20 476 2 is_stmt 1 view .LVU1768
.LBB2505:
	.loc 20 479 21 is_stmt 0 view .LVU1769
	testq	%rbx, %rbx
	je	.L1421
	testb	$7, %bl
	jne	.L1421
.L1422:
.LVL1229:
.LBB2506:
.LBI2506:
	.loc 7 1265 7 is_stmt 1 view .LVU1770
.LBB2507:
	.loc 7 1266 27 is_stmt 0 view .LVU1771
	testq	%rbx, %rbx
	je	.L1423
	testb	$7, %bl
	jne	.L1423
.L1424:
	.loc 7 1266 42 discriminator 1 view .LVU1772
	testq	%rbx, %rbx
	je	.L1425
	testb	$7, %bl
	jne	.L1425
.L1426:
.LVL1230:
	.loc 7 1266 42 discriminator 1 view .LVU1773
.LBE2507:
.LBE2506:
.LBE2505:
.LBE2504:
.LBB2511:
.LBI2511:
	.loc 3 159 2 is_stmt 1 view .LVU1774
.LBB2512:
.LBB2513:
.LBI2513:
	.loc 4 250 5 view .LVU1775
	.loc 4 250 5 is_stmt 0 view .LVU1776
.LBE2513:
	.loc 3 161 4 discriminator 1 view .LVU1777
	testq	%r12, %r12
	je	.L1427
	testb	$7, %r12b
	jne	.L1427
.L1428:
	.loc 3 161 4 discriminator 1 view .LVU1778
	movq	%r12, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1442
	movq	%r14, (%r12)
	.loc 3 161 38 discriminator 1 view .LVU1779
	testq	%r12, %r12
	je	.L1430
	.loc 3 161 38 discriminator 1 view .LVU1780
	testb	$7, %r12b
	jne	.L1430
.L1431:
	.loc 3 161 38 discriminator 1 view .LVU1781
	leaq	8(%r12), %rdx
	cmpq	$-8, %r12
	jnb	.L1443
.L1432:
	movq	%r12, %rbx
.LVL1231:
	.loc 3 161 38 discriminator 1 view .LVU1782
	addq	$8, %rbx
	je	.L1433
	testb	$7, %bl
	jne	.L1433
.L1434:
.LVL1232:
.LBB2514:
.LBI2514:
	.loc 3 90 2 is_stmt 1 view .LVU1783
.LBB2515:
	.loc 3 91 4 is_stmt 0 view .LVU1784
	testq	%rbx, %rbx
	je	.L1435
	testb	$7, %bl
	jne	.L1435
.L1436:
	.loc 3 91 4 view .LVU1785
	leaq	8(%r12), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1444
	movq	%r13, 8(%r12)
.LVL1233:
	.loc 3 91 4 view .LVU1786
.LBE2515:
.LBE2514:
.LBE2512:
.LBE2511:
.LBE2496:
	.loc 3 224 2 view .LVU1787
	popq	%rbx
	popq	%r12
.LVL1234:
	.loc 3 224 2 view .LVU1788
	popq	%r13
	popq	%r14
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.LVL1235:
.L1410:
	.cfi_restore_state
.LBB2522:
	.loc 3 218 53 view .LVU1789
	movq	%r12, %rsi
	leaq	.Lubsan_data1310(%rip), %rdi
.LVL1236:
	.loc 3 218 53 view .LVU1790
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1237:
	jmp	.L1411
.LVL1238:
.L1412:
.LBB2519:
.LBB2503:
	.loc 20 359 21 view .LVU1791
	movq	%rbx, %rsi
	leaq	.Lubsan_data1311(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1239:
	jmp	.L1413
.LVL1240:
.L1414:
.LBB2502:
.LBB2501:
	.loc 7 993 40 view .LVU1792
	movq	%rbx, %rsi
	leaq	.Lubsan_data1312(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1241:
	jmp	.L1415
.L1439:
	.loc 7 993 40 view .LVU1793
	movq	%rbx, %rsi
	leaq	.Lubsan_data1313(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL1242:
	jmp	.L1416
.L1440:
	.loc 7 993 40 view .LVU1794
	call	__asan_report_load8@PLT
.LVL1243:
.L1418:
	.loc 7 993 66 view .LVU1795
	movq	%rbx, %rsi
	leaq	.Lubsan_data1314(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1244:
	jmp	.L1419
.L1441:
	.loc 7 993 66 view .LVU1796
	movq	%rbx, %rdi
	call	__asan_report_load8@PLT
.LVL1245:
.L1421:
	.loc 7 993 66 view .LVU1797
.LBE2501:
.LBE2502:
.LBE2503:
.LBE2519:
.LBB2520:
.LBB2510:
	.loc 20 479 21 view .LVU1798
	movq	%rbx, %rsi
	leaq	.Lubsan_data1315(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1246:
	jmp	.L1422
.LVL1247:
.L1423:
.LBB2509:
.LBB2508:
	.loc 7 1266 27 view .LVU1799
	movq	%rbx, %rsi
	leaq	.Lubsan_data1316(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1248:
	jmp	.L1424
.L1425:
	.loc 7 1266 42 discriminator 1 view .LVU1800
	movq	%rbx, %rsi
	leaq	.Lubsan_data1317(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1249:
	jmp	.L1426
.LVL1250:
.L1427:
	.loc 7 1266 42 discriminator 1 view .LVU1801
.LBE2508:
.LBE2509:
.LBE2510:
.LBE2520:
.LBB2521:
.LBB2518:
	.loc 3 161 4 discriminator 1 view .LVU1802
	movq	%r12, %rsi
	leaq	.Lubsan_data1318(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1251:
	jmp	.L1428
.L1442:
	.loc 3 161 4 discriminator 1 view .LVU1803
	movq	%r12, %rdi
	call	__asan_report_store8@PLT
.LVL1252:
.L1430:
	.loc 3 161 38 discriminator 1 view .LVU1804
	movq	%r12, %rsi
	leaq	.Lubsan_data1319(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1253:
	jmp	.L1431
.L1443:
	.loc 3 161 38 discriminator 1 view .LVU1805
	movq	%r12, %rsi
	leaq	.Lubsan_data1320(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL1254:
	jmp	.L1432
.LVL1255:
.L1433:
	.loc 3 161 38 discriminator 1 view .LVU1806
	movq	%rbx, %rsi
	leaq	.Lubsan_data1321(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1256:
	jmp	.L1434
.LVL1257:
.L1435:
.LBB2517:
.LBB2516:
	.loc 3 91 4 view .LVU1807
	movq	%rbx, %rsi
	leaq	.Lubsan_data1322(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1258:
	jmp	.L1436
.L1444:
	.loc 3 91 4 view .LVU1808
	call	__asan_report_store8@PLT
.LVL1259:
.LBE2516:
.LBE2517:
.LBE2518:
.LBE2521:
.LBE2522:
	.cfi_endproc
.LFE6874:
	.size	_ZNSt4spanIKhLm18446744073709551615EEC2IRKSt6vectorIhSaIhEEEEOT_, .-_ZNSt4spanIKhLm18446744073709551615EEC2IRKSt6vectorIhSaIhEEEEOT_
	.weak	_ZNSt4spanIKhLm18446744073709551615EEC1IRKSt6vectorIhSaIhEEEEOT_
	.set	_ZNSt4spanIKhLm18446744073709551615EEC1IRKSt6vectorIhSaIhEEEEOT_,_ZNSt4spanIKhLm18446744073709551615EEC2IRKSt6vectorIhSaIhEEEEOT_
	.section	.text._ZNSt4spanIKhLm18446744073709551615EEC2IRSt6vectorIhSaIhEEEEOT_,"axG",@progbits,_ZNSt4spanIKhLm18446744073709551615EEC5IRSt6vectorIhSaIhEEEEOT_,comdat
	.align 2
	.weak	_ZNSt4spanIKhLm18446744073709551615EEC2IRSt6vectorIhSaIhEEEEOT_
	.type	_ZNSt4spanIKhLm18446744073709551615EEC2IRSt6vectorIhSaIhEEEEOT_, @function
_ZNSt4spanIKhLm18446744073709551615EEC2IRSt6vectorIhSaIhEEEEOT_:
.LASANPC6897:
.LVL1260:
.LFB6897:
	.loc 3 215 2 is_stmt 1 view -0
	.cfi_startproc
	.loc 3 215 2 is_stmt 0 view .LVU1810
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	.cfi_offset 14, -24
	.cfi_offset 13, -32
	.cfi_offset 12, -40
	.cfi_offset 3, -48
	movq	%rdi, %r12
	movq	%rsi, %rbx
.LBB2539:
	.loc 3 218 53 view .LVU1811
	testq	%rdi, %rdi
	je	.L1446
	testb	$7, %dil
	jne	.L1446
.LVL1261:
.L1447:
.LBB2540:
.LBI2540:
	.loc 20 354 2 is_stmt 1 view .LVU1812
.LBB2541:
	.loc 20 359 21 is_stmt 0 view .LVU1813
	testq	%rbx, %rbx
	je	.L1448
	testb	$7, %bl
	jne	.L1448
.L1449:
.LVL1262:
.LBB2542:
.LBI2542:
	.loc 7 992 7 is_stmt 1 view .LVU1814
.LBB2543:
	.loc 7 993 40 is_stmt 0 view .LVU1815
	testq	%rbx, %rbx
	je	.L1450
	testb	$7, %bl
	jne	.L1450
.L1451:
	.loc 7 993 40 view .LVU1816
	leaq	8(%rbx), %rdx
	cmpq	$-8, %rbx
	jnb	.L1475
.L1452:
	leaq	8(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1476
	movq	8(%rbx), %r13
	.loc 7 993 66 view .LVU1817
	testq	%rbx, %rbx
	je	.L1454
	testb	$7, %bl
	jne	.L1454
.L1455:
	movq	%rbx, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1477
	movq	(%rbx), %r14
	.loc 7 993 50 view .LVU1818
	subq	%r14, %r13
.LVL1263:
	.loc 7 993 50 view .LVU1819
.LBE2543:
.LBE2542:
.LBE2541:
.LBE2540:
.LBB2547:
.LBI2547:
	.loc 20 476 2 is_stmt 1 view .LVU1820
.LBB2548:
	.loc 20 479 21 is_stmt 0 view .LVU1821
	testq	%rbx, %rbx
	je	.L1457
	testb	$7, %bl
	jne	.L1457
.L1458:
.LVL1264:
.LBB2549:
.LBI2549:
	.loc 7 1260 7 is_stmt 1 view .LVU1822
.LBB2550:
	.loc 7 1261 27 is_stmt 0 view .LVU1823
	testq	%rbx, %rbx
	je	.L1459
	testb	$7, %bl
	jne	.L1459
.L1460:
	.loc 7 1261 27 discriminator 1 view .LVU1824
	testq	%rbx, %rbx
	je	.L1461
	testb	$7, %bl
	jne	.L1461
.L1462:
.LVL1265:
	.loc 7 1261 27 discriminator 1 view .LVU1825
.LBE2550:
.LBE2549:
.LBE2548:
.LBE2547:
.LBB2554:
.LBI2554:
	.loc 3 159 2 is_stmt 1 view .LVU1826
.LBB2555:
.LBB2556:
.LBI2556:
	.loc 4 250 5 view .LVU1827
	.loc 4 250 5 is_stmt 0 view .LVU1828
.LBE2556:
	.loc 3 161 4 discriminator 1 view .LVU1829
	testq	%r12, %r12
	je	.L1463
	testb	$7, %r12b
	jne	.L1463
.L1464:
	.loc 3 161 4 discriminator 1 view .LVU1830
	movq	%r12, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1478
	movq	%r14, (%r12)
	.loc 3 161 38 discriminator 1 view .LVU1831
	testq	%r12, %r12
	je	.L1466
	.loc 3 161 38 discriminator 1 view .LVU1832
	testb	$7, %r12b
	jne	.L1466
.L1467:
	.loc 3 161 38 discriminator 1 view .LVU1833
	leaq	8(%r12), %rdx
	cmpq	$-8, %r12
	jnb	.L1479
.L1468:
	movq	%r12, %rbx
.LVL1266:
	.loc 3 161 38 discriminator 1 view .LVU1834
	addq	$8, %rbx
	je	.L1469
	testb	$7, %bl
	jne	.L1469
.L1470:
.LVL1267:
.LBB2557:
.LBI2557:
	.loc 3 90 2 is_stmt 1 view .LVU1835
.LBB2558:
	.loc 3 91 4 is_stmt 0 view .LVU1836
	testq	%rbx, %rbx
	je	.L1471
	testb	$7, %bl
	jne	.L1471
.L1472:
	.loc 3 91 4 view .LVU1837
	leaq	8(%r12), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1480
	movq	%r13, 8(%r12)
.LVL1268:
	.loc 3 91 4 view .LVU1838
.LBE2558:
.LBE2557:
.LBE2555:
.LBE2554:
.LBE2539:
	.loc 3 224 2 view .LVU1839
	popq	%rbx
	popq	%r12
.LVL1269:
	.loc 3 224 2 view .LVU1840
	popq	%r13
	popq	%r14
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.LVL1270:
.L1446:
	.cfi_restore_state
.LBB2565:
	.loc 3 218 53 view .LVU1841
	movq	%r12, %rsi
	leaq	.Lubsan_data1323(%rip), %rdi
.LVL1271:
	.loc 3 218 53 view .LVU1842
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1272:
	jmp	.L1447
.LVL1273:
.L1448:
.LBB2562:
.LBB2546:
	.loc 20 359 21 view .LVU1843
	movq	%rbx, %rsi
	leaq	.Lubsan_data1324(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1274:
	jmp	.L1449
.LVL1275:
.L1450:
.LBB2545:
.LBB2544:
	.loc 7 993 40 view .LVU1844
	movq	%rbx, %rsi
	leaq	.Lubsan_data1325(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1276:
	jmp	.L1451
.L1475:
	.loc 7 993 40 view .LVU1845
	movq	%rbx, %rsi
	leaq	.Lubsan_data1326(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL1277:
	jmp	.L1452
.L1476:
	.loc 7 993 40 view .LVU1846
	call	__asan_report_load8@PLT
.LVL1278:
.L1454:
	.loc 7 993 66 view .LVU1847
	movq	%rbx, %rsi
	leaq	.Lubsan_data1327(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1279:
	jmp	.L1455
.L1477:
	.loc 7 993 66 view .LVU1848
	movq	%rbx, %rdi
	call	__asan_report_load8@PLT
.LVL1280:
.L1457:
	.loc 7 993 66 view .LVU1849
.LBE2544:
.LBE2545:
.LBE2546:
.LBE2562:
.LBB2563:
.LBB2553:
	.loc 20 479 21 view .LVU1850
	movq	%rbx, %rsi
	leaq	.Lubsan_data1328(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1281:
	jmp	.L1458
.LVL1282:
.L1459:
.LBB2552:
.LBB2551:
	.loc 7 1261 27 view .LVU1851
	movq	%rbx, %rsi
	leaq	.Lubsan_data1329(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1283:
	jmp	.L1460
.L1461:
	.loc 7 1261 27 discriminator 1 view .LVU1852
	movq	%rbx, %rsi
	leaq	.Lubsan_data1330(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1284:
	jmp	.L1462
.LVL1285:
.L1463:
	.loc 7 1261 27 discriminator 1 view .LVU1853
.LBE2551:
.LBE2552:
.LBE2553:
.LBE2563:
.LBB2564:
.LBB2561:
	.loc 3 161 4 discriminator 1 view .LVU1854
	movq	%r12, %rsi
	leaq	.Lubsan_data1331(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1286:
	jmp	.L1464
.L1478:
	.loc 3 161 4 discriminator 1 view .LVU1855
	movq	%r12, %rdi
	call	__asan_report_store8@PLT
.LVL1287:
.L1466:
	.loc 3 161 38 discriminator 1 view .LVU1856
	movq	%r12, %rsi
	leaq	.Lubsan_data1332(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1288:
	jmp	.L1467
.L1479:
	.loc 3 161 38 discriminator 1 view .LVU1857
	movq	%r12, %rsi
	leaq	.Lubsan_data1333(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL1289:
	jmp	.L1468
.LVL1290:
.L1469:
	.loc 3 161 38 discriminator 1 view .LVU1858
	movq	%rbx, %rsi
	leaq	.Lubsan_data1334(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1291:
	jmp	.L1470
.LVL1292:
.L1471:
.LBB2560:
.LBB2559:
	.loc 3 91 4 view .LVU1859
	movq	%rbx, %rsi
	leaq	.Lubsan_data1335(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1293:
	jmp	.L1472
.L1480:
	.loc 3 91 4 view .LVU1860
	call	__asan_report_store8@PLT
.LVL1294:
.LBE2559:
.LBE2560:
.LBE2561:
.LBE2564:
.LBE2565:
	.cfi_endproc
.LFE6897:
	.size	_ZNSt4spanIKhLm18446744073709551615EEC2IRSt6vectorIhSaIhEEEEOT_, .-_ZNSt4spanIKhLm18446744073709551615EEC2IRSt6vectorIhSaIhEEEEOT_
	.weak	_ZNSt4spanIKhLm18446744073709551615EEC1IRSt6vectorIhSaIhEEEEOT_
	.set	_ZNSt4spanIKhLm18446744073709551615EEC1IRSt6vectorIhSaIhEEEEOT_,_ZNSt4spanIKhLm18446744073709551615EEC2IRSt6vectorIhSaIhEEEEOT_
	.section	.text._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv,"axG",@progbits,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv,comdat
	.align 2
	.weak	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	.type	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv, @function
_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv:
.LASANPC6947:
.LVL1295:
.LFB6947:
	.loc 2 280 7 is_stmt 1 view -0
	.cfi_startproc
	.loc 2 280 7 is_stmt 0 view .LVU1862
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$8, %rsp
	.cfi_offset 13, -24
	.cfi_offset 12, -32
	.cfi_offset 3, -40
	movq	%rdi, %rbx
	.loc 2 282 18 view .LVU1863
	testq	%rdi, %rdi
	je	.L1482
	testb	$7, %dil
	jne	.L1482
.LVL1296:
.L1483:
.LBB2586:
.LBI2586:
	.loc 2 262 7 is_stmt 1 view .LVU1864
.LBB2587:
	.loc 2 264 13 is_stmt 0 view .LVU1865
	testq	%rbx, %rbx
	je	.L1484
	testb	$7, %bl
	jne	.L1484
.L1485:
.LVL1297:
.LBB2588:
.LBI2588:
	.loc 2 222 7 is_stmt 1 view .LVU1866
.LBB2589:
	.loc 2 223 28 is_stmt 0 view .LVU1867
	testq	%rbx, %rbx
	je	.L1486
	testb	$7, %bl
	jne	.L1486
.L1487:
	.loc 2 223 28 view .LVU1868
	movq	%rbx, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1519
	movq	(%rbx), %r12
.LVL1298:
	.loc 2 223 28 view .LVU1869
.LBE2589:
.LBE2588:
	.loc 2 264 32 discriminator 2 view .LVU1870
	testq	%rbx, %rbx
	je	.L1489
	testb	$7, %bl
	jne	.L1489
.L1490:
.LVL1299:
.LBB2591:
.LBI2591:
	.loc 2 238 7 is_stmt 1 view .LVU1871
.LBB2592:
	.loc 2 241 57 is_stmt 0 view .LVU1872
	testq	%rbx, %rbx
	je	.L1491
	testb	$7, %bl
	jne	.L1491
.L1492:
	.loc 2 241 57 view .LVU1873
	leaq	16(%rbx), %rdx
	cmpq	$-16, %rbx
	jnb	.L1520
.L1493:
	movq	%rbx, %r13
	addq	$16, %r13
	je	.L1521
.L1494:
	.loc 2 241 57 discriminator 1 view .LVU1874
	testq	%rbx, %rbx
	je	.L1495
	testb	$7, %bl
	jne	.L1495
.L1496:
.LVL1300:
	.loc 2 241 57 discriminator 1 view .LVU1875
.LBE2592:
.LBE2591:
	.loc 2 264 2 discriminator 4 view .LVU1876
	cmpq	%r13, %r12
	je	.L1522
.LVL1301:
	.loc 2 264 2 discriminator 4 view .LVU1877
.LBE2587:
.LBE2586:
	.loc 2 283 14 view .LVU1878
	testq	%rbx, %rbx
	je	.L1502
	testb	$7, %bl
	jne	.L1502
.L1503:
	.loc 2 283 14 discriminator 1 view .LVU1879
	testq	%rbx, %rbx
	je	.L1504
	testb	$7, %bl
	jne	.L1504
.L1505:
.LVL1302:
.LBB2597:
.LBI2597:
	.loc 2 288 7 is_stmt 1 view .LVU1880
.LBB2598:
	.loc 2 289 62 is_stmt 0 view .LVU1881
	testq	%rbx, %rbx
	je	.L1506
	testb	$7, %bl
	jne	.L1506
.LVL1303:
.L1507:
.LBB2599:
.LBI2599:
	.loc 2 222 7 is_stmt 1 view .LVU1882
.LBB2600:
	.loc 2 223 28 is_stmt 0 view .LVU1883
	testq	%rbx, %rbx
	je	.L1508
	testb	$7, %bl
	jne	.L1508
.L1509:
.LVL1304:
	.loc 2 223 28 view .LVU1884
.LBE2600:
.LBE2599:
	.loc 2 289 51 discriminator 2 view .LVU1885
	testq	%rbx, %rbx
	je	.L1510
	testb	$7, %bl
	jne	.L1510
.L1511:
.LVL1305:
.LBB2602:
.LBI2602:
	.loc 2 336 7 is_stmt 1 view .LVU1886
.LBB2603:
	.loc 2 337 16 is_stmt 0 view .LVU1887
	testq	%rbx, %rbx
	je	.L1512
	testb	$7, %bl
	jne	.L1512
.L1513:
	.loc 2 337 16 view .LVU1888
	testq	%rbx, %rbx
	je	.L1523
.L1514:
.LVL1306:
	.loc 2 337 16 view .LVU1889
.LBE2603:
.LBE2602:
	.loc 2 289 34 discriminator 4 view .LVU1890
	testq	%rbx, %rbx
	je	.L1524
.L1515:
.LVL1307:
.LBB2605:
.LBI2605:
	.loc 9 516 7 is_stmt 1 view .LVU1891
.LBB2606:
	.loc 9 517 23 is_stmt 0 view .LVU1892
	testq	%rbx, %rbx
	je	.L1525
.L1516:
.LVL1308:
.LBB2607:
.LBI2607:
	.loc 10 203 7 is_stmt 1 view .LVU1893
.LBB2608:
	.loc 10 210 35 is_stmt 0 view .LVU1894
	testq	%rbx, %rbx
	je	.L1526
.L1517:
.LVL1309:
.LBB2609:
.LBI2609:
	.loc 11 156 7 is_stmt 1 view .LVU1895
.LBB2610:
.LBI2610:
	.loc 1 27 6 view .LVU1896
.LBB2611:
	.loc 1 27 51 view .LVU1897
	.loc 1 27 60 is_stmt 0 view .LVU1898
	movq	%r12, %rdi
	call	free@PLT
.LVL1310:
.L1481:
	.loc 1 27 60 view .LVU1899
.LBE2611:
.LBE2610:
.LBE2609:
.LBE2608:
.LBE2607:
.LBE2606:
.LBE2605:
.LBE2598:
.LBE2597:
	.loc 2 284 7 view .LVU1900
	addq	$8, %rsp
	popq	%rbx
.LVL1311:
	.loc 2 284 7 view .LVU1901
	popq	%r12
	popq	%r13
.LVL1312:
	.loc 2 284 7 view .LVU1902
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.LVL1313:
.L1482:
	.cfi_restore_state
	.loc 2 282 18 view .LVU1903
	movq	%rbx, %rsi
	leaq	.Lubsan_data1336(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1314:
	jmp	.L1483
.LVL1315:
.L1484:
.LBB2619:
.LBB2596:
	.loc 2 264 13 view .LVU1904
	movq	%rbx, %rsi
	leaq	.Lubsan_data1337(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1316:
	jmp	.L1485
.LVL1317:
.L1486:
.LBB2594:
.LBB2590:
	.loc 2 223 28 view .LVU1905
	movq	%rbx, %rsi
	leaq	.Lubsan_data1338(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1318:
	jmp	.L1487
.L1519:
	.loc 2 223 28 view .LVU1906
	movq	%rbx, %rdi
	call	__asan_report_load8@PLT
.LVL1319:
.L1489:
	.loc 2 223 28 view .LVU1907
.LBE2590:
.LBE2594:
	.loc 2 264 32 discriminator 2 view .LVU1908
	movq	%rbx, %rsi
	leaq	.Lubsan_data1339(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1320:
	jmp	.L1490
.LVL1321:
.L1491:
.LBB2595:
.LBB2593:
	.loc 2 241 57 view .LVU1909
	movq	%rbx, %rsi
	leaq	.Lubsan_data1340(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1322:
	jmp	.L1492
.L1520:
	.loc 2 241 57 view .LVU1910
	movq	%rbx, %rsi
	leaq	.Lubsan_data1341(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL1323:
	jmp	.L1493
.L1521:
	.loc 2 241 57 view .LVU1911
	movl	$0, %esi
	leaq	.Lubsan_data1342(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1324:
	jmp	.L1494
.L1495:
	.loc 2 241 57 discriminator 1 view .LVU1912
	movq	%rbx, %rsi
	leaq	.Lubsan_data1343(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1325:
	jmp	.L1496
.LVL1326:
.L1522:
	.loc 2 241 57 discriminator 1 view .LVU1913
.LBE2593:
.LBE2595:
	.loc 2 266 10 view .LVU1914
	testq	%rbx, %rbx
	je	.L1498
	testb	$7, %bl
	jne	.L1498
.L1499:
	leaq	8(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1527
	.loc 2 266 6 view .LVU1915
	cmpq	$15, 8(%rbx)
	jbe	.L1481
	.loc 2 267 29 view .LVU1916
	call	__asan_handle_no_return@PLT
.LVL1327:
	leaq	.Lubsan_data693(%rip), %rdi
	call	__ubsan_handle_builtin_unreachable@PLT
.LVL1328:
.L1498:
	.loc 2 266 10 view .LVU1917
	movq	%rbx, %rsi
	leaq	.Lubsan_data1344(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1329:
	jmp	.L1499
.L1527:
	.loc 2 266 10 view .LVU1918
	call	__asan_report_load8@PLT
.LVL1330:
.L1502:
	.loc 2 266 10 view .LVU1919
.LBE2596:
.LBE2619:
	.loc 2 283 14 view .LVU1920
	movq	%rbx, %rsi
	leaq	.Lubsan_data1345(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1331:
	jmp	.L1503
.L1504:
	.loc 2 283 14 discriminator 1 view .LVU1921
	movq	%rbx, %rsi
	leaq	.Lubsan_data1346(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1332:
	jmp	.L1505
.LVL1333:
.L1506:
.LBB2620:
.LBB2618:
	.loc 2 289 62 view .LVU1922
	movq	%rbx, %rsi
	leaq	.Lubsan_data1347(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1334:
	.loc 2 289 62 view .LVU1923
	jmp	.L1507
.LVL1335:
.L1508:
.LBB2615:
.LBB2601:
	.loc 2 223 28 view .LVU1924
	movq	%rbx, %rsi
	leaq	.Lubsan_data1348(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1336:
	jmp	.L1509
.LVL1337:
.L1510:
	.loc 2 223 28 view .LVU1925
.LBE2601:
.LBE2615:
	.loc 2 289 51 discriminator 2 view .LVU1926
	movq	%rbx, %rsi
	leaq	.Lubsan_data1349(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1338:
	jmp	.L1511
.LVL1339:
.L1512:
.LBB2616:
.LBB2604:
	.loc 2 337 16 view .LVU1927
	movq	%rbx, %rsi
	leaq	.Lubsan_data1350(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1340:
	jmp	.L1513
.L1523:
	.loc 2 337 16 view .LVU1928
	movl	$0, %esi
	leaq	.Lubsan_data1351(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1341:
	jmp	.L1514
.LVL1342:
.L1524:
	.loc 2 337 16 view .LVU1929
.LBE2604:
.LBE2616:
	.loc 2 289 34 discriminator 4 view .LVU1930
	movl	$0, %esi
	leaq	.Lubsan_data1352(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1343:
	jmp	.L1515
.LVL1344:
.L1525:
.LBB2617:
.LBB2614:
	.loc 9 517 23 view .LVU1931
	movl	$0, %esi
	leaq	.Lubsan_data1353(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1345:
	jmp	.L1516
.LVL1346:
.L1526:
.LBB2613:
.LBB2612:
	.loc 10 210 35 view .LVU1932
	movl	$0, %esi
	leaq	.Lubsan_data1354(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1347:
	jmp	.L1517
.LBE2612:
.LBE2613:
.LBE2614:
.LBE2617:
.LBE2618:
.LBE2620:
	.cfi_endproc
.LFE6947:
	.size	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv, .-_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	.section	.rodata._ZNSt6vectorIhSaIhEE17_M_realloc_insertIJcEEEvN9__gnu_cxx17__normal_iteratorIPhS1_EEDpOT_.str1.8,"aMS",@progbits,1
	.align 8
.LC16:
	.string	"11 32 8 9 <unknown> 64 8 9 <unknown> 96 8 7 __n:445 128 8 9 <unknown> 160 8 9 __diffmax 192 8 10 __allocmax 224 8 9 __diffmax 256 8 10 __allocmax 288 8 9 __diffmax 320 8 10 __allocmax 352 8 14 __position:446"
	.section	.rodata
	.align 32
.LC17:
	.string	"vector::_M_realloc_insert"
	.zero	38
	.section	.text._ZNSt6vectorIhSaIhEE17_M_realloc_insertIJcEEEvN9__gnu_cxx17__normal_iteratorIPhS1_EEDpOT_,"axG",@progbits,_ZNSt6vectorIhSaIhEE17_M_realloc_insertIJcEEEvN9__gnu_cxx17__normal_iteratorIPhS1_EEDpOT_,comdat
	.align 2
	.weak	_ZNSt6vectorIhSaIhEE17_M_realloc_insertIJcEEEvN9__gnu_cxx17__normal_iteratorIPhS1_EEDpOT_
	.type	_ZNSt6vectorIhSaIhEE17_M_realloc_insertIJcEEEvN9__gnu_cxx17__normal_iteratorIPhS1_EEDpOT_, @function
_ZNSt6vectorIhSaIhEE17_M_realloc_insertIJcEEEvN9__gnu_cxx17__normal_iteratorIPhS1_EEDpOT_:
.LASANPC7470:
.LVL1348:
.LFB7470:
	.loc 15 445 7 is_stmt 1 view -0
	.cfi_startproc
	.loc 15 445 7 is_stmt 0 view .LVU1934
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$488, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	movq	%rsi, %r14
.LVL1349:
	.loc 15 445 7 view .LVU1935
	movq	%rdx, -480(%rbp)
	leaq	-464(%rbp), %rax
	movq	%rax, -504(%rbp)
	movq	%rax, -512(%rbp)
	cmpl	$0, __asan_option_detect_stack_use_after_return(%rip)
	jne	.L1720
.LVL1350:
.L1528:
	.loc 15 445 7 view .LVU1936
	movq	-504(%rbp), %rax
	leaq	416(%rax), %r13
	movq	$1102416563, (%rax)
.LVL1351:
	.loc 15 445 7 view .LVU1937
	leaq	.LC16(%rip), %rcx
	movq	%rcx, 8(%rax)
	leaq	.LASANPC7470(%rip), %rcx
	movq	%rcx, 16(%rax)
	shrq	$3, %rax
	movq	%rax, %r12
	movl	$-235802127, 2147450880(%rax)
	movl	$-218959360, 2147450884(%rax)
	movl	$-218959360, 2147450888(%rax)
	movl	$-218959360, 2147450892(%rax)
	movl	$-218959360, 2147450896(%rax)
	movl	$-218959360, 2147450900(%rax)
	movl	$-218959360, 2147450904(%rax)
	movl	$-218959360, 2147450908(%rax)
	movl	$-218959360, 2147450912(%rax)
	movl	$-218959360, 2147450916(%rax)
	movl	$-218959360, 2147450920(%rax)
	movl	$-202116352, 2147450924(%rax)
	.loc 15 445 7 view .LVU1938
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	.loc 15 446 34 view .LVU1939
	movq	%r14, -64(%r13)
	.loc 15 455 14 view .LVU1940
	testq	%rbx, %rbx
	je	.L1532
	testb	$7, %bl
	jne	.L1532
.L1533:
.LVL1352:
	.loc 15 455 14 view .LVU1941
	leaq	-320(%r13), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1721
	movq	$1, -320(%r13)
.LVL1353:
.LBB2714:
.LBI2714:
	.loc 7 1896 7 is_stmt 1 view .LVU1942
.LBB2715:
	.loc 7 1898 14 is_stmt 0 view .LVU1943
	testq	%rbx, %rbx
	je	.L1535
	testb	$7, %bl
	jne	.L1535
.LVL1354:
.L1536:
.LBB2716:
.LBI2716:
	.loc 7 998 7 is_stmt 1 view .LVU1944
.LBB2717:
	.loc 7 999 47 is_stmt 0 view .LVU1945
	testq	%rbx, %rbx
	je	.L1537
	testb	$7, %bl
	jne	.L1537
.L1538:
	.loc 7 999 47 view .LVU1946
	testq	%rbx, %rbx
	je	.L1539
	testb	$7, %bl
	jne	.L1539
.L1540:
	.loc 7 999 47 discriminator 1 view .LVU1947
	testq	%rbx, %rbx
	je	.L1541
	testb	$7, %bl
	jne	.L1541
.L1542:
.LVL1355:
.LBB2718:
.LBI2718:
	.loc 7 306 7 is_stmt 1 view .LVU1948
.LBB2719:
	.loc 7 307 22 is_stmt 0 view .LVU1949
	testq	%rbx, %rbx
	je	.L1543
	testb	$7, %bl
	jne	.L1543
.L1544:
	.loc 7 307 22 discriminator 1 view .LVU1950
	testq	%rbx, %rbx
	je	.L1545
	testb	$7, %bl
	jne	.L1545
.L1546:
.LVL1356:
	.loc 7 307 22 discriminator 1 view .LVU1951
.LBE2719:
.LBE2718:
	.loc 7 999 27 discriminator 2 view .LVU1952
	testq	%rbx, %rbx
	je	.L1722
.L1547:
.LVL1357:
.LBB2721:
.LBI2721:
	.loc 7 1916 7 is_stmt 1 view .LVU1953
.LBB2722:
	.loc 7 1921 15 is_stmt 0 discriminator 1 view .LVU1954
	leaq	-256(%r13), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1723
	movabsq	$9223372036854775807, %rax
	movq	%rax, -256(%r13)
	.loc 7 1923 51 discriminator 1 view .LVU1955
	testq	%rbx, %rbx
	je	.L1724
.L1549:
	.loc 7 1923 15 discriminator 3 view .LVU1956
	leaq	-224(%r13), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1725
	movq	$-1, -224(%r13)
.LVL1358:
.LBB2723:
.LBI2723:
	.loc 14 233 5 is_stmt 1 view .LVU1957
.LBB2724:
	.loc 14 238 15 is_stmt 0 view .LVU1958
	movq	-256(%r13), %r14
.LVL1359:
	.loc 14 238 15 view .LVU1959
.LBE2724:
.LBE2723:
	leaq	-256(%r13), %rax
	shrq	$3, %rax
	movb	$-8, 2147450880(%rax)
	leaq	-224(%r13), %rax
	shrq	$3, %rax
	movb	$-8, 2147450880(%rax)
.LVL1360:
	.loc 14 238 15 view .LVU1960
.LBE2722:
.LBE2721:
.LBE2717:
.LBE2716:
	.loc 7 1898 23 discriminator 2 view .LVU1961
	testq	%rbx, %rbx
	je	.L1551
	testb	$7, %bl
	jne	.L1551
.L1552:
.LVL1361:
.LBB2729:
.LBI2729:
	.loc 7 992 7 is_stmt 1 view .LVU1962
.LBB2730:
	.loc 7 993 40 is_stmt 0 view .LVU1963
	testq	%rbx, %rbx
	je	.L1553
	testb	$7, %bl
	jne	.L1553
.L1554:
	.loc 7 993 40 view .LVU1964
	leaq	8(%rbx), %rdx
	cmpq	$-8, %rbx
	jnb	.L1726
.L1555:
	leaq	8(%rbx), %rax
	movq	%rax, -488(%rbp)
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1727
	movq	8(%rbx), %r15
	.loc 7 993 66 view .LVU1965
	testq	%rbx, %rbx
	je	.L1557
	testb	$7, %bl
	jne	.L1557
.L1558:
	movq	%rbx, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1728
	.loc 7 993 50 view .LVU1966
	subq	(%rbx), %r15
.LVL1362:
	.loc 7 993 50 view .LVU1967
.LBE2730:
.LBE2729:
	.loc 7 1898 2 discriminator 4 view .LVU1968
	cmpq	%r14, %r15
	je	.L1729
	.loc 7 1901 30 view .LVU1969
	testq	%rbx, %rbx
	je	.L1562
	testb	$7, %bl
	jne	.L1562
.L1563:
.LVL1363:
.LBB2732:
.LBI2732:
	.loc 7 992 7 is_stmt 1 view .LVU1970
.LBB2733:
	.loc 7 993 40 is_stmt 0 view .LVU1971
	testq	%rbx, %rbx
	je	.L1564
	testb	$7, %bl
	jne	.L1564
.L1565:
	.loc 7 993 66 view .LVU1972
	testq	%rbx, %rbx
	je	.L1566
	testb	$7, %bl
	jne	.L1566
.L1567:
.LVL1364:
	.loc 7 993 66 view .LVU1973
.LBE2733:
.LBE2732:
	.loc 7 1901 50 discriminator 2 view .LVU1974
	leaq	-288(%r13), %rax
	shrq	$3, %rax
	movb	$0, 2147450880(%rax)
	.loc 7 1901 50 discriminator 3 view .LVU1975
	testq	%rbx, %rbx
	je	.L1568
	testb	$7, %bl
	jne	.L1568
.L1569:
.LVL1365:
.LBB2735:
.LBI2735:
	.loc 7 992 7 is_stmt 1 view .LVU1976
.LBB2736:
	.loc 7 993 40 is_stmt 0 view .LVU1977
	testq	%rbx, %rbx
	je	.L1570
	testb	$7, %bl
	jne	.L1570
.L1571:
	.loc 7 993 40 view .LVU1978
	movq	8(%rbx), %r14
	.loc 7 993 66 view .LVU1979
	testq	%rbx, %rbx
	je	.L1572
	testb	$7, %bl
	jne	.L1572
.L1573:
	.loc 7 993 50 view .LVU1980
	subq	(%rbx), %r14
.LVL1366:
	.loc 7 993 50 view .LVU1981
.LBE2736:
.LBE2735:
	.loc 7 1901 50 discriminator 5 view .LVU1982
	leaq	-288(%r13), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1730
	movq	%r14, -288(%r13)
.LVL1367:
.LBB2738:
.LBI2738:
	.loc 14 257 5 is_stmt 1 view .LVU1983
.LBB2739:
	.loc 14 264 14 is_stmt 0 view .LVU1984
	leaq	-288(%r13), %rax
	leaq	-320(%r13), %rdx
.LVL1368:
	.loc 14 264 14 view .LVU1985
	testq	%r14, %r14
	cmove	%rdx, %rax
	movq	%rax, %r14
.LVL1369:
	.loc 14 264 14 view .LVU1986
.LBE2739:
.LBE2738:
	.loc 7 1901 33 discriminator 7 view .LVU1987
	testq	%rax, %rax
	je	.L1731
.L1576:
	movq	%r14, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1732
	.loc 7 1901 18 discriminator 7 view .LVU1988
	addq	(%r14), %r15
.LVL1370:
	.loc 7 1901 50 discriminator 7 view .LVU1989
	leaq	-288(%r13), %rax
	shrq	$3, %rax
	movb	$-8, 2147450880(%rax)
	.loc 7 1902 22 view .LVU1990
	testq	%rbx, %rbx
	je	.L1578
	testb	$7, %bl
	jne	.L1578
.L1579:
.LVL1371:
.LBB2740:
.LBI2740:
	.loc 7 992 7 is_stmt 1 view .LVU1991
.LBB2741:
	.loc 7 993 40 is_stmt 0 view .LVU1992
	testq	%rbx, %rbx
	je	.L1580
	testb	$7, %bl
	jne	.L1580
.L1581:
	.loc 7 993 40 view .LVU1993
	movq	-488(%rbp), %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1733
	movq	8(%rbx), %r14
	.loc 7 993 66 view .LVU1994
	testq	%rbx, %rbx
	je	.L1583
	testb	$7, %bl
	jne	.L1583
.L1584:
	movq	%rbx, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1734
.LVL1372:
	.loc 7 993 50 view .LVU1995
	subq	(%rbx), %r14
.LBE2741:
.LBE2740:
	.loc 7 1902 48 discriminator 2 view .LVU1996
	cmpq	%r14, %r15
	jb	.L1586
	.loc 7 1902 44 discriminator 2 view .LVU1997
	testq	%rbx, %rbx
	je	.L1587
	testb	$7, %bl
	jne	.L1587
.L1588:
.LVL1373:
.LBB2743:
.LBI2743:
	.loc 7 998 7 is_stmt 1 view .LVU1998
.LBB2744:
	.loc 7 999 47 is_stmt 0 view .LVU1999
	testq	%rbx, %rbx
	je	.L1589
	testb	$7, %bl
	jne	.L1589
.L1590:
	.loc 7 999 47 view .LVU2000
	testq	%rbx, %rbx
	je	.L1591
	testb	$7, %bl
	jne	.L1591
.L1592:
	.loc 7 999 47 discriminator 1 view .LVU2001
	testq	%rbx, %rbx
	je	.L1593
	testb	$7, %bl
	jne	.L1593
.L1594:
.LVL1374:
.LBB2745:
.LBI2745:
	.loc 7 306 7 is_stmt 1 view .LVU2002
.LBB2746:
	.loc 7 307 22 is_stmt 0 view .LVU2003
	testq	%rbx, %rbx
	je	.L1595
	testb	$7, %bl
	jne	.L1595
.L1596:
	.loc 7 307 22 discriminator 1 view .LVU2004
	testq	%rbx, %rbx
	je	.L1597
	testb	$7, %bl
	jne	.L1597
.L1598:
.LVL1375:
	.loc 7 307 22 discriminator 1 view .LVU2005
.LBE2746:
.LBE2745:
	.loc 7 999 27 discriminator 2 view .LVU2006
	testq	%rbx, %rbx
	je	.L1735
.L1599:
.LVL1376:
.LBB2748:
.LBI2748:
	.loc 7 1916 7 is_stmt 1 view .LVU2007
.LBB2749:
	.loc 7 1921 15 is_stmt 0 view .LVU2008
	leaq	-192(%r13), %rax
	shrq	$3, %rax
	movb	$0, 2147450880(%rax)
	.loc 7 1921 15 discriminator 1 view .LVU2009
	movabsq	$9223372036854775807, %rax
	movq	%rax, -192(%r13)
	.loc 7 1923 15 view .LVU2010
	leaq	-160(%r13), %rax
	shrq	$3, %rax
	movb	$0, 2147450880(%rax)
	.loc 7 1923 51 discriminator 1 view .LVU2011
	testq	%rbx, %rbx
	je	.L1736
.L1601:
	.loc 7 1923 15 discriminator 3 view .LVU2012
	leaq	-160(%r13), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1737
	movq	$-1, -160(%r13)
.LVL1377:
.LBB2750:
.LBI2750:
	.loc 14 233 5 is_stmt 1 view .LVU2013
.LBB2751:
	.loc 14 238 15 is_stmt 0 view .LVU2014
	movq	-192(%r13), %rdx
.LVL1378:
	.loc 14 238 15 view .LVU2015
.LBE2751:
.LBE2750:
	leaq	-192(%r13), %rax
	shrq	$3, %rax
	movb	$-8, 2147450880(%rax)
	leaq	-160(%r13), %rax
	shrq	$3, %rax
	movb	$-8, 2147450880(%rax)
.LVL1379:
	.loc 14 238 15 view .LVU2016
.LBE2749:
.LBE2748:
.LBE2744:
.LBE2743:
	.loc 7 1902 25 discriminator 2 view .LVU2017
	cmpq	%r15, %rdx
	jnb	.L1603
.L1586:
	.loc 7 1902 58 discriminator 3 view .LVU2018
	testq	%rbx, %rbx
	je	.L1604
	testb	$7, %bl
	jne	.L1604
.L1605:
.LVL1380:
.LBB2756:
.LBI2756:
	.loc 7 998 7 is_stmt 1 view .LVU2019
.LBB2757:
	.loc 7 999 47 is_stmt 0 view .LVU2020
	testq	%rbx, %rbx
	je	.L1606
	testb	$7, %bl
	jne	.L1606
.L1607:
	.loc 7 999 47 view .LVU2021
	testq	%rbx, %rbx
	je	.L1608
	testb	$7, %bl
	jne	.L1608
.L1609:
	.loc 7 999 47 discriminator 1 view .LVU2022
	testq	%rbx, %rbx
	je	.L1610
	testb	$7, %bl
	jne	.L1610
.L1611:
.LVL1381:
.LBB2758:
.LBI2758:
	.loc 7 306 7 is_stmt 1 view .LVU2023
.LBB2759:
	.loc 7 307 22 is_stmt 0 view .LVU2024
	testq	%rbx, %rbx
	je	.L1612
	testb	$7, %bl
	jne	.L1612
.L1613:
	.loc 7 307 22 discriminator 1 view .LVU2025
	testq	%rbx, %rbx
	je	.L1614
	testb	$7, %bl
	jne	.L1614
.L1615:
.LVL1382:
	.loc 7 307 22 discriminator 1 view .LVU2026
.LBE2759:
.LBE2758:
	.loc 7 999 27 discriminator 2 view .LVU2027
	testq	%rbx, %rbx
	je	.L1738
.L1616:
.LVL1383:
.LBB2761:
.LBI2761:
	.loc 7 1916 7 is_stmt 1 view .LVU2028
.LBB2762:
	.loc 7 1921 15 is_stmt 0 view .LVU2029
	leaq	-128(%r13), %rax
	shrq	$3, %rax
	movb	$0, 2147450880(%rax)
	.loc 7 1921 15 discriminator 1 view .LVU2030
	movabsq	$9223372036854775807, %rax
	movq	%rax, -128(%r13)
	.loc 7 1923 15 view .LVU2031
	leaq	-96(%r13), %rax
	shrq	$3, %rax
	movb	$0, 2147450880(%rax)
	.loc 7 1923 51 discriminator 1 view .LVU2032
	testq	%rbx, %rbx
	je	.L1739
.L1618:
	.loc 7 1923 15 discriminator 3 view .LVU2033
	leaq	-96(%r13), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1740
	movq	$-1, -96(%r13)
.LVL1384:
.LBB2763:
.LBI2763:
	.loc 14 233 5 is_stmt 1 view .LVU2034
.LBB2764:
	.loc 14 238 15 is_stmt 0 view .LVU2035
	movq	-128(%r13), %r15
.LVL1385:
	.loc 14 238 15 view .LVU2036
.LBE2764:
.LBE2763:
	leaq	-128(%r13), %rax
	shrq	$3, %rax
	movb	$-8, 2147450880(%rax)
	leaq	-96(%r13), %rax
	shrq	$3, %rax
	movb	$-8, 2147450880(%rax)
.LVL1386:
.L1603:
	.loc 14 238 15 view .LVU2037
.LBE2762:
.LBE2761:
.LBE2757:
.LBE2756:
.LBE2715:
.LBE2714:
	.loc 15 456 15 view .LVU2038
	testq	%rbx, %rbx
	je	.L1620
	testb	$7, %bl
	jne	.L1620
.L1621:
	movq	%rbx, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1741
	movq	(%rbx), %rax
	movq	%rax, -472(%rbp)
.LVL1387:
	.loc 15 457 15 view .LVU2039
	testq	%rbx, %rbx
	je	.L1623
	testb	$7, %bl
	jne	.L1623
.LVL1388:
.L1624:
	.loc 15 457 15 view .LVU2040
	movq	-488(%rbp), %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1742
	movq	8(%rbx), %rax
	movq	%rax, -520(%rbp)
.LVL1389:
	.loc 15 458 58 view .LVU2041
	leaq	-384(%r13), %rax
.LVL1390:
	.loc 15 458 58 view .LVU2042
	shrq	$3, %rax
	movb	$0, 2147450880(%rax)
.LVL1391:
	.loc 15 458 58 discriminator 1 view .LVU2043
	testq	%rbx, %rbx
	je	.L1626
	testb	$7, %bl
	jne	.L1626
.L1627:
.LVL1392:
.LBB2777:
.LBI2777:
	.loc 7 873 7 is_stmt 1 view .LVU2044
.LBB2778:
	.loc 7 874 16 is_stmt 0 view .LVU2045
	leaq	-352(%r13), %rax
	shrq	$3, %rax
	movb	$0, 2147450880(%rax)
	.loc 7 874 39 discriminator 1 view .LVU2046
	testq	%rbx, %rbx
	je	.L1628
	testb	$7, %bl
	jne	.L1628
.L1629:
	.loc 7 874 39 discriminator 1 view .LVU2047
	testq	%rbx, %rbx
	je	.L1630
	testb	$7, %bl
	jne	.L1630
.L1631:
.LVL1393:
.LBB2779:
.LBI2779:
	.loc 12 1076 7 is_stmt 1 view .LVU2048
.LBB2780:
.LBB2781:
	.loc 12 1077 9 is_stmt 0 view .LVU2049
	testq	%rbx, %rbx
	je	.L1632
	testb	$7, %bl
	jne	.L1632
.L1633:
	movq	%rbx, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1743
	movq	(%rbx), %rax
	leaq	-352(%r13), %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L1744
	movq	%rax, -352(%r13)
.LVL1394:
	.loc 12 1077 9 view .LVU2050
.LBE2781:
.LBE2780:
.LBE2779:
	.loc 7 874 16 discriminator 1 view .LVU2051
	leaq	-352(%r13), %rdx
	shrq	$3, %rdx
	movb	$-8, 2147450880(%rdx)
.LVL1395:
	.loc 7 874 16 discriminator 1 view .LVU2052
.LBE2778:
.LBE2777:
	.loc 15 458 58 discriminator 2 view .LVU2053
	leaq	-384(%r13), %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L1745
	movq	%rax, -384(%r13)
.LVL1396:
.LBB2786:
.LBI2786:
	.loc 12 1334 5 is_stmt 1 view .LVU2054
.LBB2787:
	.loc 12 1337 27 is_stmt 0 discriminator 2 view .LVU2055
	leaq	-64(%r13), %rdi
.LVL1397:
	.loc 12 1337 27 discriminator 2 view .LVU2056
	movq	%rdi, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L1746
	movq	-64(%r13), %rsi
	movq	%rsi, -496(%rbp)
	.loc 12 1337 40 discriminator 4 view .LVU2057
	movq	%rsi, %r14
	subq	%rax, %r14
.LVL1398:
	.loc 12 1337 40 discriminator 4 view .LVU2058
.LBE2787:
.LBE2786:
	.loc 15 458 58 discriminator 5 view .LVU2059
	subq	$384, %r13
	shrq	$3, %r13
	movb	$-8, 2147450880(%r13)
	.loc 15 459 44 view .LVU2060
	testq	%rbx, %rbx
	je	.L1638
	testb	$7, %bl
	jne	.L1638
.L1639:
	testq	%rbx, %rbx
	je	.L1640
	testb	$7, %bl
	jne	.L1640
.L1641:
.LVL1399:
.LBB2789:
.LBI2789:
	.loc 7 378 7 is_stmt 1 view .LVU2061
.LBB2790:
	.loc 7 381 18 is_stmt 0 view .LVU2062
	testq	%r15, %r15
	je	.L1718
	.loc 7 381 34 discriminator 1 view .LVU2063
	testq	%rbx, %rbx
	je	.L1643
	testb	$7, %bl
	jne	.L1643
.L1644:
	.loc 7 381 33 discriminator 1 view .LVU2064
	testq	%rbx, %rbx
	je	.L1747
.L1645:
.LVL1400:
.LBB2791:
.LBI2791:
	.loc 9 481 7 is_stmt 1 view .LVU2065
.LBB2792:
	.loc 9 482 28 is_stmt 0 view .LVU2066
	testq	%rbx, %rbx
	je	.L1748
.L1646:
.LVL1401:
.LBB2793:
.LBI2793:
	.loc 10 189 7 is_stmt 1 view .LVU2067
.LBB2794:
	.loc 10 198 40 is_stmt 0 view .LVU2068
	testq	%rbx, %rbx
	je	.L1749
.L1647:
.LVL1402:
.LBB2795:
.LBI2795:
	.loc 11 126 7 is_stmt 1 view .LVU2069
.LBB2796:
	.loc 11 134 46 is_stmt 0 view .LVU2070
	testq	%rbx, %rbx
	je	.L1750
.L1648:
	.loc 11 134 2 discriminator 3 view .LVU2071
	testq	%r15, %r15
	js	.L1751
	.loc 11 151 48 view .LVU2072
	movq	%r15, %rdi
	call	_Znwm
.LVL1403:
	movq	%rax, %r13
.LVL1404:
.L1642:
	.loc 11 151 48 view .LVU2073
.LBE2796:
.LBE2795:
.LBE2794:
.LBE2793:
.LBE2792:
.LBE2791:
.LBE2790:
.LBE2789:
	.loc 15 468 28 view .LVU2074
	leaq	0(%r13,%r14), %rdx
	testq	%r14, %r14
	js	.L1651
	cmpq	%r13, %rdx
	jnb	.L1652
.L1653:
	movq	%r13, %rsi
	leaq	.Lubsan_data1431(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL1405:
	jmp	.L1652
.LVL1406:
.L1720:
	.loc 15 445 7 view .LVU2075
	movl	$384, %edi
	call	__asan_stack_malloc_3@PLT
.LVL1407:
	.loc 15 445 7 view .LVU2076
	testq	%rax, %rax
	cmove	-504(%rbp), %rax
	movq	%rax, -504(%rbp)
	jmp	.L1528
.LVL1408:
.L1532:
	.loc 15 455 14 view .LVU2077
	movq	%rbx, %rsi
	leaq	.Lubsan_data1355(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1409:
	jmp	.L1533
.LVL1410:
.L1721:
	.loc 15 455 14 view .LVU2078
	call	__asan_report_store8@PLT
.LVL1411:
.L1535:
.LBB2804:
.LBB2776:
	.loc 7 1898 14 view .LVU2079
	movq	%rbx, %rsi
	leaq	.Lubsan_data1356(%rip), %rdi
.LVL1412:
	.loc 7 1898 14 view .LVU2080
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1413:
	.loc 7 1898 14 view .LVU2081
	jmp	.L1536
.LVL1414:
.L1537:
.LBB2769:
.LBB2728:
	.loc 7 999 47 view .LVU2082
	movq	%rbx, %rsi
	leaq	.Lubsan_data1357(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1415:
	jmp	.L1538
.L1539:
	.loc 7 999 47 view .LVU2083
	movq	%rbx, %rsi
	leaq	.Lubsan_data1358(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1416:
	jmp	.L1540
.L1541:
	.loc 7 999 47 discriminator 1 view .LVU2084
	movq	%rbx, %rsi
	leaq	.Lubsan_data1359(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1417:
	jmp	.L1542
.LVL1418:
.L1543:
.LBB2726:
.LBB2720:
	.loc 7 307 22 view .LVU2085
	movq	%rbx, %rsi
	leaq	.Lubsan_data1360(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1419:
	jmp	.L1544
.L1545:
	.loc 7 307 22 discriminator 1 view .LVU2086
	movq	%rbx, %rsi
	leaq	.Lubsan_data1361(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1420:
	jmp	.L1546
.LVL1421:
.L1722:
	.loc 7 307 22 discriminator 1 view .LVU2087
.LBE2720:
.LBE2726:
	.loc 7 999 27 discriminator 2 view .LVU2088
	movl	$0, %esi
	leaq	.Lubsan_data1362(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1422:
	jmp	.L1547
.LVL1423:
.L1723:
.LBB2727:
.LBB2725:
	.loc 7 1921 15 discriminator 1 view .LVU2089
	call	__asan_report_store8@PLT
.LVL1424:
.L1724:
	.loc 7 1923 51 discriminator 1 view .LVU2090
	movl	$0, %esi
	leaq	.Lubsan_data1363(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1425:
	jmp	.L1549
.L1725:
	.loc 7 1923 15 discriminator 3 view .LVU2091
	call	__asan_report_store8@PLT
.LVL1426:
.L1551:
	.loc 7 1923 15 discriminator 3 view .LVU2092
.LBE2725:
.LBE2727:
.LBE2728:
.LBE2769:
	.loc 7 1898 23 discriminator 2 view .LVU2093
	movq	%rbx, %rsi
	leaq	.Lubsan_data1367(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1427:
	jmp	.L1552
.LVL1428:
.L1553:
.LBB2770:
.LBB2731:
	.loc 7 993 40 view .LVU2094
	movq	%rbx, %rsi
	leaq	.Lubsan_data1368(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1429:
	jmp	.L1554
.L1726:
	.loc 7 993 40 view .LVU2095
	movq	%rbx, %rsi
	leaq	.Lubsan_data1369(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL1430:
	jmp	.L1555
.L1727:
	.loc 7 993 40 view .LVU2096
	movq	-488(%rbp), %rdi
	call	__asan_report_load8@PLT
.LVL1431:
.L1557:
	.loc 7 993 66 view .LVU2097
	movq	%rbx, %rsi
	leaq	.Lubsan_data1370(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1432:
	jmp	.L1558
.L1728:
	.loc 7 993 66 view .LVU2098
	movq	%rbx, %rdi
	call	__asan_report_load8@PLT
.LVL1433:
.L1729:
	.loc 7 993 66 view .LVU2099
.LBE2731:
.LBE2770:
	.loc 7 1899 24 view .LVU2100
	call	__asan_handle_no_return@PLT
.LVL1434:
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L1752
	leaq	.LC17(%rip), %rdi
	call	_ZSt20__throw_length_errorPKc@PLT
.LVL1435:
.L1752:
	call	__stack_chk_fail@PLT
.LVL1436:
.L1562:
	.loc 7 1901 30 view .LVU2101
	movq	%rbx, %rsi
	leaq	.Lubsan_data1371(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1437:
	jmp	.L1563
.LVL1438:
.L1564:
.LBB2771:
.LBB2734:
	.loc 7 993 40 view .LVU2102
	movq	%rbx, %rsi
	leaq	.Lubsan_data1372(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1439:
	jmp	.L1565
.L1566:
	.loc 7 993 66 view .LVU2103
	movq	%rbx, %rsi
	leaq	.Lubsan_data1373(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1440:
	jmp	.L1567
.LVL1441:
.L1568:
	.loc 7 993 66 view .LVU2104
.LBE2734:
.LBE2771:
	.loc 7 1901 50 discriminator 3 view .LVU2105
	movq	%rbx, %rsi
	leaq	.Lubsan_data1374(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1442:
	jmp	.L1569
.LVL1443:
.L1570:
.LBB2772:
.LBB2737:
	.loc 7 993 40 view .LVU2106
	movq	%rbx, %rsi
	leaq	.Lubsan_data1375(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1444:
	jmp	.L1571
.L1572:
	.loc 7 993 66 view .LVU2107
	movq	%rbx, %rsi
	leaq	.Lubsan_data1376(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1445:
	jmp	.L1573
.LVL1446:
.L1730:
	.loc 7 993 66 view .LVU2108
.LBE2737:
.LBE2772:
	.loc 7 1901 50 discriminator 5 view .LVU2109
	call	__asan_report_store8@PLT
.LVL1447:
.L1731:
	.loc 7 1901 33 discriminator 7 view .LVU2110
	movl	$0, %esi
	leaq	.Lubsan_data1380(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1448:
	jmp	.L1576
.L1732:
	movq	%r14, %rdi
	call	__asan_report_load8@PLT
.LVL1449:
.L1578:
	.loc 7 1902 22 view .LVU2111
	movq	%rbx, %rsi
	leaq	.Lubsan_data1381(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1450:
	jmp	.L1579
.LVL1451:
.L1580:
.LBB2773:
.LBB2742:
	.loc 7 993 40 view .LVU2112
	movq	%rbx, %rsi
	leaq	.Lubsan_data1382(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1452:
	jmp	.L1581
.L1733:
	.loc 7 993 40 view .LVU2113
	movq	-488(%rbp), %rdi
	call	__asan_report_load8@PLT
.LVL1453:
.L1583:
	.loc 7 993 66 view .LVU2114
	movq	%rbx, %rsi
	leaq	.Lubsan_data1383(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1454:
	jmp	.L1584
.L1734:
	.loc 7 993 66 view .LVU2115
	movq	%rbx, %rdi
	call	__asan_report_load8@PLT
.LVL1455:
.L1587:
	.loc 7 993 66 view .LVU2116
.LBE2742:
.LBE2773:
	.loc 7 1902 44 discriminator 2 view .LVU2117
	movq	%rbx, %rsi
	leaq	.Lubsan_data1384(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1456:
	jmp	.L1588
.LVL1457:
.L1589:
.LBB2774:
.LBB2755:
	.loc 7 999 47 view .LVU2118
	movq	%rbx, %rsi
	leaq	.Lubsan_data1385(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1458:
	jmp	.L1590
.L1591:
	.loc 7 999 47 view .LVU2119
	movq	%rbx, %rsi
	leaq	.Lubsan_data1386(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1459:
	jmp	.L1592
.L1593:
	.loc 7 999 47 discriminator 1 view .LVU2120
	movq	%rbx, %rsi
	leaq	.Lubsan_data1387(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1460:
	jmp	.L1594
.LVL1461:
.L1595:
.LBB2753:
.LBB2747:
	.loc 7 307 22 view .LVU2121
	movq	%rbx, %rsi
	leaq	.Lubsan_data1388(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1462:
	jmp	.L1596
.L1597:
	.loc 7 307 22 discriminator 1 view .LVU2122
	movq	%rbx, %rsi
	leaq	.Lubsan_data1389(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1463:
	jmp	.L1598
.LVL1464:
.L1735:
	.loc 7 307 22 discriminator 1 view .LVU2123
.LBE2747:
.LBE2753:
	.loc 7 999 27 discriminator 2 view .LVU2124
	movl	$0, %esi
	leaq	.Lubsan_data1390(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1465:
	jmp	.L1599
.LVL1466:
.L1736:
.LBB2754:
.LBB2752:
	.loc 7 1923 51 discriminator 1 view .LVU2125
	movl	$0, %esi
	leaq	.Lubsan_data1391(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1467:
	jmp	.L1601
.L1737:
	.loc 7 1923 15 discriminator 3 view .LVU2126
	call	__asan_report_store8@PLT
.LVL1468:
.L1604:
	.loc 7 1923 15 discriminator 3 view .LVU2127
.LBE2752:
.LBE2754:
.LBE2755:
.LBE2774:
	.loc 7 1902 58 discriminator 3 view .LVU2128
	movq	%rbx, %rsi
	leaq	.Lubsan_data1395(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1469:
	jmp	.L1605
.LVL1470:
.L1606:
.LBB2775:
.LBB2768:
	.loc 7 999 47 view .LVU2129
	movq	%rbx, %rsi
	leaq	.Lubsan_data1396(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1471:
	jmp	.L1607
.L1608:
	.loc 7 999 47 view .LVU2130
	movq	%rbx, %rsi
	leaq	.Lubsan_data1397(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1472:
	jmp	.L1609
.L1610:
	.loc 7 999 47 discriminator 1 view .LVU2131
	movq	%rbx, %rsi
	leaq	.Lubsan_data1398(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1473:
	jmp	.L1611
.LVL1474:
.L1612:
.LBB2766:
.LBB2760:
	.loc 7 307 22 view .LVU2132
	movq	%rbx, %rsi
	leaq	.Lubsan_data1399(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1475:
	jmp	.L1613
.L1614:
	.loc 7 307 22 discriminator 1 view .LVU2133
	movq	%rbx, %rsi
	leaq	.Lubsan_data1400(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1476:
	jmp	.L1615
.LVL1477:
.L1738:
	.loc 7 307 22 discriminator 1 view .LVU2134
.LBE2760:
.LBE2766:
	.loc 7 999 27 discriminator 2 view .LVU2135
	movl	$0, %esi
	leaq	.Lubsan_data1401(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1478:
	jmp	.L1616
.LVL1479:
.L1739:
.LBB2767:
.LBB2765:
	.loc 7 1923 51 discriminator 1 view .LVU2136
	movl	$0, %esi
	leaq	.Lubsan_data1402(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1480:
	jmp	.L1618
.L1740:
	.loc 7 1923 15 discriminator 3 view .LVU2137
	call	__asan_report_store8@PLT
.LVL1481:
.L1620:
	.loc 7 1923 15 discriminator 3 view .LVU2138
.LBE2765:
.LBE2767:
.LBE2768:
.LBE2775:
.LBE2776:
.LBE2804:
	.loc 15 456 15 view .LVU2139
	movq	%rbx, %rsi
	leaq	.Lubsan_data1406(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1482:
	jmp	.L1621
.L1741:
	.loc 15 456 15 view .LVU2140
	movq	%rbx, %rdi
	call	__asan_report_load8@PLT
.LVL1483:
.L1623:
	.loc 15 457 15 view .LVU2141
	movq	%rbx, %rsi
	leaq	.Lubsan_data1407(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1484:
	.loc 15 457 15 view .LVU2142
	jmp	.L1624
.L1742:
	.loc 15 457 15 view .LVU2143
	movq	-488(%rbp), %rdi
	call	__asan_report_load8@PLT
.LVL1485:
.L1626:
	.loc 15 458 58 discriminator 1 view .LVU2144
	movq	%rbx, %rsi
	leaq	.Lubsan_data1408(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1486:
	jmp	.L1627
.LVL1487:
.L1628:
.LBB2805:
.LBB2785:
	.loc 7 874 39 discriminator 1 view .LVU2145
	movq	%rbx, %rsi
	leaq	.Lubsan_data1409(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1488:
	jmp	.L1629
.L1630:
	.loc 7 874 39 discriminator 1 view .LVU2146
	movq	%rbx, %rsi
	leaq	.Lubsan_data1410(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1489:
	jmp	.L1631
.LVL1490:
.L1632:
.LBB2784:
.LBB2783:
.LBB2782:
	.loc 12 1077 9 view .LVU2147
	movq	%rbx, %rsi
	leaq	.Lubsan_data1411(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1491:
	jmp	.L1633
.L1743:
	.loc 12 1077 9 view .LVU2148
	movq	%rbx, %rdi
	call	__asan_report_load8@PLT
.LVL1492:
.L1744:
	.loc 12 1077 9 view .LVU2149
	call	__asan_report_store8@PLT
.LVL1493:
.L1745:
	.loc 12 1077 9 view .LVU2150
.LBE2782:
.LBE2783:
.LBE2784:
.LBE2785:
.LBE2805:
	.loc 15 458 58 discriminator 2 view .LVU2151
	call	__asan_report_store8@PLT
.LVL1494:
.L1746:
.LBB2806:
.LBB2788:
	.loc 12 1337 27 discriminator 2 view .LVU2152
	call	__asan_report_load8@PLT
.LVL1495:
.L1638:
	.loc 12 1337 27 discriminator 2 view .LVU2153
.LBE2788:
.LBE2806:
	.loc 15 459 44 view .LVU2154
	movq	%rbx, %rsi
	leaq	.Lubsan_data1424(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1496:
	jmp	.L1639
.L1640:
	.loc 15 459 44 view .LVU2155
	movq	%rbx, %rsi
	leaq	.Lubsan_data1425(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1497:
	jmp	.L1641
.LVL1498:
.L1643:
.LBB2807:
.LBB2803:
	.loc 7 381 34 discriminator 1 view .LVU2156
	movq	%rbx, %rsi
	leaq	.Lubsan_data1426(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1499:
	jmp	.L1644
.L1747:
	.loc 7 381 33 discriminator 1 view .LVU2157
	movl	$0, %esi
	leaq	.Lubsan_data1427(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1500:
	jmp	.L1645
.LVL1501:
.L1748:
.LBB2802:
.LBB2801:
	.loc 9 482 28 view .LVU2158
	movl	$0, %esi
	leaq	.Lubsan_data1428(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1502:
	jmp	.L1646
.LVL1503:
.L1749:
.LBB2800:
.LBB2799:
	.loc 10 198 40 view .LVU2159
	movl	$0, %esi
	leaq	.Lubsan_data1429(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1504:
	jmp	.L1647
.LVL1505:
.L1750:
.LBB2798:
.LBB2797:
	.loc 11 134 46 view .LVU2160
	movl	$0, %esi
	leaq	.Lubsan_data1430(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1506:
	jmp	.L1648
.L1751:
	.loc 11 140 28 view .LVU2161
	call	__asan_handle_no_return@PLT
.LVL1507:
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L1753
	call	_ZSt17__throw_bad_allocv@PLT
.LVL1508:
.L1753:
	call	__stack_chk_fail@PLT
.LVL1509:
.L1718:
	.loc 11 140 28 view .LVU2162
.LBE2797:
.LBE2798:
.LBE2799:
.LBE2800:
.LBE2801:
.LBE2802:
	.loc 7 381 18 discriminator 2 view .LVU2163
	movl	$0, %r13d
	jmp	.L1642
.LVL1510:
.L1651:
	.loc 7 381 18 discriminator 2 view .LVU2164
.LBE2803:
.LBE2807:
	.loc 15 468 28 view .LVU2165
	cmpq	%rdx, %r13
	jb	.L1653
.L1652:
	.loc 15 468 28 view .LVU2166
	addq	%r13, %r14
.LVL1511:
	.loc 15 468 35 view .LVU2167
	testq	%rbx, %rbx
	je	.L1654
	testb	$7, %bl
	jne	.L1654
.L1655:
	.loc 15 468 28 view .LVU2168
	testq	%rbx, %rbx
	je	.L1754
.L1656:
.LVL1512:
.LBB2808:
.LBI2808:
	.loc 9 533 2 is_stmt 1 view .LVU2169
.LBB2809:
.LBI2809:
	.file 21 "/usr/include/c++/13/bits/stl_construct.h"
	.loc 21 94 5 view .LVU2170
.LBB2810:
	.loc 21 97 14 is_stmt 0 discriminator 1 view .LVU2171
	cmpq	$0, -480(%rbp)
	je	.L1755
.L1657:
	.loc 21 97 14 discriminator 1 view .LVU2172
	movq	-480(%rbp), %rcx
	movq	%rcx, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	andl	$7, %ecx
	cmpb	%cl, %al
	jg	.L1658
	testb	%al, %al
	jne	.L1756
.L1658:
	movq	-480(%rbp), %rax
	movzbl	(%rax), %eax
	movb	%al, -480(%rbp)
.LVL1513:
	.loc 21 97 14 discriminator 1 view .LVU2173
	testq	%r14, %r14
	je	.L1757
.L1659:
	movq	%r14, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	movq	%r14, %rdx
	andl	$7, %edx
	cmpb	%dl, %al
	jg	.L1660
	testb	%al, %al
	jne	.L1758
.L1660:
	movzbl	-480(%rbp), %eax
	movb	%al, (%r14)
.LVL1514:
	.loc 21 97 14 discriminator 1 view .LVU2174
.LBE2810:
.LBE2809:
.LBE2808:
	.loc 15 481 39 view .LVU2175
	testq	%rbx, %rbx
	je	.L1661
	testb	$7, %bl
	jne	.L1661
.L1662:
	testq	%rbx, %rbx
	je	.L1663
	testb	$7, %bl
	jne	.L1663
.L1664:
.LVL1515:
.LBB2813:
.LBI2813:
	.loc 7 301 7 is_stmt 1 view .LVU2176
.LBB2814:
	.loc 7 302 22 is_stmt 0 view .LVU2177
	testq	%rbx, %rbx
	je	.L1665
	testb	$7, %bl
	jne	.L1665
.L1666:
	testq	%rbx, %rbx
	je	.L1759
.L1667:
.LVL1516:
	.loc 7 302 22 view .LVU2178
.LBE2814:
.LBE2813:
	.loc 15 480 34 view .LVU2179
	testq	%rbx, %rbx
	je	.L1760
.L1668:
.LVL1517:
.LBB2816:
.LBI2816:
	.loc 7 504 7 is_stmt 1 view .LVU2180
.LBB2817:
	.loc 7 509 26 is_stmt 0 view .LVU2181
	testq	%rbx, %rbx
	je	.L1761
.L1669:
.LVL1518:
.LBB2818:
.LBI2818:
	.loc 13 1141 5 is_stmt 1 view .LVU2182
.LBB2819:
.LBI2819:
	.loc 13 1114 5 view .LVU2183
.LBB2820:
	.loc 13 1118 17 is_stmt 0 view .LVU2184
	movq	-496(%rbp), %r14
	movq	-472(%rbp), %rax
	subq	%rax, %r14
.LVL1519:
.LBB2821:
	.loc 13 1119 7 view .LVU2185
	testq	%r14, %r14
	jle	.L1670
.LBB2822:
	.loc 13 1131 21 view .LVU2186
	testq	%r13, %r13
	je	.L1762
.L1671:
	.loc 13 1131 21 view .LVU2187
	cmpq	$0, -472(%rbp)
	je	.L1763
.L1672:
	movq	%r14, %rdx
	movq	-472(%rbp), %rsi
	movq	%r13, %rdi
	call	memmove@PLT
.LVL1520:
.L1670:
	.loc 13 1131 21 view .LVU2188
.LBE2822:
.LBE2821:
	.loc 13 1133 25 view .LVU2189
	leaq	0(%r13,%r14), %rdx
	testq	%r14, %r14
	js	.L1673
	cmpq	%r13, %rdx
	jnb	.L1674
.L1675:
	movq	%r13, %rsi
	leaq	.Lubsan_data1446(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL1521:
	jmp	.L1674
.LVL1522:
.L1654:
	.loc 13 1133 25 view .LVU2190
.LBE2820:
.LBE2819:
.LBE2818:
.LBE2817:
.LBE2816:
	.loc 15 468 35 view .LVU2191
	movq	%rbx, %rsi
	leaq	.Lubsan_data1432(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1523:
	jmp	.L1655
.L1754:
	.loc 15 468 28 view .LVU2192
	movl	$0, %esi
	leaq	.Lubsan_data1433(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1524:
	jmp	.L1656
.LVL1525:
.L1755:
.LBB2829:
.LBB2812:
.LBB2811:
	.loc 21 97 14 discriminator 1 view .LVU2193
	movl	$0, %esi
	leaq	.Lubsan_data1434(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1526:
	jmp	.L1657
.L1756:
	.loc 21 97 14 discriminator 1 view .LVU2194
	movq	-480(%rbp), %rdi
	call	__asan_report_load1@PLT
.LVL1527:
.L1757:
	.loc 21 97 14 discriminator 1 view .LVU2195
	movl	$0, %esi
	leaq	.Lubsan_data1435(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1528:
	jmp	.L1659
.L1758:
	.loc 21 97 14 discriminator 1 view .LVU2196
	movq	%r14, %rdi
	call	__asan_report_store1@PLT
.LVL1529:
.L1661:
	.loc 21 97 14 discriminator 1 view .LVU2197
.LBE2811:
.LBE2812:
.LBE2829:
	.loc 15 481 39 view .LVU2198
	movq	%rbx, %rsi
	leaq	.Lubsan_data1436(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1530:
	jmp	.L1662
.L1663:
	.loc 15 481 39 view .LVU2199
	movq	%rbx, %rsi
	leaq	.Lubsan_data1437(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1531:
	jmp	.L1664
.LVL1532:
.L1665:
.LBB2830:
.LBB2815:
	.loc 7 302 22 view .LVU2200
	movq	%rbx, %rsi
	leaq	.Lubsan_data1438(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1533:
	jmp	.L1666
.L1759:
	.loc 7 302 22 view .LVU2201
	movl	$0, %esi
	leaq	.Lubsan_data1439(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1534:
	jmp	.L1667
.LVL1535:
.L1760:
	.loc 7 302 22 view .LVU2202
.LBE2815:
.LBE2830:
	.loc 15 480 34 view .LVU2203
	movl	$0, %esi
	leaq	.Lubsan_data1440(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1536:
	jmp	.L1668
.LVL1537:
.L1761:
.LBB2831:
.LBB2828:
	.loc 7 509 26 view .LVU2204
	movl	$0, %esi
	leaq	.Lubsan_data1445(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1538:
	jmp	.L1669
.LVL1539:
.L1762:
.LBB2827:
.LBB2826:
.LBB2825:
.LBB2824:
.LBB2823:
	.loc 13 1131 21 view .LVU2205
	leaq	.Lubsan_data857(%rip), %rdi
	call	__ubsan_handle_nonnull_arg@PLT
.LVL1540:
	.loc 13 1131 21 view .LVU2206
	jmp	.L1671
.L1763:
	.loc 13 1131 21 view .LVU2207
	leaq	.Lubsan_data858(%rip), %rdi
	call	__ubsan_handle_nonnull_arg@PLT
.LVL1541:
	jmp	.L1672
.L1673:
	.loc 13 1131 21 view .LVU2208
.LBE2823:
.LBE2824:
	.loc 13 1133 25 view .LVU2209
	cmpq	%rdx, %r13
	jb	.L1675
.L1674:
	.loc 13 1133 25 view .LVU2210
	addq	%r13, %r14
.LVL1542:
	.loc 13 1133 25 view .LVU2211
.LBE2825:
.LBE2826:
.LBE2827:
.LBE2828:
.LBE2831:
	.loc 15 483 8 view .LVU2212
	leaq	1(%r14), %rdx
	cmpq	$-1, %r14
	jnb	.L1764
.L1676:
	leaq	1(%r14), %rax
	movq	%rax, -480(%rbp)
.LVL1543:
	.loc 15 486 40 view .LVU2213
	testq	%rbx, %rbx
	je	.L1677
	testb	$7, %bl
	jne	.L1677
.LVL1544:
.L1678:
	.loc 15 486 40 view .LVU2214
	testq	%rbx, %rbx
	je	.L1679
	testb	$7, %bl
	jne	.L1679
.L1680:
.LVL1545:
.LBB2832:
.LBI2832:
	.loc 7 301 7 is_stmt 1 view .LVU2215
.LBB2833:
	.loc 7 302 22 is_stmt 0 view .LVU2216
	testq	%rbx, %rbx
	je	.L1681
	testb	$7, %bl
	jne	.L1681
.L1682:
	testq	%rbx, %rbx
	je	.L1765
.L1683:
.LVL1546:
	.loc 7 302 22 view .LVU2217
.LBE2833:
.LBE2832:
	.loc 15 485 34 view .LVU2218
	testq	%rbx, %rbx
	je	.L1766
.L1684:
.LVL1547:
.LBB2835:
.LBI2835:
	.loc 7 504 7 is_stmt 1 view .LVU2219
.LBB2836:
	.loc 7 509 26 is_stmt 0 view .LVU2220
	testq	%rbx, %rbx
	je	.L1767
.L1685:
.LVL1548:
.LBB2837:
.LBI2837:
	.loc 13 1141 5 is_stmt 1 view .LVU2221
.LBB2838:
.LBI2838:
	.loc 13 1114 5 view .LVU2222
.LBB2839:
	.loc 13 1118 17 is_stmt 0 view .LVU2223
	movq	-520(%rbp), %r14
	movq	-496(%rbp), %rax
	subq	%rax, %r14
.LVL1549:
.LBB2840:
	.loc 13 1119 7 view .LVU2224
	testq	%r14, %r14
	jle	.L1686
.LBB2841:
	.loc 13 1131 21 view .LVU2225
	testq	%rax, %rax
	je	.L1768
.L1687:
	.loc 13 1131 21 view .LVU2226
	movq	%r14, %rdx
	movq	-496(%rbp), %rsi
	movq	-480(%rbp), %rdi
	call	memmove@PLT
.LVL1550:
.L1686:
	.loc 13 1131 21 view .LVU2227
.LBE2841:
.LBE2840:
	.loc 13 1133 25 view .LVU2228
	movq	-480(%rbp), %rax
	leaq	(%rax,%r14), %rdx
	testq	%r14, %r14
	js	.L1688
	cmpq	%rax, %rdx
	jnb	.L1689
.L1690:
	movq	-480(%rbp), %rsi
	leaq	.Lubsan_data1458(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL1551:
	jmp	.L1689
.LVL1552:
.L1764:
	.loc 13 1133 25 view .LVU2229
.LBE2839:
.LBE2838:
.LBE2837:
.LBE2836:
.LBE2835:
	.loc 15 483 8 view .LVU2230
	movq	%r14, %rsi
	leaq	.Lubsan_data1447(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL1553:
	jmp	.L1676
.LVL1554:
.L1677:
	.loc 15 486 40 view .LVU2231
	movq	%rbx, %rsi
	leaq	.Lubsan_data1448(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1555:
	.loc 15 486 40 view .LVU2232
	jmp	.L1678
.L1679:
	.loc 15 486 40 view .LVU2233
	movq	%rbx, %rsi
	leaq	.Lubsan_data1449(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1556:
	jmp	.L1680
.LVL1557:
.L1681:
.LBB2848:
.LBB2834:
	.loc 7 302 22 view .LVU2234
	movq	%rbx, %rsi
	leaq	.Lubsan_data1450(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1558:
	jmp	.L1682
.L1765:
	.loc 7 302 22 view .LVU2235
	movl	$0, %esi
	leaq	.Lubsan_data1451(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1559:
	jmp	.L1683
.LVL1560:
.L1766:
	.loc 7 302 22 view .LVU2236
.LBE2834:
.LBE2848:
	.loc 15 485 34 view .LVU2237
	movl	$0, %esi
	leaq	.Lubsan_data1452(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1561:
	jmp	.L1684
.LVL1562:
.L1767:
.LBB2849:
.LBB2847:
	.loc 7 509 26 view .LVU2238
	movl	$0, %esi
	leaq	.Lubsan_data1457(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1563:
	jmp	.L1685
.LVL1564:
.L1768:
.LBB2846:
.LBB2845:
.LBB2844:
.LBB2843:
.LBB2842:
	.loc 13 1131 21 view .LVU2239
	leaq	.Lubsan_data858(%rip), %rdi
	call	__ubsan_handle_nonnull_arg@PLT
.LVL1565:
	.loc 13 1131 21 view .LVU2240
	jmp	.L1687
.L1688:
	.loc 13 1131 21 view .LVU2241
.LBE2842:
.LBE2843:
	.loc 13 1133 25 view .LVU2242
	cmpq	%rdx, -480(%rbp)
	jb	.L1690
.L1689:
	movq	-480(%rbp), %rax
	addq	%r14, %rax
	movq	%rax, %r14
.LVL1566:
	.loc 13 1133 25 view .LVU2243
.LBE2844:
.LBE2845:
.LBE2846:
.LBE2847:
.LBE2849:
	.loc 15 519 20 view .LVU2244
	testq	%rbx, %rbx
	je	.L1691
	testb	$7, %bl
	jne	.L1691
.LVL1567:
.L1692:
	.loc 15 519 20 view .LVU2245
	testq	%rbx, %rbx
	je	.L1693
	testb	$7, %bl
	jne	.L1693
.L1694:
	.loc 15 520 21 view .LVU2246
	testq	%rbx, %rbx
	je	.L1695
	testb	$7, %bl
	jne	.L1695
.L1696:
	leaq	16(%rbx), %rdx
	cmpq	$-16, %rbx
	jnb	.L1769
.L1697:
.LVL1568:
.LBB2850:
.LBI2850:
	.loc 7 386 7 is_stmt 1 view .LVU2247
.LBB2851:
	.loc 7 389 2 is_stmt 0 view .LVU2248
	cmpq	$0, -472(%rbp)
	je	.L1698
	.loc 7 390 20 view .LVU2249
	testq	%rbx, %rbx
	je	.L1699
	testb	$7, %bl
	jne	.L1699
.LVL1569:
.L1700:
	.loc 7 390 19 view .LVU2250
	testq	%rbx, %rbx
	je	.L1770
.L1701:
.LVL1570:
.LBB2852:
.LBI2852:
	.loc 9 516 7 is_stmt 1 view .LVU2251
.LBB2853:
	.loc 9 517 23 is_stmt 0 view .LVU2252
	testq	%rbx, %rbx
	je	.L1771
.L1702:
.LVL1571:
.LBB2854:
.LBI2854:
	.loc 10 203 7 is_stmt 1 view .LVU2253
.LBB2855:
	.loc 10 210 35 is_stmt 0 view .LVU2254
	testq	%rbx, %rbx
	je	.L1772
.L1703:
.LVL1572:
.LBB2856:
.LBI2856:
	.loc 11 156 7 is_stmt 1 view .LVU2255
.LBB2857:
.LBI2857:
	.loc 1 27 6 view .LVU2256
.LBB2858:
	.loc 1 27 51 view .LVU2257
	.loc 1 27 60 is_stmt 0 view .LVU2258
	movq	-472(%rbp), %rdi
	call	free@PLT
.LVL1573:
.L1698:
	.loc 1 27 60 view .LVU2259
.LBE2858:
.LBE2857:
.LBE2856:
.LBE2855:
.LBE2854:
.LBE2853:
.LBE2852:
.LBE2851:
.LBE2850:
	.loc 15 521 30 view .LVU2260
	testq	%rbx, %rbx
	je	.L1704
	testb	$7, %bl
	jne	.L1704
.L1705:
	movq	%rbx, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1773
	movq	%r13, (%rbx)
	.loc 15 522 31 view .LVU2261
	testq	%rbx, %rbx
	je	.L1707
	.loc 15 522 31 view .LVU2262
	testb	$7, %bl
	jne	.L1707
.L1708:
	.loc 15 522 31 view .LVU2263
	movq	-488(%rbp), %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1774
	movq	%r14, 8(%rbx)
	.loc 15 523 53 view .LVU2264
	leaq	0(%r13,%r15), %rdx
	testq	%r15, %r15
	js	.L1710
	.loc 15 523 53 view .LVU2265
	cmpq	%r13, %rdx
	jnb	.L1711
.L1712:
	movq	%r13, %rsi
	leaq	.Lubsan_data1469(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL1574:
	jmp	.L1711
.LVL1575:
.L1691:
	.loc 15 519 20 view .LVU2266
	movq	%rbx, %rsi
	leaq	.Lubsan_data1459(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1576:
	.loc 15 519 20 view .LVU2267
	jmp	.L1692
.L1693:
	.loc 15 519 20 view .LVU2268
	movq	%rbx, %rsi
	leaq	.Lubsan_data1460(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1577:
	jmp	.L1694
.L1695:
	.loc 15 520 21 view .LVU2269
	movq	%rbx, %rsi
	leaq	.Lubsan_data1461(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1578:
	jmp	.L1696
.L1769:
	.loc 15 520 21 view .LVU2270
	movq	%rbx, %rsi
	leaq	.Lubsan_data1462(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL1579:
	jmp	.L1697
.LVL1580:
.L1699:
.LBB2864:
.LBB2863:
	.loc 7 390 20 view .LVU2271
	movq	%rbx, %rsi
	leaq	.Lubsan_data1463(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1581:
	.loc 7 390 20 view .LVU2272
	jmp	.L1700
.L1770:
	.loc 7 390 19 view .LVU2273
	movl	$0, %esi
	leaq	.Lubsan_data1464(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1582:
	jmp	.L1701
.LVL1583:
.L1771:
.LBB2862:
.LBB2861:
	.loc 9 517 23 view .LVU2274
	movl	$0, %esi
	leaq	.Lubsan_data1465(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1584:
	jmp	.L1702
.LVL1585:
.L1772:
.LBB2860:
.LBB2859:
	.loc 10 210 35 view .LVU2275
	movl	$0, %esi
	leaq	.Lubsan_data1466(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1586:
	jmp	.L1703
.LVL1587:
.L1704:
	.loc 10 210 35 view .LVU2276
.LBE2859:
.LBE2860:
.LBE2861:
.LBE2862:
.LBE2863:
.LBE2864:
	.loc 15 521 30 view .LVU2277
	movq	%rbx, %rsi
	leaq	.Lubsan_data1467(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1588:
	jmp	.L1705
.L1773:
	.loc 15 521 30 view .LVU2278
	movq	%rbx, %rdi
	call	__asan_report_store8@PLT
.LVL1589:
.L1707:
	.loc 15 522 31 view .LVU2279
	movq	%rbx, %rsi
	leaq	.Lubsan_data1468(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1590:
	jmp	.L1708
.L1774:
	.loc 15 522 31 view .LVU2280
	movq	-488(%rbp), %rdi
	call	__asan_report_store8@PLT
.LVL1591:
.L1710:
	.loc 15 523 53 view .LVU2281
	cmpq	%rdx, %r13
	jb	.L1712
.L1711:
	.loc 15 523 53 view .LVU2282
	addq	%r15, %r13
.LVL1592:
	.loc 15 523 39 view .LVU2283
	testq	%rbx, %rbx
	je	.L1713
	testb	$7, %bl
	jne	.L1713
.L1714:
	leaq	16(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1775
	movq	%r13, 16(%rbx)
	.loc 15 445 7 view .LVU2284
	movq	-504(%rbp), %rsi
	cmpq	%rsi, -512(%rbp)
	jne	.L1776
	pxor	%xmm0, %xmm0
	movups	%xmm0, 2147450880(%r12)
.LVL1593:
	.loc 15 445 7 view .LVU2285
	movups	%xmm0, 2147450896(%r12)
	movups	%xmm0, 2147450912(%r12)
.L1530:
	.loc 15 524 5 view .LVU2286
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L1777
	addq	$488, %rsp
	popq	%rbx
.LVL1594:
	.loc 15 524 5 view .LVU2287
	popq	%r12
	popq	%r13
	popq	%r14
.LVL1595:
	.loc 15 524 5 view .LVU2288
	popq	%r15
.LVL1596:
	.loc 15 524 5 view .LVU2289
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.LVL1597:
.L1713:
	.cfi_restore_state
	.loc 15 523 39 view .LVU2290
	movq	%rbx, %rsi
	leaq	.Lubsan_data1470(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1598:
	jmp	.L1714
.L1775:
	.loc 15 523 39 view .LVU2291
	call	__asan_report_store8@PLT
.LVL1599:
.L1776:
	.loc 15 445 7 view .LVU2292
	movq	$1172321806, (%rsi)
.LVL1600:
	.loc 15 445 7 view .LVU2293
	movdqa	.LC1(%rip), %xmm0
	movups	%xmm0, 2147450880(%r12)
	movups	%xmm0, 2147450896(%r12)
	movups	%xmm0, 2147450912(%r12)
	movq	504(%rsi), %rax
	movb	$0, (%rax)
	jmp	.L1530
.L1777:
	.loc 15 524 5 view .LVU2294
	call	__stack_chk_fail@PLT
.LVL1601:
	.cfi_endproc
.LFE7470:
	.size	_ZNSt6vectorIhSaIhEE17_M_realloc_insertIJcEEEvN9__gnu_cxx17__normal_iteratorIPhS1_EEDpOT_, .-_ZNSt6vectorIhSaIhEE17_M_realloc_insertIJcEEEvN9__gnu_cxx17__normal_iteratorIPhS1_EEDpOT_
	.globl	__asan_stack_malloc_4
	.section	.rodata._ZNSt6vectorIhSaIhEE19_M_range_initializeISt19istreambuf_iteratorIcSt11char_traitsIcEEEEvT_S7_St18input_iterator_tag.str1.8,"aMS",@progbits,1
	.align 8
.LC18:
	.ascii	"26 32 1 9 <unknown> 48 4 3 __c 64 4 5 __eof 80 4 5 __eof 96 "
	.ascii	"4 5 __eof 112 4 5 __eof 128 4 5 __eof 144 4 5 __eof 160 4 5 "
	.ascii	"__eof 176 4 "
	.string	"5 __eof 192 4 3 __c 208 4 3 __c 224 4 3 __c 240 4 3 __c 256 4 3 __c 272 4 3 __c 288 4 3 __c 304 4 3 __c 320 8 9 <unknown> 352 8 9 <unknown> 384 8 9 <unknown> 416 8 9 <unknown> 448 8 9 <unknown> 480 8 9 <unknown> 512 16 12 __first:1667 544 16 11 __last:1667"
	.section	.text._ZNSt6vectorIhSaIhEE19_M_range_initializeISt19istreambuf_iteratorIcSt11char_traitsIcEEEEvT_S7_St18input_iterator_tag,"axG",@progbits,_ZNSt6vectorIhSaIhEE19_M_range_initializeISt19istreambuf_iteratorIcSt11char_traitsIcEEEEvT_S7_St18input_iterator_tag,comdat
	.align 2
	.weak	_ZNSt6vectorIhSaIhEE19_M_range_initializeISt19istreambuf_iteratorIcSt11char_traitsIcEEEEvT_S7_St18input_iterator_tag
	.type	_ZNSt6vectorIhSaIhEE19_M_range_initializeISt19istreambuf_iteratorIcSt11char_traitsIcEEEEvT_S7_St18input_iterator_tag, @function
_ZNSt6vectorIhSaIhEE19_M_range_initializeISt19istreambuf_iteratorIcSt11char_traitsIcEEEEvT_S7_St18input_iterator_tag:
.LASANPC7144:
.LVL1602:
.LFB7144:
	.loc 7 1667 2 is_stmt 1 view -0
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA7144
	.loc 7 1667 2 is_stmt 0 view .LVU2296
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$696, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rdi, %r15
	movq	%rsi, -664(%rbp)
	movq	%rdx, %r14
.LVL1603:
	.loc 7 1667 2 view .LVU2297
	movq	%rcx, %r13
.LVL1604:
	.loc 7 1667 2 view .LVU2298
	movq	%r8, %r12
.LVL1605:
	.loc 7 1667 2 view .LVU2299
	leaq	-656(%rbp), %rax
	movq	%rax, -696(%rbp)
	movq	%rax, -712(%rbp)
	cmpl	$0, __asan_option_detect_stack_use_after_return(%rip)
	jne	.L2112
.LVL1606:
.L1778:
	.loc 7 1667 2 view .LVU2300
	movq	-696(%rbp), %rax
	leaq	608(%rax), %rbx
	movq	$1102416563, (%rax)
	leaq	.LC18(%rip), %rsi
.LVL1607:
	.loc 7 1667 2 view .LVU2301
	movq	%rsi, 8(%rax)
	leaq	.LASANPC7144(%rip), %rsi
	movq	%rsi, 16(%rax)
	shrq	$3, %rax
	movq	%rax, -720(%rbp)
	movl	$-235802127, 2147450880(%rax)
	movl	$-234556927, 2147450884(%rax)
	movl	$-234556924, 2147450888(%rax)
	movl	$-234556924, 2147450892(%rax)
	movl	$-234556924, 2147450896(%rax)
	movl	$-234556924, 2147450900(%rax)
	movl	$-234556924, 2147450904(%rax)
	movl	$-234556924, 2147450908(%rax)
	movl	$-234556924, 2147450912(%rax)
	movl	$-234556924, 2147450916(%rax)
	movl	$-218959360, 2147450920(%rax)
	movl	$-218959360, 2147450924(%rax)
	movl	$-218959360, 2147450928(%rax)
	movl	$-218959360, 2147450932(%rax)
	movl	$-218959360, 2147450936(%rax)
	movl	$-218959360, 2147450940(%rax)
	movl	$-219021312, 2147450944(%rax)
	movl	$-202178560, 2147450948(%rax)
	.loc 7 1667 2 view .LVU2302
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	.loc 7 1667 37 view .LVU2303
	movq	-664(%rbp), %rax
.LVL1608:
	.loc 7 1667 37 view .LVU2304
	movq	%rax, -96(%rbx)
	movq	%r14, -88(%rbx)
	.loc 7 1667 61 view .LVU2305
	movq	%r13, -64(%rbx)
	movq	%r12, -56(%rbx)
.LBB2995:
.LBB2996:
.LBB2997:
.LBB2998:
.LBB2999:
	.loc 18 206 11 view .LVU2306
	leaq	-88(%rbx), %rax
.LVL1609:
	.loc 18 206 11 view .LVU2307
	movq	%rax, -728(%rbp)
	shrq	$3, %rax
	movq	%rax, -664(%rbp)
	leaq	-352(%rbx), %rax
	movq	%rax, -680(%rbp)
	movq	%rbx, %rax
	andl	$7, %eax
	addl	$3, %eax
	movb	%al, -681(%rbp)
	jmp	.L1782
.LVL1610:
.L2112:
	.loc 18 206 11 view .LVU2308
.LBE2999:
.LBE2998:
.LBE2997:
.LBE2996:
.LBE2995:
	.loc 7 1667 2 view .LVU2309
	movl	$576, %edi
.LVL1611:
	.loc 7 1667 2 view .LVU2310
	call	__asan_stack_malloc_4@PLT
.LVL1612:
	.loc 7 1667 2 view .LVU2311
	testq	%rax, %rax
	cmove	-696(%rbp), %rax
	movq	%rax, -696(%rbp)
	jmp	.L1778
.LVL1613:
.L1783:
	.loc 7 1673 20 view .LVU2312
	movq	%r15, %rsi
	leaq	.Lubsan_data1471(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1614:
	jmp	.L1784
.LVL1615:
.L2144:
.LBB3076:
.LBB3077:
.LBB3078:
.LBB3079:
	.loc 18 207 6 view .LVU2313
	call	__asan_report_load8@PLT
.LVL1616:
.L2145:
	.loc 18 207 6 view .LVU2314
	call	__asan_report_store4@PLT
.LVL1617:
.L2146:
	.loc 18 207 69 discriminator 3 view .LVU2315
	testq	%r12, %r12
	je	.L1789
	testb	$7, %r12b
	jne	.L1789
.L1790:
	.loc 18 207 69 discriminator 1 view .LVU2316
	testq	%r12, %r12
	je	.L1791
	testb	$7, %r12b
	jne	.L1791
.L1792:
	movq	%r12, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2113
	movq	(%r12), %r14
	movabsq	$-2748838011557800672, %rax
	xorq	%r14, %rax
	movabsq	$-7070675565921424023, %rcx
	imulq	%rcx, %rax
	movq	%rax, %rdx
	salq	$47, %rdx
	xorq	%r14, %rax
	xorq	%rdx, %rax
	imulq	%rcx, %rax
	movq	%rax, %rdx
	salq	$47, %rdx
	xorq	%rax, %rdx
	imulq	%rcx, %rdx
	movq	%rdx, %rcx
	andl	$127, %ecx
	leaq	__ubsan_vptr_type_cache(%rip), %rax
	cmpq	%rdx, (%rax,%rcx,8)
	jne	.L2114
.L1794:
.LVL1618:
.LBB3080:
.LBI3080:
	.file 22 "/usr/include/c++/13/streambuf"
	.loc 22 345 7 is_stmt 1 view .LVU2317
.LBB3081:
	.loc 22 348 33 is_stmt 0 view .LVU2318
	testq	%r12, %r12
	je	.L1795
	testb	$7, %r12b
	jne	.L1795
.L1796:
	.loc 22 348 33 discriminator 1 view .LVU2319
	testq	%r12, %r12
	je	.L1797
	testb	$7, %r12b
	jne	.L1797
.L1798:
.LVL1619:
.LBB3082:
.LBI3082:
	.loc 22 492 7 is_stmt 1 view .LVU2320
.LBB3083:
	.loc 22 492 30 is_stmt 0 view .LVU2321
	testq	%r12, %r12
	je	.L1799
	testb	$7, %r12b
	jne	.L1799
.L1800:
	.loc 22 492 30 discriminator 1 view .LVU2322
	testq	%r12, %r12
	je	.L1801
	testb	$7, %r12b
	jne	.L1801
.L1802:
	leaq	16(%r12), %rdx
	cmpq	$-16, %r12
	jnb	.L2115
.L1803:
	leaq	16(%r12), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2116
	movq	16(%r12), %r13
.LVL1620:
	.loc 22 492 30 discriminator 1 view .LVU2323
.LBE3083:
.LBE3082:
	.loc 22 348 49 discriminator 3 view .LVU2324
	testq	%r12, %r12
	je	.L1805
	testb	$7, %r12b
	jne	.L1805
.L1806:
	.loc 22 348 49 discriminator 4 view .LVU2325
	testq	%r12, %r12
	je	.L1807
	testb	$7, %r12b
	jne	.L1807
.L1808:
.LVL1621:
.LBB3085:
.LBI3085:
	.loc 22 495 7 is_stmt 1 view .LVU2326
.LBB3086:
	.loc 22 495 30 is_stmt 0 view .LVU2327
	testq	%r12, %r12
	je	.L1809
	testb	$7, %r12b
	jne	.L1809
.L1810:
	.loc 22 495 30 discriminator 1 view .LVU2328
	testq	%r12, %r12
	je	.L1811
	testb	$7, %r12b
	jne	.L1811
.L1812:
	leaq	24(%r12), %rdx
	cmpq	$-24, %r12
	jnb	.L2117
.L1813:
	leaq	24(%r12), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2118
.LVL1622:
	.loc 22 495 30 discriminator 1 view .LVU2329
.LBE3086:
.LBE3085:
	.loc 22 348 2 discriminator 7 view .LVU2330
	cmpq	24(%r12), %r13
	jnb	.L1815
	.loc 22 349 48 view .LVU2331
	testq	%r12, %r12
	je	.L1816
	testb	$7, %r12b
	jne	.L1816
.L1817:
	.loc 22 349 48 discriminator 1 view .LVU2332
	testq	%r12, %r12
	je	.L1818
	testb	$7, %r12b
	jne	.L1818
.L1819:
.LVL1623:
.LBB3088:
.LBI3088:
	.loc 22 492 7 is_stmt 1 view .LVU2333
.LBB3089:
	.loc 22 492 30 is_stmt 0 view .LVU2334
	testq	%r12, %r12
	je	.L1820
	testb	$7, %r12b
	jne	.L1820
.L1821:
	.loc 22 492 30 discriminator 1 view .LVU2335
	testq	%r12, %r12
	je	.L1822
	testb	$7, %r12b
	jne	.L1822
.L1823:
.LVL1624:
	.loc 22 492 30 discriminator 1 view .LVU2336
.LBE3089:
.LBE3088:
	.loc 22 349 48 discriminator 3 view .LVU2337
	testq	%r13, %r13
	je	.L2119
.L1824:
.LVL1625:
.LBB3091:
.LBI3091:
	.loc 16 457 7 is_stmt 1 view .LVU2338
.LBB3092:
	.loc 16 458 9 view .LVU2339
	.loc 16 458 65 is_stmt 0 view .LVU2340
	testq	%r13, %r13
	je	.L2120
.L1825:
	.loc 16 458 65 view .LVU2341
	movq	%r13, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	movq	%r13, %rdx
	andl	$7, %edx
	cmpb	%dl, %al
	jg	.L1826
	testb	%al, %al
	jne	.L2121
.L1826:
	.loc 16 458 69 view .LVU2342
	movzbl	0(%r13), %r13d
.LVL1626:
	.loc 16 458 69 view .LVU2343
	leaq	-416(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L1827
	testb	%dl, %dl
	jne	.L2122
.L1827:
	movl	%r13d, -416(%rbx)
.LVL1627:
	.loc 16 458 69 view .LVU2344
.LBE3092:
.LBE3091:
.LBE3081:
.LBE3080:
.LBB3099:
.LBI3099:
	.loc 18 217 7 is_stmt 1 view .LVU2345
.LBB3100:
	.loc 18 219 17 is_stmt 0 discriminator 1 view .LVU2346
	movl	$-1, -544(%rbx)
	leaq	-544(%rbx), %rax
	shrq	$3, %rax
	movb	$-8, 2147450880(%rax)
.LVL1628:
	.loc 18 219 17 discriminator 1 view .LVU2347
	jmp	.L1786
.L1789:
	.loc 18 219 17 discriminator 1 view .LVU2348
.LBE3100:
.LBE3099:
	.loc 18 207 69 discriminator 3 view .LVU2349
	movq	%r12, %rsi
	leaq	.Lubsan_data1478(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1629:
	jmp	.L1790
.L1791:
	.loc 18 207 69 discriminator 1 view .LVU2350
	movq	%r12, %rsi
	leaq	.Lubsan_data1479(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1630:
	jmp	.L1792
.L2113:
	movq	%r12, %rdi
	call	__asan_report_load8@PLT
.LVL1631:
.L2114:
	movq	%r12, %rsi
	leaq	.Lubsan_data1480(%rip), %rdi
	call	__ubsan_handle_dynamic_type_cache_miss@PLT
.LVL1632:
	jmp	.L1794
.LVL1633:
.L1795:
.LBB3102:
.LBB3098:
	.loc 22 348 33 view .LVU2351
	movq	%r12, %rsi
	leaq	.Lubsan_data1481(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1634:
	jmp	.L1796
.L1797:
	.loc 22 348 33 discriminator 1 view .LVU2352
	movq	%r12, %rsi
	leaq	.Lubsan_data1482(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1635:
	jmp	.L1798
.LVL1636:
.L1799:
.LBB3094:
.LBB3084:
	.loc 22 492 30 view .LVU2353
	movq	%r12, %rsi
	leaq	.Lubsan_data1483(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1637:
	jmp	.L1800
.L1801:
	.loc 22 492 30 discriminator 1 view .LVU2354
	movq	%r12, %rsi
	leaq	.Lubsan_data1484(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1638:
	jmp	.L1802
.L2115:
	.loc 22 492 30 discriminator 1 view .LVU2355
	movq	%r12, %rsi
	leaq	.Lubsan_data1485(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL1639:
	jmp	.L1803
.L2116:
	.loc 22 492 30 discriminator 1 view .LVU2356
	call	__asan_report_load8@PLT
.LVL1640:
.L1805:
	.loc 22 492 30 discriminator 1 view .LVU2357
.LBE3084:
.LBE3094:
	.loc 22 348 49 discriminator 3 view .LVU2358
	movq	%r12, %rsi
	leaq	.Lubsan_data1486(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1641:
	jmp	.L1806
.L1807:
	.loc 22 348 49 discriminator 4 view .LVU2359
	movq	%r12, %rsi
	leaq	.Lubsan_data1487(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1642:
	jmp	.L1808
.LVL1643:
.L1809:
.LBB3095:
.LBB3087:
	.loc 22 495 30 view .LVU2360
	movq	%r12, %rsi
	leaq	.Lubsan_data1488(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1644:
	jmp	.L1810
.L1811:
	.loc 22 495 30 discriminator 1 view .LVU2361
	movq	%r12, %rsi
	leaq	.Lubsan_data1489(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1645:
	jmp	.L1812
.L2117:
	.loc 22 495 30 discriminator 1 view .LVU2362
	movq	%r12, %rsi
	leaq	.Lubsan_data1490(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL1646:
	jmp	.L1813
.L2118:
	.loc 22 495 30 discriminator 1 view .LVU2363
	call	__asan_report_load8@PLT
.LVL1647:
.L1816:
	.loc 22 495 30 discriminator 1 view .LVU2364
.LBE3087:
.LBE3095:
	.loc 22 349 48 view .LVU2365
	movq	%r12, %rsi
	leaq	.Lubsan_data1491(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1648:
	jmp	.L1817
.L1818:
	.loc 22 349 48 discriminator 1 view .LVU2366
	movq	%r12, %rsi
	leaq	.Lubsan_data1492(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1649:
	jmp	.L1819
.LVL1650:
.L1820:
.LBB3096:
.LBB3090:
	.loc 22 492 30 view .LVU2367
	movq	%r12, %rsi
	leaq	.Lubsan_data1493(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1651:
	jmp	.L1821
.L1822:
	.loc 22 492 30 discriminator 1 view .LVU2368
	movq	%r12, %rsi
	leaq	.Lubsan_data1494(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1652:
	jmp	.L1823
.LVL1653:
.L2119:
	.loc 22 492 30 discriminator 1 view .LVU2369
.LBE3090:
.LBE3096:
	.loc 22 349 48 discriminator 3 view .LVU2370
	movl	$0, %esi
	leaq	.Lubsan_data1495(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1654:
	jmp	.L1824
.LVL1655:
.L2120:
.LBB3097:
.LBB3093:
	.loc 16 458 65 view .LVU2371
	movl	$0, %esi
	leaq	.Lubsan_data1496(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1656:
	jmp	.L1825
.L2121:
	.loc 16 458 65 view .LVU2372
	movq	%r13, %rdi
	call	__asan_report_load1@PLT
.LVL1657:
.L2122:
	.loc 16 458 65 view .LVU2373
	call	__asan_report_store4@PLT
.LVL1658:
.L1815:
	.loc 16 458 65 view .LVU2374
.LBE3093:
.LBE3097:
	.loc 22 351 27 view .LVU2375
	testq	%r12, %r12
	je	.L1829
	testb	$7, %r12b
	jne	.L1829
.L1830:
	.loc 22 351 27 discriminator 1 view .LVU2376
	testq	%r12, %r12
	je	.L1831
	testb	$7, %r12b
	jne	.L1831
.L1832:
	leaq	72(%r14), %rdx
	cmpq	$-72, %r14
	jnb	.L2123
.L1833:
	movq	%r14, %rsi
	addq	$72, %rsi
	je	.L1834
	testb	$7, %sil
	jne	.L1834
.L1835:
	leaq	72(%r14), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2124
	.loc 22 351 27 discriminator 2 view .LVU2377
	movq	%r12, %rdi
.LEHB32:
	call	*72(%r14)
.LVL1659:
.LEHE32:
	jmp	.L2125
.L1829:
	.loc 22 351 27 view .LVU2378
	movq	%r12, %rsi
	leaq	.Lubsan_data1499(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1660:
	jmp	.L1830
.L1831:
	.loc 22 351 27 discriminator 1 view .LVU2379
	movq	%r12, %rsi
	leaq	.Lubsan_data1500(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1661:
	jmp	.L1832
.L2123:
	.loc 22 351 27 discriminator 1 view .LVU2380
	movq	%r14, %rsi
	leaq	.Lubsan_data1501(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL1662:
	jmp	.L1833
.L1834:
	leaq	.Lubsan_data1502(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1663:
	jmp	.L1835
.L2124:
	call	__asan_report_load8@PLT
.LVL1664:
.L2125:
	.loc 22 351 27 discriminator 2 view .LVU2381
	movl	%eax, %r13d
.LVL1665:
	.loc 22 351 27 discriminator 2 view .LVU2382
	leaq	-416(%rbx), %rdi
	movq	%rdi, %rax
.LVL1666:
	.loc 22 351 27 discriminator 2 view .LVU2383
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	movq	%rdi, %rdx
	andl	$7, %edx
	addl	$3, %edx
	cmpb	%al, %dl
	jl	.L1837
	testb	%al, %al
	jne	.L2126
.L1837:
	movl	%r13d, -416(%rbx)
.LVL1667:
	.loc 22 351 27 discriminator 2 view .LVU2384
.LBE3098:
.LBE3102:
.LBB3103:
	.loc 18 217 7 is_stmt 1 view .LVU2385
.LBB3101:
	.loc 18 219 17 is_stmt 0 discriminator 1 view .LVU2386
	movl	$-1, -544(%rbx)
	leaq	-544(%rbx), %rax
	shrq	$3, %rax
	movb	$-8, 2147450880(%rax)
.LVL1668:
	.loc 18 219 17 discriminator 1 view .LVU2387
.LBE3101:
.LBE3103:
	.loc 18 207 34 discriminator 4 view .LVU2388
	cmpl	$-1, %r13d
	jne	.L1786
.LVL1669:
	.loc 18 208 12 view .LVU2389
	leaq	-96(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2127
	movq	$0, -96(%rbx)
	jmp	.L1786
.LVL1670:
.L2126:
	.loc 18 208 12 view .LVU2390
	call	__asan_report_store4@PLT
.LVL1671:
.L2127:
	.loc 18 208 12 view .LVU2391
	call	__asan_report_store8@PLT
.LVL1672:
.L2147:
	.loc 18 208 12 view .LVU2392
.LBE3079:
.LBE3078:
	.loc 18 152 11 discriminator 1 view .LVU2393
	call	__asan_report_store4@PLT
.LVL1673:
.L2148:
	.loc 18 152 11 discriminator 1 view .LVU2394
.LBE3077:
.LBE3076:
	.loc 7 1673 21 discriminator 2 view .LVU2395
	call	__asan_report_store1@PLT
.LVL1674:
.L1842:
.LBB3112:
.LBB3113:
	.loc 15 114 20 view .LVU2396
	movq	%r15, %rsi
	leaq	.Lubsan_data1507(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1675:
	jmp	.L1843
.L2149:
	.loc 15 114 20 view .LVU2397
	movq	%r12, %rdx
	movq	%r15, %rsi
	leaq	.Lubsan_data1508(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL1676:
	jmp	.L1844
.L2150:
	.loc 15 114 20 view .LVU2398
	movq	%r12, %rdi
	call	__asan_report_load8@PLT
.LVL1677:
.L1846:
	.loc 15 114 47 view .LVU2399
	movq	%r15, %rsi
	leaq	.Lubsan_data1509(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1678:
	jmp	.L1847
.L2151:
	.loc 15 114 47 view .LVU2400
	movq	%r15, %rsi
	leaq	.Lubsan_data1510(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL1679:
	jmp	.L1848
.L2152:
	.loc 15 114 47 view .LVU2401
	call	__asan_report_load8@PLT
.LVL1680:
.L1851:
	.loc 15 117 30 view .LVU2402
	movq	%r15, %rsi
	leaq	.Lubsan_data1511(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1681:
	jmp	.L1852
.L1853:
	.loc 15 117 37 view .LVU2403
	movq	%r15, %rsi
	leaq	.Lubsan_data1512(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1682:
	jmp	.L1854
.L2153:
	.loc 15 117 30 view .LVU2404
	movl	$0, %esi
	leaq	.Lubsan_data1513(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1683:
	jmp	.L1855
.LVL1684:
.L2154:
.LBB3114:
.LBB3115:
.LBB3116:
	.loc 21 97 14 discriminator 1 view .LVU2405
	movl	$0, %esi
	leaq	.Lubsan_data1515(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1685:
	jmp	.L1856
.L2155:
	.loc 21 97 14 discriminator 1 view .LVU2406
	movq	%r14, %rdi
	call	__asan_report_store1@PLT
.LVL1686:
.L1858:
	.loc 21 97 14 discriminator 1 view .LVU2407
.LBE3116:
.LBE3115:
.LBE3114:
	.loc 15 119 22 view .LVU2408
	movq	%r15, %rsi
	leaq	.Lubsan_data1516(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1687:
	jmp	.L1859
.L2156:
	.loc 15 119 6 view .LVU2409
	movq	%r13, %rsi
	leaq	.Lubsan_data1517(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL1688:
	jmp	.L1860
.L1861:
	.loc 15 119 6 view .LVU2410
	movq	%r15, %rsi
	leaq	.Lubsan_data1518(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1689:
	jmp	.L1862
.L1850:
	.loc 15 123 21 view .LVU2411
	testq	%r15, %r15
	je	.L1864
	testb	$7, %r15b
	jne	.L1864
.L1865:
	.loc 15 123 25 discriminator 1 view .LVU2412
	testq	%r15, %r15
	je	.L1866
	testb	$7, %r15b
	jne	.L1866
.L1867:
.LVL1690:
.LBB3119:
.LBI3119:
	.loc 7 893 7 is_stmt 1 view .LVU2413
.LBB3120:
	.loc 7 894 16 is_stmt 0 view .LVU2414
	leaq	-288(%rbx), %rax
	shrq	$3, %rax
	movb	$0, 2147450880(%rax)
	.loc 7 894 39 discriminator 1 view .LVU2415
	testq	%r15, %r15
	je	.L1868
	testb	$7, %r15b
	jne	.L1868
.L1869:
	.loc 7 894 39 discriminator 1 view .LVU2416
	testq	%r12, %r12
	je	.L1870
	testb	$7, %r12b
	jne	.L1870
.L1871:
.LVL1691:
.LBB3121:
.LBI3121:
	.loc 12 1076 7 is_stmt 1 view .LVU2417
.LBB3122:
.LBB3123:
	.loc 12 1077 9 is_stmt 0 view .LVU2418
	testq	%r12, %r12
	je	.L1872
	testb	$7, %r12b
	jne	.L1872
.L1873:
	.loc 12 1077 9 view .LVU2419
	leaq	8(%r15), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2128
	movq	8(%r15), %rsi
	leaq	-288(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2129
	movq	%rsi, -288(%rbx)
.LVL1692:
	.loc 12 1077 9 view .LVU2420
.LBE3123:
.LBE3122:
.LBE3121:
	.loc 7 894 16 discriminator 1 view .LVU2421
	leaq	-288(%rbx), %rax
	shrq	$3, %rax
	movb	$-8, 2147450880(%rax)
.LVL1693:
	.loc 7 894 16 discriminator 1 view .LVU2422
.LBE3120:
.LBE3119:
	.loc 15 123 21 discriminator 3 view .LVU2423
	leaq	-576(%rbx), %rdx
	movq	%r15, %rdi
.LEHB33:
	call	_ZNSt6vectorIhSaIhEE17_M_realloc_insertIJcEEEvN9__gnu_cxx17__normal_iteratorIPhS1_EEDpOT_
.LVL1694:
.LEHE33:
	jmp	.L1863
.L1864:
	.loc 15 123 21 view .LVU2424
	movq	%r15, %rsi
	leaq	.Lubsan_data1519(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1695:
	jmp	.L1865
.L1866:
	.loc 15 123 25 discriminator 1 view .LVU2425
	movq	%r15, %rsi
	leaq	.Lubsan_data1520(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1696:
	jmp	.L1867
.LVL1697:
.L1868:
.LBB3128:
.LBB3127:
	.loc 7 894 39 discriminator 1 view .LVU2426
	movq	%r15, %rsi
	leaq	.Lubsan_data1521(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1698:
	jmp	.L1869
.L1870:
	.loc 7 894 39 discriminator 1 view .LVU2427
	movq	%r12, %rsi
	leaq	.Lubsan_data1522(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1699:
	jmp	.L1871
.LVL1700:
.L1872:
.LBB3126:
.LBB3125:
.LBB3124:
	.loc 12 1077 9 view .LVU2428
	movq	%r12, %rsi
	leaq	.Lubsan_data1523(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1701:
	jmp	.L1873
.L2128:
	.loc 12 1077 9 view .LVU2429
	call	__asan_report_load8@PLT
.LVL1702:
.L2129:
	.loc 12 1077 9 view .LVU2430
	call	__asan_report_store8@PLT
.LVL1703:
.L1876:
	.loc 12 1077 9 view .LVU2431
.LBE3124:
.LBE3125:
.LBE3126:
.LBE3127:
.LBE3128:
	.loc 15 125 13 view .LVU2432
	movq	%r15, %rsi
	leaq	.Lubsan_data1525(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1704:
	jmp	.L1877
.LVL1705:
.L1878:
.LBB3129:
.LBB3130:
	.loc 7 1236 14 discriminator 2 view .LVU2433
	movq	%r15, %rsi
	leaq	.Lubsan_data1526(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1706:
	jmp	.L1879
.LVL1707:
.L1880:
.LBB3131:
.LBB3132:
	.loc 7 894 39 discriminator 1 view .LVU2434
	movq	%r15, %rsi
	leaq	.Lubsan_data1527(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1708:
	jmp	.L1881
.L1882:
	.loc 7 894 39 discriminator 1 view .LVU2435
	movq	%r12, %rsi
	leaq	.Lubsan_data1528(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1709:
	jmp	.L1883
.LVL1710:
.L1884:
.LBB3133:
.LBB3134:
.LBB3135:
	.loc 12 1077 9 view .LVU2436
	movq	%r12, %rsi
	leaq	.Lubsan_data1529(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1711:
	jmp	.L1885
.L2157:
	.loc 12 1077 9 view .LVU2437
	call	__asan_report_load8@PLT
.LVL1712:
.L2158:
	.loc 12 1077 9 view .LVU2438
	call	__asan_report_store8@PLT
.LVL1713:
.L2159:
	.loc 12 1077 9 view .LVU2439
.LBE3135:
.LBE3134:
.LBE3133:
.LBE3132:
.LBE3131:
	.loc 7 1236 14 discriminator 3 view .LVU2440
	call	__asan_report_store8@PLT
.LVL1714:
.L2160:
.LBB3140:
.LBB3141:
	.loc 12 1158 45 discriminator 2 view .LVU2441
	movq	%r12, %rsi
	leaq	.Lubsan_data1533(%rip), %rdi
.LVL1715:
	.loc 12 1158 45 discriminator 2 view .LVU2442
	call	__ubsan_handle_pointer_overflow@PLT
.LVL1716:
	jmp	.L1889
.L2161:
	.loc 12 1158 45 discriminator 2 view .LVU2443
	call	__asan_report_store8@PLT
.LVL1717:
.L2162:
.LBB3142:
.LBB3143:
.LBB3144:
	.loc 12 1077 9 view .LVU2444
	call	__asan_report_store8@PLT
.LVL1718:
.L2163:
	.loc 12 1077 9 view .LVU2445
.LBE3144:
.LBE3143:
.LBE3142:
.LBE3141:
.LBE3140:
	.loc 7 1236 17 discriminator 5 view .LVU2446
	call	__asan_report_store8@PLT
.LVL1719:
.L2164:
.LBB3149:
.LBB3150:
	.loc 12 1100 17 view .LVU2447
	movl	$0, %esi
	leaq	.Lubsan_data1539(%rip), %rdi
.LVL1720:
	.loc 12 1100 17 view .LVU2448
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1721:
	jmp	.L1893
.LVL1722:
.L2165:
	.loc 12 1100 17 view .LVU2449
.LBE3150:
.LBE3149:
	.loc 7 1236 20 discriminator 8 view .LVU2450
	movl	$0, %esi
	leaq	.Lubsan_data1541(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1723:
	jmp	.L1894
.LVL1724:
.L2166:
	.loc 7 1236 20 discriminator 8 view .LVU2451
.LBE3130:
.LBE3129:
.LBE3113:
.LBE3112:
.LBB3159:
.LBB3160:
	.loc 18 173 2 view .LVU2452
	call	__asan_report_load8@PLT
.LVL1725:
.L1896:
	.loc 18 173 17 view .LVU2453
	movq	%r12, %rsi
	leaq	.Lubsan_data1543(%rip), %rdi
.LVL1726:
	.loc 18 173 17 view .LVU2454
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1727:
	jmp	.L1897
.L1898:
	.loc 18 173 17 discriminator 1 view .LVU2455
	movq	%r12, %rsi
	leaq	.Lubsan_data1544(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1728:
	jmp	.L1899
.L2167:
	movq	%r12, %rdi
	call	__asan_report_load8@PLT
.LVL1729:
.L2168:
	movq	%r12, %rsi
	leaq	.Lubsan_data1545(%rip), %rdi
	call	__ubsan_handle_dynamic_type_cache_miss@PLT
.LVL1730:
	jmp	.L1901
.LVL1731:
.L1902:
.LBB3161:
.LBB3162:
	.loc 22 326 33 view .LVU2456
	movq	%r12, %rsi
	leaq	.Lubsan_data1546(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1732:
	jmp	.L1903
.L1904:
	.loc 22 326 33 discriminator 1 view .LVU2457
	movq	%r12, %rsi
	leaq	.Lubsan_data1547(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1733:
	jmp	.L1905
.LVL1734:
.L1906:
.LBB3163:
.LBB3164:
	.loc 22 492 30 view .LVU2458
	movq	%r12, %rsi
	leaq	.Lubsan_data1548(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1735:
	jmp	.L1907
.L1908:
	.loc 22 492 30 discriminator 1 view .LVU2459
	movq	%r12, %rsi
	leaq	.Lubsan_data1549(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1736:
	jmp	.L1909
.L2169:
	.loc 22 492 30 discriminator 1 view .LVU2460
	movq	%r12, %rsi
	leaq	.Lubsan_data1550(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL1737:
	jmp	.L1910
.L2170:
	.loc 22 492 30 discriminator 1 view .LVU2461
	call	__asan_report_load8@PLT
.LVL1738:
.L1912:
	.loc 22 492 30 discriminator 1 view .LVU2462
.LBE3164:
.LBE3163:
	.loc 22 326 49 discriminator 3 view .LVU2463
	movq	%r12, %rsi
	leaq	.Lubsan_data1551(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1739:
	jmp	.L1913
.L1914:
	.loc 22 326 49 discriminator 4 view .LVU2464
	movq	%r12, %rsi
	leaq	.Lubsan_data1552(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1740:
	jmp	.L1915
.LVL1741:
.L1916:
.LBB3166:
.LBB3167:
	.loc 22 495 30 view .LVU2465
	movq	%r12, %rsi
	leaq	.Lubsan_data1553(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1742:
	jmp	.L1917
.L1918:
	.loc 22 495 30 discriminator 1 view .LVU2466
	movq	%r12, %rsi
	leaq	.Lubsan_data1554(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1743:
	jmp	.L1919
.L2171:
	.loc 22 495 30 discriminator 1 view .LVU2467
	movq	%r12, %rsi
	leaq	.Lubsan_data1555(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL1744:
	jmp	.L1920
.L2172:
	.loc 22 495 30 discriminator 1 view .LVU2468
	call	__asan_report_load8@PLT
.LVL1745:
.L2108:
	.loc 22 495 30 discriminator 1 view .LVU2469
	endbr64
.LBE3167:
.LBE3166:
.LBE3162:
.LBE3161:
.LBE3160:
.LBE3159:
.LBB3189:
.LBB3110:
	movq	%rax, %rdi
	leaq	-560(%rbx), %rax
	shrq	$3, %rax
	movb	$-8, 2147450880(%rax)
.LVL1746:
.L1925:
	.loc 22 495 30 discriminator 1 view .LVU2470
.LBE3110:
.LBE3189:
	.loc 7 1673 21 discriminator 3 view .LVU2471
	leaq	-576(%rbx), %rax
	shrq	$3, %rax
	movb	$-8, 2147450880(%rax)
.L2074:
	.loc 7 1677 6 discriminator 1 view .LVU2472
	call	__cxa_begin_catch@PLT
.LVL1747:
	.loc 7 1678 11 view .LVU2473
	testq	%r15, %r15
	je	.L2075
	testb	$7, %r15b
	je	.L2076
.L2075:
	movq	%r15, %rsi
	leaq	.Lubsan_data1649(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1748:
.L2076:
.LBB3190:
.LBI3190:
	.loc 7 1605 7 is_stmt 1 view .LVU2474
.LBB3191:
	.loc 7 1606 24 is_stmt 0 view .LVU2475
	testq	%r15, %r15
	je	.L2077
	testb	$7, %r15b
	je	.L2078
.L2077:
	.loc 7 1606 24 view .LVU2476
	movq	%r15, %rsi
	leaq	.Lubsan_data1650(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1749:
.L2078:
	.loc 7 1606 24 discriminator 1 view .LVU2477
	testq	%r15, %r15
	je	.L2079
	testb	$7, %r15b
	je	.L2080
.L2079:
	movq	%r15, %rsi
	leaq	.Lubsan_data1651(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1750:
.L2080:
	.loc 7 1606 24 discriminator 1 view .LVU2478
	movq	%r15, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	je	.L2081
	movq	%r15, %rdi
	call	__asan_report_load8@PLT
.LVL1751:
.L1926:
	.loc 7 1606 24 discriminator 1 view .LVU2479
.LBE3191:
.LBE3190:
.LBB3197:
.LBB3187:
.LBB3185:
.LBB3183:
	.loc 22 328 50 view .LVU2480
	movq	%r12, %rsi
	leaq	.Lubsan_data1556(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1752:
	jmp	.L1927
.L1928:
	.loc 22 328 50 discriminator 1 view .LVU2481
	movq	%r12, %rsi
	leaq	.Lubsan_data1557(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1753:
	jmp	.L1929
.LVL1754:
.L1930:
.LBB3169:
.LBB3170:
	.loc 22 492 30 view .LVU2482
	movq	%r12, %rsi
	leaq	.Lubsan_data1558(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1755:
	jmp	.L1931
.L1932:
	.loc 22 492 30 discriminator 1 view .LVU2483
	movq	%r12, %rsi
	leaq	.Lubsan_data1559(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1756:
	jmp	.L1933
.LVL1757:
.L2174:
	.loc 22 492 30 discriminator 1 view .LVU2484
.LBE3170:
.LBE3169:
	.loc 22 328 50 discriminator 3 view .LVU2485
	movl	$0, %esi
	leaq	.Lubsan_data1560(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1758:
	jmp	.L1934
.LVL1759:
.L2175:
.LBB3172:
.LBB3173:
	.loc 16 458 65 view .LVU2486
	movl	$0, %esi
	leaq	.Lubsan_data1561(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1760:
	jmp	.L1935
.LVL1761:
.L1936:
	.loc 16 458 65 view .LVU2487
.LBE3173:
.LBE3172:
	.loc 22 329 17 view .LVU2488
	movq	%r12, %rsi
	leaq	.Lubsan_data1562(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1762:
	.loc 22 329 17 view .LVU2489
	jmp	.L1937
.L1938:
	.loc 22 329 17 discriminator 1 view .LVU2490
	movq	%r12, %rsi
	leaq	.Lubsan_data1563(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1763:
	jmp	.L1939
.LVL1764:
.L1940:
.LBB3175:
.LBB3176:
	.loc 22 505 24 view .LVU2491
	movq	%r12, %rsi
	leaq	.Lubsan_data1564(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1765:
	jmp	.L1941
.L1942:
	.loc 22 505 24 discriminator 1 view .LVU2492
	movq	%r12, %rsi
	leaq	.Lubsan_data1565(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1766:
	jmp	.L1943
.L2176:
	.loc 22 505 34 discriminator 2 view .LVU2493
	movq	%r13, %rsi
	leaq	.Lubsan_data1566(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL1767:
	jmp	.L1944
.L1945:
	.loc 22 505 34 discriminator 2 view .LVU2494
	movq	%r12, %rsi
	leaq	.Lubsan_data1567(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1768:
	jmp	.L1946
.LVL1769:
.L2173:
	.loc 22 505 34 discriminator 2 view .LVU2495
.LBE3176:
.LBE3175:
	.loc 22 332 23 view .LVU2496
	testq	%r12, %r12
	je	.L1948
	.loc 22 332 23 view .LVU2497
	testb	$7, %r12b
	jne	.L1948
.L1949:
	.loc 22 332 23 discriminator 1 view .LVU2498
	testq	%r12, %r12
	je	.L1950
	testb	$7, %r12b
	jne	.L1950
.L1951:
	leaq	80(%r14), %rdx
	cmpq	$-80, %r14
	jnb	.L2130
.L1952:
	movq	%r14, %rsi
	addq	$80, %rsi
	je	.L1953
	testb	$7, %sil
	jne	.L1953
.L1954:
	leaq	80(%r14), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2131
	.loc 22 332 23 discriminator 2 view .LVU2499
	movq	%r12, %rdi
.LEHB34:
	call	*80(%r14)
.LVL1770:
	jmp	.L1947
.L1948:
	.loc 22 332 23 view .LVU2500
	movq	%r12, %rsi
	leaq	.Lubsan_data1568(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1771:
	jmp	.L1949
.L1950:
	.loc 22 332 23 discriminator 1 view .LVU2501
	movq	%r12, %rsi
	leaq	.Lubsan_data1569(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1772:
	jmp	.L1951
.L2130:
	.loc 22 332 23 discriminator 1 view .LVU2502
	movq	%r14, %rsi
	leaq	.Lubsan_data1570(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL1773:
	jmp	.L1952
.L1953:
	leaq	.Lubsan_data1571(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1774:
	jmp	.L1954
.L2131:
	call	__asan_report_load8@PLT
.LVL1775:
.L2177:
	.loc 22 332 23 discriminator 1 view .LVU2503
.LBE3183:
.LBE3185:
	.loc 18 174 7 view .LVU2504
	movq	-728(%rbp), %rdi
	call	__asan_report_store4@PLT
.LVL1776:
.L2178:
	.loc 18 174 7 view .LVU2505
.LBE3187:
.LBE3197:
.LBB3198:
.LBB3074:
.LBB3034:
.LBB3028:
.LBB3026:
	.loc 18 206 11 view .LVU2506
	movq	-728(%rbp), %rdi
	call	__asan_report_load4@PLT
.LVL1777:
.L2179:
	.loc 18 207 6 view .LVU2507
	call	__asan_report_load8@PLT
.LVL1778:
.L2180:
	.loc 18 207 6 view .LVU2508
	movq	-680(%rbp), %rdi
	call	__asan_report_store4@PLT
.LVL1779:
.L1962:
	.loc 18 207 69 discriminator 3 view .LVU2509
	movq	%r12, %rsi
	leaq	.Lubsan_data1582(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1780:
	.loc 18 207 69 discriminator 3 view .LVU2510
	jmp	.L1963
.L1964:
	.loc 18 207 69 discriminator 1 view .LVU2511
	movq	%r12, %rsi
	leaq	.Lubsan_data1583(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1781:
	jmp	.L1965
.L2181:
	movq	%r12, %rdi
	call	__asan_report_load8@PLT
.LVL1782:
.L2182:
	movq	%r12, %rsi
	leaq	.Lubsan_data1584(%rip), %rdi
	call	__ubsan_handle_dynamic_type_cache_miss@PLT
.LVL1783:
	jmp	.L1967
.LVL1784:
.L1968:
.LBB3000:
.LBB3001:
	.loc 22 348 33 view .LVU2512
	movq	%r12, %rsi
	leaq	.Lubsan_data1585(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1785:
	jmp	.L1969
.L1970:
	.loc 22 348 33 discriminator 1 view .LVU2513
	movq	%r12, %rsi
	leaq	.Lubsan_data1586(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1786:
	jmp	.L1971
.LVL1787:
.L1972:
.LBB3002:
.LBB3003:
	.loc 22 492 30 view .LVU2514
	movq	%r12, %rsi
	leaq	.Lubsan_data1587(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1788:
	jmp	.L1973
.L1974:
	.loc 22 492 30 discriminator 1 view .LVU2515
	movq	%r12, %rsi
	leaq	.Lubsan_data1588(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1789:
	jmp	.L1975
.L2183:
	.loc 22 492 30 discriminator 1 view .LVU2516
	movq	%r12, %rsi
	leaq	.Lubsan_data1589(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL1790:
	jmp	.L1976
.L2184:
	.loc 22 492 30 discriminator 1 view .LVU2517
	call	__asan_report_load8@PLT
.LVL1791:
.L1978:
	.loc 22 492 30 discriminator 1 view .LVU2518
.LBE3003:
.LBE3002:
	.loc 22 348 49 discriminator 3 view .LVU2519
	movq	%r12, %rsi
	leaq	.Lubsan_data1590(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1792:
	jmp	.L1979
.L1980:
	.loc 22 348 49 discriminator 4 view .LVU2520
	movq	%r12, %rsi
	leaq	.Lubsan_data1591(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1793:
	jmp	.L1981
.LVL1794:
.L1982:
.LBB3005:
.LBB3006:
	.loc 22 495 30 view .LVU2521
	movq	%r12, %rsi
	leaq	.Lubsan_data1592(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1795:
	jmp	.L1983
.L1984:
	.loc 22 495 30 discriminator 1 view .LVU2522
	movq	%r12, %rsi
	leaq	.Lubsan_data1593(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1796:
	jmp	.L1985
.L2185:
	.loc 22 495 30 discriminator 1 view .LVU2523
	movq	%r12, %rsi
	leaq	.Lubsan_data1594(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL1797:
	jmp	.L1986
.L2186:
	.loc 22 495 30 discriminator 1 view .LVU2524
	call	__asan_report_load8@PLT
.LVL1798:
.L1989:
	.loc 22 495 30 discriminator 1 view .LVU2525
.LBE3006:
.LBE3005:
	.loc 22 349 48 view .LVU2526
	movq	%r12, %rsi
	leaq	.Lubsan_data1595(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1799:
	jmp	.L1990
.L1991:
	.loc 22 349 48 discriminator 1 view .LVU2527
	movq	%r12, %rsi
	leaq	.Lubsan_data1596(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1800:
	jmp	.L1992
.LVL1801:
.L1993:
.LBB3008:
.LBB3009:
	.loc 22 492 30 view .LVU2528
	movq	%r12, %rsi
	leaq	.Lubsan_data1597(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1802:
	jmp	.L1994
.L1995:
	.loc 22 492 30 discriminator 1 view .LVU2529
	movq	%r12, %rsi
	leaq	.Lubsan_data1598(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1803:
	jmp	.L1996
.LVL1804:
.L2187:
	.loc 22 492 30 discriminator 1 view .LVU2530
.LBE3009:
.LBE3008:
	.loc 22 349 48 discriminator 3 view .LVU2531
	movl	$0, %esi
	leaq	.Lubsan_data1599(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1805:
	jmp	.L1997
.LVL1806:
.L2188:
.LBB3011:
.LBB3012:
	.loc 16 458 65 view .LVU2532
	movl	$0, %esi
	leaq	.Lubsan_data1600(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1807:
	jmp	.L1998
.L2189:
	.loc 16 458 65 view .LVU2533
	movq	%r14, %rdi
	call	__asan_report_load1@PLT
.LVL1808:
.L2190:
	.loc 16 458 65 view .LVU2534
	call	__asan_report_store4@PLT
.LVL1809:
.L1988:
	.loc 16 458 65 view .LVU2535
.LBE3012:
.LBE3011:
	.loc 22 351 27 view .LVU2536
	testq	%r12, %r12
	je	.L2002
	.loc 22 351 27 view .LVU2537
	testb	$7, %r12b
	jne	.L2002
.L2003:
	.loc 22 351 27 discriminator 1 view .LVU2538
	testq	%r12, %r12
	je	.L2004
	testb	$7, %r12b
	jne	.L2004
.L2005:
	movq	-672(%rbp), %rax
	leaq	72(%rax), %rdx
	cmpq	$-72, %rax
	jnb	.L2132
.L2006:
	movq	-672(%rbp), %rsi
	addq	$72, %rsi
	je	.L2007
	testb	$7, %sil
	jne	.L2007
.L2008:
	movq	-672(%rbp), %rax
	leaq	72(%rax), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2133
	.loc 22 351 27 discriminator 2 view .LVU2539
	movq	%r12, %rdi
	movq	-672(%rbp), %rax
	call	*72(%rax)
.LVL1810:
	jmp	.L2134
.L2002:
	.loc 22 351 27 view .LVU2540
	movq	%r12, %rsi
	leaq	.Lubsan_data1603(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1811:
	jmp	.L2003
.L2004:
	.loc 22 351 27 discriminator 1 view .LVU2541
	movq	%r12, %rsi
	leaq	.Lubsan_data1604(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1812:
	jmp	.L2005
.L2132:
	.loc 22 351 27 discriminator 1 view .LVU2542
	movq	%rax, %rsi
	leaq	.Lubsan_data1605(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL1813:
	jmp	.L2006
.L2007:
	leaq	.Lubsan_data1606(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1814:
	jmp	.L2008
.L2133:
	call	__asan_report_load8@PLT
.LVL1815:
.L2134:
	.loc 22 351 27 discriminator 2 view .LVU2543
	movl	%eax, %edx
.LVL1816:
	.loc 22 351 27 discriminator 2 view .LVU2544
	leaq	-368(%rbx), %rdi
	movq	%rdi, %rax
.LVL1817:
	.loc 22 351 27 discriminator 2 view .LVU2545
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	movq	%rdi, %rcx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%al, %cl
	jl	.L2010
	testb	%al, %al
	jne	.L2135
.L2010:
	movl	%edx, -368(%rbx)
.LVL1818:
	.loc 22 351 27 discriminator 2 view .LVU2546
.LBE3001:
.LBE3000:
.LBB3019:
.LBI3019:
	.loc 18 217 7 is_stmt 1 view .LVU2547
.LBB3020:
	.loc 18 219 17 is_stmt 0 discriminator 1 view .LVU2548
	movl	$-1, -496(%rbx)
	leaq	-496(%rbx), %rax
	shrq	$3, %rax
	movb	$-8, 2147450880(%rax)
.LVL1819:
	.loc 18 219 17 discriminator 1 view .LVU2549
.LBE3020:
.LBE3019:
	.loc 18 207 34 discriminator 4 view .LVU2550
	cmpl	$-1, %edx
	jne	.L1959
.LVL1820:
	.loc 18 208 12 view .LVU2551
	leaq	-96(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2136
	movq	$0, -96(%rbx)
	jmp	.L1959
.LVL1821:
.L2135:
	.loc 18 208 12 view .LVU2552
	call	__asan_report_store4@PLT
.LVL1822:
.L2136:
	.loc 18 208 12 view .LVU2553
	call	__asan_report_store8@PLT
.LVL1823:
.L2103:
	.loc 18 206 11 view .LVU2554
	movl	%r13d, %edx
.LVL1824:
.L1959:
	.loc 18 206 11 view .LVU2555
	leaq	-384(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %ecx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	jl	.L2013
	testb	%cl, %cl
	jne	.L2137
.L2013:
	movl	%edx, -384(%rbx)
.LVL1825:
	.loc 18 206 11 view .LVU2556
.LBE3026:
.LBE3028:
.LBB3029:
.LBI3029:
	.loc 18 217 7 is_stmt 1 view .LVU2557
.LBB3030:
	.loc 18 219 17 is_stmt 0 discriminator 1 view .LVU2558
	movl	$-1, -512(%rbx)
.LVL1826:
.LBB3031:
.LBI3031:
	.loc 16 461 7 is_stmt 1 view .LVU2559
.LBB3032:
	.loc 16 462 9 view .LVU2560
	.loc 16 462 24 is_stmt 0 view .LVU2561
	cmpl	$-1, %edx
	sete	%r14b
.LVL1827:
	.loc 16 462 24 view .LVU2562
.LBE3032:
.LBE3031:
	leaq	-512(%rbx), %rax
	shrq	$3, %rax
	movb	$-8, 2147450880(%rax)
.LVL1828:
	.loc 16 462 24 view .LVU2563
.LBE3030:
.LBE3029:
.LBE3034:
.LBB3035:
.LBI3035:
	.loc 18 213 7 is_stmt 1 view .LVU2564
.LBB3036:
.LBI3036:
	.loc 18 204 7 view .LVU2565
.LBB3037:
	.loc 18 206 11 is_stmt 0 view .LVU2566
	leaq	-56(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L2015
	cmpb	$3, %al
	jle	.L2138
.L2015:
	movl	-56(%rbx), %eax
.LVL1829:
	.loc 18 207 6 view .LVU2567
	leaq	-64(%rbx), %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L2139
	movq	-64(%rbx), %r12
	.loc 18 207 34 view .LVU2568
	testq	%r12, %r12
	je	.L2017
	leaq	-304(%rbx), %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %ecx
	movq	%rdi, %rdx
	andl	$7, %edx
	addl	$3, %edx
	cmpb	%cl, %dl
	jl	.L2018
	testb	%cl, %cl
	jne	.L2140
.L2018:
	movl	%eax, -304(%rbx)
.LVL1830:
.LBB3038:
.LBI3038:
	.loc 18 217 7 is_stmt 1 view .LVU2569
.LBB3039:
	.loc 18 219 17 is_stmt 0 discriminator 1 view .LVU2570
	movl	$-1, -432(%rbx)
	leaq	-432(%rbx), %rdx
	shrq	$3, %rdx
	movb	$-8, 2147450880(%rdx)
.LVL1831:
	.loc 18 219 17 discriminator 1 view .LVU2571
.LBE3039:
.LBE3038:
	.loc 18 207 14 discriminator 1 view .LVU2572
	cmpl	$-1, %eax
	je	.L2141
.LVL1832:
.L2017:
	.loc 18 207 14 discriminator 1 view .LVU2573
	leaq	-336(%rbx), %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %ecx
	movq	%rdi, %rdx
	andl	$7, %edx
	addl	$3, %edx
	cmpb	%cl, %dl
	jl	.L2071
	testb	%cl, %cl
	jne	.L2142
.L2071:
	movl	%eax, -336(%rbx)
.LVL1833:
	.loc 18 207 14 discriminator 1 view .LVU2574
.LBE3037:
.LBE3036:
.LBB3065:
.LBI3065:
	.loc 18 217 7 is_stmt 1 view .LVU2575
.LBB3066:
	.loc 18 219 17 is_stmt 0 discriminator 1 view .LVU2576
	movl	$-1, -464(%rbx)
.LVL1834:
.LBB3067:
.LBI3067:
	.loc 16 461 7 is_stmt 1 view .LVU2577
.LBB3068:
	.loc 16 462 9 view .LVU2578
	.loc 16 462 9 is_stmt 0 view .LVU2579
.LBE3068:
.LBE3067:
	leaq	-464(%rbx), %rdx
	shrq	$3, %rdx
	movb	$-8, 2147450880(%rdx)
.LVL1835:
.LBB3070:
.LBB3069:
	.loc 16 462 24 view .LVU2580
	cmpl	$-1, %eax
	sete	%al
.LBE3069:
.LBE3070:
.LBE3066:
.LBE3065:
.LBE3035:
.LBE3074:
.LBE3198:
	.loc 7 1671 21 discriminator 2 view .LVU2581
	cmpb	%al, %r14b
	je	.L2143
	.loc 7 1673 20 view .LVU2582
	testq	%r15, %r15
	je	.L1783
	testb	$7, %r15b
	jne	.L1783
.L1784:
	.loc 7 1673 8 discriminator 1 view .LVU2583
	leaq	-576(%rbx), %rax
	shrq	$3, %rax
	movb	$1, 2147450880(%rax)
.LVL1836:
.LBB3199:
.LBI3076:
	.loc 18 150 7 is_stmt 1 view .LVU2584
.LBB3111:
	.loc 18 152 11 is_stmt 0 view .LVU2585
	leaq	-560(%rbx), %rax
	shrq	$3, %rax
	movb	$4, 2147450880(%rax)
.LVL1837:
.LBB3107:
.LBI3078:
	.loc 18 204 7 is_stmt 1 view .LVU2586
.LBB3106:
	.loc 18 207 6 is_stmt 0 view .LVU2587
	leaq	-96(%rbx), %rdi
.LVL1838:
	.loc 18 207 6 view .LVU2588
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2144
	.loc 18 207 6 view .LVU2589
	movq	-96(%rbx), %r12
	.loc 18 207 34 view .LVU2590
	testq	%r12, %r12
	je	.L1786
	leaq	-400(%rbx), %rdi
.LVL1839:
	.loc 18 207 34 view .LVU2591
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L1787
	testb	%dl, %dl
	jne	.L2145
.L1787:
	movl	%r13d, -400(%rbx)
.LVL1840:
.LBB3104:
.LBI3104:
	.loc 18 217 7 is_stmt 1 view .LVU2592
.LBB3105:
	.loc 18 219 17 is_stmt 0 discriminator 1 view .LVU2593
	movl	$-1, -528(%rbx)
	leaq	-528(%rbx), %rax
	shrq	$3, %rax
	movb	$-8, 2147450880(%rax)
.LVL1841:
	.loc 18 219 17 discriminator 1 view .LVU2594
.LBE3105:
.LBE3104:
	.loc 18 207 14 discriminator 1 view .LVU2595
	cmpl	$-1, %r13d
	je	.L2146
.LVL1842:
.L1786:
	.loc 18 207 14 discriminator 1 view .LVU2596
.LBE3106:
.LBE3107:
	.loc 18 152 11 discriminator 1 view .LVU2597
	leaq	-560(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L1840
	cmpb	$3, %al
	jle	.L2147
.L1840:
	movl	%r13d, -560(%rbx)
.LVL1843:
.LBB3108:
.LBI3108:
	.loc 16 451 7 is_stmt 1 view .LVU2598
.LBB3109:
	.loc 16 452 9 view .LVU2599
	.loc 16 452 42 is_stmt 0 view .LVU2600
	movl	%r13d, %edx
.LVL1844:
	.loc 16 452 42 view .LVU2601
.LBE3109:
.LBE3108:
	leaq	-560(%rbx), %rax
	shrq	$3, %rax
	movb	$-8, 2147450880(%rax)
.LVL1845:
	.loc 16 452 42 view .LVU2602
.LBE3111:
.LBE3199:
	.loc 7 1673 21 discriminator 2 view .LVU2603
	leaq	-576(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L1841
	jle	.L2148
.L1841:
	movb	%dl, -576(%rbx)
.LVL1846:
.LBB3200:
.LBI3112:
	.loc 15 111 7 is_stmt 1 view .LVU2604
.LBB3158:
	.loc 15 114 20 is_stmt 0 view .LVU2605
	testq	%r15, %r15
	je	.L1842
	testb	$7, %r15b
	jne	.L1842
.L1843:
	.loc 15 114 20 view .LVU2606
	leaq	8(%r15), %r12
	cmpq	$-8, %r15
	jnb	.L2149
.L1844:
	movq	%r12, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2150
	movq	8(%r15), %r14
	.loc 15 114 47 view .LVU2607
	testq	%r15, %r15
	je	.L1846
	testb	$7, %r15b
	jne	.L1846
.L1847:
	leaq	16(%r15), %rdx
	cmpq	$-16, %r15
	jnb	.L2151
.L1848:
	leaq	16(%r15), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2152
	.loc 15 114 2 view .LVU2608
	cmpq	16(%r15), %r14
	je	.L1850
	.loc 15 117 30 view .LVU2609
	testq	%r15, %r15
	je	.L1851
	testb	$7, %r15b
	jne	.L1851
.L1852:
	.loc 15 117 37 view .LVU2610
	testq	%r15, %r15
	je	.L1853
	testb	$7, %r15b
	jne	.L1853
.L1854:
	.loc 15 117 30 view .LVU2611
	testq	%r15, %r15
	je	.L2153
.L1855:
.LVL1847:
.LBB3156:
.LBI3114:
	.loc 9 533 2 is_stmt 1 view .LVU2612
.LBB3118:
.LBI3115:
	.loc 21 94 5 view .LVU2613
.LBB3117:
	.loc 21 97 14 is_stmt 0 discriminator 1 view .LVU2614
	testq	%r14, %r14
	je	.L2154
.L1856:
	.loc 21 97 14 discriminator 1 view .LVU2615
	movq	%r14, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	movq	%r14, %rdx
	andl	$7, %edx
	cmpb	%dl, %al
	jg	.L1857
	testb	%al, %al
	jne	.L2155
.L1857:
	movb	%r13b, (%r14)
.LVL1848:
	.loc 21 97 14 discriminator 1 view .LVU2616
.LBE3117:
.LBE3118:
.LBE3156:
	.loc 15 119 22 view .LVU2617
	testq	%r15, %r15
	je	.L1858
	testb	$7, %r15b
	jne	.L1858
.L1859:
	movq	8(%r15), %r13
	.loc 15 119 6 view .LVU2618
	leaq	1(%r13), %rdx
	cmpq	$-1, %r13
	jnb	.L2156
.L1860:
	addq	$1, %r13
	testq	%r15, %r15
	je	.L1861
	testb	$7, %r15b
	jne	.L1861
.L1862:
	movq	%r13, 8(%r15)
.L1863:
	.loc 15 125 13 view .LVU2619
	testq	%r15, %r15
	je	.L1876
	testb	$7, %r15b
	jne	.L1876
.L1877:
.LVL1849:
.LBB3157:
.LBI3129:
	.loc 7 1233 7 is_stmt 1 view .LVU2620
.LBB3155:
	.loc 7 1236 9 is_stmt 0 view .LVU2621
	leaq	-192(%rbx), %rax
	shrq	$3, %rax
	movb	$0, 2147450880(%rax)
	.loc 7 1236 17 discriminator 1 view .LVU2622
	leaq	-224(%rbx), %rax
	shrq	$3, %rax
	movb	$0, 2147450880(%rax)
	.loc 7 1236 14 discriminator 2 view .LVU2623
	testq	%r15, %r15
	je	.L1878
	testb	$7, %r15b
	jne	.L1878
.L1879:
.LVL1850:
.LBB3152:
.LBI3131:
	.loc 7 893 7 is_stmt 1 view .LVU2624
.LBB3139:
	.loc 7 894 16 is_stmt 0 view .LVU2625
	leaq	-256(%rbx), %rax
	shrq	$3, %rax
	movb	$0, 2147450880(%rax)
	.loc 7 894 39 discriminator 1 view .LVU2626
	testq	%r15, %r15
	je	.L1880
	testb	$7, %r15b
	jne	.L1880
.L1881:
	.loc 7 894 39 discriminator 1 view .LVU2627
	testq	%r12, %r12
	je	.L1882
	testb	$7, %r12b
	jne	.L1882
.L1883:
.LVL1851:
.LBB3138:
.LBI3133:
	.loc 12 1076 7 is_stmt 1 view .LVU2628
.LBB3137:
.LBB3136:
	.loc 12 1077 9 is_stmt 0 view .LVU2629
	testq	%r12, %r12
	je	.L1884
	testb	$7, %r12b
	jne	.L1884
.L1885:
	.loc 12 1077 9 view .LVU2630
	leaq	8(%r15), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2157
	movq	8(%r15), %rdx
	leaq	-256(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2158
	movq	%rdx, -256(%rbx)
.LVL1852:
	.loc 12 1077 9 view .LVU2631
.LBE3136:
.LBE3137:
.LBE3138:
	.loc 7 894 16 discriminator 1 view .LVU2632
	leaq	-256(%rbx), %rax
	shrq	$3, %rax
	movb	$-8, 2147450880(%rax)
.LVL1853:
	.loc 7 894 16 discriminator 1 view .LVU2633
.LBE3139:
.LBE3152:
	.loc 7 1236 14 discriminator 3 view .LVU2634
	leaq	-224(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2159
	movq	%rdx, -224(%rbx)
.LVL1854:
.LBB3153:
.LBI3140:
	.loc 12 1157 7 is_stmt 1 view .LVU2635
.LBB3148:
	.loc 12 1158 16 is_stmt 0 view .LVU2636
	leaq	-128(%rbx), %rax
	shrq	$3, %rax
	movb	$0, 2147450880(%rax)
	.loc 12 1158 45 discriminator 1 view .LVU2637
	leaq	-160(%rbx), %rax
	shrq	$3, %rax
	movb	$0, 2147450880(%rax)
	.loc 12 1158 34 discriminator 2 view .LVU2638
	movq	-224(%rbx), %r12
	.loc 12 1158 45 discriminator 2 view .LVU2639
	leaq	-1(%r12), %rdx
	testq	%r12, %r12
	je	.L2160
.LVL1855:
.L1889:
	.loc 12 1158 45 discriminator 2 view .LVU2640
	subq	$1, %r12
	leaq	-160(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2161
	movq	%r12, -160(%rbx)
.LVL1856:
.LBB3147:
.LBI3142:
	.loc 12 1076 7 is_stmt 1 view .LVU2641
.LBB3146:
.LBB3145:
	.loc 12 1077 9 is_stmt 0 view .LVU2642
	leaq	-128(%rbx), %rdi
.LVL1857:
	.loc 12 1077 9 view .LVU2643
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2162
	movq	%r12, -128(%rbx)
.LVL1858:
	.loc 12 1077 9 view .LVU2644
.LBE3145:
.LBE3146:
.LBE3147:
	.loc 12 1158 45 discriminator 1 view .LVU2645
	leaq	-160(%rbx), %rax
	shrq	$3, %rax
	movb	$-8, 2147450880(%rax)
	.loc 12 1158 16 discriminator 2 view .LVU2646
	leaq	-128(%rbx), %rax
	shrq	$3, %rax
	movb	$-8, 2147450880(%rax)
.LVL1859:
	.loc 12 1158 16 discriminator 2 view .LVU2647
.LBE3148:
.LBE3153:
	.loc 7 1236 17 discriminator 5 view .LVU2648
	leaq	-192(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2163
	movq	%r12, -192(%rbx)
.LVL1860:
.LBB3154:
.LBI3149:
	.loc 12 1099 7 is_stmt 1 view .LVU2649
.LBB3151:
	.loc 12 1100 17 is_stmt 0 view .LVU2650
	testq	%r12, %r12
	je	.L2164
.LVL1861:
.L1893:
	.loc 12 1100 17 view .LVU2651
.LBE3151:
.LBE3154:
	.loc 7 1236 20 discriminator 8 view .LVU2652
	testq	%r12, %r12
	je	.L2165
.L1894:
	.loc 7 1236 14 discriminator 1 view .LVU2653
	leaq	-224(%rbx), %rax
	shrq	$3, %rax
	movb	$-8, 2147450880(%rax)
	.loc 7 1236 17 discriminator 2 view .LVU2654
	leaq	-192(%rbx), %rax
	shrq	$3, %rax
	movb	$-8, 2147450880(%rax)
.LVL1862:
	.loc 7 1236 17 discriminator 2 view .LVU2655
.LBE3155:
.LBE3157:
.LBE3158:
.LBE3200:
	.loc 7 1673 21 discriminator 4 view .LVU2656
	leaq	-576(%rbx), %rax
	shrq	$3, %rax
	movb	$-8, 2147450880(%rax)
	.loc 7 1671 6 is_stmt 1 view .LVU2657
.LVL1863:
.LBB3201:
.LBI3159:
	.loc 18 166 7 view .LVU2658
.LBB3188:
	.loc 18 173 2 is_stmt 0 view .LVU2659
	leaq	-96(%rbx), %rdi
.LVL1864:
	.loc 18 173 2 view .LVU2660
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2166
	movq	-96(%rbx), %r12
	.loc 18 173 17 view .LVU2661
	testq	%r12, %r12
	je	.L1896
	testb	$7, %r12b
	jne	.L1896
.LVL1865:
.L1897:
	.loc 18 173 17 discriminator 1 view .LVU2662
	testq	%r12, %r12
	je	.L1898
	testb	$7, %r12b
	jne	.L1898
.L1899:
	movq	%r12, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2167
	movq	(%r12), %r14
	movabsq	$-2748838011557800672, %rax
	xorq	%r14, %rax
	movabsq	$-7070675565921424023, %rcx
	imulq	%rcx, %rax
	movq	%rax, %rdx
	salq	$47, %rdx
	xorq	%r14, %rax
	xorq	%rdx, %rax
	imulq	%rcx, %rax
	movq	%rax, %rdx
	salq	$47, %rdx
	xorq	%rax, %rdx
	imulq	%rcx, %rdx
	movq	%rdx, %rcx
	andl	$127, %ecx
	leaq	__ubsan_vptr_type_cache(%rip), %rax
	cmpq	%rdx, (%rax,%rcx,8)
	jne	.L2168
.L1901:
.LVL1866:
.LBB3186:
.LBI3161:
	.loc 22 323 7 is_stmt 1 view .LVU2663
.LBB3184:
	.loc 22 326 33 is_stmt 0 view .LVU2664
	testq	%r12, %r12
	je	.L1902
	testb	$7, %r12b
	jne	.L1902
.L1903:
	.loc 22 326 33 discriminator 1 view .LVU2665
	testq	%r12, %r12
	je	.L1904
	testb	$7, %r12b
	jne	.L1904
.L1905:
.LVL1867:
.LBB3178:
.LBI3163:
	.loc 22 492 7 is_stmt 1 view .LVU2666
.LBB3165:
	.loc 22 492 30 is_stmt 0 view .LVU2667
	testq	%r12, %r12
	je	.L1906
	testb	$7, %r12b
	jne	.L1906
.L1907:
	.loc 22 492 30 discriminator 1 view .LVU2668
	testq	%r12, %r12
	je	.L1908
	testb	$7, %r12b
	jne	.L1908
.L1909:
	leaq	16(%r12), %rdx
	cmpq	$-16, %r12
	jnb	.L2169
.L1910:
	leaq	16(%r12), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2170
	movq	16(%r12), %r13
.LVL1868:
	.loc 22 492 30 discriminator 1 view .LVU2669
.LBE3165:
.LBE3178:
	.loc 22 326 49 discriminator 3 view .LVU2670
	testq	%r12, %r12
	je	.L1912
	testb	$7, %r12b
	jne	.L1912
.L1913:
	.loc 22 326 49 discriminator 4 view .LVU2671
	testq	%r12, %r12
	je	.L1914
	testb	$7, %r12b
	jne	.L1914
.L1915:
.LVL1869:
.LBB3179:
.LBI3166:
	.loc 22 495 7 is_stmt 1 view .LVU2672
.LBB3168:
	.loc 22 495 30 is_stmt 0 view .LVU2673
	testq	%r12, %r12
	je	.L1916
	testb	$7, %r12b
	jne	.L1916
.L1917:
	.loc 22 495 30 discriminator 1 view .LVU2674
	testq	%r12, %r12
	je	.L1918
	testb	$7, %r12b
	jne	.L1918
.L1919:
	leaq	24(%r12), %rdx
	cmpq	$-24, %r12
	jnb	.L2171
.L1920:
	leaq	24(%r12), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2172
.LVL1870:
	.loc 22 495 30 discriminator 1 view .LVU2675
.LBE3168:
.LBE3179:
	.loc 22 326 2 discriminator 7 view .LVU2676
	cmpq	24(%r12), %r13
	jnb	.L2173
	.loc 22 328 50 view .LVU2677
	testq	%r12, %r12
	je	.L1926
	testb	$7, %r12b
	jne	.L1926
.L1927:
	.loc 22 328 50 discriminator 1 view .LVU2678
	testq	%r12, %r12
	je	.L1928
	testb	$7, %r12b
	jne	.L1928
.L1929:
.LVL1871:
.LBB3180:
.LBI3169:
	.loc 22 492 7 is_stmt 1 view .LVU2679
.LBB3171:
	.loc 22 492 30 is_stmt 0 view .LVU2680
	testq	%r12, %r12
	je	.L1930
	testb	$7, %r12b
	jne	.L1930
.L1931:
	.loc 22 492 30 discriminator 1 view .LVU2681
	testq	%r12, %r12
	je	.L1932
	testb	$7, %r12b
	jne	.L1932
.L1933:
.LVL1872:
	.loc 22 492 30 discriminator 1 view .LVU2682
.LBE3171:
.LBE3180:
	.loc 22 328 50 discriminator 3 view .LVU2683
	testq	%r13, %r13
	je	.L2174
.L1934:
.LVL1873:
.LBB3181:
.LBI3172:
	.loc 16 457 7 is_stmt 1 view .LVU2684
.LBB3174:
	.loc 16 458 9 view .LVU2685
	.loc 16 458 65 is_stmt 0 view .LVU2686
	testq	%r13, %r13
	je	.L2175
.L1935:
.LVL1874:
	.loc 16 458 65 view .LVU2687
.LBE3174:
.LBE3181:
	.loc 22 329 17 view .LVU2688
	testq	%r12, %r12
	je	.L1936
	testb	$7, %r12b
	jne	.L1936
.LVL1875:
.L1937:
	.loc 22 329 17 discriminator 1 view .LVU2689
	testq	%r12, %r12
	je	.L1938
	testb	$7, %r12b
	jne	.L1938
.L1939:
.LVL1876:
.LBB3182:
.LBI3175:
	.loc 22 505 7 is_stmt 1 view .LVU2690
.LBB3177:
	.loc 22 505 24 is_stmt 0 view .LVU2691
	testq	%r12, %r12
	je	.L1940
	testb	$7, %r12b
	jne	.L1940
.L1941:
	.loc 22 505 24 discriminator 1 view .LVU2692
	testq	%r12, %r12
	je	.L1942
	testb	$7, %r12b
	jne	.L1942
.L1943:
	.loc 22 505 34 discriminator 2 view .LVU2693
	leaq	1(%r13), %rdx
	cmpq	$-1, %r13
	jnb	.L2176
.L1944:
	addq	$1, %r13
	testq	%r12, %r12
	je	.L1945
	testb	$7, %r12b
	jne	.L1945
.L1946:
	movq	%r13, 16(%r12)
.LVL1877:
.L1947:
	.loc 22 505 34 discriminator 2 view .LVU2694
.LBE3177:
.LBE3182:
.LBE3184:
.LBE3186:
	.loc 18 174 7 view .LVU2695
	movq	-664(%rbp), %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L1956
	cmpb	$3, %al
	jle	.L2177
.L1956:
	movl	$-1, -88(%rbx)
.LVL1878:
.L1782:
	.loc 18 174 7 view .LVU2696
.LBE3188:
.LBE3201:
	.loc 7 1671 21 is_stmt 1 discriminator 1 view .LVU2697
.LBB3202:
.LBI2995:
	.loc 18 234 5 view .LVU2698
.LBB3075:
.LBI2996:
	.loc 18 199 7 view .LVU2699
.LBB3072:
.LBI2997:
	.loc 18 213 7 view .LVU2700
.LBB3033:
.LBI2998:
	.loc 18 204 7 view .LVU2701
.LBB3027:
	.loc 18 206 11 is_stmt 0 view .LVU2702
	movq	-664(%rbp), %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L1957
	cmpb	$3, %al
	jle	.L2178
.L1957:
	movl	-88(%rbx), %r13d
.LVL1879:
	.loc 18 207 6 view .LVU2703
	leaq	-96(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2179
	movq	-96(%rbx), %r12
	.loc 18 207 34 view .LVU2704
	testq	%r12, %r12
	je	.L2103
	movq	-680(%rbp), %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	cmpb	%al, -681(%rbp)
	jl	.L1960
	testb	%al, %al
	jne	.L2180
.L1960:
	movl	%r13d, -352(%rbx)
.LVL1880:
.LBB3022:
.LBI3022:
	.loc 18 217 7 is_stmt 1 view .LVU2705
.LBB3023:
	.loc 18 219 17 is_stmt 0 discriminator 1 view .LVU2706
	movl	$-1, -480(%rbx)
	leaq	-480(%rbx), %rax
	shrq	$3, %rax
	movb	$-8, 2147450880(%rax)
.LVL1881:
	.loc 18 219 17 discriminator 1 view .LVU2707
.LBE3023:
.LBE3022:
	.loc 18 206 11 view .LVU2708
	movl	%r13d, %edx
	.loc 18 207 14 discriminator 1 view .LVU2709
	cmpl	$-1, %r13d
	jne	.L1959
.LVL1882:
	.loc 18 207 69 discriminator 3 view .LVU2710
	testq	%r12, %r12
	je	.L1962
	testb	$7, %r12b
	jne	.L1962
.LVL1883:
.L1963:
	.loc 18 207 69 discriminator 1 view .LVU2711
	testq	%r12, %r12
	je	.L1964
	testb	$7, %r12b
	jne	.L1964
.L1965:
	movq	%r12, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2181
	movq	(%r12), %rsi
	movq	%rsi, -672(%rbp)
	movabsq	$-2748838011557800672, %rax
	xorq	%rsi, %rax
	movabsq	$-7070675565921424023, %rcx
	imulq	%rcx, %rax
	movq	%rax, %rdx
	salq	$47, %rdx
	xorq	%rsi, %rax
	xorq	%rdx, %rax
	imulq	%rcx, %rax
	movq	%rax, %rdx
	salq	$47, %rdx
	xorq	%rax, %rdx
	imulq	%rcx, %rdx
	movq	%rdx, %rcx
	andl	$127, %ecx
	leaq	__ubsan_vptr_type_cache(%rip), %rax
	cmpq	%rdx, (%rax,%rcx,8)
	jne	.L2182
.L1967:
.LVL1884:
.LBB3024:
.LBI3000:
	.loc 22 345 7 is_stmt 1 view .LVU2712
.LBB3018:
	.loc 22 348 33 is_stmt 0 view .LVU2713
	testq	%r12, %r12
	je	.L1968
	testb	$7, %r12b
	jne	.L1968
.L1969:
	.loc 22 348 33 discriminator 1 view .LVU2714
	testq	%r12, %r12
	je	.L1970
	testb	$7, %r12b
	jne	.L1970
.L1971:
.LVL1885:
.LBB3014:
.LBI3002:
	.loc 22 492 7 is_stmt 1 view .LVU2715
.LBB3004:
	.loc 22 492 30 is_stmt 0 view .LVU2716
	testq	%r12, %r12
	je	.L1972
	testb	$7, %r12b
	jne	.L1972
.L1973:
	.loc 22 492 30 discriminator 1 view .LVU2717
	testq	%r12, %r12
	je	.L1974
	testb	$7, %r12b
	jne	.L1974
.L1975:
	leaq	16(%r12), %rdx
	cmpq	$-16, %r12
	jnb	.L2183
.L1976:
	leaq	16(%r12), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2184
	movq	16(%r12), %r14
.LVL1886:
	.loc 22 492 30 discriminator 1 view .LVU2718
.LBE3004:
.LBE3014:
	.loc 22 348 49 discriminator 3 view .LVU2719
	testq	%r12, %r12
	je	.L1978
	testb	$7, %r12b
	jne	.L1978
.L1979:
	.loc 22 348 49 discriminator 4 view .LVU2720
	testq	%r12, %r12
	je	.L1980
	testb	$7, %r12b
	jne	.L1980
.L1981:
.LVL1887:
.LBB3015:
.LBI3005:
	.loc 22 495 7 is_stmt 1 view .LVU2721
.LBB3007:
	.loc 22 495 30 is_stmt 0 view .LVU2722
	testq	%r12, %r12
	je	.L1982
	testb	$7, %r12b
	jne	.L1982
.L1983:
	.loc 22 495 30 discriminator 1 view .LVU2723
	testq	%r12, %r12
	je	.L1984
	testb	$7, %r12b
	jne	.L1984
.L1985:
	leaq	24(%r12), %rdx
	cmpq	$-24, %r12
	jnb	.L2185
.L1986:
	leaq	24(%r12), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2186
.LVL1888:
	.loc 22 495 30 discriminator 1 view .LVU2724
.LBE3007:
.LBE3015:
	.loc 22 348 2 discriminator 7 view .LVU2725
	cmpq	24(%r12), %r14
	jnb	.L1988
	.loc 22 349 48 view .LVU2726
	testq	%r12, %r12
	je	.L1989
	testb	$7, %r12b
	jne	.L1989
.L1990:
	.loc 22 349 48 discriminator 1 view .LVU2727
	testq	%r12, %r12
	je	.L1991
	testb	$7, %r12b
	jne	.L1991
.L1992:
.LVL1889:
.LBB3016:
.LBI3008:
	.loc 22 492 7 is_stmt 1 view .LVU2728
.LBB3010:
	.loc 22 492 30 is_stmt 0 view .LVU2729
	testq	%r12, %r12
	je	.L1993
	testb	$7, %r12b
	jne	.L1993
.L1994:
	.loc 22 492 30 discriminator 1 view .LVU2730
	testq	%r12, %r12
	je	.L1995
	testb	$7, %r12b
	jne	.L1995
.L1996:
.LVL1890:
	.loc 22 492 30 discriminator 1 view .LVU2731
.LBE3010:
.LBE3016:
	.loc 22 349 48 discriminator 3 view .LVU2732
	testq	%r14, %r14
	je	.L2187
.L1997:
.LVL1891:
.LBB3017:
.LBI3011:
	.loc 16 457 7 is_stmt 1 view .LVU2733
.LBB3013:
	.loc 16 458 9 view .LVU2734
	.loc 16 458 65 is_stmt 0 view .LVU2735
	testq	%r14, %r14
	je	.L2188
.L1998:
	.loc 16 458 65 view .LVU2736
	movq	%r14, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	movq	%r14, %rdx
	andl	$7, %edx
	cmpb	%dl, %al
	jg	.L1999
	testb	%al, %al
	jne	.L2189
.L1999:
	.loc 16 458 69 view .LVU2737
	movzbl	(%r14), %edx
.LVL1892:
	.loc 16 458 69 view .LVU2738
	leaq	-368(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %ecx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	jl	.L2000
	testb	%cl, %cl
	jne	.L2190
.L2000:
	movl	%edx, -368(%rbx)
.LVL1893:
	.loc 16 458 69 view .LVU2739
.LBE3013:
.LBE3017:
.LBE3018:
.LBE3024:
.LBB3025:
	.loc 18 217 7 is_stmt 1 view .LVU2740
.LBB3021:
	.loc 18 219 17 is_stmt 0 discriminator 1 view .LVU2741
	movl	$-1, -496(%rbx)
	leaq	-496(%rbx), %rax
	shrq	$3, %rax
	movb	$-8, 2147450880(%rax)
.LVL1894:
	.loc 18 219 17 discriminator 1 view .LVU2742
	jmp	.L1959
.LVL1895:
.L2137:
	.loc 18 219 17 discriminator 1 view .LVU2743
	call	__asan_report_store4@PLT
.LVL1896:
.L2138:
	.loc 18 219 17 discriminator 1 view .LVU2744
.LBE3021:
.LBE3025:
.LBE3027:
.LBE3033:
.LBE3072:
.LBB3073:
.LBB3071:
.LBB3064:
	.loc 18 206 11 view .LVU2745
	call	__asan_report_load4@PLT
.LVL1897:
.L2139:
	.loc 18 207 6 view .LVU2746
	call	__asan_report_load8@PLT
.LVL1898:
.L2140:
	.loc 18 207 6 view .LVU2747
	call	__asan_report_store4@PLT
.LVL1899:
.L2141:
	.loc 18 207 69 discriminator 3 view .LVU2748
	testq	%r12, %r12
	je	.L2020
	testb	$7, %r12b
	jne	.L2020
.LVL1900:
.L2021:
	.loc 18 207 69 discriminator 1 view .LVU2749
	testq	%r12, %r12
	je	.L2022
	testb	$7, %r12b
	jne	.L2022
.L2023:
	movq	%r12, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2191
	movq	(%r12), %rsi
	movq	%rsi, -704(%rbp)
	movabsq	$-2748838011557800672, %rax
	xorq	%rsi, %rax
	movabsq	$-7070675565921424023, %rcx
	imulq	%rcx, %rax
	movq	%rax, %rdx
	salq	$47, %rdx
	xorq	%rsi, %rax
	xorq	%rdx, %rax
	imulq	%rcx, %rax
	movq	%rax, %rdx
	salq	$47, %rdx
	xorq	%rax, %rdx
	imulq	%rcx, %rdx
	movq	%rdx, %rcx
	andl	$127, %ecx
	leaq	__ubsan_vptr_type_cache(%rip), %rax
	cmpq	%rdx, (%rax,%rcx,8)
	jne	.L2192
.L2025:
.LVL1901:
.LBB3040:
.LBI3040:
	.loc 22 345 7 is_stmt 1 view .LVU2750
.LBB3041:
	.loc 22 348 33 is_stmt 0 view .LVU2751
	testq	%r12, %r12
	je	.L2026
	testb	$7, %r12b
	jne	.L2026
.L2027:
	.loc 22 348 33 discriminator 1 view .LVU2752
	testq	%r12, %r12
	je	.L2028
	testb	$7, %r12b
	jne	.L2028
.L2029:
.LVL1902:
.LBB3042:
.LBI3042:
	.loc 22 492 7 is_stmt 1 view .LVU2753
.LBB3043:
	.loc 22 492 30 is_stmt 0 view .LVU2754
	testq	%r12, %r12
	je	.L2030
	testb	$7, %r12b
	jne	.L2030
.L2031:
	.loc 22 492 30 discriminator 1 view .LVU2755
	testq	%r12, %r12
	je	.L2032
	testb	$7, %r12b
	jne	.L2032
.L2033:
	leaq	16(%r12), %rdx
	cmpq	$-16, %r12
	jnb	.L2193
.L2034:
	leaq	16(%r12), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2194
	movq	16(%r12), %rax
	movq	%rax, -672(%rbp)
.LVL1903:
	.loc 22 492 30 discriminator 1 view .LVU2756
.LBE3043:
.LBE3042:
	.loc 22 348 49 discriminator 3 view .LVU2757
	testq	%r12, %r12
	je	.L2036
	testb	$7, %r12b
	jne	.L2036
.L2037:
	.loc 22 348 49 discriminator 4 view .LVU2758
	testq	%r12, %r12
	je	.L2038
	testb	$7, %r12b
	jne	.L2038
.L2039:
.LVL1904:
.LBB3045:
.LBI3045:
	.loc 22 495 7 is_stmt 1 view .LVU2759
.LBB3046:
	.loc 22 495 30 is_stmt 0 view .LVU2760
	testq	%r12, %r12
	je	.L2040
	testb	$7, %r12b
	jne	.L2040
.L2041:
	.loc 22 495 30 discriminator 1 view .LVU2761
	testq	%r12, %r12
	je	.L2042
	testb	$7, %r12b
	jne	.L2042
.L2043:
	leaq	24(%r12), %rdx
	cmpq	$-24, %r12
	jnb	.L2195
.L2044:
	leaq	24(%r12), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2196
.LVL1905:
	.loc 22 495 30 discriminator 1 view .LVU2762
.LBE3046:
.LBE3045:
	.loc 22 348 2 discriminator 7 view .LVU2763
	movq	-672(%rbp), %rax
	cmpq	24(%r12), %rax
	jnb	.L2046
	.loc 22 349 48 view .LVU2764
	testq	%r12, %r12
	je	.L2047
	testb	$7, %r12b
	jne	.L2047
.L2048:
	.loc 22 349 48 discriminator 1 view .LVU2765
	testq	%r12, %r12
	je	.L2049
	testb	$7, %r12b
	jne	.L2049
.L2050:
.LVL1906:
.LBB3048:
.LBI3048:
	.loc 22 492 7 is_stmt 1 view .LVU2766
.LBB3049:
	.loc 22 492 30 is_stmt 0 view .LVU2767
	testq	%r12, %r12
	je	.L2051
	testb	$7, %r12b
	jne	.L2051
.L2052:
	.loc 22 492 30 discriminator 1 view .LVU2768
	testq	%r12, %r12
	je	.L2053
	testb	$7, %r12b
	jne	.L2053
.L2054:
.LVL1907:
	.loc 22 492 30 discriminator 1 view .LVU2769
.LBE3049:
.LBE3048:
	.loc 22 349 48 discriminator 3 view .LVU2770
	cmpq	$0, -672(%rbp)
	je	.L2197
.L2055:
.LVL1908:
.LBB3051:
.LBI3051:
	.loc 16 457 7 is_stmt 1 view .LVU2771
.LBB3052:
	.loc 16 458 9 view .LVU2772
	.loc 16 458 65 is_stmt 0 view .LVU2773
	cmpq	$0, -672(%rbp)
	je	.L2198
.L2056:
	movq	-672(%rbp), %rsi
	movq	%rsi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	andl	$7, %esi
	cmpb	%sil, %al
	jg	.L2057
	testb	%al, %al
	jne	.L2199
.L2057:
	.loc 16 458 69 view .LVU2774
	movq	-672(%rbp), %rax
	movzbl	(%rax), %eax
.LVL1909:
	.loc 16 458 69 view .LVU2775
	leaq	-320(%rbx), %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %ecx
	movq	%rdi, %rdx
	andl	$7, %edx
	addl	$3, %edx
	cmpb	%cl, %dl
	jl	.L2058
	testb	%cl, %cl
	jne	.L2200
.L2058:
	movl	%eax, -320(%rbx)
.LVL1910:
	.loc 16 458 69 view .LVU2776
.LBE3052:
.LBE3051:
.LBE3041:
.LBE3040:
.LBB3059:
.LBI3059:
	.loc 18 217 7 is_stmt 1 view .LVU2777
.LBB3060:
	.loc 18 219 17 is_stmt 0 discriminator 1 view .LVU2778
	movl	$-1, -448(%rbx)
	leaq	-448(%rbx), %rdx
	shrq	$3, %rdx
	movb	$-8, 2147450880(%rdx)
.LVL1911:
	.loc 18 219 17 discriminator 1 view .LVU2779
	jmp	.L2017
.L2020:
	.loc 18 219 17 discriminator 1 view .LVU2780
.LBE3060:
.LBE3059:
	.loc 18 207 69 discriminator 3 view .LVU2781
	movq	%r12, %rsi
	leaq	.Lubsan_data1619(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1912:
	.loc 18 207 69 discriminator 3 view .LVU2782
	jmp	.L2021
.L2022:
	.loc 18 207 69 discriminator 1 view .LVU2783
	movq	%r12, %rsi
	leaq	.Lubsan_data1620(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1913:
	jmp	.L2023
.L2191:
	movq	%r12, %rdi
	call	__asan_report_load8@PLT
.LVL1914:
.L2192:
	movq	%r12, %rsi
	leaq	.Lubsan_data1621(%rip), %rdi
	call	__ubsan_handle_dynamic_type_cache_miss@PLT
.LVL1915:
	jmp	.L2025
.LVL1916:
.L2026:
.LBB3062:
.LBB3058:
	.loc 22 348 33 view .LVU2784
	movq	%r12, %rsi
	leaq	.Lubsan_data1622(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1917:
	jmp	.L2027
.L2028:
	.loc 22 348 33 discriminator 1 view .LVU2785
	movq	%r12, %rsi
	leaq	.Lubsan_data1623(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1918:
	jmp	.L2029
.LVL1919:
.L2030:
.LBB3054:
.LBB3044:
	.loc 22 492 30 view .LVU2786
	movq	%r12, %rsi
	leaq	.Lubsan_data1624(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1920:
	jmp	.L2031
.L2032:
	.loc 22 492 30 discriminator 1 view .LVU2787
	movq	%r12, %rsi
	leaq	.Lubsan_data1625(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1921:
	jmp	.L2033
.L2193:
	.loc 22 492 30 discriminator 1 view .LVU2788
	movq	%r12, %rsi
	leaq	.Lubsan_data1626(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL1922:
	jmp	.L2034
.L2194:
	.loc 22 492 30 discriminator 1 view .LVU2789
	call	__asan_report_load8@PLT
.LVL1923:
.L2036:
	.loc 22 492 30 discriminator 1 view .LVU2790
.LBE3044:
.LBE3054:
	.loc 22 348 49 discriminator 3 view .LVU2791
	movq	%r12, %rsi
	leaq	.Lubsan_data1627(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1924:
	jmp	.L2037
.L2038:
	.loc 22 348 49 discriminator 4 view .LVU2792
	movq	%r12, %rsi
	leaq	.Lubsan_data1628(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1925:
	jmp	.L2039
.LVL1926:
.L2040:
.LBB3055:
.LBB3047:
	.loc 22 495 30 view .LVU2793
	movq	%r12, %rsi
	leaq	.Lubsan_data1629(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1927:
	jmp	.L2041
.L2042:
	.loc 22 495 30 discriminator 1 view .LVU2794
	movq	%r12, %rsi
	leaq	.Lubsan_data1630(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1928:
	jmp	.L2043
.L2195:
	.loc 22 495 30 discriminator 1 view .LVU2795
	movq	%r12, %rsi
	leaq	.Lubsan_data1631(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL1929:
	jmp	.L2044
.L2196:
	.loc 22 495 30 discriminator 1 view .LVU2796
	call	__asan_report_load8@PLT
.LVL1930:
.L2047:
	.loc 22 495 30 discriminator 1 view .LVU2797
.LBE3047:
.LBE3055:
	.loc 22 349 48 view .LVU2798
	movq	%r12, %rsi
	leaq	.Lubsan_data1632(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1931:
	jmp	.L2048
.L2049:
	.loc 22 349 48 discriminator 1 view .LVU2799
	movq	%r12, %rsi
	leaq	.Lubsan_data1633(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1932:
	jmp	.L2050
.LVL1933:
.L2051:
.LBB3056:
.LBB3050:
	.loc 22 492 30 view .LVU2800
	movq	%r12, %rsi
	leaq	.Lubsan_data1634(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1934:
	jmp	.L2052
.L2053:
	.loc 22 492 30 discriminator 1 view .LVU2801
	movq	%r12, %rsi
	leaq	.Lubsan_data1635(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1935:
	jmp	.L2054
.LVL1936:
.L2197:
	.loc 22 492 30 discriminator 1 view .LVU2802
.LBE3050:
.LBE3056:
	.loc 22 349 48 discriminator 3 view .LVU2803
	movl	$0, %esi
	leaq	.Lubsan_data1636(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1937:
	jmp	.L2055
.LVL1938:
.L2198:
.LBB3057:
.LBB3053:
	.loc 16 458 65 view .LVU2804
	movl	$0, %esi
	leaq	.Lubsan_data1637(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1939:
	jmp	.L2056
.L2199:
	movq	-672(%rbp), %rdi
	call	__asan_report_load1@PLT
.LVL1940:
.L2200:
	.loc 16 458 65 view .LVU2805
	call	__asan_report_store4@PLT
.LVL1941:
.L2046:
	.loc 16 458 65 view .LVU2806
.LBE3053:
.LBE3057:
	.loc 22 351 27 view .LVU2807
	testq	%r12, %r12
	je	.L2060
	testb	$7, %r12b
	jne	.L2060
.L2061:
	.loc 22 351 27 discriminator 1 view .LVU2808
	testq	%r12, %r12
	je	.L2062
	testb	$7, %r12b
	jne	.L2062
.L2063:
	movq	-704(%rbp), %rax
	leaq	72(%rax), %rdx
	cmpq	$-72, %rax
	jnb	.L2201
.L2064:
	movq	-704(%rbp), %rsi
	addq	$72, %rsi
	je	.L2065
	testb	$7, %sil
	jne	.L2065
.L2066:
	movq	-704(%rbp), %rax
	leaq	72(%rax), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2202
	.loc 22 351 27 discriminator 2 view .LVU2809
	movq	%r12, %rdi
	movq	-704(%rbp), %rax
	call	*72(%rax)
.LVL1942:
.LEHE34:
	jmp	.L2203
.L2060:
	.loc 22 351 27 view .LVU2810
	movq	%r12, %rsi
	leaq	.Lubsan_data1640(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1943:
	jmp	.L2061
.L2062:
	.loc 22 351 27 discriminator 1 view .LVU2811
	movq	%r12, %rsi
	leaq	.Lubsan_data1641(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1944:
	jmp	.L2063
.L2201:
	.loc 22 351 27 discriminator 1 view .LVU2812
	movq	%rax, %rsi
	leaq	.Lubsan_data1642(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL1945:
	jmp	.L2064
.L2065:
	leaq	.Lubsan_data1643(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1946:
	jmp	.L2066
.L2202:
	call	__asan_report_load8@PLT
.LVL1947:
.L2203:
	.loc 22 351 27 discriminator 1 view .LVU2813
	leaq	-320(%rbx), %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %edx
	movq	%rdi, %rcx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	jl	.L2068
	testb	%dl, %dl
	jne	.L2204
.L2068:
	movl	%eax, -320(%rbx)
.LVL1948:
	.loc 22 351 27 discriminator 1 view .LVU2814
.LBE3058:
.LBE3062:
.LBB3063:
	.loc 18 217 7 is_stmt 1 view .LVU2815
.LBB3061:
	.loc 18 219 17 is_stmt 0 discriminator 1 view .LVU2816
	movl	$-1, -448(%rbx)
	leaq	-448(%rbx), %rdx
	shrq	$3, %rdx
	movb	$-8, 2147450880(%rdx)
.LVL1949:
	.loc 18 219 17 discriminator 1 view .LVU2817
.LBE3061:
.LBE3063:
	.loc 18 207 34 discriminator 4 view .LVU2818
	cmpl	$-1, %eax
	jne	.L2017
.LVL1950:
	.loc 18 208 12 view .LVU2819
	leaq	-64(%rbx), %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L2205
	movq	$0, -64(%rbx)
	jmp	.L2017
.LVL1951:
.L2204:
	.loc 18 208 12 view .LVU2820
	call	__asan_report_store4@PLT
.LVL1952:
.L2205:
	.loc 18 208 12 view .LVU2821
	call	__asan_report_store8@PLT
.LVL1953:
.L2142:
	.loc 18 208 12 view .LVU2822
	call	__asan_report_store4@PLT
.LVL1954:
.L2105:
	.loc 18 208 12 view .LVU2823
	endbr64
.LBE3064:
.LBE3071:
.LBE3073:
.LBE3075:
.LBE3202:
	.loc 7 1673 21 discriminator 3 view .LVU2824
	movq	%rax, %rdi
	jmp	.L1925
.LVL1955:
.L2106:
	.loc 7 1673 21 discriminator 3 view .LVU2825
	endbr64
	.loc 7 1677 6 discriminator 1 view .LVU2826
	movq	%rax, %rdi
	jmp	.L2074
.LVL1956:
.L2081:
.LBB3203:
.LBB3196:
	.loc 7 1606 24 discriminator 1 view .LVU2827
	movq	(%r15), %rbx
.LVL1957:
.LBB3192:
.LBI3192:
	.loc 7 1933 7 is_stmt 1 view .LVU2828
.LBB3193:
	.loc 7 1935 36 is_stmt 0 view .LVU2829
	testq	%r15, %r15
	je	.L2082
	testb	$7, %r15b
	je	.L2083
.L2082:
	.loc 7 1935 36 view .LVU2830
	movq	%r15, %rsi
	leaq	.Lubsan_data1652(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1958:
.L2083:
	.loc 7 1935 36 view .LVU2831
	leaq	8(%r15), %rdx
	cmpq	$-8, %r15
	jb	.L2084
	movq	%r15, %rsi
	leaq	.Lubsan_data1653(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL1959:
.L2084:
	leaq	8(%r15), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	je	.L2085
	call	__asan_report_load8@PLT
.LVL1960:
.L2085:
	.loc 7 1935 2 view .LVU2832
	cmpq	8(%r15), %rbx
	je	.L2086
	.loc 7 1938 25 view .LVU2833
	testq	%r15, %r15
	je	.L2087
	testb	$7, %r15b
	je	.L2088
.L2087:
	movq	%r15, %rsi
	leaq	.Lubsan_data1654(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1961:
.L2088:
	.loc 7 1938 25 view .LVU2834
	testq	%r15, %r15
	je	.L2089
	testb	$7, %r15b
	je	.L2090
.L2089:
	movq	%r15, %rsi
	leaq	.Lubsan_data1655(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1962:
.L2090:
.LBB3194:
.LBI3194:
	.loc 7 301 7 is_stmt 1 view .LVU2835
.LBB3195:
	.loc 7 302 22 is_stmt 0 view .LVU2836
	testq	%r15, %r15
	je	.L2091
	testb	$7, %r15b
	je	.L2092
.L2091:
	.loc 7 302 22 view .LVU2837
	movq	%r15, %rsi
	leaq	.Lubsan_data1656(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1963:
.L2092:
	.loc 7 302 22 view .LVU2838
	testq	%r15, %r15
	jne	.L2093
	movl	$0, %esi
	leaq	.Lubsan_data1657(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1964:
.L2093:
	.loc 7 302 22 view .LVU2839
.LBE3195:
.LBE3194:
	.loc 7 1937 19 view .LVU2840
	testq	%r15, %r15
	jne	.L2094
	movl	$0, %esi
	leaq	.Lubsan_data1658(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1965:
.L2094:
	.loc 7 1937 19 discriminator 1 view .LVU2841
	testq	%r15, %r15
	je	.L2095
	testb	$7, %r15b
	je	.L2096
.L2095:
	movq	%r15, %rsi
	leaq	.Lubsan_data1659(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1966:
.L2096:
	.loc 7 1939 30 view .LVU2842
	testq	%r15, %r15
	je	.L2097
	testb	$7, %r15b
	je	.L2098
.L2097:
	movq	%r15, %rsi
	leaq	.Lubsan_data1660(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL1967:
.L2098:
	.loc 7 1939 30 view .LVU2843
	movq	%rbx, 8(%r15)
.L2086:
.LVL1968:
	.loc 7 1939 30 view .LVU2844
.LBE3193:
.LBE3192:
.LBE3196:
.LBE3203:
	.loc 7 1679 6 view .LVU2845
	call	__asan_handle_no_return@PLT
.LVL1969:
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	je	.L2099
	call	__stack_chk_fail@PLT
.LVL1970:
.L2099:
.LEHB35:
	call	__cxa_rethrow@PLT
.LVL1971:
.LEHE35:
.L2107:
	endbr64
	.loc 7 1677 6 view .LVU2846
	movq	%rax, %rbx
	call	__cxa_end_catch@PLT
.LVL1972:
	call	__asan_handle_no_return@PLT
.LVL1973:
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	je	.L2101
	call	__stack_chk_fail@PLT
.LVL1974:
.L2101:
	movq	%rbx, %rdi
.LEHB36:
	call	_Unwind_Resume@PLT
.LVL1975:
.LEHE36:
.L2143:
	.loc 7 1667 2 view .LVU2847
	movq	-696(%rbp), %rsi
	cmpq	%rsi, -712(%rbp)
	jne	.L2206
	pxor	%xmm0, %xmm0
	movq	-720(%rbp), %rax
	movups	%xmm0, 2147450880(%rax)
	movups	%xmm0, 2147450896(%rax)
	movups	%xmm0, 2147450912(%rax)
	movups	%xmm0, 2147450928(%rax)
	movq	$0, 2147450944(%rax)
.L1780:
	.loc 7 1681 2 view .LVU2848
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L2207
	addq	$696, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
.LVL1976:
	.loc 7 1681 2 view .LVU2849
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.LVL1977:
.L2206:
	.cfi_restore_state
	.loc 7 1667 2 view .LVU2850
	movq	$1172321806, (%rsi)
	movdqa	.LC1(%rip), %xmm0
	movq	-720(%rbp), %rax
	movups	%xmm0, 2147450880(%rax)
	movups	%xmm0, 2147450896(%rax)
	movups	%xmm0, 2147450912(%rax)
	movups	%xmm0, 2147450928(%rax)
	movabsq	$-723401728380766731, %rcx
	movq	%rcx, 2147450944(%rax)
	movq	1016(%rsi), %rax
	movb	$0, (%rax)
	jmp	.L1780
.L2207:
	.loc 7 1681 2 view .LVU2851
	call	__stack_chk_fail@PLT
.LVL1978:
	.cfi_endproc
.LFE7144:
	.section	.gcc_except_table
	.align 4
.LLSDA7144:
	.byte	0xff
	.byte	0x9b
	.uleb128 .LLSDATT7144-.LLSDATTD7144
.LLSDATTD7144:
	.byte	0x1
	.uleb128 .LLSDACSE7144-.LLSDACSB7144
.LLSDACSB7144:
	.uleb128 .LEHB32-.LFB7144
	.uleb128 .LEHE32-.LEHB32
	.uleb128 .L2108-.LFB7144
	.uleb128 0x3
	.uleb128 .LEHB33-.LFB7144
	.uleb128 .LEHE33-.LEHB33
	.uleb128 .L2105-.LFB7144
	.uleb128 0x3
	.uleb128 .LEHB34-.LFB7144
	.uleb128 .LEHE34-.LEHB34
	.uleb128 .L2106-.LFB7144
	.uleb128 0x1
	.uleb128 .LEHB35-.LFB7144
	.uleb128 .LEHE35-.LEHB35
	.uleb128 .L2107-.LFB7144
	.uleb128 0
	.uleb128 .LEHB36-.LFB7144
	.uleb128 .LEHE36-.LEHB36
	.uleb128 0
	.uleb128 0
.LLSDACSE7144:
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0x7d
	.align 4
	.long	0

.LLSDATT7144:
	.section	.text._ZNSt6vectorIhSaIhEE19_M_range_initializeISt19istreambuf_iteratorIcSt11char_traitsIcEEEEvT_S7_St18input_iterator_tag,"axG",@progbits,_ZNSt6vectorIhSaIhEE19_M_range_initializeISt19istreambuf_iteratorIcSt11char_traitsIcEEEEvT_S7_St18input_iterator_tag,comdat
	.size	_ZNSt6vectorIhSaIhEE19_M_range_initializeISt19istreambuf_iteratorIcSt11char_traitsIcEEEEvT_S7_St18input_iterator_tag, .-_ZNSt6vectorIhSaIhEE19_M_range_initializeISt19istreambuf_iteratorIcSt11char_traitsIcEEEEvT_S7_St18input_iterator_tag
	.section	.rodata._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEmmPKcm.str1.1,"aMS",@progbits,1
.LC19:
	.string	"1 32 8 18 __new_capacity:331"
	.section	.rodata
	.align 32
.LC20:
	.string	"basic_string::_M_create"
	.zero	40
	.section	.text._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEmmPKcm,"axG",@progbits,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEmmPKcm,comdat
	.align 2
	.weak	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEmmPKcm
	.type	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEmmPKcm, @function
_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEmmPKcm:
.LASANPC7529:
.LVL1979:
.LFB7529:
	.loc 17 325 5 is_stmt 1 view -0
	.cfi_startproc
	.loc 17 325 5 is_stmt 0 view .LVU2853
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$184, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	movq	%rsi, -160(%rbp)
	movq	%rdx, %r13
	movq	%rcx, -184(%rbp)
	movq	%r8, -168(%rbp)
	leaq	-144(%rbp), %r12
	movq	%r12, -208(%rbp)
	cmpl	$0, __asan_option_detect_stack_use_after_return(%rip)
	jne	.L2397
.LVL1980:
.L2208:
	.loc 17 325 5 view .LVU2854
	leaq	96(%r12), %r15
	movq	$1102416563, (%r12)
.LVL1981:
	.loc 17 325 5 view .LVU2855
	leaq	.LC19(%rip), %rax
	movq	%rax, 8(%r12)
	leaq	.LASANPC7529(%rip), %rax
	movq	%rax, 16(%r12)
	movq	%r12, %rax
	shrq	$3, %rax
	movq	%rax, -200(%rbp)
	movl	$-235802127, 2147450880(%rax)
	movl	$-202116352, 2147450884(%rax)
	.loc 17 325 5 view .LVU2856
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	.loc 17 329 42 view .LVU2857
	testq	%rbx, %rbx
	je	.L2212
	testb	$7, %bl
	jne	.L2212
.L2213:
.LVL1982:
.LBB3288:
.LBI3288:
	.loc 2 1078 7 is_stmt 1 view .LVU2858
.LBB3289:
	.loc 2 1079 16 is_stmt 0 view .LVU2859
	testq	%rbx, %rbx
	je	.L2214
	testb	$7, %bl
	jne	.L2214
.L2215:
	.loc 2 1079 16 view .LVU2860
	leaq	8(%rbx), %rdx
	cmpq	$-8, %rbx
	jnb	.L2398
.L2216:
	leaq	8(%rbx), %rax
	movq	%rax, -224(%rbp)
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2399
.LVL1983:
	.loc 2 1079 16 view .LVU2861
	movq	-160(%rbp), %rax
	addq	%r13, %rax
	movq	%rax, -216(%rbp)
.LBE3289:
.LBE3288:
	.loc 17 329 23 discriminator 2 view .LVU2862
	movq	8(%rbx), %rcx
	subq	%rax, %rcx
	movq	%rcx, -192(%rbp)
.LVL1984:
	.loc 17 331 40 discriminator 1 view .LVU2863
	testq	%rbx, %rbx
	je	.L2218
	testb	$7, %bl
	jne	.L2218
.LVL1985:
.L2219:
.LBB3291:
.LBI3291:
	.loc 2 1078 7 is_stmt 1 view .LVU2864
.LBB3292:
	.loc 2 1079 16 is_stmt 0 view .LVU2865
	testq	%rbx, %rbx
	je	.L2220
	testb	$7, %bl
	jne	.L2220
.L2221:
	.loc 2 1079 16 view .LVU2866
	movq	8(%rbx), %r14
.LVL1986:
	.loc 2 1079 16 view .LVU2867
.LBE3292:
.LBE3291:
	.loc 17 331 52 discriminator 3 view .LVU2868
	movq	-168(%rbp), %rax
	subq	%r13, %rax
	leaq	(%rax,%r14), %r13
.LVL1987:
	.loc 17 331 17 discriminator 3 view .LVU2869
	leaq	-64(%r15), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2400
	movq	%r13, -64(%r15)
	.loc 17 332 30 view .LVU2870
	testq	%rbx, %rbx
	je	.L2223
	testb	$7, %bl
	jne	.L2223
.L2224:
	.loc 17 332 55 discriminator 1 view .LVU2871
	testq	%rbx, %rbx
	je	.L2225
	testb	$7, %bl
	jne	.L2225
.L2226:
.LVL1988:
.LBB3294:
.LBI3294:
	.loc 2 1169 7 is_stmt 1 view .LVU2872
.LBB3295:
	.loc 2 1171 20 is_stmt 0 view .LVU2873
	testq	%rbx, %rbx
	je	.L2227
	testb	$7, %bl
	jne	.L2227
.L2228:
.LVL1989:
.LBB3296:
.LBI3296:
	.loc 2 262 7 is_stmt 1 view .LVU2874
.LBB3297:
	.loc 2 264 13 is_stmt 0 view .LVU2875
	testq	%rbx, %rbx
	je	.L2229
	testb	$7, %bl
	jne	.L2229
.L2230:
.LVL1990:
.LBB3298:
.LBI3298:
	.loc 2 222 7 is_stmt 1 view .LVU2876
.LBB3299:
	.loc 2 223 28 is_stmt 0 view .LVU2877
	testq	%rbx, %rbx
	je	.L2231
	testb	$7, %bl
	jne	.L2231
.L2232:
	.loc 2 223 28 view .LVU2878
	movq	%rbx, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2401
	movq	(%rbx), %rax
	movq	%rax, -176(%rbp)
.LVL1991:
	.loc 2 223 28 view .LVU2879
.LBE3299:
.LBE3298:
	.loc 2 264 32 discriminator 2 view .LVU2880
	testq	%rbx, %rbx
	je	.L2234
	testb	$7, %bl
	jne	.L2234
.L2235:
.LVL1992:
.LBB3301:
.LBI3301:
	.loc 2 238 7 is_stmt 1 view .LVU2881
.LBB3302:
	.loc 2 241 57 is_stmt 0 view .LVU2882
	testq	%rbx, %rbx
	je	.L2236
	testb	$7, %bl
	jne	.L2236
.L2237:
	.loc 2 241 57 view .LVU2883
	leaq	16(%rbx), %rdx
	cmpq	$-16, %rbx
	jnb	.L2402
.L2238:
	movq	%rbx, %rax
	addq	$16, %rax
	movq	%rax, -152(%rbp)
	je	.L2403
.L2239:
	.loc 2 241 57 discriminator 1 view .LVU2884
	testq	%rbx, %rbx
	je	.L2240
	testb	$7, %bl
	jne	.L2240
.L2241:
.LVL1993:
	.loc 2 241 57 discriminator 1 view .LVU2885
.LBE3302:
.LBE3301:
	.loc 2 264 2 discriminator 4 view .LVU2886
	movq	-152(%rbp), %rsi
	cmpq	%rsi, -176(%rbp)
	je	.L2404
.LVL1994:
	.loc 2 264 2 discriminator 4 view .LVU2887
.LBE3297:
.LBE3296:
	.loc 2 1171 23 discriminator 2 view .LVU2888
	testq	%rbx, %rbx
	je	.L2390
	testb	$7, %bl
	jne	.L2390
.L2391:
	movq	-152(%rbp), %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2405
	movq	16(%rbx), %r14
.L2245:
.LVL1995:
	.loc 2 1171 23 discriminator 2 view .LVU2889
.LBE3295:
.LBE3294:
.LBB3312:
.LBI3312:
	.loc 17 138 5 is_stmt 1 view .LVU2890
.LBB3313:
	.loc 17 143 32 is_stmt 0 view .LVU2891
	testq	%rbx, %rbx
	je	.L2246
	testb	$7, %bl
	jne	.L2246
.L2247:
.LVL1996:
.LBB3314:
.LBI3314:
	.loc 2 1084 7 is_stmt 1 view .LVU2892
.LBB3315:
	.loc 2 1085 57 is_stmt 0 view .LVU2893
	testq	%rbx, %rbx
	je	.L2248
	testb	$7, %bl
	jne	.L2248
.L2249:
.LVL1997:
.LBB3316:
.LBI3316:
	.loc 2 341 7 is_stmt 1 view .LVU2894
.LBB3317:
	.loc 2 342 16 is_stmt 0 view .LVU2895
	testq	%rbx, %rbx
	je	.L2250
	testb	$7, %bl
	jne	.L2250
.L2251:
	.loc 2 342 16 view .LVU2896
	testq	%rbx, %rbx
	je	.L2406
.L2252:
	.loc 2 342 16 discriminator 1 view .LVU2897
	testq	%rbx, %rbx
	je	.L2253
	testb	$7, %bl
	jne	.L2253
.L2254:
.LVL1998:
	.loc 2 342 16 discriminator 1 view .LVU2898
.LBE3317:
.LBE3316:
	.loc 2 1085 40 discriminator 2 view .LVU2899
	testq	%rbx, %rbx
	je	.L2407
.L2255:
.LVL1999:
	.loc 2 1085 40 discriminator 2 view .LVU2900
.LBE3315:
.LBE3314:
	.loc 17 143 7 discriminator 2 view .LVU2901
	testq	%r13, %r13
	js	.L2408
	.loc 17 149 7 view .LVU2902
	cmpq	%r13, %r14
	jnb	.L2258
	.loc 17 149 57 discriminator 1 view .LVU2903
	addq	%r14, %r14
.LVL2000:
	.loc 17 149 39 discriminator 1 view .LVU2904
	cmpq	%r14, %r13
	jnb	.L2258
	.loc 17 151 15 view .LVU2905
	movq	%r14, -64(%r15)
	.loc 17 153 29 view .LVU2906
	testq	%rbx, %rbx
	je	.L2259
	testb	$7, %bl
	jne	.L2259
.L2260:
.LVL2001:
.LBB3321:
.LBI3321:
	.loc 2 1084 7 is_stmt 1 view .LVU2907
.LBB3322:
	.loc 2 1085 57 is_stmt 0 view .LVU2908
	testq	%rbx, %rbx
	je	.L2261
	testb	$7, %bl
	jne	.L2261
.L2262:
.LVL2002:
.LBB3323:
.LBI3323:
	.loc 2 341 7 is_stmt 1 view .LVU2909
.LBB3324:
	.loc 2 342 16 is_stmt 0 view .LVU2910
	testq	%rbx, %rbx
	je	.L2263
	testb	$7, %bl
	jne	.L2263
.L2264:
	.loc 2 342 16 view .LVU2911
	testq	%rbx, %rbx
	je	.L2409
.L2265:
	.loc 2 342 16 discriminator 1 view .LVU2912
	testq	%rbx, %rbx
	je	.L2266
	testb	$7, %bl
	jne	.L2266
.L2267:
.LVL2003:
	.loc 2 342 16 discriminator 1 view .LVU2913
.LBE3324:
.LBE3323:
	.loc 2 1085 40 discriminator 2 view .LVU2914
	testq	%rbx, %rbx
	je	.L2410
.L2268:
.LVL2004:
	.loc 2 1085 40 discriminator 2 view .LVU2915
.LBE3322:
.LBE3321:
	.loc 17 153 4 discriminator 2 view .LVU2916
	testq	%r14, %r14
	js	.L2411
.L2258:
	.loc 17 159 25 view .LVU2917
	movq	-64(%r15), %rax
	addq	$1, %rax
	movq	%rax, -176(%rbp)
	.loc 17 159 42 view .LVU2918
	testq	%rbx, %rbx
	je	.L2279
	testb	$7, %bl
	jne	.L2279
.L2280:
.LVL2005:
.LBB3328:
.LBI3328:
	.loc 2 336 7 is_stmt 1 view .LVU2919
.LBB3329:
	.loc 2 337 16 is_stmt 0 view .LVU2920
	testq	%rbx, %rbx
	je	.L2281
	testb	$7, %bl
	jne	.L2281
.L2282:
	.loc 2 337 16 view .LVU2921
	testq	%rbx, %rbx
	je	.L2412
.L2283:
.LVL2006:
	.loc 2 337 16 view .LVU2922
.LBE3329:
.LBE3328:
	.loc 17 159 25 discriminator 2 view .LVU2923
	testq	%rbx, %rbx
	je	.L2413
.L2284:
.LVL2007:
.LBB3331:
.LBI3331:
	.loc 2 124 7 is_stmt 1 view .LVU2924
.LBB3332:
	.loc 2 126 39 is_stmt 0 view .LVU2925
	testq	%rbx, %rbx
	je	.L2414
.L2285:
.LVL2008:
.LBB3333:
.LBI3333:
	.loc 9 481 7 is_stmt 1 view .LVU2926
.LBB3334:
	.loc 9 482 28 is_stmt 0 view .LVU2927
	testq	%rbx, %rbx
	je	.L2415
.L2286:
.LVL2009:
.LBB3335:
.LBI3335:
	.loc 10 189 7 is_stmt 1 view .LVU2928
.LBB3336:
	.loc 10 198 40 is_stmt 0 view .LVU2929
	testq	%rbx, %rbx
	je	.L2416
.L2287:
.LVL2010:
.LBB3337:
.LBI3337:
	.loc 11 126 7 is_stmt 1 view .LVU2930
.LBB3338:
	.loc 11 134 46 is_stmt 0 view .LVU2931
	testq	%rbx, %rbx
	je	.L2417
.L2288:
	.loc 11 134 2 discriminator 3 view .LVU2932
	cmpq	$0, -176(%rbp)
	js	.L2418
	.loc 11 151 48 view .LVU2933
	movq	-176(%rbp), %rdi
	call	_Znwm
.LVL2011:
	movq	%rax, %r14
.LVL2012:
	.loc 11 151 48 view .LVU2934
.LBE3338:
.LBE3337:
.LBE3336:
.LBE3335:
.LBE3334:
.LBE3333:
.LBE3332:
.LBE3331:
.LBE3313:
.LBE3312:
	.loc 17 334 7 view .LVU2935
	cmpq	$0, -160(%rbp)
	jne	.L2419
.LVL2013:
.L2291:
	.loc 17 336 7 view .LVU2936
	cmpq	$0, -184(%rbp)
	je	.L2307
	cmpq	$0, -168(%rbp)
	jne	.L2420
.L2307:
	.loc 17 338 7 view .LVU2937
	cmpq	$0, -192(%rbp)
	jne	.L2421
.L2320:
	.loc 17 342 17 view .LVU2938
	testq	%rbx, %rbx
	je	.L2342
	testb	$7, %bl
	jne	.L2342
.L2343:
.LVL2014:
.LBB3359:
.LBI3359:
	.loc 2 280 7 is_stmt 1 view .LVU2939
.LBB3360:
	.loc 2 282 18 is_stmt 0 view .LVU2940
	testq	%rbx, %rbx
	je	.L2344
	testb	$7, %bl
	jne	.L2344
.L2345:
.LVL2015:
.LBB3361:
.LBI3361:
	.loc 2 262 7 is_stmt 1 view .LVU2941
.LBB3362:
	.loc 2 264 13 is_stmt 0 view .LVU2942
	testq	%rbx, %rbx
	je	.L2346
	testb	$7, %bl
	jne	.L2346
.L2347:
.LVL2016:
.LBB3363:
.LBI3363:
	.loc 2 222 7 is_stmt 1 view .LVU2943
.LBB3364:
	.loc 2 223 28 is_stmt 0 view .LVU2944
	testq	%rbx, %rbx
	je	.L2348
	testb	$7, %bl
	jne	.L2348
.L2349:
	.loc 2 223 28 view .LVU2945
	movq	%rbx, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2422
	movq	(%rbx), %r13
.LVL2017:
	.loc 2 223 28 view .LVU2946
.LBE3364:
.LBE3363:
	.loc 2 264 32 discriminator 2 view .LVU2947
	testq	%rbx, %rbx
	je	.L2351
	testb	$7, %bl
	jne	.L2351
.L2352:
.LVL2018:
.LBB3366:
.LBI3366:
	.loc 2 238 7 is_stmt 1 view .LVU2948
.LBB3367:
	.loc 2 241 57 is_stmt 0 view .LVU2949
	testq	%rbx, %rbx
	je	.L2353
	testb	$7, %bl
	jne	.L2353
.L2354:
	.loc 2 241 57 view .LVU2950
	cmpq	$0, -152(%rbp)
	je	.L2423
.L2355:
	.loc 2 241 57 discriminator 1 view .LVU2951
	testq	%rbx, %rbx
	je	.L2356
	testb	$7, %bl
	jne	.L2356
.L2357:
.LVL2019:
	.loc 2 241 57 discriminator 1 view .LVU2952
.LBE3367:
.LBE3366:
	.loc 2 264 2 discriminator 4 view .LVU2953
	cmpq	%r13, -152(%rbp)
	je	.L2424
.LVL2020:
	.loc 2 264 2 discriminator 4 view .LVU2954
.LBE3362:
.LBE3361:
	.loc 2 283 14 view .LVU2955
	testq	%rbx, %rbx
	je	.L2374
	testb	$7, %bl
	jne	.L2374
.L2375:
	.loc 2 283 14 discriminator 1 view .LVU2956
	testq	%rbx, %rbx
	je	.L2376
	testb	$7, %bl
	jne	.L2376
.L2377:
.LVL2021:
.LBB3372:
.LBI3372:
	.loc 2 288 7 is_stmt 1 view .LVU2957
.LBB3373:
	.loc 2 289 62 is_stmt 0 view .LVU2958
	testq	%rbx, %rbx
	je	.L2378
	testb	$7, %bl
	jne	.L2378
.LVL2022:
.L2379:
.LBB3374:
.LBI3374:
	.loc 2 222 7 is_stmt 1 view .LVU2959
.LBB3375:
	.loc 2 223 28 is_stmt 0 view .LVU2960
	testq	%rbx, %rbx
	je	.L2380
	testb	$7, %bl
	jne	.L2380
.L2381:
.LVL2023:
	.loc 2 223 28 view .LVU2961
.LBE3375:
.LBE3374:
	.loc 2 289 51 discriminator 2 view .LVU2962
	testq	%rbx, %rbx
	je	.L2382
	testb	$7, %bl
	jne	.L2382
.L2383:
.LVL2024:
.LBB3377:
.LBI3377:
	.loc 2 336 7 is_stmt 1 view .LVU2963
.LBB3378:
	.loc 2 337 16 is_stmt 0 view .LVU2964
	testq	%rbx, %rbx
	je	.L2384
	testb	$7, %bl
	jne	.L2384
.L2385:
	.loc 2 337 16 view .LVU2965
	testq	%rbx, %rbx
	je	.L2425
.L2386:
.LVL2025:
	.loc 2 337 16 view .LVU2966
.LBE3378:
.LBE3377:
	.loc 2 289 34 discriminator 4 view .LVU2967
	testq	%rbx, %rbx
	je	.L2426
.L2387:
.LVL2026:
.LBB3380:
.LBI3380:
	.loc 9 516 7 is_stmt 1 view .LVU2968
.LBB3381:
	.loc 9 517 23 is_stmt 0 view .LVU2969
	testq	%rbx, %rbx
	je	.L2427
.L2388:
.LVL2027:
.LBB3382:
.LBI3382:
	.loc 10 203 7 is_stmt 1 view .LVU2970
.LBB3383:
	.loc 10 210 35 is_stmt 0 view .LVU2971
	testq	%rbx, %rbx
	je	.L2428
.L2389:
.LVL2028:
.LBB3384:
.LBI3384:
	.loc 11 156 7 is_stmt 1 view .LVU2972
.LBB3385:
.LBI3385:
	.loc 1 27 6 view .LVU2973
.LBB3386:
	.loc 1 27 51 view .LVU2974
	.loc 1 27 60 is_stmt 0 view .LVU2975
	movq	%r13, %rdi
	call	free@PLT
.LVL2029:
.L2362:
	.loc 1 27 60 view .LVU2976
.LBE3386:
.LBE3385:
.LBE3384:
.LBE3383:
.LBE3382:
.LBE3381:
.LBE3380:
.LBE3373:
.LBE3372:
.LBE3360:
.LBE3359:
	.loc 17 343 14 view .LVU2977
	testq	%rbx, %rbx
	je	.L2363
	testb	$7, %bl
	jne	.L2363
.L2364:
.LVL2030:
.LBB3398:
.LBI3398:
	.loc 2 212 7 is_stmt 1 view .LVU2978
.LBB3399:
	.loc 2 213 26 is_stmt 0 view .LVU2979
	testq	%rbx, %rbx
	je	.L2365
	testb	$7, %bl
	jne	.L2365
.L2366:
	.loc 2 213 26 view .LVU2980
	movq	%rbx, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2429
	movq	%r14, (%rbx)
.LVL2031:
	.loc 2 213 26 view .LVU2981
.LBE3399:
.LBE3398:
	.loc 17 344 18 view .LVU2982
	testq	%rbx, %rbx
	je	.L2368
	.loc 17 344 18 view .LVU2983
	testb	$7, %bl
	jne	.L2368
.L2369:
	.loc 17 344 18 discriminator 1 view .LVU2984
	leaq	-64(%r15), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2430
	movq	-64(%r15), %r13
.LVL2032:
.LBB3401:
.LBI3401:
	.loc 2 249 7 is_stmt 1 view .LVU2985
.LBB3402:
	.loc 2 250 31 is_stmt 0 view .LVU2986
	testq	%rbx, %rbx
	je	.L2371
	testb	$7, %bl
	jne	.L2371
.L2372:
	.loc 2 250 31 view .LVU2987
	movq	-152(%rbp), %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2431
	movq	%r13, 16(%rbx)
.LVL2033:
	.loc 2 250 31 view .LVU2988
.LBE3402:
.LBE3401:
	.loc 17 325 5 view .LVU2989
	cmpq	%r12, -208(%rbp)
	jne	.L2432
	movq	-200(%rbp), %rax
	movq	$0, 2147450880(%rax)
.LVL2034:
.L2210:
	.loc 17 345 5 view .LVU2990
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L2433
	addq	$184, %rsp
	popq	%rbx
.LVL2035:
	.loc 17 345 5 view .LVU2991
	popq	%r12
	popq	%r13
	popq	%r14
.LVL2036:
	.loc 17 345 5 view .LVU2992
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.LVL2037:
.L2397:
	.cfi_restore_state
	.loc 17 325 5 view .LVU2993
	movl	$64, %edi
	call	__asan_stack_malloc_0@PLT
.LVL2038:
	.loc 17 325 5 view .LVU2994
	testq	%rax, %rax
	cmovne	%rax, %r12
	jmp	.L2208
.LVL2039:
.L2212:
	.loc 17 329 42 view .LVU2995
	movq	%rbx, %rsi
	leaq	.Lubsan_data1661(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2040:
	jmp	.L2213
.LVL2041:
.L2214:
.LBB3404:
.LBB3290:
	.loc 2 1079 16 view .LVU2996
	movq	%rbx, %rsi
	leaq	.Lubsan_data1662(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2042:
	jmp	.L2215
.L2398:
	.loc 2 1079 16 view .LVU2997
	movq	%rbx, %rsi
	leaq	.Lubsan_data1663(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL2043:
	jmp	.L2216
.L2399:
	.loc 2 1079 16 view .LVU2998
	movq	-224(%rbp), %rdi
	call	__asan_report_load8@PLT
.LVL2044:
.L2218:
	.loc 2 1079 16 view .LVU2999
.LBE3290:
.LBE3404:
	.loc 17 331 40 discriminator 1 view .LVU3000
	movq	%rbx, %rsi
	leaq	.Lubsan_data1664(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2045:
	.loc 17 331 40 discriminator 1 view .LVU3001
	jmp	.L2219
.LVL2046:
.L2220:
.LBB3405:
.LBB3293:
	.loc 2 1079 16 view .LVU3002
	movq	%rbx, %rsi
	leaq	.Lubsan_data1665(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2047:
	jmp	.L2221
.LVL2048:
.L2400:
	.loc 2 1079 16 view .LVU3003
.LBE3293:
.LBE3405:
	.loc 17 331 17 discriminator 3 view .LVU3004
	call	__asan_report_store8@PLT
.LVL2049:
.L2223:
	.loc 17 332 30 view .LVU3005
	movq	%rbx, %rsi
	leaq	.Lubsan_data1666(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2050:
	jmp	.L2224
.L2225:
	.loc 17 332 55 discriminator 1 view .LVU3006
	movq	%rbx, %rsi
	leaq	.Lubsan_data1667(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2051:
	jmp	.L2226
.LVL2052:
.L2227:
.LBB3406:
.LBB3310:
	.loc 2 1171 20 view .LVU3007
	movq	%rbx, %rsi
	leaq	.Lubsan_data1668(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2053:
	jmp	.L2228
.LVL2054:
.L2229:
.LBB3308:
.LBB3306:
	.loc 2 264 13 view .LVU3008
	movq	%rbx, %rsi
	leaq	.Lubsan_data1669(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2055:
	jmp	.L2230
.LVL2056:
.L2231:
.LBB3304:
.LBB3300:
	.loc 2 223 28 view .LVU3009
	movq	%rbx, %rsi
	leaq	.Lubsan_data1670(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2057:
	jmp	.L2232
.L2401:
	.loc 2 223 28 view .LVU3010
	movq	%rbx, %rdi
	call	__asan_report_load8@PLT
.LVL2058:
.L2234:
	.loc 2 223 28 view .LVU3011
.LBE3300:
.LBE3304:
	.loc 2 264 32 discriminator 2 view .LVU3012
	movq	%rbx, %rsi
	leaq	.Lubsan_data1671(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2059:
	jmp	.L2235
.LVL2060:
.L2236:
.LBB3305:
.LBB3303:
	.loc 2 241 57 view .LVU3013
	movq	%rbx, %rsi
	leaq	.Lubsan_data1672(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2061:
	jmp	.L2237
.L2402:
	.loc 2 241 57 view .LVU3014
	movq	%rbx, %rsi
	leaq	.Lubsan_data1673(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL2062:
	jmp	.L2238
.L2403:
	.loc 2 241 57 view .LVU3015
	movl	$0, %esi
	leaq	.Lubsan_data1674(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2063:
	jmp	.L2239
.L2240:
	.loc 2 241 57 discriminator 1 view .LVU3016
	movq	%rbx, %rsi
	leaq	.Lubsan_data1675(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2064:
	jmp	.L2241
.LVL2065:
.L2404:
	.loc 2 241 57 discriminator 1 view .LVU3017
.LBE3303:
.LBE3305:
	.loc 2 266 10 view .LVU3018
	testq	%rbx, %rbx
	je	.L2243
	testb	$7, %bl
	jne	.L2243
.L2244:
	.loc 2 266 6 view .LVU3019
	cmpq	$15, %r14
	ja	.L2434
.LBE3306:
.LBE3308:
	.loc 2 1171 23 discriminator 1 view .LVU3020
	movl	$15, %r14d
	jmp	.L2245
.L2243:
.LBB3309:
.LBB3307:
	.loc 2 266 10 view .LVU3021
	movq	%rbx, %rsi
	leaq	.Lubsan_data1676(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2066:
	jmp	.L2244
.L2434:
	.loc 2 267 29 view .LVU3022
	call	__asan_handle_no_return@PLT
.LVL2067:
	leaq	.Lubsan_data693(%rip), %rdi
	call	__ubsan_handle_builtin_unreachable@PLT
.LVL2068:
.L2246:
	.loc 2 267 29 view .LVU3023
.LBE3307:
.LBE3309:
.LBE3310:
.LBE3406:
.LBB3407:
.LBB3358:
	.loc 17 143 32 view .LVU3024
	movq	%rbx, %rsi
	leaq	.Lubsan_data1678(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2069:
	jmp	.L2247
.LVL2070:
.L2248:
.LBB3346:
.LBB3320:
	.loc 2 1085 57 view .LVU3025
	movq	%rbx, %rsi
	leaq	.Lubsan_data1679(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2071:
	jmp	.L2249
.LVL2072:
.L2250:
.LBB3319:
.LBB3318:
	.loc 2 342 16 view .LVU3026
	movq	%rbx, %rsi
	leaq	.Lubsan_data1680(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2073:
	jmp	.L2251
.L2406:
	.loc 2 342 16 view .LVU3027
	movl	$0, %esi
	leaq	.Lubsan_data1681(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2074:
	jmp	.L2252
.L2253:
	.loc 2 342 16 discriminator 1 view .LVU3028
	movq	%rbx, %rsi
	leaq	.Lubsan_data1682(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2075:
	jmp	.L2254
.LVL2076:
.L2407:
	.loc 2 342 16 discriminator 1 view .LVU3029
.LBE3318:
.LBE3319:
	.loc 2 1085 40 discriminator 2 view .LVU3030
	movl	$0, %esi
	leaq	.Lubsan_data1683(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2077:
	jmp	.L2255
.LVL2078:
.L2408:
	.loc 2 1085 40 discriminator 2 view .LVU3031
.LBE3320:
.LBE3346:
	.loc 17 144 27 view .LVU3032
	call	__asan_handle_no_return@PLT
.LVL2079:
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L2435
	leaq	.LC20(%rip), %rdi
	call	_ZSt20__throw_length_errorPKc@PLT
.LVL2080:
.L2435:
	call	__stack_chk_fail@PLT
.LVL2081:
.L2259:
	.loc 17 153 29 view .LVU3033
	movq	%rbx, %rsi
	leaq	.Lubsan_data1688(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2082:
	jmp	.L2260
.LVL2083:
.L2261:
.LBB3347:
.LBB3327:
	.loc 2 1085 57 view .LVU3034
	movq	%rbx, %rsi
	leaq	.Lubsan_data1689(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2084:
	jmp	.L2262
.LVL2085:
.L2263:
.LBB3326:
.LBB3325:
	.loc 2 342 16 view .LVU3035
	movq	%rbx, %rsi
	leaq	.Lubsan_data1690(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2086:
	jmp	.L2264
.L2409:
	.loc 2 342 16 view .LVU3036
	movl	$0, %esi
	leaq	.Lubsan_data1691(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2087:
	jmp	.L2265
.L2266:
	.loc 2 342 16 discriminator 1 view .LVU3037
	movq	%rbx, %rsi
	leaq	.Lubsan_data1692(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2088:
	jmp	.L2267
.LVL2089:
.L2410:
	.loc 2 342 16 discriminator 1 view .LVU3038
.LBE3325:
.LBE3326:
	.loc 2 1085 40 discriminator 2 view .LVU3039
	movl	$0, %esi
	leaq	.Lubsan_data1693(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2090:
	jmp	.L2268
.LVL2091:
.L2411:
	.loc 2 1085 40 discriminator 2 view .LVU3040
.LBE3327:
.LBE3347:
	.loc 17 154 27 view .LVU3041
	testq	%rbx, %rbx
	je	.L2269
	testb	$7, %bl
	jne	.L2269
.L2270:
.LVL2092:
.LBB3348:
.LBI3348:
	.loc 2 1084 7 is_stmt 1 view .LVU3042
.LBB3349:
	.loc 2 1085 57 is_stmt 0 view .LVU3043
	testq	%rbx, %rbx
	je	.L2271
	testb	$7, %bl
	jne	.L2271
.L2272:
.LVL2093:
.LBB3350:
.LBI3350:
	.loc 2 341 7 is_stmt 1 view .LVU3044
.LBB3351:
	.loc 2 342 16 is_stmt 0 view .LVU3045
	testq	%rbx, %rbx
	je	.L2273
	testb	$7, %bl
	jne	.L2273
.L2274:
	.loc 2 342 16 view .LVU3046
	testq	%rbx, %rbx
	je	.L2436
.L2275:
	.loc 2 342 16 discriminator 1 view .LVU3047
	testq	%rbx, %rbx
	je	.L2276
	testb	$7, %bl
	jne	.L2276
.L2277:
.LVL2094:
	.loc 2 342 16 discriminator 1 view .LVU3048
.LBE3351:
.LBE3350:
	.loc 2 1085 40 discriminator 2 view .LVU3049
	testq	%rbx, %rbx
	je	.L2437
.L2278:
.LVL2095:
	.loc 2 1085 40 discriminator 2 view .LVU3050
.LBE3349:
.LBE3348:
	.loc 17 154 17 discriminator 2 view .LVU3051
	movabsq	$9223372036854775807, %rax
	movq	%rax, -64(%r15)
	jmp	.L2258
.L2269:
	.loc 17 154 27 view .LVU3052
	movq	%rbx, %rsi
	leaq	.Lubsan_data1694(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2096:
	jmp	.L2270
.LVL2097:
.L2271:
.LBB3355:
.LBB3354:
	.loc 2 1085 57 view .LVU3053
	movq	%rbx, %rsi
	leaq	.Lubsan_data1695(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2098:
	jmp	.L2272
.LVL2099:
.L2273:
.LBB3353:
.LBB3352:
	.loc 2 342 16 view .LVU3054
	movq	%rbx, %rsi
	leaq	.Lubsan_data1696(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2100:
	jmp	.L2274
.L2436:
	.loc 2 342 16 view .LVU3055
	movl	$0, %esi
	leaq	.Lubsan_data1697(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2101:
	jmp	.L2275
.L2276:
	.loc 2 342 16 discriminator 1 view .LVU3056
	movq	%rbx, %rsi
	leaq	.Lubsan_data1698(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2102:
	jmp	.L2277
.LVL2103:
.L2437:
	.loc 2 342 16 discriminator 1 view .LVU3057
.LBE3352:
.LBE3353:
	.loc 2 1085 40 discriminator 2 view .LVU3058
	movl	$0, %esi
	leaq	.Lubsan_data1699(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2104:
	jmp	.L2278
.LVL2105:
.L2279:
	.loc 2 1085 40 discriminator 2 view .LVU3059
.LBE3354:
.LBE3355:
	.loc 17 159 42 view .LVU3060
	movq	%rbx, %rsi
	leaq	.Lubsan_data1702(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2106:
	jmp	.L2280
.LVL2107:
.L2281:
.LBB3356:
.LBB3330:
	.loc 2 337 16 view .LVU3061
	movq	%rbx, %rsi
	leaq	.Lubsan_data1703(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2108:
	jmp	.L2282
.L2412:
	.loc 2 337 16 view .LVU3062
	movl	$0, %esi
	leaq	.Lubsan_data1704(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2109:
	jmp	.L2283
.LVL2110:
.L2413:
	.loc 2 337 16 view .LVU3063
.LBE3330:
.LBE3356:
	.loc 17 159 25 discriminator 2 view .LVU3064
	movl	$0, %esi
	leaq	.Lubsan_data1705(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2111:
	jmp	.L2284
.LVL2112:
.L2414:
.LBB3357:
.LBB3345:
	.loc 2 126 39 view .LVU3065
	movl	$0, %esi
	leaq	.Lubsan_data1706(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2113:
	jmp	.L2285
.LVL2114:
.L2415:
.LBB3344:
.LBB3343:
	.loc 9 482 28 view .LVU3066
	movl	$0, %esi
	leaq	.Lubsan_data1707(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2115:
	jmp	.L2286
.LVL2116:
.L2416:
.LBB3342:
.LBB3341:
	.loc 10 198 40 view .LVU3067
	movl	$0, %esi
	leaq	.Lubsan_data1708(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2117:
	jmp	.L2287
.LVL2118:
.L2417:
.LBB3340:
.LBB3339:
	.loc 11 134 46 view .LVU3068
	movl	$0, %esi
	leaq	.Lubsan_data1709(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2119:
	jmp	.L2288
.L2418:
	.loc 11 140 28 view .LVU3069
	call	__asan_handle_no_return@PLT
.LVL2120:
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L2438
	call	_ZSt17__throw_bad_allocv@PLT
.LVL2121:
.L2438:
	call	__stack_chk_fail@PLT
.LVL2122:
.L2419:
	.loc 11 140 28 view .LVU3070
.LBE3339:
.LBE3340:
.LBE3341:
.LBE3342:
.LBE3343:
.LBE3344:
.LBE3345:
.LBE3357:
.LBE3358:
.LBE3407:
	.loc 17 335 28 view .LVU3071
	testq	%rbx, %rbx
	je	.L2292
	testb	$7, %bl
	jne	.L2292
.LVL2123:
.L2293:
.LBB3408:
.LBI3408:
	.loc 2 222 7 is_stmt 1 view .LVU3072
.LBB3409:
	.loc 2 223 28 is_stmt 0 view .LVU3073
	testq	%rbx, %rbx
	je	.L2294
	testb	$7, %bl
	jne	.L2294
.L2295:
	.loc 2 223 28 view .LVU3074
	movq	%rbx, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2439
	movq	(%rbx), %r13
.LVL2124:
	.loc 2 223 28 view .LVU3075
.LBE3409:
.LBE3408:
.LBB3411:
.LBI3411:
	.loc 2 425 7 is_stmt 1 view .LVU3076
.LBB3412:
	.loc 2 427 2 is_stmt 0 view .LVU3077
	cmpq	$1, -160(%rbp)
	je	.L2440
.LVL2125:
.LBB3413:
.LBI3413:
	.loc 16 427 7 is_stmt 1 view .LVU3078
.LBB3414:
	.loc 16 429 2 view .LVU3079
	.loc 16 432 2 view .LVU3080
	.loc 16 435 2 view .LVU3081
	.loc 16 435 49 is_stmt 0 view .LVU3082
	testq	%r14, %r14
	je	.L2441
.L2305:
	.loc 16 435 49 view .LVU3083
	testq	%r13, %r13
	je	.L2442
.L2306:
	movq	-160(%rbp), %rdx
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	memcpy@PLT
.LVL2126:
	.loc 16 435 49 view .LVU3084
	jmp	.L2291
.LVL2127:
.L2292:
	.loc 16 435 49 view .LVU3085
.LBE3414:
.LBE3413:
.LBE3412:
.LBE3411:
	.loc 17 335 28 view .LVU3086
	movq	%rbx, %rsi
	leaq	.Lubsan_data1710(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2128:
	.loc 17 335 28 view .LVU3087
	jmp	.L2293
.LVL2129:
.L2294:
.LBB3422:
.LBB3410:
	.loc 2 223 28 view .LVU3088
	movq	%rbx, %rsi
	leaq	.Lubsan_data1711(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2130:
	jmp	.L2295
.L2439:
	.loc 2 223 28 view .LVU3089
	movq	%rbx, %rdi
	call	__asan_report_load8@PLT
.LVL2131:
.L2440:
	.loc 2 223 28 view .LVU3090
.LBE3410:
.LBE3422:
.LBB3423:
.LBB3421:
	.loc 2 428 23 view .LVU3091
	testq	%r13, %r13
	je	.L2443
.L2298:
	.loc 2 428 23 discriminator 1 view .LVU3092
	testq	%r14, %r14
	je	.L2444
.L2299:
.LVL2132:
.LBB3416:
.LBI3416:
	.loc 16 351 7 is_stmt 1 view .LVU3093
.LBB3417:
	.loc 16 354 2 view .LVU3094
	.loc 16 358 2 view .LVU3095
	.loc 16 358 9 is_stmt 0 view .LVU3096
	testq	%r13, %r13
	je	.L2445
.L2300:
	.loc 16 358 9 view .LVU3097
	movq	%r13, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	movq	%r13, %rdx
	andl	$7, %edx
	cmpb	%dl, %al
	jg	.L2301
	testb	%al, %al
	jne	.L2446
.L2301:
	movzbl	0(%r13), %r13d
.LVL2133:
	.loc 16 358 7 view .LVU3098
	testq	%r14, %r14
	je	.L2447
.L2302:
	cmpq	$0, -176(%rbp)
	je	.L2448
.L2303:
	movq	%r14, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	movq	%r14, %rdx
	andl	$7, %edx
	cmpb	%dl, %al
	jg	.L2304
	testb	%al, %al
	jne	.L2449
.L2304:
	movb	%r13b, (%r14)
.LVL2134:
	.loc 16 359 7 view .LVU3099
	jmp	.L2291
.LVL2135:
.L2443:
	.loc 16 359 7 view .LVU3100
.LBE3417:
.LBE3416:
	.loc 2 428 23 view .LVU3101
	movl	$0, %esi
	leaq	.Lubsan_data1712(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2136:
	jmp	.L2298
.L2444:
	.loc 2 428 23 discriminator 1 view .LVU3102
	movl	$0, %esi
	leaq	.Lubsan_data1713(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2137:
	jmp	.L2299
.LVL2138:
.L2445:
.LBB3419:
.LBB3418:
	.loc 16 358 9 view .LVU3103
	movl	$0, %esi
	leaq	.Lubsan_data1714(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2139:
	jmp	.L2300
.L2446:
	.loc 16 358 9 view .LVU3104
	movq	%r13, %rdi
	call	__asan_report_load1@PLT
.LVL2140:
.L2447:
	.loc 16 358 7 view .LVU3105
	movl	$0, %esi
	leaq	.Lubsan_data1715(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2141:
	jmp	.L2302
.L2448:
	movq	%r14, %rsi
	leaq	.Lubsan_data1716(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2142:
	jmp	.L2303
.L2449:
	.loc 16 358 7 view .LVU3106
	movq	%r14, %rdi
	call	__asan_report_store1@PLT
.LVL2143:
.L2441:
	.loc 16 358 7 view .LVU3107
.LBE3418:
.LBE3419:
.LBB3420:
.LBB3415:
	.loc 16 435 49 view .LVU3108
	leaq	.Lubsan_data846(%rip), %rdi
	call	__ubsan_handle_nonnull_arg@PLT
.LVL2144:
	jmp	.L2305
.L2442:
	.loc 16 435 49 view .LVU3109
	leaq	.Lubsan_data847(%rip), %rdi
	call	__ubsan_handle_nonnull_arg@PLT
.LVL2145:
	jmp	.L2306
.LVL2146:
.L2420:
	.loc 16 435 49 view .LVU3110
.LBE3415:
.LBE3420:
.LBE3421:
.LBE3423:
	.loc 17 337 15 view .LVU3111
	movq	-160(%rbp), %rax
	leaq	(%r14,%rax), %rdx
	testq	%rax, %rax
	js	.L2308
	cmpq	%r14, %rdx
	jnb	.L2309
.L2310:
	movq	%r14, %rsi
	leaq	.Lubsan_data1717(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL2147:
	jmp	.L2309
.L2308:
	.loc 17 337 15 view .LVU3112
	cmpq	%rdx, %r14
	jb	.L2310
.L2309:
	.loc 17 337 15 view .LVU3113
	movq	-160(%rbp), %rax
	leaq	(%r14,%rax), %r13
.LVL2148:
.LBB3424:
.LBI3424:
	.loc 2 425 7 is_stmt 1 view .LVU3114
.LBB3425:
	.loc 2 427 2 is_stmt 0 view .LVU3115
	cmpq	$1, -168(%rbp)
	je	.L2450
.LVL2149:
.LBB3426:
.LBI3426:
	.loc 16 427 7 is_stmt 1 view .LVU3116
.LBB3427:
	.loc 16 429 2 view .LVU3117
	.loc 16 432 2 view .LVU3118
	.loc 16 435 2 view .LVU3119
	.loc 16 435 49 is_stmt 0 view .LVU3120
	testq	%r13, %r13
	je	.L2451
.L2319:
	movq	-168(%rbp), %rdx
	movq	-184(%rbp), %rsi
	movq	%r13, %rdi
	call	memcpy@PLT
.LVL2150:
	.loc 16 435 66 view .LVU3121
	jmp	.L2307
.LVL2151:
.L2450:
	.loc 16 435 66 view .LVU3122
.LBE3427:
.LBE3426:
	.loc 2 428 23 view .LVU3123
	cmpq	$0, -184(%rbp)
	je	.L2452
.L2312:
	.loc 2 428 23 discriminator 1 view .LVU3124
	testq	%r13, %r13
	je	.L2453
.L2313:
.LVL2152:
.LBB3429:
.LBI3429:
	.loc 16 351 7 is_stmt 1 view .LVU3125
.LBB3430:
	.loc 16 354 2 view .LVU3126
	.loc 16 358 2 view .LVU3127
	.loc 16 358 9 is_stmt 0 view .LVU3128
	cmpq	$0, -184(%rbp)
	je	.L2454
.L2314:
	.loc 16 358 9 view .LVU3129
	movq	-184(%rbp), %rsi
	movq	%rsi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	andl	$7, %esi
	cmpb	%sil, %al
	jg	.L2315
	testb	%al, %al
	jne	.L2455
.L2315:
	movq	-184(%rbp), %rax
	movzbl	(%rax), %eax
	movb	%al, -184(%rbp)
.LVL2153:
	.loc 16 358 7 view .LVU3130
	testq	%r13, %r13
	je	.L2456
.L2316:
	movq	-160(%rbp), %rcx
	movq	-176(%rbp), %rax
	cmpq	%rax, %rcx
	cmovnb	%rcx, %rax
	cmpq	%rcx, %rax
	je	.L2457
.L2317:
	movq	%r13, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	movq	%r13, %rdx
	andl	$7, %edx
	cmpb	%dl, %al
	jg	.L2318
	testb	%al, %al
	jne	.L2458
.L2318:
	movzbl	-184(%rbp), %eax
	movb	%al, 0(%r13)
.LVL2154:
	.loc 16 359 7 view .LVU3131
	jmp	.L2307
.LVL2155:
.L2452:
	.loc 16 359 7 view .LVU3132
.LBE3430:
.LBE3429:
	.loc 2 428 23 view .LVU3133
	movl	$0, %esi
	leaq	.Lubsan_data1718(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2156:
	jmp	.L2312
.L2453:
	.loc 2 428 23 discriminator 1 view .LVU3134
	movl	$0, %esi
	leaq	.Lubsan_data1719(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2157:
	jmp	.L2313
.LVL2158:
.L2454:
.LBB3432:
.LBB3431:
	.loc 16 358 9 view .LVU3135
	movl	$0, %esi
	leaq	.Lubsan_data1720(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2159:
	jmp	.L2314
.L2455:
	.loc 16 358 9 view .LVU3136
	movq	-184(%rbp), %rdi
	call	__asan_report_load1@PLT
.LVL2160:
.L2456:
	.loc 16 358 7 view .LVU3137
	movl	$0, %esi
	leaq	.Lubsan_data1721(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2161:
	jmp	.L2316
.L2457:
	movq	%r13, %rsi
	leaq	.Lubsan_data1722(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2162:
	jmp	.L2317
.L2458:
	.loc 16 358 7 view .LVU3138
	movq	%r13, %rdi
	call	__asan_report_store1@PLT
.LVL2163:
.L2451:
	.loc 16 358 7 view .LVU3139
.LBE3431:
.LBE3432:
.LBB3433:
.LBB3428:
	.loc 16 435 49 view .LVU3140
	leaq	.Lubsan_data846(%rip), %rdi
	call	__ubsan_handle_nonnull_arg@PLT
.LVL2164:
	jmp	.L2319
.LVL2165:
.L2421:
	.loc 16 435 49 view .LVU3141
.LBE3428:
.LBE3433:
.LBE3425:
.LBE3424:
	.loc 17 340 16 view .LVU3142
	testq	%rbx, %rbx
	je	.L2321
	testb	$7, %bl
	jne	.L2321
.L2322:
.LVL2166:
.LBB3434:
.LBI3434:
	.loc 2 222 7 is_stmt 1 view .LVU3143
.LBB3435:
	.loc 2 223 28 is_stmt 0 view .LVU3144
	testq	%rbx, %rbx
	je	.L2323
	testb	$7, %bl
	jne	.L2323
.L2324:
	.loc 2 223 28 view .LVU3145
	movq	%rbx, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2459
	movq	(%rbx), %r13
.LVL2167:
	.loc 2 223 28 view .LVU3146
.LBE3435:
.LBE3434:
	.loc 17 340 27 discriminator 2 view .LVU3147
	movq	-216(%rbp), %rax
	leaq	0(%r13,%rax), %rdx
	testq	%rax, %rax
	js	.L2326
	cmpq	%r13, %rdx
	jnb	.L2327
.L2328:
	movq	%r13, %rsi
	leaq	.Lubsan_data1725(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL2168:
	jmp	.L2327
.L2321:
	.loc 17 340 16 view .LVU3148
	movq	%rbx, %rsi
	leaq	.Lubsan_data1723(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2169:
	jmp	.L2322
.LVL2170:
.L2323:
.LBB3437:
.LBB3436:
	.loc 2 223 28 view .LVU3149
	movq	%rbx, %rsi
	leaq	.Lubsan_data1724(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2171:
	jmp	.L2324
.L2459:
	.loc 2 223 28 view .LVU3150
	movq	%rbx, %rdi
	call	__asan_report_load8@PLT
.LVL2172:
.L2326:
	.loc 2 223 28 view .LVU3151
.LBE3436:
.LBE3437:
	.loc 17 340 27 discriminator 2 view .LVU3152
	cmpq	%rdx, %r13
	jb	.L2328
.L2327:
	movq	-216(%rbp), %rax
	addq	%r13, %rax
	movq	%rax, -184(%rbp)
	.loc 17 339 28 view .LVU3153
	movq	-160(%rbp), %r13
	movq	-168(%rbp), %rax
	addq	%rax, %r13
	.loc 17 339 15 view .LVU3154
	leaq	(%r14,%r13), %rdx
	js	.L2329
	cmpq	%r14, %rdx
	jnb	.L2330
.L2331:
	movq	%r14, %rsi
	leaq	.Lubsan_data1726(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL2173:
	jmp	.L2330
.L2329:
	.loc 17 339 15 view .LVU3155
	cmpq	%rdx, %r14
	jb	.L2331
.L2330:
	.loc 17 339 15 view .LVU3156
	leaq	(%r14,%r13), %rax
	movq	%rax, -160(%rbp)
.LVL2174:
.LBB3438:
.LBI3438:
	.loc 2 425 7 is_stmt 1 view .LVU3157
.LBB3439:
	.loc 2 427 2 is_stmt 0 view .LVU3158
	cmpq	$1, -192(%rbp)
	je	.L2460
.LVL2175:
.LBB3440:
.LBI3440:
	.loc 16 427 7 is_stmt 1 view .LVU3159
.LBB3441:
	.loc 16 429 2 view .LVU3160
	.loc 16 432 2 view .LVU3161
	.loc 16 435 2 view .LVU3162
	.loc 16 435 49 is_stmt 0 view .LVU3163
	cmpq	$0, -160(%rbp)
	je	.L2461
.LVL2176:
.L2340:
	.loc 16 435 49 view .LVU3164
	cmpq	$0, -184(%rbp)
	je	.L2462
.L2341:
	movq	-192(%rbp), %rdx
	movq	-184(%rbp), %rsi
	movq	-160(%rbp), %rdi
	call	memcpy@PLT
.LVL2177:
	.loc 16 435 49 view .LVU3165
	jmp	.L2320
.LVL2178:
.L2460:
	.loc 16 435 49 view .LVU3166
.LBE3441:
.LBE3440:
	.loc 2 428 23 view .LVU3167
	cmpq	$0, -184(%rbp)
	je	.L2463
.LVL2179:
.L2333:
	.loc 2 428 23 discriminator 1 view .LVU3168
	cmpq	$0, -160(%rbp)
	je	.L2464
.L2334:
.LVL2180:
.LBB3443:
.LBI3443:
	.loc 16 351 7 is_stmt 1 view .LVU3169
.LBB3444:
	.loc 16 354 2 view .LVU3170
	.loc 16 358 2 view .LVU3171
	.loc 16 358 9 is_stmt 0 view .LVU3172
	cmpq	$0, -184(%rbp)
	je	.L2465
.L2335:
	movq	-184(%rbp), %rcx
	movq	%rcx, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	andl	$7, %ecx
	cmpb	%cl, %al
	jg	.L2336
	testb	%al, %al
	jne	.L2466
.L2336:
	movq	-184(%rbp), %rax
	movzbl	(%rax), %eax
	movb	%al, -168(%rbp)
	.loc 16 358 7 view .LVU3173
	cmpq	$0, -160(%rbp)
	je	.L2467
.L2337:
	movq	-176(%rbp), %rax
	cmpq	%rax, %r13
	cmovnb	%r13, %rax
	cmpq	%r13, %rax
	je	.L2468
.L2338:
	movq	-160(%rbp), %rsi
	movq	%rsi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	andl	$7, %esi
	cmpb	%sil, %al
	jg	.L2339
	testb	%al, %al
	jne	.L2469
.L2339:
	movq	-160(%rbp), %rax
	movzbl	-168(%rbp), %esi
	movb	%sil, (%rax)
.LVL2181:
	.loc 16 359 7 view .LVU3174
	jmp	.L2320
.LVL2182:
.L2463:
	.loc 16 359 7 view .LVU3175
.LBE3444:
.LBE3443:
	.loc 2 428 23 view .LVU3176
	movl	$0, %esi
	leaq	.Lubsan_data1727(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2183:
	.loc 2 428 23 view .LVU3177
	jmp	.L2333
.L2464:
	.loc 2 428 23 discriminator 1 view .LVU3178
	movl	$0, %esi
	leaq	.Lubsan_data1728(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2184:
	jmp	.L2334
.LVL2185:
.L2465:
.LBB3446:
.LBB3445:
	.loc 16 358 9 view .LVU3179
	movl	$0, %esi
	leaq	.Lubsan_data1729(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2186:
	jmp	.L2335
.L2466:
	movq	-184(%rbp), %rdi
	call	__asan_report_load1@PLT
.LVL2187:
.L2467:
	.loc 16 358 7 view .LVU3180
	movl	$0, %esi
	leaq	.Lubsan_data1730(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2188:
	jmp	.L2337
.L2468:
	movq	-160(%rbp), %rsi
	leaq	.Lubsan_data1731(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2189:
	jmp	.L2338
.L2469:
	movq	-160(%rbp), %rdi
	call	__asan_report_store1@PLT
.LVL2190:
.L2461:
	.loc 16 358 7 view .LVU3181
.LBE3445:
.LBE3446:
.LBB3447:
.LBB3442:
	.loc 16 435 49 view .LVU3182
	leaq	.Lubsan_data846(%rip), %rdi
	call	__ubsan_handle_nonnull_arg@PLT
.LVL2191:
	.loc 16 435 49 view .LVU3183
	jmp	.L2340
.L2462:
	leaq	.Lubsan_data847(%rip), %rdi
	call	__ubsan_handle_nonnull_arg@PLT
.LVL2192:
	jmp	.L2341
.LVL2193:
.L2342:
	.loc 16 435 49 view .LVU3184
.LBE3442:
.LBE3447:
.LBE3439:
.LBE3438:
	.loc 17 342 17 view .LVU3185
	movq	%rbx, %rsi
	leaq	.Lubsan_data1732(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2194:
	jmp	.L2343
.LVL2195:
.L2344:
.LBB3448:
.LBB3396:
	.loc 2 282 18 view .LVU3186
	movq	%rbx, %rsi
	leaq	.Lubsan_data1733(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2196:
	jmp	.L2345
.LVL2197:
.L2346:
.LBB3394:
.LBB3371:
	.loc 2 264 13 view .LVU3187
	movq	%rbx, %rsi
	leaq	.Lubsan_data1734(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2198:
	jmp	.L2347
.LVL2199:
.L2348:
.LBB3369:
.LBB3365:
	.loc 2 223 28 view .LVU3188
	movq	%rbx, %rsi
	leaq	.Lubsan_data1735(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2200:
	jmp	.L2349
.L2422:
	.loc 2 223 28 view .LVU3189
	movq	%rbx, %rdi
	call	__asan_report_load8@PLT
.LVL2201:
.L2351:
	.loc 2 223 28 view .LVU3190
.LBE3365:
.LBE3369:
	.loc 2 264 32 discriminator 2 view .LVU3191
	movq	%rbx, %rsi
	leaq	.Lubsan_data1736(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2202:
	jmp	.L2352
.LVL2203:
.L2353:
.LBB3370:
.LBB3368:
	.loc 2 241 57 view .LVU3192
	movq	%rbx, %rsi
	leaq	.Lubsan_data1737(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2204:
	jmp	.L2354
.L2423:
	.loc 2 241 57 view .LVU3193
	movl	$0, %esi
	leaq	.Lubsan_data1738(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2205:
	jmp	.L2355
.L2356:
	.loc 2 241 57 discriminator 1 view .LVU3194
	movq	%rbx, %rsi
	leaq	.Lubsan_data1739(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2206:
	jmp	.L2357
.LVL2207:
.L2424:
	.loc 2 241 57 discriminator 1 view .LVU3195
.LBE3368:
.LBE3370:
	.loc 2 266 10 view .LVU3196
	testq	%rbx, %rbx
	je	.L2359
	testb	$7, %bl
	jne	.L2359
.L2360:
	movq	-224(%rbp), %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2470
	.loc 2 266 6 view .LVU3197
	cmpq	$15, 8(%rbx)
	jbe	.L2362
	.loc 2 267 29 view .LVU3198
	call	__asan_handle_no_return@PLT
.LVL2208:
	leaq	.Lubsan_data693(%rip), %rdi
	call	__ubsan_handle_builtin_unreachable@PLT
.LVL2209:
.L2359:
	.loc 2 266 10 view .LVU3199
	movq	%rbx, %rsi
	leaq	.Lubsan_data1740(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2210:
	jmp	.L2360
.L2470:
	.loc 2 266 10 view .LVU3200
	movq	-224(%rbp), %rdi
	call	__asan_report_load8@PLT
.LVL2211:
.L2363:
	.loc 2 266 10 view .LVU3201
.LBE3371:
.LBE3394:
.LBE3396:
.LBE3448:
	.loc 17 343 14 view .LVU3202
	movq	%rbx, %rsi
	leaq	.Lubsan_data1741(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2212:
	jmp	.L2364
.LVL2213:
.L2365:
.LBB3449:
.LBB3400:
	.loc 2 213 26 view .LVU3203
	movq	%rbx, %rsi
	leaq	.Lubsan_data1742(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2214:
	jmp	.L2366
.L2429:
	.loc 2 213 26 view .LVU3204
	movq	%rbx, %rdi
	call	__asan_report_store8@PLT
.LVL2215:
.L2368:
	.loc 2 213 26 view .LVU3205
.LBE3400:
.LBE3449:
	.loc 17 344 18 view .LVU3206
	movq	%rbx, %rsi
	leaq	.Lubsan_data1743(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2216:
	jmp	.L2369
.L2430:
	.loc 17 344 18 discriminator 1 view .LVU3207
	call	__asan_report_load8@PLT
.LVL2217:
.L2371:
.LBB3450:
.LBB3403:
	.loc 2 250 31 view .LVU3208
	movq	%rbx, %rsi
	leaq	.Lubsan_data1744(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2218:
	jmp	.L2372
.L2431:
	.loc 2 250 31 view .LVU3209
	movq	-152(%rbp), %rdi
	call	__asan_report_store8@PLT
.LVL2219:
.L2374:
	.loc 2 250 31 view .LVU3210
.LBE3403:
.LBE3450:
.LBB3451:
.LBB3397:
	.loc 2 283 14 view .LVU3211
	movq	%rbx, %rsi
	leaq	.Lubsan_data1745(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2220:
	jmp	.L2375
.L2376:
	.loc 2 283 14 discriminator 1 view .LVU3212
	movq	%rbx, %rsi
	leaq	.Lubsan_data1746(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2221:
	jmp	.L2377
.LVL2222:
.L2378:
.LBB3395:
.LBB3393:
	.loc 2 289 62 view .LVU3213
	movq	%rbx, %rsi
	leaq	.Lubsan_data1747(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2223:
	.loc 2 289 62 view .LVU3214
	jmp	.L2379
.LVL2224:
.L2380:
.LBB3390:
.LBB3376:
	.loc 2 223 28 view .LVU3215
	movq	%rbx, %rsi
	leaq	.Lubsan_data1748(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2225:
	jmp	.L2381
.LVL2226:
.L2382:
	.loc 2 223 28 view .LVU3216
.LBE3376:
.LBE3390:
	.loc 2 289 51 discriminator 2 view .LVU3217
	movq	%rbx, %rsi
	leaq	.Lubsan_data1749(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2227:
	jmp	.L2383
.LVL2228:
.L2384:
.LBB3391:
.LBB3379:
	.loc 2 337 16 view .LVU3218
	movq	%rbx, %rsi
	leaq	.Lubsan_data1750(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2229:
	jmp	.L2385
.L2425:
	.loc 2 337 16 view .LVU3219
	movl	$0, %esi
	leaq	.Lubsan_data1751(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2230:
	jmp	.L2386
.LVL2231:
.L2426:
	.loc 2 337 16 view .LVU3220
.LBE3379:
.LBE3391:
	.loc 2 289 34 discriminator 4 view .LVU3221
	movl	$0, %esi
	leaq	.Lubsan_data1752(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2232:
	jmp	.L2387
.LVL2233:
.L2427:
.LBB3392:
.LBB3389:
	.loc 9 517 23 view .LVU3222
	movl	$0, %esi
	leaq	.Lubsan_data1753(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2234:
	jmp	.L2388
.LVL2235:
.L2428:
.LBB3388:
.LBB3387:
	.loc 10 210 35 view .LVU3223
	movl	$0, %esi
	leaq	.Lubsan_data1754(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2236:
	jmp	.L2389
.LVL2237:
.L2390:
	.loc 10 210 35 view .LVU3224
.LBE3387:
.LBE3388:
.LBE3389:
.LBE3392:
.LBE3393:
.LBE3395:
.LBE3397:
.LBE3451:
.LBB3452:
.LBB3311:
	.loc 2 1171 23 discriminator 2 view .LVU3225
	movq	%rbx, %rsi
	leaq	.Lubsan_data1755(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2238:
	jmp	.L2391
.L2405:
	.loc 2 1171 23 discriminator 2 view .LVU3226
	movq	-152(%rbp), %rdi
	call	__asan_report_load8@PLT
.LVL2239:
.L2432:
	.loc 2 1171 23 discriminator 2 view .LVU3227
.LBE3311:
.LBE3452:
	.loc 17 325 5 view .LVU3228
	movq	$1172321806, (%r12)
.LVL2240:
	.loc 17 325 5 view .LVU3229
	movq	-200(%rbp), %rax
	movabsq	$-723401728380766731, %rsi
	movq	%rsi, 2147450880(%rax)
	movq	56(%r12), %rax
	movb	$0, (%rax)
	jmp	.L2210
.L2433:
	.loc 17 345 5 view .LVU3230
	call	__stack_chk_fail@PLT
.LVL2241:
	.cfi_endproc
.LFE7529:
	.size	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEmmPKcm, .-_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEmmPKcm
	.section	.rodata._ZSt12__str_concatINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEET_PKNS6_10value_typeENS6_9size_typeES9_SA_RKNS6_14allocator_typeE.str1.8,"aMS",@progbits,1
	.align 8
.LC21:
	.string	"5 32 1 9 <unknown> 48 1 9 <unknown> 64 1 9 <unknown> 80 1 9 <unknown> 96 8 10 __res:3528"
	.section	.rodata
	.align 32
.LC22:
	.string	"basic_string::append"
	.zero	43
	.section	.text._ZSt12__str_concatINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEET_PKNS6_10value_typeENS6_9size_typeES9_SA_RKNS6_14allocator_typeE,"axG",@progbits,_ZSt12__str_concatINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEET_PKNS6_10value_typeENS6_9size_typeES9_SA_RKNS6_14allocator_typeE,comdat
	.weak	_ZSt12__str_concatINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEET_PKNS6_10value_typeENS6_9size_typeES9_SA_RKNS6_14allocator_typeE
	.type	_ZSt12__str_concatINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEET_PKNS6_10value_typeENS6_9size_typeES9_SA_RKNS6_14allocator_typeE, @function
_ZSt12__str_concatINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEET_PKNS6_10value_typeENS6_9size_typeES9_SA_RKNS6_14allocator_typeE:
.LASANPC7136:
.LVL2242:
.LFB7136:
	.loc 2 3528 5 is_stmt 1 view -0
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA7136
	.loc 2 3528 5 is_stmt 0 view .LVU3232
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$264, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	movq	%rsi, -272(%rbp)
	movq	%rdx, -216(%rbp)
	movq	%rcx, -280(%rbp)
	movq	%r8, -224(%rbp)
	movq	%r9, %r13
	leaq	-208(%rbp), %rax
	movq	%rax, -240(%rbp)
	movq	%rax, -256(%rbp)
	cmpl	$0, __asan_option_detect_stack_use_after_return(%rip)
	jne	.L2856
.LVL2243:
.L2471:
	.loc 2 3528 5 view .LVU3233
	movq	-240(%rbp), %rax
	leaq	160(%rax), %r12
	movq	$1102416563, (%rax)
.LVL2244:
	.loc 2 3528 5 view .LVU3234
	leaq	.LC21(%rip), %rcx
	movq	%rcx, 8(%rax)
	leaq	.LASANPC7136(%rip), %rsi
	movq	%rsi, 16(%rax)
	shrq	$3, %rax
	movq	%rax, -264(%rbp)
	movl	$-235802127, 2147450880(%rax)
	movl	$-234753535, 2147450884(%rax)
	movl	$-234753535, 2147450888(%rax)
	movl	$-202116352, 2147450892(%rax)
	.loc 2 3528 5 view .LVU3235
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	.loc 2 3536 12 discriminator 1 view .LVU3236
	testq	%r13, %r13
	je	.L2857
.L2475:
.LVL2245:
.LBB3640:
.LBI3640:
	.loc 8 97 29 is_stmt 1 view .LVU3237
.LBB3641:
	.loc 8 98 67 is_stmt 0 view .LVU3238
	testq	%r13, %r13
	je	.L2858
.L2476:
.LVL2246:
.LBB3642:
.LBI3642:
	.loc 9 587 7 is_stmt 1 view .LVU3239
.LBB3643:
	.loc 9 588 16 is_stmt 0 view .LVU3240
	testq	%r13, %r13
	je	.L2859
.L2477:
.LVL2247:
.LBB3644:
.LBI3644:
	.loc 10 167 7 is_stmt 1 view .LVU3241
.LBB3645:
	.loc 10 168 34 is_stmt 0 discriminator 1 view .LVU3242
	testq	%r13, %r13
	je	.L2860
.L2478:
.LVL2248:
.LBB3646:
.LBI3646:
	.loc 11 92 7 is_stmt 1 view .LVU3243
	.loc 11 92 7 is_stmt 0 view .LVU3244
.LBE3646:
.LBE3645:
.LBE3644:
.LBE3643:
.LBE3642:
.LBE3641:
.LBE3640:
.LBB3652:
.LBI3652:
	.loc 2 535 7 is_stmt 1 view .LVU3245
.LBB3653:
	.loc 2 536 9 is_stmt 0 view .LVU3246
	testq	%rbx, %rbx
	je	.L2479
	testb	$7, %bl
	jne	.L2479
.L2480:
	.loc 2 536 9 view .LVU3247
	testq	%rbx, %rbx
	je	.L2481
	testb	$7, %bl
	jne	.L2481
.L2482:
	.loc 2 536 34 discriminator 1 view .LVU3248
	testq	%rbx, %rbx
	je	.L2483
	testb	$7, %bl
	jne	.L2483
.L2484:
.LVL2249:
.LBB3654:
.LBI3654:
	.loc 2 227 7 is_stmt 1 view .LVU3249
.LBB3655:
	.loc 2 230 51 is_stmt 0 view .LVU3250
	testq	%rbx, %rbx
	je	.L2485
	testb	$7, %bl
	jne	.L2485
.L2486:
	.loc 2 230 51 view .LVU3251
	leaq	16(%rbx), %rdx
	cmpq	$-16, %rbx
	jnb	.L2861
.L2487:
	movq	%rbx, %r15
	addq	$16, %r15
	je	.L2862
.L2488:
.LVL2250:
	.loc 2 230 51 view .LVU3252
.LBE3655:
.LBE3654:
.LBB3657:
.LBI3657:
	.loc 2 188 2 is_stmt 1 view .LVU3253
.LBB3658:
	.loc 2 189 35 is_stmt 0 view .LVU3254
	testq	%rbx, %rbx
	je	.L2863
.L2489:
.LVL2251:
.LBB3659:
.LBI3659:
	.loc 10 167 7 is_stmt 1 view .LVU3255
.LBB3660:
	.loc 10 168 34 is_stmt 0 view .LVU3256
	testq	%rbx, %rbx
	je	.L2864
.L2490:
.LVL2252:
.LBB3661:
.LBI3661:
	.loc 11 92 7 is_stmt 1 view .LVU3257
	.loc 11 92 7 is_stmt 0 view .LVU3258
.LBE3661:
.LBE3660:
.LBE3659:
	.loc 2 189 25 discriminator 2 view .LVU3259
	testq	%rbx, %rbx
	je	.L2491
	testb	$7, %bl
	jne	.L2491
.L2492:
	movq	%rbx, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2865
	movq	%r15, (%rbx)
.LVL2253:
	.loc 2 189 25 discriminator 2 view .LVU3260
.LBE3658:
.LBE3657:
	.loc 2 538 19 view .LVU3261
	testq	%rbx, %rbx
	je	.L2494
	testb	$7, %bl
	jne	.L2494
.L2495:
.LVL2254:
.LBB3665:
.LBI3665:
	.loc 2 348 7 is_stmt 1 view .LVU3262
	.loc 2 348 7 is_stmt 0 view .LVU3263
.LBE3665:
	.loc 2 539 15 view .LVU3264
	testq	%rbx, %rbx
	je	.L2496
	testb	$7, %bl
	jne	.L2496
.L2497:
.LVL2255:
.LBB3666:
.LBI3666:
	.loc 2 254 7 is_stmt 1 view .LVU3265
.LBB3667:
	.loc 2 256 11 is_stmt 0 view .LVU3266
	testq	%rbx, %rbx
	je	.L2498
	testb	$7, %bl
	jne	.L2498
.L2499:
.LVL2256:
.LBB3668:
.LBI3668:
	.loc 2 217 7 is_stmt 1 view .LVU3267
.LBB3669:
	.loc 2 218 26 is_stmt 0 view .LVU3268
	testq	%rbx, %rbx
	je	.L2500
	testb	$7, %bl
	jne	.L2500
.L2501:
	.loc 2 218 26 view .LVU3269
	leaq	8(%rbx), %rax
	movq	%rax, -232(%rbp)
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2866
	movq	$0, 8(%rbx)
.LVL2257:
	.loc 2 218 26 view .LVU3270
.LBE3669:
.LBE3668:
	.loc 2 257 21 discriminator 1 view .LVU3271
	leaq	-112(%r12), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L2503
	jle	.L2867
.L2503:
	movb	$0, -112(%r12)
	.loc 2 257 29 discriminator 1 view .LVU3272
	testq	%rbx, %rbx
	je	.L2504
	testb	$7, %bl
	jne	.L2504
.L2505:
.LVL2258:
.LBB3671:
.LBI3671:
	.loc 2 222 7 is_stmt 1 view .LVU3273
.LBB3672:
	.loc 2 223 28 is_stmt 0 view .LVU3274
	testq	%rbx, %rbx
	je	.L2506
	testb	$7, %bl
	jne	.L2506
.L2507:
	.loc 2 223 28 view .LVU3275
	movq	%rbx, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2868
	movq	(%rbx), %r13
.LVL2259:
	.loc 2 223 28 view .LVU3276
.LBE3672:
.LBE3671:
	.loc 2 257 31 discriminator 3 view .LVU3277
	testq	%r13, %r13
	je	.L2869
.L2509:
.LVL2260:
.LBB3674:
.LBI3674:
	.loc 16 351 7 is_stmt 1 view .LVU3278
.LBB3675:
	.loc 16 354 2 view .LVU3279
	.loc 16 358 2 view .LVU3280
	.loc 16 358 7 is_stmt 0 view .LVU3281
	testq	%r13, %r13
	je	.L2870
.L2510:
	.loc 16 358 7 view .LVU3282
	movq	%r13, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	movq	%r13, %rdx
	andl	$7, %edx
	cmpb	%dl, %al
	jg	.L2511
	testb	%al, %al
	jne	.L2871
.L2511:
	movb	$0, 0(%r13)
.LVL2261:
	.loc 16 358 7 view .LVU3283
.LBE3675:
.LBE3674:
	.loc 2 257 21 discriminator 5 view .LVU3284
	leaq	-112(%r12), %rax
	shrq	$3, %rax
	movb	$-8, 2147450880(%rax)
.LVL2262:
	.loc 2 257 21 discriminator 5 view .LVU3285
.LBE3667:
.LBE3666:
.LBE3653:
.LBE3652:
.LBB3685:
.LBI3685:
	.loc 10 184 7 is_stmt 1 view .LVU3286
.LBE3685:
	.loc 2 3536 12 is_stmt 0 discriminator 2 view .LVU3287
	leaq	-128(%r12), %rax
.LVL2263:
	.loc 2 3536 12 discriminator 2 view .LVU3288
	shrq	$3, %rax
.LVL2264:
	.loc 2 3536 12 discriminator 2 view .LVU3289
	movb	$-8, 2147450880(%rax)
	.loc 2 3537 20 view .LVU3290
	movq	-216(%rbp), %rax
	movq	-224(%rbp), %rcx
	leaq	(%rax,%rcx), %r13
.LVL2265:
	.loc 2 3537 20 view .LVU3291
	leaq	-64(%r12), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2872
	movq	%r13, -64(%r12)
.LVL2266:
.LBB3686:
.LBI3686:
	.loc 17 304 5 is_stmt 1 view .LVU3292
.LBB3687:
	.loc 17 307 44 is_stmt 0 view .LVU3293
	testq	%rbx, %rbx
	je	.L2513
	testb	$7, %bl
	jne	.L2513
.LVL2267:
.L2514:
.LBB3688:
.LBI3688:
	.loc 2 1169 7 is_stmt 1 view .LVU3294
.LBB3689:
	.loc 2 1171 20 is_stmt 0 view .LVU3295
	testq	%rbx, %rbx
	je	.L2515
	testb	$7, %bl
	jne	.L2515
.L2516:
.LVL2268:
.LBB3690:
.LBI3690:
	.loc 2 262 7 is_stmt 1 view .LVU3296
.LBB3691:
	.loc 2 264 13 is_stmt 0 view .LVU3297
	testq	%rbx, %rbx
	je	.L2517
	testb	$7, %bl
	jne	.L2517
.L2518:
.LVL2269:
.LBB3692:
.LBI3692:
	.loc 2 222 7 is_stmt 1 view .LVU3298
.LBB3693:
	.loc 2 223 28 is_stmt 0 view .LVU3299
	testq	%rbx, %rbx
	je	.L2519
	testb	$7, %bl
	jne	.L2519
.L2520:
	.loc 2 223 28 view .LVU3300
	movq	%rbx, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2873
	movq	(%rbx), %r14
.LVL2270:
	.loc 2 223 28 view .LVU3301
.LBE3693:
.LBE3692:
	.loc 2 264 32 discriminator 2 view .LVU3302
	testq	%rbx, %rbx
	je	.L2522
	testb	$7, %bl
	jne	.L2522
.L2523:
.LVL2271:
.LBB3695:
.LBI3695:
	.loc 2 238 7 is_stmt 1 view .LVU3303
.LBB3696:
	.loc 2 241 57 is_stmt 0 view .LVU3304
	testq	%rbx, %rbx
	je	.L2524
	testb	$7, %bl
	jne	.L2524
.L2525:
	.loc 2 241 57 view .LVU3305
	testq	%r15, %r15
	je	.L2874
.L2526:
	.loc 2 241 57 discriminator 1 view .LVU3306
	testq	%rbx, %rbx
	je	.L2527
	testb	$7, %bl
	jne	.L2527
.L2528:
.LVL2272:
	.loc 2 241 57 discriminator 1 view .LVU3307
.LBE3696:
.LBE3695:
	.loc 2 264 2 discriminator 4 view .LVU3308
	cmpq	%r14, %r15
	je	.L2875
.LVL2273:
	.loc 2 264 2 discriminator 4 view .LVU3309
.LBE3691:
.LBE3690:
	.loc 2 1171 23 discriminator 2 view .LVU3310
	testq	%rbx, %rbx
	je	.L2847
	testb	$7, %bl
	jne	.L2847
.L2848:
	movq	%r15, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2876
	movq	16(%rbx), %r14
.L2533:
.LVL2274:
	.loc 2 1171 23 discriminator 2 view .LVU3311
.LBE3689:
.LBE3688:
	.loc 17 312 7 view .LVU3312
	cmpq	%r13, %r14
	jb	.L2877
.LVL2275:
.L2534:
	.loc 17 312 7 view .LVU3313
.LBE3687:
.LBE3686:
.LBB3838:
.LBI3838:
	.loc 2 1455 7 is_stmt 1 view .LVU3314
.LBB3839:
	.loc 2 1458 17 is_stmt 0 view .LVU3315
	testq	%rbx, %rbx
	je	.L2632
	testb	$7, %bl
	jne	.L2632
.L2633:
.LVL2276:
.LBB3840:
.LBI3840:
	.loc 2 397 7 is_stmt 1 view .LVU3316
.LBB3841:
	.loc 2 399 20 is_stmt 0 view .LVU3317
	testq	%rbx, %rbx
	je	.L2634
	testb	$7, %bl
	jne	.L2634
.L2635:
.LVL2277:
.LBB3842:
.LBI3842:
	.loc 2 1084 7 is_stmt 1 view .LVU3318
.LBB3843:
	.loc 2 1085 57 is_stmt 0 view .LVU3319
	testq	%rbx, %rbx
	je	.L2636
	testb	$7, %bl
	jne	.L2636
.L2637:
.LVL2278:
.LBB3844:
.LBI3844:
	.loc 2 341 7 is_stmt 1 view .LVU3320
.LBB3845:
	.loc 2 342 16 is_stmt 0 view .LVU3321
	testq	%rbx, %rbx
	je	.L2638
	testb	$7, %bl
	jne	.L2638
.L2639:
	.loc 2 342 16 view .LVU3322
	testq	%rbx, %rbx
	je	.L2878
.L2640:
	.loc 2 342 16 discriminator 1 view .LVU3323
	testq	%rbx, %rbx
	je	.L2641
	testb	$7, %bl
	jne	.L2641
.L2642:
.LVL2279:
	.loc 2 342 16 discriminator 1 view .LVU3324
.LBE3845:
.LBE3844:
	.loc 2 1085 40 discriminator 2 view .LVU3325
	testq	%rbx, %rbx
	je	.L2879
.L2643:
.LVL2280:
	.loc 2 1085 40 discriminator 2 view .LVU3326
.LBE3843:
.LBE3842:
	.loc 2 399 36 discriminator 2 view .LVU3327
	testq	%rbx, %rbx
	je	.L2644
	testb	$7, %bl
	jne	.L2644
.L2645:
.LVL2281:
.LBB3849:
.LBI3849:
	.loc 2 1071 7 is_stmt 1 view .LVU3328
.LBB3850:
	.loc 2 1072 16 is_stmt 0 view .LVU3329
	testq	%rbx, %rbx
	je	.L2646
	testb	$7, %bl
	jne	.L2646
.L2647:
	.loc 2 1072 16 view .LVU3330
	movq	-232(%rbp), %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2880
	movq	8(%rbx), %r14
.LVL2282:
	.loc 2 1072 16 view .LVU3331
.LBE3850:
.LBE3849:
	.loc 2 399 2 discriminator 4 view .LVU3332
	movabsq	$9223372036854775807, %rax
	subq	%r14, %rax
	movq	-216(%rbp), %rsi
	cmpq	%rsi, %rax
	jb	.L2881
.LVL2283:
	.loc 2 399 2 discriminator 4 view .LVU3333
.LBE3841:
.LBE3840:
	.loc 2 1459 18 view .LVU3334
	testq	%rbx, %rbx
	je	.L2651
	testb	$7, %bl
	jne	.L2651
.L2652:
.LVL2284:
.LBB3855:
.LBI3855:
	.loc 17 413 5 is_stmt 1 view .LVU3335
.LBB3856:
	.loc 17 416 47 is_stmt 0 view .LVU3336
	testq	%rbx, %rbx
	je	.L2653
	testb	$7, %bl
	jne	.L2653
.L2654:
.LVL2285:
.LBB3857:
.LBI3857:
	.loc 2 1071 7 is_stmt 1 view .LVU3337
.LBB3858:
	.loc 2 1072 16 is_stmt 0 view .LVU3338
	testq	%rbx, %rbx
	je	.L2655
	testb	$7, %bl
	jne	.L2655
.L2656:
.LVL2286:
	.loc 2 1072 16 view .LVU3339
.LBE3858:
.LBE3857:
	.loc 17 416 23 discriminator 2 view .LVU3340
	movq	-216(%rbp), %rax
	leaq	(%rax,%r14), %r13
.LVL2287:
	.loc 17 418 34 view .LVU3341
	testq	%rbx, %rbx
	je	.L2657
	testb	$7, %bl
	jne	.L2657
.L2658:
.LVL2288:
.LBB3860:
.LBI3860:
	.loc 2 1169 7 is_stmt 1 view .LVU3342
.LBB3861:
	.loc 2 1171 20 is_stmt 0 view .LVU3343
	testq	%rbx, %rbx
	je	.L2659
	testb	$7, %bl
	jne	.L2659
.L2660:
.LVL2289:
.LBB3862:
.LBI3862:
	.loc 2 262 7 is_stmt 1 view .LVU3344
.LBB3863:
	.loc 2 264 13 is_stmt 0 view .LVU3345
	testq	%rbx, %rbx
	je	.L2661
	testb	$7, %bl
	jne	.L2661
.L2662:
.LVL2290:
.LBB3864:
.LBI3864:
	.loc 2 222 7 is_stmt 1 view .LVU3346
.LBB3865:
	.loc 2 223 28 is_stmt 0 view .LVU3347
	testq	%rbx, %rbx
	je	.L2663
	testb	$7, %bl
	jne	.L2663
.L2664:
	.loc 2 223 28 view .LVU3348
	movq	%rbx, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2882
	movq	(%rbx), %rax
	movq	%rax, -248(%rbp)
.LVL2291:
	.loc 2 223 28 view .LVU3349
.LBE3865:
.LBE3864:
	.loc 2 264 32 discriminator 2 view .LVU3350
	testq	%rbx, %rbx
	je	.L2666
	testb	$7, %bl
	jne	.L2666
.L2667:
.LVL2292:
.LBB3867:
.LBI3867:
	.loc 2 238 7 is_stmt 1 view .LVU3351
.LBB3868:
	.loc 2 241 57 is_stmt 0 view .LVU3352
	testq	%rbx, %rbx
	je	.L2668
	testb	$7, %bl
	jne	.L2668
.L2669:
	.loc 2 241 57 view .LVU3353
	testq	%r15, %r15
	je	.L2883
.L2670:
	.loc 2 241 57 discriminator 1 view .LVU3354
	testq	%rbx, %rbx
	je	.L2671
	testb	$7, %bl
	jne	.L2671
.L2672:
.LVL2293:
	.loc 2 241 57 discriminator 1 view .LVU3355
.LBE3868:
.LBE3867:
	.loc 2 264 2 discriminator 4 view .LVU3356
	movq	-248(%rbp), %rax
	cmpq	%rax, %r15
	je	.L2884
.LVL2294:
	.loc 2 264 2 discriminator 4 view .LVU3357
.LBE3863:
.LBE3862:
	.loc 2 1171 23 discriminator 2 view .LVU3358
	testq	%rbx, %rbx
	je	.L2828
	testb	$7, %bl
	jne	.L2828
.L2829:
	movq	%r15, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2885
	movq	16(%rbx), %rax
.L2676:
.LVL2295:
	.loc 2 1171 23 discriminator 2 view .LVU3359
.LBE3861:
.LBE3860:
	.loc 17 418 7 discriminator 2 view .LVU3360
	cmpq	%r13, %rax
	jb	.L2677
	.loc 17 420 4 view .LVU3361
	cmpq	$0, -216(%rbp)
	jne	.L2886
.LVL2296:
.L2678:
	.loc 17 426 26 view .LVU3362
	testq	%rbx, %rbx
	je	.L2705
	testb	$7, %bl
	jne	.L2705
.L2706:
.LVL2297:
.LBB3878:
.LBI3878:
	.loc 2 254 7 is_stmt 1 view .LVU3363
.LBB3879:
	.loc 2 256 11 is_stmt 0 view .LVU3364
	testq	%rbx, %rbx
	je	.L2707
	testb	$7, %bl
	jne	.L2707
.L2708:
.LVL2298:
.LBB3880:
.LBI3880:
	.loc 2 217 7 is_stmt 1 view .LVU3365
.LBB3881:
	.loc 2 218 26 is_stmt 0 view .LVU3366
	testq	%rbx, %rbx
	je	.L2709
	testb	$7, %bl
	jne	.L2709
.L2710:
	.loc 2 218 26 view .LVU3367
	movq	%r13, 8(%rbx)
.LVL2299:
	.loc 2 218 26 view .LVU3368
.LBE3881:
.LBE3880:
	.loc 2 257 21 view .LVU3369
	leaq	-96(%r12), %rax
	shrq	$3, %rax
	movb	$1, 2147450880(%rax)
	.loc 2 257 21 discriminator 1 view .LVU3370
	movb	$0, -96(%r12)
	.loc 2 257 29 discriminator 1 view .LVU3371
	testq	%rbx, %rbx
	je	.L2712
	testb	$7, %bl
	jne	.L2712
.L2713:
.LVL2300:
.LBB3883:
.LBI3883:
	.loc 2 222 7 is_stmt 1 view .LVU3372
.LBB3884:
	.loc 2 223 28 is_stmt 0 view .LVU3373
	testq	%rbx, %rbx
	je	.L2714
	testb	$7, %bl
	jne	.L2714
.L2715:
	.loc 2 223 28 view .LVU3374
	movq	(%rbx), %r14
.LVL2301:
	.loc 2 223 28 view .LVU3375
.LBE3884:
.LBE3883:
	.loc 2 257 31 discriminator 3 view .LVU3376
	leaq	(%r14,%r13), %rdx
	testq	%r13, %r13
	js	.L2716
	cmpq	%r14, %rdx
	jnb	.L2717
.L2718:
	movq	%r14, %rsi
	leaq	.Lubsan_data1884(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL2302:
	jmp	.L2717
.LVL2303:
.L2856:
	.loc 2 257 31 discriminator 3 view .LVU3377
.LBE3879:
.LBE3878:
.LBE3856:
.LBE3855:
.LBE3839:
.LBE3838:
	.loc 2 3528 5 view .LVU3378
	movl	$128, %edi
	call	__asan_stack_malloc_1@PLT
.LVL2304:
	.loc 2 3528 5 view .LVU3379
	testq	%rax, %rax
	cmove	-240(%rbp), %rax
	movq	%rax, -240(%rbp)
	jmp	.L2471
.LVL2305:
.L2857:
	.loc 2 3536 12 discriminator 1 view .LVU3380
	movl	$0, %esi
	leaq	.Lubsan_data1756(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2306:
	jmp	.L2475
.LVL2307:
.L2858:
.LBB3931:
.LBB3651:
	.loc 8 98 67 view .LVU3381
	movl	$0, %esi
	leaq	.Lubsan_data1757(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2308:
	jmp	.L2476
.LVL2309:
.L2859:
.LBB3650:
.LBB3649:
	.loc 9 588 16 view .LVU3382
	movl	$0, %esi
	leaq	.Lubsan_data1759(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2310:
	jmp	.L2477
.LVL2311:
.L2860:
.LBB3648:
.LBB3647:
	.loc 10 168 34 discriminator 1 view .LVU3383
	movl	$0, %esi
	leaq	.Lubsan_data1761(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2312:
	jmp	.L2478
.LVL2313:
.L2479:
	.loc 10 168 34 discriminator 1 view .LVU3384
.LBE3647:
.LBE3648:
.LBE3649:
.LBE3650:
.LBE3651:
.LBE3931:
.LBB3932:
.LBB3684:
	.loc 2 536 9 view .LVU3385
	movq	%rbx, %rsi
	leaq	.Lubsan_data1762(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2314:
	jmp	.L2480
.L2481:
	.loc 2 536 9 view .LVU3386
	movq	%rbx, %rsi
	leaq	.Lubsan_data1763(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2315:
	jmp	.L2482
.L2483:
	.loc 2 536 34 discriminator 1 view .LVU3387
	movq	%rbx, %rsi
	leaq	.Lubsan_data1764(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2316:
	jmp	.L2484
.LVL2317:
.L2485:
.LBB3681:
.LBB3656:
	.loc 2 230 51 view .LVU3388
	movq	%rbx, %rsi
	leaq	.Lubsan_data1765(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2318:
	jmp	.L2486
.L2861:
	.loc 2 230 51 view .LVU3389
	movq	%rbx, %rsi
	leaq	.Lubsan_data1766(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL2319:
	jmp	.L2487
.L2862:
	.loc 2 230 51 view .LVU3390
	movl	$0, %esi
	leaq	.Lubsan_data1767(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2320:
	jmp	.L2488
.LVL2321:
.L2863:
	.loc 2 230 51 view .LVU3391
.LBE3656:
.LBE3681:
.LBB3682:
.LBB3664:
	.loc 2 189 35 view .LVU3392
	movl	$0, %esi
	leaq	.Lubsan_data1768(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2322:
	jmp	.L2489
.LVL2323:
.L2864:
.LBB3663:
.LBB3662:
	.loc 10 168 34 view .LVU3393
	movl	$0, %esi
	leaq	.Lubsan_data1769(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2324:
	jmp	.L2490
.LVL2325:
.L2491:
	.loc 10 168 34 view .LVU3394
.LBE3662:
.LBE3663:
	.loc 2 189 25 discriminator 2 view .LVU3395
	movq	%rbx, %rsi
	leaq	.Lubsan_data1771(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2326:
	jmp	.L2492
.L2865:
	.loc 2 189 25 discriminator 2 view .LVU3396
	movq	%rbx, %rdi
	call	__asan_report_store8@PLT
.LVL2327:
.L2494:
	.loc 2 189 25 discriminator 2 view .LVU3397
.LBE3664:
.LBE3682:
	.loc 2 538 19 view .LVU3398
	movq	%rbx, %rsi
	leaq	.Lubsan_data1772(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2328:
	jmp	.L2495
.L2496:
	.loc 2 539 15 view .LVU3399
	movq	%rbx, %rsi
	leaq	.Lubsan_data1773(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2329:
	jmp	.L2497
.LVL2330:
.L2498:
.LBB3683:
.LBB3680:
	.loc 2 256 11 view .LVU3400
	movq	%rbx, %rsi
	leaq	.Lubsan_data1774(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2331:
	jmp	.L2499
.LVL2332:
.L2500:
.LBB3677:
.LBB3670:
	.loc 2 218 26 view .LVU3401
	movq	%rbx, %rsi
	leaq	.Lubsan_data1775(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2333:
	jmp	.L2501
.L2866:
	.loc 2 218 26 view .LVU3402
	movq	-232(%rbp), %rdi
	call	__asan_report_store8@PLT
.LVL2334:
.L2867:
	.loc 2 218 26 view .LVU3403
.LBE3670:
.LBE3677:
	.loc 2 257 21 discriminator 1 view .LVU3404
	call	__asan_report_store1@PLT
.LVL2335:
.L2504:
	.loc 2 257 29 discriminator 1 view .LVU3405
	movq	%rbx, %rsi
	leaq	.Lubsan_data1776(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2336:
	jmp	.L2505
.LVL2337:
.L2506:
.LBB3678:
.LBB3673:
	.loc 2 223 28 view .LVU3406
	movq	%rbx, %rsi
	leaq	.Lubsan_data1777(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2338:
	jmp	.L2507
.L2868:
	.loc 2 223 28 view .LVU3407
	movq	%rbx, %rdi
	call	__asan_report_load8@PLT
.LVL2339:
.L2869:
	.loc 2 223 28 view .LVU3408
.LBE3673:
.LBE3678:
	.loc 2 257 31 discriminator 3 view .LVU3409
	movl	$0, %esi
	leaq	.Lubsan_data1778(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2340:
	jmp	.L2509
.LVL2341:
.L2870:
.LBB3679:
.LBB3676:
	.loc 16 358 7 view .LVU3410
	movl	$0, %esi
	leaq	.Lubsan_data1780(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2342:
	jmp	.L2510
.L2871:
	.loc 16 358 7 view .LVU3411
	movq	%r13, %rdi
	call	__asan_report_store1@PLT
.LVL2343:
.L2872:
	.loc 16 358 7 view .LVU3412
	call	__asan_report_store8@PLT
.LVL2344:
.L2513:
	.loc 16 358 7 view .LVU3413
.LBE3676:
.LBE3679:
.LBE3680:
.LBE3683:
.LBE3684:
.LBE3932:
.LBB3933:
.LBB3835:
	.loc 17 307 44 view .LVU3414
	movq	%rbx, %rsi
	leaq	.Lubsan_data1781(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2345:
	.loc 17 307 44 view .LVU3415
	jmp	.L2514
.LVL2346:
.L2515:
.LBB3706:
.LBB3704:
	.loc 2 1171 20 view .LVU3416
	movq	%rbx, %rsi
	leaq	.Lubsan_data1782(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2347:
	jmp	.L2516
.LVL2348:
.L2517:
.LBB3702:
.LBB3700:
	.loc 2 264 13 view .LVU3417
	movq	%rbx, %rsi
	leaq	.Lubsan_data1783(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2349:
	jmp	.L2518
.LVL2350:
.L2519:
.LBB3698:
.LBB3694:
	.loc 2 223 28 view .LVU3418
	movq	%rbx, %rsi
	leaq	.Lubsan_data1784(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2351:
	jmp	.L2520
.L2873:
	.loc 2 223 28 view .LVU3419
	movq	%rbx, %rdi
	call	__asan_report_load8@PLT
.LVL2352:
.L2522:
	.loc 2 223 28 view .LVU3420
.LBE3694:
.LBE3698:
	.loc 2 264 32 discriminator 2 view .LVU3421
	movq	%rbx, %rsi
	leaq	.Lubsan_data1785(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2353:
	jmp	.L2523
.LVL2354:
.L2524:
.LBB3699:
.LBB3697:
	.loc 2 241 57 view .LVU3422
	movq	%rbx, %rsi
	leaq	.Lubsan_data1786(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2355:
	jmp	.L2525
.L2874:
	.loc 2 241 57 view .LVU3423
	movl	$0, %esi
	leaq	.Lubsan_data1787(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2356:
	jmp	.L2526
.L2527:
	.loc 2 241 57 discriminator 1 view .LVU3424
	movq	%rbx, %rsi
	leaq	.Lubsan_data1788(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2357:
	jmp	.L2528
.LVL2358:
.L2875:
	.loc 2 241 57 discriminator 1 view .LVU3425
.LBE3697:
.LBE3699:
	.loc 2 266 10 view .LVU3426
	testq	%rbx, %rbx
	je	.L2530
	testb	$7, %bl
	jne	.L2530
.L2531:
	movq	-232(%rbp), %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2887
	.loc 2 266 6 view .LVU3427
	cmpq	$15, 8(%rbx)
	ja	.L2888
.LBE3700:
.LBE3702:
	.loc 2 1171 23 discriminator 1 view .LVU3428
	movl	$15, %r14d
	jmp	.L2533
.L2530:
.LBB3703:
.LBB3701:
	.loc 2 266 10 view .LVU3429
	movq	%rbx, %rsi
	leaq	.Lubsan_data1789(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2359:
	jmp	.L2531
.L2887:
	.loc 2 266 10 view .LVU3430
	movq	-232(%rbp), %rdi
	call	__asan_report_load8@PLT
.LVL2360:
.L2888:
	.loc 2 267 29 view .LVU3431
	call	__asan_handle_no_return@PLT
.LVL2361:
	leaq	.Lubsan_data693(%rip), %rdi
	call	__ubsan_handle_builtin_unreachable@PLT
.LVL2362:
.L2877:
	.loc 2 267 29 view .LVU3432
.LBE3701:
.LBE3703:
.LBE3704:
.LBE3706:
	.loc 17 315 32 view .LVU3433
	testq	%rbx, %rbx
	je	.L2535
	testb	$7, %bl
	jne	.L2535
.L2536:
.LVL2363:
.LBB3707:
.LBI3707:
	.loc 17 138 5 is_stmt 1 view .LVU3434
.LBB3708:
	.loc 17 143 32 is_stmt 0 view .LVU3435
	testq	%rbx, %rbx
	je	.L2537
	testb	$7, %bl
	jne	.L2537
.L2538:
.LVL2364:
.LBB3709:
.LBI3709:
	.loc 2 1084 7 is_stmt 1 view .LVU3436
.LBB3710:
	.loc 2 1085 57 is_stmt 0 view .LVU3437
	testq	%rbx, %rbx
	je	.L2539
	testb	$7, %bl
	jne	.L2539
.L2540:
.LVL2365:
.LBB3711:
.LBI3711:
	.loc 2 341 7 is_stmt 1 view .LVU3438
.LBB3712:
	.loc 2 342 16 is_stmt 0 view .LVU3439
	testq	%rbx, %rbx
	je	.L2541
	testb	$7, %bl
	jne	.L2541
.L2542:
	.loc 2 342 16 view .LVU3440
	testq	%rbx, %rbx
	je	.L2889
.L2543:
	.loc 2 342 16 discriminator 1 view .LVU3441
	testq	%rbx, %rbx
	je	.L2544
	testb	$7, %bl
	jne	.L2544
.L2545:
.LVL2366:
	.loc 2 342 16 discriminator 1 view .LVU3442
.LBE3712:
.LBE3711:
	.loc 2 1085 40 discriminator 2 view .LVU3443
	testq	%rbx, %rbx
	je	.L2890
.L2546:
.LVL2367:
	.loc 2 1085 40 discriminator 2 view .LVU3444
.LBE3710:
.LBE3709:
	.loc 17 143 7 discriminator 2 view .LVU3445
	testq	%r13, %r13
	js	.L2891
	.loc 17 149 57 discriminator 1 view .LVU3446
	addq	%r14, %r14
.LVL2368:
	.loc 17 149 39 discriminator 1 view .LVU3447
	cmpq	%r14, %r13
	jnb	.L2549
	.loc 17 151 15 view .LVU3448
	movq	%r14, -64(%r12)
	.loc 17 153 29 view .LVU3449
	testq	%rbx, %rbx
	je	.L2550
	testb	$7, %bl
	jne	.L2550
.L2551:
.LVL2369:
.LBB3716:
.LBI3716:
	.loc 2 1084 7 is_stmt 1 view .LVU3450
.LBB3717:
	.loc 2 1085 57 is_stmt 0 view .LVU3451
	testq	%rbx, %rbx
	je	.L2552
	testb	$7, %bl
	jne	.L2552
.L2553:
.LVL2370:
.LBB3718:
.LBI3718:
	.loc 2 341 7 is_stmt 1 view .LVU3452
.LBB3719:
	.loc 2 342 16 is_stmt 0 view .LVU3453
	testq	%rbx, %rbx
	je	.L2554
	testb	$7, %bl
	jne	.L2554
.L2555:
	.loc 2 342 16 view .LVU3454
	testq	%rbx, %rbx
	je	.L2892
.L2556:
	.loc 2 342 16 discriminator 1 view .LVU3455
	testq	%rbx, %rbx
	je	.L2557
	testb	$7, %bl
	jne	.L2557
.L2558:
.LVL2371:
	.loc 2 342 16 discriminator 1 view .LVU3456
.LBE3719:
.LBE3718:
	.loc 2 1085 40 discriminator 2 view .LVU3457
	testq	%rbx, %rbx
	je	.L2893
.L2559:
.LVL2372:
	.loc 2 1085 40 discriminator 2 view .LVU3458
.LBE3717:
.LBE3716:
	.loc 17 153 4 discriminator 2 view .LVU3459
	testq	%r14, %r14
	js	.L2894
.L2549:
	.loc 17 159 25 view .LVU3460
	movq	-64(%r12), %rax
	movq	%rax, -296(%rbp)
	addq	$1, %rax
	movq	%rax, -248(%rbp)
	.loc 17 159 42 view .LVU3461
	testq	%rbx, %rbx
	je	.L2570
	testb	$7, %bl
	jne	.L2570
.L2571:
.LVL2373:
.LBB3723:
.LBI3723:
	.loc 2 336 7 is_stmt 1 view .LVU3462
.LBB3724:
	.loc 2 337 16 is_stmt 0 view .LVU3463
	testq	%rbx, %rbx
	je	.L2572
	testb	$7, %bl
	jne	.L2572
.L2573:
	.loc 2 337 16 view .LVU3464
	testq	%rbx, %rbx
	je	.L2895
.L2574:
.LVL2374:
	.loc 2 337 16 view .LVU3465
.LBE3724:
.LBE3723:
	.loc 17 159 25 discriminator 2 view .LVU3466
	testq	%rbx, %rbx
	je	.L2896
.L2575:
.LVL2375:
.LBB3726:
.LBI3726:
	.loc 2 124 7 is_stmt 1 view .LVU3467
.LBB3727:
	.loc 2 126 39 is_stmt 0 view .LVU3468
	testq	%rbx, %rbx
	je	.L2897
.L2576:
.LVL2376:
.LBB3728:
.LBI3728:
	.loc 9 481 7 is_stmt 1 view .LVU3469
.LBB3729:
	.loc 9 482 28 is_stmt 0 view .LVU3470
	testq	%rbx, %rbx
	je	.L2898
.L2577:
.LVL2377:
.LBB3730:
.LBI3730:
	.loc 10 189 7 is_stmt 1 view .LVU3471
.LBB3731:
	.loc 10 198 40 is_stmt 0 view .LVU3472
	testq	%rbx, %rbx
	je	.L2899
.L2578:
.LVL2378:
.LBB3732:
.LBI3732:
	.loc 11 126 7 is_stmt 1 view .LVU3473
.LBB3733:
	.loc 11 134 46 is_stmt 0 view .LVU3474
	testq	%rbx, %rbx
	je	.L2900
.L2579:
	.loc 11 134 2 discriminator 3 view .LVU3475
	cmpq	$0, -248(%rbp)
	js	.L2901
	.loc 11 151 48 view .LVU3476
	movq	-248(%rbp), %rdi
.LEHB37:
	call	_Znwm
.LVL2379:
	jmp	.L2902
.LVL2380:
.L2535:
	.loc 11 151 48 view .LVU3477
.LBE3733:
.LBE3732:
.LBE3731:
.LBE3730:
.LBE3729:
.LBE3728:
.LBE3727:
.LBE3726:
.LBE3708:
.LBE3707:
	.loc 17 315 32 view .LVU3478
	movq	%rbx, %rsi
	leaq	.Lubsan_data1790(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2381:
	jmp	.L2536
.LVL2382:
.L2537:
.LBB3763:
.LBB3761:
	.loc 17 143 32 view .LVU3479
	movq	%rbx, %rsi
	leaq	.Lubsan_data1792(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2383:
	jmp	.L2538
.LVL2384:
.L2539:
.LBB3748:
.LBB3715:
	.loc 2 1085 57 view .LVU3480
	movq	%rbx, %rsi
	leaq	.Lubsan_data1793(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2385:
	jmp	.L2540
.LVL2386:
.L2541:
.LBB3714:
.LBB3713:
	.loc 2 342 16 view .LVU3481
	movq	%rbx, %rsi
	leaq	.Lubsan_data1794(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2387:
	jmp	.L2542
.L2889:
	.loc 2 342 16 view .LVU3482
	movl	$0, %esi
	leaq	.Lubsan_data1795(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2388:
	jmp	.L2543
.L2544:
	.loc 2 342 16 discriminator 1 view .LVU3483
	movq	%rbx, %rsi
	leaq	.Lubsan_data1796(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2389:
	jmp	.L2545
.LVL2390:
.L2890:
	.loc 2 342 16 discriminator 1 view .LVU3484
.LBE3713:
.LBE3714:
	.loc 2 1085 40 discriminator 2 view .LVU3485
	movl	$0, %esi
	leaq	.Lubsan_data1797(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2391:
	jmp	.L2546
.LVL2392:
.L2891:
	.loc 2 1085 40 discriminator 2 view .LVU3486
.LBE3715:
.LBE3748:
	.loc 17 144 27 view .LVU3487
	call	__asan_handle_no_return@PLT
.LVL2393:
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L2903
	leaq	.LC20(%rip), %rdi
	call	_ZSt20__throw_length_errorPKc@PLT
.LVL2394:
.L2903:
	call	__stack_chk_fail@PLT
.LVL2395:
.L2550:
	.loc 17 153 29 view .LVU3488
	movq	%rbx, %rsi
	leaq	.Lubsan_data1802(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2396:
	jmp	.L2551
.LVL2397:
.L2552:
.LBB3749:
.LBB3722:
	.loc 2 1085 57 view .LVU3489
	movq	%rbx, %rsi
	leaq	.Lubsan_data1803(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2398:
	jmp	.L2553
.LVL2399:
.L2554:
.LBB3721:
.LBB3720:
	.loc 2 342 16 view .LVU3490
	movq	%rbx, %rsi
	leaq	.Lubsan_data1804(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2400:
	jmp	.L2555
.L2892:
	.loc 2 342 16 view .LVU3491
	movl	$0, %esi
	leaq	.Lubsan_data1805(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2401:
	jmp	.L2556
.L2557:
	.loc 2 342 16 discriminator 1 view .LVU3492
	movq	%rbx, %rsi
	leaq	.Lubsan_data1806(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2402:
	jmp	.L2558
.LVL2403:
.L2893:
	.loc 2 342 16 discriminator 1 view .LVU3493
.LBE3720:
.LBE3721:
	.loc 2 1085 40 discriminator 2 view .LVU3494
	movl	$0, %esi
	leaq	.Lubsan_data1807(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2404:
	jmp	.L2559
.LVL2405:
.L2894:
	.loc 2 1085 40 discriminator 2 view .LVU3495
.LBE3722:
.LBE3749:
	.loc 17 154 27 view .LVU3496
	testq	%rbx, %rbx
	je	.L2560
	testb	$7, %bl
	jne	.L2560
.L2561:
.LVL2406:
.LBB3750:
.LBI3750:
	.loc 2 1084 7 is_stmt 1 view .LVU3497
.LBB3751:
	.loc 2 1085 57 is_stmt 0 view .LVU3498
	testq	%rbx, %rbx
	je	.L2562
	testb	$7, %bl
	jne	.L2562
.L2563:
.LVL2407:
.LBB3752:
.LBI3752:
	.loc 2 341 7 is_stmt 1 view .LVU3499
.LBB3753:
	.loc 2 342 16 is_stmt 0 view .LVU3500
	testq	%rbx, %rbx
	je	.L2564
	testb	$7, %bl
	jne	.L2564
.L2565:
	.loc 2 342 16 view .LVU3501
	testq	%rbx, %rbx
	je	.L2904
.L2566:
	.loc 2 342 16 discriminator 1 view .LVU3502
	testq	%rbx, %rbx
	je	.L2567
	testb	$7, %bl
	jne	.L2567
.L2568:
.LVL2408:
	.loc 2 342 16 discriminator 1 view .LVU3503
.LBE3753:
.LBE3752:
	.loc 2 1085 40 discriminator 2 view .LVU3504
	testq	%rbx, %rbx
	je	.L2905
.L2569:
.LVL2409:
	.loc 2 1085 40 discriminator 2 view .LVU3505
.LBE3751:
.LBE3750:
	.loc 17 154 17 discriminator 2 view .LVU3506
	movabsq	$9223372036854775807, %rax
	movq	%rax, -64(%r12)
	jmp	.L2549
.L2560:
	.loc 17 154 27 view .LVU3507
	movq	%rbx, %rsi
	leaq	.Lubsan_data1808(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2410:
	jmp	.L2561
.LVL2411:
.L2562:
.LBB3757:
.LBB3756:
	.loc 2 1085 57 view .LVU3508
	movq	%rbx, %rsi
	leaq	.Lubsan_data1809(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2412:
	jmp	.L2563
.LVL2413:
.L2564:
.LBB3755:
.LBB3754:
	.loc 2 342 16 view .LVU3509
	movq	%rbx, %rsi
	leaq	.Lubsan_data1810(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2414:
	jmp	.L2565
.L2904:
	.loc 2 342 16 view .LVU3510
	movl	$0, %esi
	leaq	.Lubsan_data1811(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2415:
	jmp	.L2566
.L2567:
	.loc 2 342 16 discriminator 1 view .LVU3511
	movq	%rbx, %rsi
	leaq	.Lubsan_data1812(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2416:
	jmp	.L2568
.LVL2417:
.L2905:
	.loc 2 342 16 discriminator 1 view .LVU3512
.LBE3754:
.LBE3755:
	.loc 2 1085 40 discriminator 2 view .LVU3513
	movl	$0, %esi
	leaq	.Lubsan_data1813(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2418:
	jmp	.L2569
.LVL2419:
.L2570:
	.loc 2 1085 40 discriminator 2 view .LVU3514
.LBE3756:
.LBE3757:
	.loc 17 159 42 view .LVU3515
	movq	%rbx, %rsi
	leaq	.Lubsan_data1816(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2420:
	jmp	.L2571
.LVL2421:
.L2572:
.LBB3758:
.LBB3725:
	.loc 2 337 16 view .LVU3516
	movq	%rbx, %rsi
	leaq	.Lubsan_data1817(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2422:
	jmp	.L2573
.L2895:
	.loc 2 337 16 view .LVU3517
	movl	$0, %esi
	leaq	.Lubsan_data1818(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2423:
	jmp	.L2574
.LVL2424:
.L2896:
	.loc 2 337 16 view .LVU3518
.LBE3725:
.LBE3758:
	.loc 17 159 25 discriminator 2 view .LVU3519
	movl	$0, %esi
	leaq	.Lubsan_data1819(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2425:
	jmp	.L2575
.LVL2426:
.L2897:
.LBB3759:
.LBB3746:
	.loc 2 126 39 view .LVU3520
	movl	$0, %esi
	leaq	.Lubsan_data1820(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2427:
	jmp	.L2576
.LVL2428:
.L2898:
.LBB3744:
.LBB3742:
	.loc 9 482 28 view .LVU3521
	movl	$0, %esi
	leaq	.Lubsan_data1821(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2429:
	jmp	.L2577
.LVL2430:
.L2899:
.LBB3740:
.LBB3738:
	.loc 10 198 40 view .LVU3522
	movl	$0, %esi
	leaq	.Lubsan_data1822(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2431:
	jmp	.L2578
.LVL2432:
.L2900:
.LBB3736:
.LBB3734:
	.loc 11 134 46 view .LVU3523
	movl	$0, %esi
	leaq	.Lubsan_data1823(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2433:
	jmp	.L2579
.L2901:
	.loc 11 140 28 view .LVU3524
	call	__asan_handle_no_return@PLT
.LVL2434:
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L2906
	call	_ZSt17__throw_bad_allocv@PLT
.LVL2435:
.L2854:
	.loc 11 140 28 view .LVU3525
	endbr64
.LBE3734:
.LBE3736:
.LBE3738:
.LBE3740:
.LBE3742:
.LBE3744:
.LBE3746:
.LBE3759:
.LBE3761:
.LBE3763:
.LBE3835:
.LBE3933:
.LBB3934:
.LBB3935:
	.loc 2 804 19 view .LVU3526
	movq	%rax, %r12
.LVL2436:
	.loc 2 804 19 view .LVU3527
.LBE3935:
.LBI3934:
	.loc 2 803 7 is_stmt 1 view .LVU3528
.LBB3939:
	.loc 2 804 19 is_stmt 0 view .LVU3529
	testq	%rbx, %rbx
	je	.L2817
	testb	$7, %bl
	je	.L2818
.L2817:
	.loc 2 804 19 view .LVU3530
	movq	%rbx, %rsi
	leaq	.Lubsan_data1932(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2437:
.L2818:
	.loc 2 804 19 discriminator 1 view .LVU3531
	movq	%rbx, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
.LVL2438:
	.loc 2 804 23 discriminator 2 view .LVU3532
	testq	%rbx, %rbx
	je	.L2819
	testb	$7, %bl
	je	.L2820
.L2819:
	movq	%rbx, %rsi
	leaq	.Lubsan_data1933(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2439:
.L2820:
	.loc 2 804 23 discriminator 2 view .LVU3533
	testq	%rbx, %rbx
	je	.L2821
	testb	$7, %bl
	je	.L2822
.L2821:
	movq	%rbx, %rsi
	leaq	.Lubsan_data1934(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2440:
.L2822:
.LBB3936:
.LBI3936:
	.loc 2 181 14 is_stmt 1 view .LVU3534
.LBB3937:
	testq	%rbx, %rbx
	jne	.L2823
	movl	$0, %esi
	leaq	.Lubsan_data1935(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2441:
.L2823:
.LBB3938:
.LBI3938:
	.loc 10 184 7 view .LVU3535
	.loc 10 184 7 is_stmt 0 view .LVU3536
	call	__asan_handle_no_return@PLT
.LVL2442:
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	je	.L2824
	call	__stack_chk_fail@PLT
.LVL2443:
.L2906:
	.loc 10 184 7 view .LVU3537
.LBE3938:
.LBE3937:
.LBE3936:
.LBE3939:
.LBE3934:
.LBB3940:
.LBB3836:
.LBB3764:
.LBB3762:
.LBB3760:
.LBB3747:
.LBB3745:
.LBB3743:
.LBB3741:
.LBB3739:
.LBB3737:
.LBB3735:
	.loc 11 140 28 view .LVU3538
	call	__stack_chk_fail@PLT
.LVL2444:
.L2902:
	.loc 11 151 48 view .LVU3539
	movq	%rax, %r14
.LVL2445:
	.loc 11 151 48 view .LVU3540
.LBE3735:
.LBE3737:
.LBE3739:
.LBE3741:
.LBE3743:
.LBE3745:
.LBE3747:
.LBE3760:
.LBE3762:
.LBE3764:
	.loc 17 316 45 view .LVU3541
	testq	%rbx, %rbx
	je	.L2582
	testb	$7, %bl
	jne	.L2582
.LVL2446:
.L2583:
.LBB3765:
.LBI3765:
	.loc 2 1078 7 is_stmt 1 view .LVU3542
.LBB3766:
	.loc 2 1079 16 is_stmt 0 view .LVU3543
	testq	%rbx, %rbx
	je	.L2584
	testb	$7, %bl
	jne	.L2584
.L2585:
	.loc 2 1079 16 view .LVU3544
	movq	-232(%rbp), %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2907
.LVL2447:
	.loc 2 1079 16 view .LVU3545
.LBE3766:
.LBE3765:
	.loc 17 316 20 discriminator 2 view .LVU3546
	movq	8(%rbx), %rax
	addq	$1, %rax
	movq	%rax, -288(%rbp)
	.loc 17 316 35 discriminator 2 view .LVU3547
	testq	%rbx, %rbx
	je	.L2587
	testb	$7, %bl
	jne	.L2587
.L2588:
.LVL2448:
.LBB3768:
.LBI3768:
	.loc 2 222 7 is_stmt 1 view .LVU3548
.LBB3769:
	.loc 2 223 28 is_stmt 0 view .LVU3549
	testq	%rbx, %rbx
	je	.L2589
	testb	$7, %bl
	jne	.L2589
.L2590:
	.loc 2 223 28 view .LVU3550
	movq	%rbx, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2908
	movq	(%rbx), %r13
.LVL2449:
	.loc 2 223 28 view .LVU3551
.LBE3769:
.LBE3768:
.LBB3771:
.LBI3771:
	.loc 2 425 7 is_stmt 1 view .LVU3552
.LBB3772:
	.loc 2 427 2 is_stmt 0 view .LVU3553
	cmpq	$1, -288(%rbp)
	je	.L2909
.LVL2450:
.LBB3773:
.LBI3773:
	.loc 16 427 7 is_stmt 1 view .LVU3554
.LBB3774:
	.loc 16 429 2 view .LVU3555
	cmpq	$0, -288(%rbp)
	je	.L2600
	.loc 16 432 2 view .LVU3556
	.loc 16 435 2 view .LVU3557
	.loc 16 435 49 is_stmt 0 view .LVU3558
	testq	%r14, %r14
	je	.L2910
.L2601:
	.loc 16 435 49 view .LVU3559
	testq	%r13, %r13
	je	.L2911
.L2602:
	movq	-288(%rbp), %rdx
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	memcpy@PLT
.LVL2451:
.L2600:
	.loc 16 435 49 view .LVU3560
.LBE3774:
.LBE3773:
.LBE3772:
.LBE3771:
	.loc 17 317 17 view .LVU3561
	testq	%rbx, %rbx
	je	.L2603
	testb	$7, %bl
	jne	.L2603
.L2604:
.LVL2452:
.LBB3782:
.LBI3782:
	.loc 2 280 7 is_stmt 1 view .LVU3562
.LBB3783:
	.loc 2 282 18 is_stmt 0 view .LVU3563
	testq	%rbx, %rbx
	je	.L2605
	testb	$7, %bl
	jne	.L2605
.L2606:
.LVL2453:
.LBB3784:
.LBI3784:
	.loc 2 262 7 is_stmt 1 view .LVU3564
.LBB3785:
	.loc 2 264 13 is_stmt 0 view .LVU3565
	testq	%rbx, %rbx
	je	.L2607
	testb	$7, %bl
	jne	.L2607
.L2608:
.LVL2454:
.LBB3786:
.LBI3786:
	.loc 2 222 7 is_stmt 1 view .LVU3566
.LBB3787:
	.loc 2 223 28 is_stmt 0 view .LVU3567
	testq	%rbx, %rbx
	je	.L2609
	testb	$7, %bl
	jne	.L2609
.L2610:
	.loc 2 223 28 view .LVU3568
	movq	(%rbx), %r13
.LVL2455:
	.loc 2 223 28 view .LVU3569
.LBE3787:
.LBE3786:
	.loc 2 264 32 discriminator 2 view .LVU3570
	testq	%rbx, %rbx
	je	.L2611
	testb	$7, %bl
	jne	.L2611
.L2612:
.LVL2456:
.LBB3789:
.LBI3789:
	.loc 2 238 7 is_stmt 1 view .LVU3571
.LBB3790:
	.loc 2 241 57 is_stmt 0 view .LVU3572
	testq	%rbx, %rbx
	je	.L2613
	testb	$7, %bl
	jne	.L2613
.L2614:
	.loc 2 241 57 view .LVU3573
	testq	%r15, %r15
	je	.L2912
.L2615:
	.loc 2 241 57 discriminator 1 view .LVU3574
	testq	%rbx, %rbx
	je	.L2616
	testb	$7, %bl
	jne	.L2616
.L2617:
.LVL2457:
	.loc 2 241 57 discriminator 1 view .LVU3575
.LBE3790:
.LBE3789:
	.loc 2 264 2 discriminator 4 view .LVU3576
	cmpq	%r13, %r15
	je	.L2913
.LVL2458:
	.loc 2 264 2 discriminator 4 view .LVU3577
.LBE3785:
.LBE3784:
	.loc 2 283 14 view .LVU3578
	testq	%rbx, %rbx
	je	.L2831
	testb	$7, %bl
	jne	.L2831
.L2832:
	.loc 2 283 14 discriminator 1 view .LVU3579
	testq	%rbx, %rbx
	je	.L2833
	testb	$7, %bl
	jne	.L2833
.L2834:
.LVL2459:
.LBB3795:
.LBI3795:
	.loc 2 288 7 is_stmt 1 view .LVU3580
.LBB3796:
	.loc 2 289 62 is_stmt 0 view .LVU3581
	testq	%rbx, %rbx
	je	.L2835
	testb	$7, %bl
	jne	.L2835
.LVL2460:
.L2836:
.LBB3797:
.LBI3797:
	.loc 2 222 7 is_stmt 1 view .LVU3582
.LBB3798:
	.loc 2 223 28 is_stmt 0 view .LVU3583
	testq	%rbx, %rbx
	je	.L2837
	testb	$7, %bl
	jne	.L2837
.L2838:
.LVL2461:
	.loc 2 223 28 view .LVU3584
.LBE3798:
.LBE3797:
	.loc 2 289 51 discriminator 2 view .LVU3585
	testq	%rbx, %rbx
	je	.L2839
	testb	$7, %bl
	jne	.L2839
.L2840:
.LVL2462:
.LBB3800:
.LBI3800:
	.loc 2 336 7 is_stmt 1 view .LVU3586
.LBB3801:
	.loc 2 337 16 is_stmt 0 view .LVU3587
	testq	%rbx, %rbx
	je	.L2841
	testb	$7, %bl
	jne	.L2841
.L2842:
	.loc 2 337 16 view .LVU3588
	testq	%rbx, %rbx
	je	.L2914
.L2843:
.LVL2463:
	.loc 2 337 16 view .LVU3589
.LBE3801:
.LBE3800:
	.loc 2 289 34 discriminator 4 view .LVU3590
	testq	%rbx, %rbx
	je	.L2915
.L2844:
.LVL2464:
.LBB3803:
.LBI3803:
	.loc 9 516 7 is_stmt 1 view .LVU3591
.LBB3804:
	.loc 9 517 23 is_stmt 0 view .LVU3592
	testq	%rbx, %rbx
	je	.L2916
.L2845:
.LVL2465:
.LBB3805:
.LBI3805:
	.loc 10 203 7 is_stmt 1 view .LVU3593
.LBB3806:
	.loc 10 210 35 is_stmt 0 view .LVU3594
	testq	%rbx, %rbx
	je	.L2917
.L2846:
.LVL2466:
.LBB3807:
.LBI3807:
	.loc 11 156 7 is_stmt 1 view .LVU3595
.LBB3808:
.LBI3808:
	.loc 1 27 6 view .LVU3596
.LBB3809:
	.loc 1 27 51 view .LVU3597
	.loc 1 27 60 is_stmt 0 view .LVU3598
	movq	%r13, %rdi
	call	free@PLT
.LVL2467:
.L2621:
	.loc 1 27 60 view .LVU3599
.LBE3809:
.LBE3808:
.LBE3807:
.LBE3806:
.LBE3805:
.LBE3804:
.LBE3803:
.LBE3796:
.LBE3795:
.LBE3783:
.LBE3782:
	.loc 17 318 14 view .LVU3600
	testq	%rbx, %rbx
	je	.L2622
	testb	$7, %bl
	jne	.L2622
.L2623:
.LVL2468:
.LBB3821:
.LBI3821:
	.loc 2 212 7 is_stmt 1 view .LVU3601
.LBB3822:
	.loc 2 213 26 is_stmt 0 view .LVU3602
	testq	%rbx, %rbx
	je	.L2624
	testb	$7, %bl
	jne	.L2624
.L2625:
	.loc 2 213 26 view .LVU3603
	movq	%rbx, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2918
	movq	%r14, (%rbx)
.LVL2469:
	.loc 2 213 26 view .LVU3604
.LBE3822:
.LBE3821:
	.loc 17 319 18 view .LVU3605
	testq	%rbx, %rbx
	je	.L2627
	.loc 17 319 18 view .LVU3606
	testb	$7, %bl
	jne	.L2627
.L2628:
.LVL2470:
.LBB3824:
.LBI3824:
	.loc 2 249 7 is_stmt 1 view .LVU3607
.LBB3825:
	.loc 2 250 31 is_stmt 0 view .LVU3608
	testq	%rbx, %rbx
	je	.L2629
	testb	$7, %bl
	jne	.L2629
.L2630:
	.loc 2 250 31 view .LVU3609
	movq	%r15, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2919
	movq	-296(%rbp), %rax
	movq	%rax, 16(%rbx)
.LVL2471:
	.loc 2 250 45 view .LVU3610
	jmp	.L2534
.LVL2472:
.L2582:
	.loc 2 250 45 view .LVU3611
.LBE3825:
.LBE3824:
	.loc 17 316 45 view .LVU3612
	movq	%rbx, %rsi
	leaq	.Lubsan_data1824(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2473:
	.loc 17 316 45 view .LVU3613
	jmp	.L2583
.LVL2474:
.L2584:
.LBB3827:
.LBB3767:
	.loc 2 1079 16 view .LVU3614
	movq	%rbx, %rsi
	leaq	.Lubsan_data1825(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2475:
	jmp	.L2585
.L2907:
	.loc 2 1079 16 view .LVU3615
	movq	-232(%rbp), %rdi
	call	__asan_report_load8@PLT
.LVL2476:
.L2587:
	.loc 2 1079 16 view .LVU3616
.LBE3767:
.LBE3827:
	.loc 17 316 35 discriminator 2 view .LVU3617
	movq	%rbx, %rsi
	leaq	.Lubsan_data1826(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2477:
	jmp	.L2588
.LVL2478:
.L2589:
.LBB3828:
.LBB3770:
	.loc 2 223 28 view .LVU3618
	movq	%rbx, %rsi
	leaq	.Lubsan_data1827(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2479:
	jmp	.L2590
.L2908:
	.loc 2 223 28 view .LVU3619
	movq	%rbx, %rdi
	call	__asan_report_load8@PLT
.LVL2480:
.L2909:
	.loc 2 223 28 view .LVU3620
.LBE3770:
.LBE3828:
.LBB3829:
.LBB3781:
	.loc 2 428 23 view .LVU3621
	testq	%r13, %r13
	je	.L2920
.L2593:
	.loc 2 428 23 discriminator 1 view .LVU3622
	testq	%r14, %r14
	je	.L2921
.L2594:
.LVL2481:
.LBB3776:
.LBI3776:
	.loc 16 351 7 is_stmt 1 view .LVU3623
.LBB3777:
	.loc 16 354 2 view .LVU3624
	.loc 16 358 2 view .LVU3625
	.loc 16 358 9 is_stmt 0 view .LVU3626
	testq	%r13, %r13
	je	.L2922
.L2595:
	.loc 16 358 9 view .LVU3627
	movq	%r13, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	movq	%r13, %rdx
	andl	$7, %edx
	cmpb	%dl, %al
	jg	.L2596
	testb	%al, %al
	jne	.L2923
.L2596:
	movzbl	0(%r13), %r13d
.LVL2482:
	.loc 16 358 7 view .LVU3628
	testq	%r14, %r14
	je	.L2924
.L2597:
	cmpq	$0, -248(%rbp)
	je	.L2925
.L2598:
	movq	%r14, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	movq	%r14, %rdx
	andl	$7, %edx
	cmpb	%dl, %al
	jg	.L2599
	testb	%al, %al
	jne	.L2926
.L2599:
	movb	%r13b, (%r14)
.LVL2483:
	.loc 16 359 7 view .LVU3629
	jmp	.L2600
.LVL2484:
.L2920:
	.loc 16 359 7 view .LVU3630
.LBE3777:
.LBE3776:
	.loc 2 428 23 view .LVU3631
	movl	$0, %esi
	leaq	.Lubsan_data1828(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2485:
	jmp	.L2593
.L2921:
	.loc 2 428 23 discriminator 1 view .LVU3632
	movl	$0, %esi
	leaq	.Lubsan_data1829(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2486:
	jmp	.L2594
.LVL2487:
.L2922:
.LBB3779:
.LBB3778:
	.loc 16 358 9 view .LVU3633
	movl	$0, %esi
	leaq	.Lubsan_data1830(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2488:
	jmp	.L2595
.L2923:
	.loc 16 358 9 view .LVU3634
	movq	%r13, %rdi
	call	__asan_report_load1@PLT
.LVL2489:
.L2924:
	.loc 16 358 7 view .LVU3635
	movl	$0, %esi
	leaq	.Lubsan_data1831(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2490:
	jmp	.L2597
.L2925:
	movq	%r14, %rsi
	leaq	.Lubsan_data1832(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2491:
	jmp	.L2598
.L2926:
	.loc 16 358 7 view .LVU3636
	movq	%r14, %rdi
	call	__asan_report_store1@PLT
.LVL2492:
.L2910:
	.loc 16 358 7 view .LVU3637
.LBE3778:
.LBE3779:
.LBB3780:
.LBB3775:
	.loc 16 435 49 view .LVU3638
	leaq	.Lubsan_data846(%rip), %rdi
	call	__ubsan_handle_nonnull_arg@PLT
.LVL2493:
	jmp	.L2601
.L2911:
	.loc 16 435 49 view .LVU3639
	leaq	.Lubsan_data847(%rip), %rdi
	call	__ubsan_handle_nonnull_arg@PLT
.LVL2494:
	jmp	.L2602
.LVL2495:
.L2603:
	.loc 16 435 49 view .LVU3640
.LBE3775:
.LBE3780:
.LBE3781:
.LBE3829:
	.loc 17 317 17 view .LVU3641
	movq	%rbx, %rsi
	leaq	.Lubsan_data1833(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2496:
	jmp	.L2604
.LVL2497:
.L2605:
.LBB3830:
.LBB3819:
	.loc 2 282 18 view .LVU3642
	movq	%rbx, %rsi
	leaq	.Lubsan_data1834(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2498:
	jmp	.L2606
.LVL2499:
.L2607:
.LBB3817:
.LBB3794:
	.loc 2 264 13 view .LVU3643
	movq	%rbx, %rsi
	leaq	.Lubsan_data1835(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2500:
	jmp	.L2608
.LVL2501:
.L2609:
.LBB3792:
.LBB3788:
	.loc 2 223 28 view .LVU3644
	movq	%rbx, %rsi
	leaq	.Lubsan_data1836(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2502:
	jmp	.L2610
.LVL2503:
.L2611:
	.loc 2 223 28 view .LVU3645
.LBE3788:
.LBE3792:
	.loc 2 264 32 discriminator 2 view .LVU3646
	movq	%rbx, %rsi
	leaq	.Lubsan_data1837(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2504:
	jmp	.L2612
.LVL2505:
.L2613:
.LBB3793:
.LBB3791:
	.loc 2 241 57 view .LVU3647
	movq	%rbx, %rsi
	leaq	.Lubsan_data1838(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2506:
	jmp	.L2614
.L2912:
	.loc 2 241 57 view .LVU3648
	movl	$0, %esi
	leaq	.Lubsan_data1839(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2507:
	jmp	.L2615
.L2616:
	.loc 2 241 57 discriminator 1 view .LVU3649
	movq	%rbx, %rsi
	leaq	.Lubsan_data1840(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2508:
	jmp	.L2617
.LVL2509:
.L2913:
	.loc 2 241 57 discriminator 1 view .LVU3650
.LBE3791:
.LBE3793:
	.loc 2 266 10 view .LVU3651
	testq	%rbx, %rbx
	je	.L2619
	testb	$7, %bl
	jne	.L2619
.L2620:
	.loc 2 266 6 view .LVU3652
	cmpq	$15, 8(%rbx)
	jbe	.L2621
	.loc 2 267 29 view .LVU3653
	call	__asan_handle_no_return@PLT
.LVL2510:
	leaq	.Lubsan_data693(%rip), %rdi
	call	__ubsan_handle_builtin_unreachable@PLT
.LVL2511:
.L2619:
	.loc 2 266 10 view .LVU3654
	movq	%rbx, %rsi
	leaq	.Lubsan_data1841(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2512:
	jmp	.L2620
.LVL2513:
.L2622:
	.loc 2 266 10 view .LVU3655
.LBE3794:
.LBE3817:
.LBE3819:
.LBE3830:
	.loc 17 318 14 view .LVU3656
	movq	%rbx, %rsi
	leaq	.Lubsan_data1842(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2514:
	jmp	.L2623
.LVL2515:
.L2624:
.LBB3831:
.LBB3823:
	.loc 2 213 26 view .LVU3657
	movq	%rbx, %rsi
	leaq	.Lubsan_data1843(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2516:
	jmp	.L2625
.L2918:
	.loc 2 213 26 view .LVU3658
	movq	%rbx, %rdi
	call	__asan_report_store8@PLT
.LVL2517:
.L2627:
	.loc 2 213 26 view .LVU3659
.LBE3823:
.LBE3831:
	.loc 17 319 18 view .LVU3660
	movq	%rbx, %rsi
	leaq	.Lubsan_data1844(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2518:
	jmp	.L2628
.LVL2519:
.L2629:
.LBB3832:
.LBB3826:
	.loc 2 250 31 view .LVU3661
	movq	%rbx, %rsi
	leaq	.Lubsan_data1845(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2520:
	jmp	.L2630
.L2919:
	.loc 2 250 31 view .LVU3662
	movq	%r15, %rdi
	call	__asan_report_store8@PLT
.LVL2521:
.L2632:
	.loc 2 250 31 view .LVU3663
.LBE3826:
.LBE3832:
.LBE3836:
.LBE3940:
.LBB3941:
.LBB3928:
	.loc 2 1458 17 view .LVU3664
	movq	%rbx, %rsi
	leaq	.Lubsan_data1846(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2522:
	jmp	.L2633
.LVL2523:
.L2634:
.LBB3924:
.LBB3854:
	.loc 2 399 20 view .LVU3665
	movq	%rbx, %rsi
	leaq	.Lubsan_data1847(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2524:
	jmp	.L2635
.LVL2525:
.L2636:
.LBB3852:
.LBB3848:
	.loc 2 1085 57 view .LVU3666
	movq	%rbx, %rsi
	leaq	.Lubsan_data1848(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2526:
	jmp	.L2637
.LVL2527:
.L2638:
.LBB3847:
.LBB3846:
	.loc 2 342 16 view .LVU3667
	movq	%rbx, %rsi
	leaq	.Lubsan_data1849(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2528:
	jmp	.L2639
.L2878:
	.loc 2 342 16 view .LVU3668
	movl	$0, %esi
	leaq	.Lubsan_data1850(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2529:
	jmp	.L2640
.L2641:
	.loc 2 342 16 discriminator 1 view .LVU3669
	movq	%rbx, %rsi
	leaq	.Lubsan_data1851(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2530:
	jmp	.L2642
.LVL2531:
.L2879:
	.loc 2 342 16 discriminator 1 view .LVU3670
.LBE3846:
.LBE3847:
	.loc 2 1085 40 discriminator 2 view .LVU3671
	movl	$0, %esi
	leaq	.Lubsan_data1852(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2532:
	jmp	.L2643
.LVL2533:
.L2644:
	.loc 2 1085 40 discriminator 2 view .LVU3672
.LBE3848:
.LBE3852:
	.loc 2 399 36 discriminator 2 view .LVU3673
	movq	%rbx, %rsi
	leaq	.Lubsan_data1853(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2534:
	jmp	.L2645
.LVL2535:
.L2646:
.LBB3853:
.LBB3851:
	.loc 2 1072 16 view .LVU3674
	movq	%rbx, %rsi
	leaq	.Lubsan_data1854(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2536:
	jmp	.L2647
.L2880:
	.loc 2 1072 16 view .LVU3675
	movq	-232(%rbp), %rdi
	call	__asan_report_load8@PLT
.LVL2537:
.L2881:
	.loc 2 1072 16 view .LVU3676
.LBE3851:
.LBE3853:
	.loc 2 400 24 view .LVU3677
	call	__asan_handle_no_return@PLT
.LVL2538:
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L2927
	leaq	.LC22(%rip), %rdi
	call	_ZSt20__throw_length_errorPKc@PLT
.LVL2539:
.L2927:
	call	__stack_chk_fail@PLT
.LVL2540:
.L2651:
	.loc 2 400 24 view .LVU3678
.LBE3854:
.LBE3924:
	.loc 2 1459 18 view .LVU3679
	movq	%rbx, %rsi
	leaq	.Lubsan_data1855(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2541:
	jmp	.L2652
.LVL2542:
.L2653:
.LBB3925:
.LBB3921:
	.loc 17 416 47 view .LVU3680
	movq	%rbx, %rsi
	leaq	.Lubsan_data1856(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2543:
	jmp	.L2654
.LVL2544:
.L2655:
.LBB3894:
.LBB3859:
	.loc 2 1072 16 view .LVU3681
	movq	%rbx, %rsi
	leaq	.Lubsan_data1857(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2545:
	jmp	.L2656
.LVL2546:
.L2657:
	.loc 2 1072 16 view .LVU3682
.LBE3859:
.LBE3894:
	.loc 17 418 34 view .LVU3683
	movq	%rbx, %rsi
	leaq	.Lubsan_data1858(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2547:
	jmp	.L2658
.LVL2548:
.L2659:
.LBB3895:
.LBB3876:
	.loc 2 1171 20 view .LVU3684
	movq	%rbx, %rsi
	leaq	.Lubsan_data1859(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2549:
	jmp	.L2660
.LVL2550:
.L2661:
.LBB3874:
.LBB3872:
	.loc 2 264 13 view .LVU3685
	movq	%rbx, %rsi
	leaq	.Lubsan_data1860(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2551:
	jmp	.L2662
.LVL2552:
.L2663:
.LBB3870:
.LBB3866:
	.loc 2 223 28 view .LVU3686
	movq	%rbx, %rsi
	leaq	.Lubsan_data1861(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2553:
	jmp	.L2664
.L2882:
	.loc 2 223 28 view .LVU3687
	movq	%rbx, %rdi
	call	__asan_report_load8@PLT
.LVL2554:
.L2666:
	.loc 2 223 28 view .LVU3688
.LBE3866:
.LBE3870:
	.loc 2 264 32 discriminator 2 view .LVU3689
	movq	%rbx, %rsi
	leaq	.Lubsan_data1862(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2555:
	jmp	.L2667
.LVL2556:
.L2668:
.LBB3871:
.LBB3869:
	.loc 2 241 57 view .LVU3690
	movq	%rbx, %rsi
	leaq	.Lubsan_data1863(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2557:
	jmp	.L2669
.L2883:
	.loc 2 241 57 view .LVU3691
	movl	$0, %esi
	leaq	.Lubsan_data1864(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2558:
	jmp	.L2670
.L2671:
	.loc 2 241 57 discriminator 1 view .LVU3692
	movq	%rbx, %rsi
	leaq	.Lubsan_data1865(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2559:
	jmp	.L2672
.LVL2560:
.L2884:
	.loc 2 241 57 discriminator 1 view .LVU3693
.LBE3869:
.LBE3871:
	.loc 2 266 10 view .LVU3694
	testq	%rbx, %rbx
	je	.L2674
	testb	$7, %bl
	jne	.L2674
.L2675:
	.loc 2 266 6 view .LVU3695
	cmpq	$15, %r14
	ja	.L2928
.LBE3872:
.LBE3874:
	.loc 2 1171 23 discriminator 1 view .LVU3696
	movl	$15, %eax
	jmp	.L2676
.L2674:
.LBB3875:
.LBB3873:
	.loc 2 266 10 view .LVU3697
	movq	%rbx, %rsi
	leaq	.Lubsan_data1866(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2561:
	jmp	.L2675
.L2928:
	.loc 2 267 29 view .LVU3698
	call	__asan_handle_no_return@PLT
.LVL2562:
	leaq	.Lubsan_data693(%rip), %rdi
	call	__ubsan_handle_builtin_unreachable@PLT
.LVL2563:
.L2886:
	.loc 2 267 29 view .LVU3699
.LBE3873:
.LBE3875:
.LBE3876:
.LBE3895:
	.loc 17 421 33 view .LVU3700
	testq	%rbx, %rbx
	je	.L2679
	testb	$7, %bl
	jne	.L2679
.L2680:
.LVL2564:
.LBB3896:
.LBI3896:
	.loc 2 222 7 is_stmt 1 view .LVU3701
.LBB3897:
	.loc 2 223 28 is_stmt 0 view .LVU3702
	testq	%rbx, %rbx
	je	.L2681
	testb	$7, %bl
	jne	.L2681
.L2682:
.LVL2565:
	.loc 2 223 28 view .LVU3703
.LBE3897:
.LBE3896:
	.loc 17 421 48 discriminator 2 view .LVU3704
	testq	%rbx, %rbx
	je	.L2683
	testb	$7, %bl
	jne	.L2683
.L2684:
.LVL2566:
.LBB3899:
.LBI3899:
	.loc 2 1071 7 is_stmt 1 view .LVU3705
.LBB3900:
	.loc 2 1072 16 is_stmt 0 view .LVU3706
	testq	%rbx, %rbx
	je	.L2685
	testb	$7, %bl
	jne	.L2685
.L2686:
.LVL2567:
	.loc 2 1072 16 view .LVU3707
.LBE3900:
.LBE3899:
	.loc 17 421 19 discriminator 4 view .LVU3708
	movq	-248(%rbp), %rax
	leaq	(%rax,%r14), %rdx
	testq	%r14, %r14
	js	.L2687
	cmpq	%rax, %rdx
	jnb	.L2688
.L2689:
	movq	-248(%rbp), %rsi
	leaq	.Lubsan_data1871(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL2568:
	jmp	.L2688
.L2679:
	.loc 17 421 33 view .LVU3709
	movq	%rbx, %rsi
	leaq	.Lubsan_data1867(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2569:
	jmp	.L2680
.LVL2570:
.L2681:
.LBB3902:
.LBB3898:
	.loc 2 223 28 view .LVU3710
	movq	%rbx, %rsi
	leaq	.Lubsan_data1868(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2571:
	jmp	.L2682
.LVL2572:
.L2683:
	.loc 2 223 28 view .LVU3711
.LBE3898:
.LBE3902:
	.loc 17 421 48 discriminator 2 view .LVU3712
	movq	%rbx, %rsi
	leaq	.Lubsan_data1869(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2573:
	jmp	.L2684
.LVL2574:
.L2685:
.LBB3903:
.LBB3901:
	.loc 2 1072 16 view .LVU3713
	movq	%rbx, %rsi
	leaq	.Lubsan_data1870(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2575:
	jmp	.L2686
.LVL2576:
.L2687:
	.loc 2 1072 16 view .LVU3714
.LBE3901:
.LBE3903:
	.loc 17 421 19 discriminator 4 view .LVU3715
	cmpq	%rdx, -248(%rbp)
	jb	.L2689
.L2688:
	movq	-248(%rbp), %rax
	addq	%r14, %rax
	movq	%rax, %r14
.LVL2577:
.LBB3904:
.LBI3904:
	.loc 2 425 7 is_stmt 1 view .LVU3716
.LBB3905:
	.loc 2 427 2 is_stmt 0 view .LVU3717
	cmpq	$1, -216(%rbp)
	je	.L2929
.LVL2578:
.LBB3906:
.LBI3906:
	.loc 16 427 7 is_stmt 1 view .LVU3718
.LBB3907:
	.loc 16 429 2 view .LVU3719
	.loc 16 432 2 view .LVU3720
	.loc 16 435 2 view .LVU3721
	.loc 16 435 49 is_stmt 0 view .LVU3722
	testq	%rax, %rax
	je	.L2930
.LVL2579:
.L2697:
	.loc 16 435 49 view .LVU3723
	cmpq	$0, -272(%rbp)
	je	.L2931
.L2698:
	movq	-216(%rbp), %rdx
	movq	-272(%rbp), %rsi
	movq	%r14, %rdi
	call	memcpy@PLT
.LVL2580:
	.loc 16 435 49 view .LVU3724
	jmp	.L2678
.LVL2581:
.L2929:
	.loc 16 435 49 view .LVU3725
.LBE3907:
.LBE3906:
	.loc 2 428 23 view .LVU3726
	cmpq	$0, -272(%rbp)
	je	.L2932
.LVL2582:
.L2691:
	.loc 2 428 23 discriminator 1 view .LVU3727
	testq	%r14, %r14
	je	.L2933
.L2692:
.LVL2583:
.LBB3909:
.LBI3909:
	.loc 16 351 7 is_stmt 1 view .LVU3728
.LBB3910:
	.loc 16 354 2 view .LVU3729
	.loc 16 358 2 view .LVU3730
	.loc 16 358 9 is_stmt 0 view .LVU3731
	cmpq	$0, -272(%rbp)
	je	.L2934
.L2693:
	.loc 16 358 9 view .LVU3732
	movq	-272(%rbp), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	andl	$7, %edi
	cmpb	%dil, %al
	jg	.L2694
	testb	%al, %al
	jne	.L2935
.L2694:
	movq	-272(%rbp), %rax
	movzbl	(%rax), %eax
	movb	%al, -216(%rbp)
.LVL2584:
	.loc 16 358 7 view .LVU3733
	testq	%r14, %r14
	je	.L2936
.L2695:
	movq	%r14, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	movq	%r14, %rdx
	andl	$7, %edx
	cmpb	%dl, %al
	jg	.L2696
	testb	%al, %al
	jne	.L2937
.L2696:
	movzbl	-216(%rbp), %eax
	movb	%al, (%r14)
.LVL2585:
	.loc 16 359 7 view .LVU3734
	jmp	.L2678
.LVL2586:
.L2932:
	.loc 16 359 7 view .LVU3735
.LBE3910:
.LBE3909:
	.loc 2 428 23 view .LVU3736
	movl	$0, %esi
	leaq	.Lubsan_data1872(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2587:
	.loc 2 428 23 view .LVU3737
	jmp	.L2691
.L2933:
	.loc 2 428 23 discriminator 1 view .LVU3738
	movl	$0, %esi
	leaq	.Lubsan_data1873(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2588:
	jmp	.L2692
.LVL2589:
.L2934:
.LBB3912:
.LBB3911:
	.loc 16 358 9 view .LVU3739
	movl	$0, %esi
	leaq	.Lubsan_data1874(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2590:
	jmp	.L2693
.L2935:
	.loc 16 358 9 view .LVU3740
	movq	-272(%rbp), %rdi
	call	__asan_report_load1@PLT
.LVL2591:
.L2936:
	.loc 16 358 7 view .LVU3741
	movl	$0, %esi
	leaq	.Lubsan_data1875(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2592:
	jmp	.L2695
.L2937:
	.loc 16 358 7 view .LVU3742
	movq	%r14, %rdi
	call	__asan_report_store1@PLT
.LVL2593:
.L2930:
	.loc 16 358 7 view .LVU3743
.LBE3911:
.LBE3912:
.LBB3913:
.LBB3908:
	.loc 16 435 49 view .LVU3744
	leaq	.Lubsan_data846(%rip), %rdi
	call	__ubsan_handle_nonnull_arg@PLT
.LVL2594:
	.loc 16 435 49 view .LVU3745
	jmp	.L2697
.L2931:
	leaq	.Lubsan_data847(%rip), %rdi
	call	__ubsan_handle_nonnull_arg@PLT
.LVL2595:
	jmp	.L2698
.LVL2596:
.L2677:
	.loc 16 435 49 view .LVU3746
.LBE3908:
.LBE3913:
.LBE3905:
.LBE3904:
	.loc 17 424 17 view .LVU3747
	testq	%rbx, %rbx
	je	.L2699
	testb	$7, %bl
	jne	.L2699
.L2700:
	.loc 17 424 28 discriminator 1 view .LVU3748
	testq	%rbx, %rbx
	je	.L2701
	testb	$7, %bl
	jne	.L2701
.L2702:
.LVL2597:
.LBB3914:
.LBI3914:
	.loc 2 1071 7 is_stmt 1 view .LVU3749
.LBB3915:
	.loc 2 1072 16 is_stmt 0 view .LVU3750
	testq	%rbx, %rbx
	je	.L2703
	testb	$7, %bl
	jne	.L2703
.L2704:
.LVL2598:
	.loc 2 1072 16 view .LVU3751
.LBE3915:
.LBE3914:
	.loc 17 424 17 discriminator 3 view .LVU3752
	movq	-216(%rbp), %r8
	movq	-272(%rbp), %rcx
	movl	$0, %edx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEmmPKcm
.LVL2599:
	jmp	.L2678
.L2699:
	.loc 17 424 17 view .LVU3753
	movq	%rbx, %rsi
	leaq	.Lubsan_data1876(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2600:
	jmp	.L2700
.L2701:
	.loc 17 424 28 discriminator 1 view .LVU3754
	movq	%rbx, %rsi
	leaq	.Lubsan_data1877(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2601:
	jmp	.L2702
.LVL2602:
.L2703:
.LBB3917:
.LBB3916:
	.loc 2 1072 16 view .LVU3755
	movq	%rbx, %rsi
	leaq	.Lubsan_data1878(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2603:
	jmp	.L2704
.LVL2604:
.L2705:
	.loc 2 1072 16 view .LVU3756
.LBE3916:
.LBE3917:
	.loc 17 426 26 view .LVU3757
	movq	%rbx, %rsi
	leaq	.Lubsan_data1879(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2605:
	jmp	.L2706
.LVL2606:
.L2707:
.LBB3918:
.LBB3892:
	.loc 2 256 11 view .LVU3758
	movq	%rbx, %rsi
	leaq	.Lubsan_data1880(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2607:
	jmp	.L2708
.LVL2608:
.L2709:
.LBB3886:
.LBB3882:
	.loc 2 218 26 view .LVU3759
	movq	%rbx, %rsi
	leaq	.Lubsan_data1881(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2609:
	jmp	.L2710
.LVL2610:
.L2712:
	.loc 2 218 26 view .LVU3760
.LBE3882:
.LBE3886:
	.loc 2 257 29 discriminator 1 view .LVU3761
	movq	%rbx, %rsi
	leaq	.Lubsan_data1882(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2611:
	jmp	.L2713
.LVL2612:
.L2714:
.LBB3887:
.LBB3885:
	.loc 2 223 28 view .LVU3762
	movq	%rbx, %rsi
	leaq	.Lubsan_data1883(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2613:
	jmp	.L2715
.LVL2614:
.L2716:
	.loc 2 223 28 view .LVU3763
.LBE3885:
.LBE3887:
	.loc 2 257 31 discriminator 3 view .LVU3764
	cmpq	%rdx, %r14
	jb	.L2718
.L2717:
	addq	%r13, %r14
	je	.L2938
.L2719:
.LVL2615:
.LBB3888:
.LBI3888:
	.loc 16 351 7 is_stmt 1 view .LVU3765
.LBB3889:
	.loc 16 354 2 view .LVU3766
	.loc 16 358 2 view .LVU3767
	.loc 16 358 7 is_stmt 0 view .LVU3768
	testq	%r14, %r14
	je	.L2939
.L2720:
	.loc 16 358 7 view .LVU3769
	movq	%r14, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	movq	%r14, %rdx
	andl	$7, %edx
	cmpb	%dl, %al
	jg	.L2721
	testb	%al, %al
	jne	.L2940
.L2721:
	movb	$0, (%r14)
.LVL2616:
	.loc 16 358 7 view .LVU3770
.LBE3889:
.LBE3888:
	.loc 2 257 21 discriminator 5 view .LVU3771
	leaq	-96(%r12), %rax
	shrq	$3, %rax
	movb	$-8, 2147450880(%rax)
.LVL2617:
	.loc 2 257 21 discriminator 5 view .LVU3772
.LBE3892:
.LBE3918:
	.loc 17 427 15 view .LVU3773
	testq	%rbx, %rbx
	je	.L2722
	testb	$7, %bl
	jne	.L2722
.L2723:
.LVL2618:
	.loc 17 427 15 view .LVU3774
.LBE3921:
.LBE3925:
.LBE3928:
.LBE3941:
.LBB3942:
.LBI3942:
	.loc 2 1455 7 is_stmt 1 view .LVU3775
.LBB3943:
	.loc 2 1458 17 is_stmt 0 view .LVU3776
	testq	%rbx, %rbx
	je	.L2724
	testb	$7, %bl
	jne	.L2724
.L2725:
.LVL2619:
.LBB3944:
.LBI3944:
	.loc 2 397 7 is_stmt 1 view .LVU3777
.LBB3945:
	.loc 2 399 20 is_stmt 0 view .LVU3778
	testq	%rbx, %rbx
	je	.L2726
	testb	$7, %bl
	jne	.L2726
.L2727:
.LVL2620:
.LBB3946:
.LBI3946:
	.loc 2 1084 7 is_stmt 1 view .LVU3779
.LBB3947:
	.loc 2 1085 57 is_stmt 0 view .LVU3780
	testq	%rbx, %rbx
	je	.L2728
	testb	$7, %bl
	jne	.L2728
.L2729:
.LVL2621:
.LBB3948:
.LBI3948:
	.loc 2 341 7 is_stmt 1 view .LVU3781
.LBB3949:
	.loc 2 342 16 is_stmt 0 view .LVU3782
	testq	%rbx, %rbx
	je	.L2730
	testb	$7, %bl
	jne	.L2730
.L2731:
	.loc 2 342 16 view .LVU3783
	testq	%rbx, %rbx
	je	.L2941
.L2732:
	.loc 2 342 16 discriminator 1 view .LVU3784
	testq	%rbx, %rbx
	je	.L2733
	testb	$7, %bl
	jne	.L2733
.L2734:
.LVL2622:
	.loc 2 342 16 discriminator 1 view .LVU3785
.LBE3949:
.LBE3948:
	.loc 2 1085 40 discriminator 2 view .LVU3786
	testq	%rbx, %rbx
	je	.L2942
.L2735:
.LVL2623:
	.loc 2 1085 40 discriminator 2 view .LVU3787
.LBE3947:
.LBE3946:
	.loc 2 399 36 discriminator 2 view .LVU3788
	testq	%rbx, %rbx
	je	.L2736
	testb	$7, %bl
	jne	.L2736
.L2737:
.LVL2624:
.LBB3953:
.LBI3953:
	.loc 2 1071 7 is_stmt 1 view .LVU3789
.LBB3954:
	.loc 2 1072 16 is_stmt 0 view .LVU3790
	testq	%rbx, %rbx
	je	.L2738
	testb	$7, %bl
	jne	.L2738
.L2739:
	.loc 2 1072 16 view .LVU3791
	movq	-232(%rbp), %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2943
	movq	8(%rbx), %r14
.LVL2625:
	.loc 2 1072 16 view .LVU3792
.LBE3954:
.LBE3953:
	.loc 2 399 2 discriminator 4 view .LVU3793
	movabsq	$9223372036854775807, %rax
	subq	%r14, %rax
	movq	-224(%rbp), %rcx
	cmpq	%rcx, %rax
	jb	.L2944
.LVL2626:
	.loc 2 399 2 discriminator 4 view .LVU3794
.LBE3945:
.LBE3944:
	.loc 2 1459 18 view .LVU3795
	testq	%rbx, %rbx
	je	.L2743
	testb	$7, %bl
	jne	.L2743
.L2744:
.LVL2627:
.LBB3959:
.LBI3959:
	.loc 17 413 5 is_stmt 1 view .LVU3796
.LBB3960:
	.loc 17 416 47 is_stmt 0 view .LVU3797
	testq	%rbx, %rbx
	je	.L2745
	testb	$7, %bl
	jne	.L2745
.L2746:
.LVL2628:
.LBB3961:
.LBI3961:
	.loc 2 1071 7 is_stmt 1 view .LVU3798
.LBB3962:
	.loc 2 1072 16 is_stmt 0 view .LVU3799
	testq	%rbx, %rbx
	je	.L2747
	testb	$7, %bl
	jne	.L2747
.L2748:
.LVL2629:
	.loc 2 1072 16 view .LVU3800
.LBE3962:
.LBE3961:
	.loc 17 416 23 discriminator 2 view .LVU3801
	movq	-224(%rbp), %rax
	leaq	(%rax,%r14), %r13
.LVL2630:
	.loc 17 418 34 view .LVU3802
	testq	%rbx, %rbx
	je	.L2749
	testb	$7, %bl
	jne	.L2749
.L2750:
.LVL2631:
.LBB3964:
.LBI3964:
	.loc 2 1169 7 is_stmt 1 view .LVU3803
.LBB3965:
	.loc 2 1171 20 is_stmt 0 view .LVU3804
	testq	%rbx, %rbx
	je	.L2751
	testb	$7, %bl
	jne	.L2751
.L2752:
.LVL2632:
.LBB3966:
.LBI3966:
	.loc 2 262 7 is_stmt 1 view .LVU3805
.LBB3967:
	.loc 2 264 13 is_stmt 0 view .LVU3806
	testq	%rbx, %rbx
	je	.L2753
	testb	$7, %bl
	jne	.L2753
.L2754:
.LVL2633:
.LBB3968:
.LBI3968:
	.loc 2 222 7 is_stmt 1 view .LVU3807
.LBB3969:
	.loc 2 223 28 is_stmt 0 view .LVU3808
	testq	%rbx, %rbx
	je	.L2755
	testb	$7, %bl
	jne	.L2755
.L2756:
	.loc 2 223 28 view .LVU3809
	movq	%rbx, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2945
	movq	(%rbx), %rax
	movq	%rax, -216(%rbp)
.LVL2634:
	.loc 2 223 28 view .LVU3810
.LBE3969:
.LBE3968:
	.loc 2 264 32 discriminator 2 view .LVU3811
	testq	%rbx, %rbx
	je	.L2758
	testb	$7, %bl
	jne	.L2758
.L2759:
.LVL2635:
.LBB3971:
.LBI3971:
	.loc 2 238 7 is_stmt 1 view .LVU3812
.LBB3972:
	.loc 2 241 57 is_stmt 0 view .LVU3813
	testq	%rbx, %rbx
	je	.L2760
	testb	$7, %bl
	jne	.L2760
.L2761:
	.loc 2 241 57 view .LVU3814
	testq	%r15, %r15
	je	.L2946
.L2762:
	.loc 2 241 57 discriminator 1 view .LVU3815
	testq	%rbx, %rbx
	je	.L2763
	testb	$7, %bl
	jne	.L2763
.L2764:
.LVL2636:
	.loc 2 241 57 discriminator 1 view .LVU3816
.LBE3972:
.LBE3971:
	.loc 2 264 2 discriminator 4 view .LVU3817
	movq	-216(%rbp), %rax
	cmpq	%rax, %r15
	je	.L2947
.LVL2637:
	.loc 2 264 2 discriminator 4 view .LVU3818
.LBE3967:
.LBE3966:
	.loc 2 1171 23 discriminator 2 view .LVU3819
	testq	%rbx, %rbx
	je	.L2825
	testb	$7, %bl
	jne	.L2825
.L2826:
	movq	%r15, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L2948
	movq	16(%rbx), %rax
.L2768:
.LVL2638:
	.loc 2 1171 23 discriminator 2 view .LVU3820
.LBE3965:
.LBE3964:
	.loc 17 418 7 discriminator 2 view .LVU3821
	cmpq	%r13, %rax
	jb	.L2769
	.loc 17 420 4 view .LVU3822
	cmpq	$0, -224(%rbp)
	jne	.L2949
.L2770:
	.loc 17 426 26 view .LVU3823
	testq	%rbx, %rbx
	je	.L2797
	testb	$7, %bl
	jne	.L2797
.L2798:
.LVL2639:
.LBB3982:
.LBI3982:
	.loc 2 254 7 is_stmt 1 view .LVU3824
.LBB3983:
	.loc 2 256 11 is_stmt 0 view .LVU3825
	testq	%rbx, %rbx
	je	.L2799
	testb	$7, %bl
	jne	.L2799
.L2800:
.LVL2640:
.LBB3984:
.LBI3984:
	.loc 2 217 7 is_stmt 1 view .LVU3826
.LBB3985:
	.loc 2 218 26 is_stmt 0 view .LVU3827
	testq	%rbx, %rbx
	je	.L2801
	testb	$7, %bl
	jne	.L2801
.L2802:
	.loc 2 218 26 view .LVU3828
	movq	%r13, 8(%rbx)
.LVL2641:
	.loc 2 218 26 view .LVU3829
.LBE3985:
.LBE3984:
	.loc 2 257 21 view .LVU3830
	leaq	-80(%r12), %rax
	shrq	$3, %rax
	movb	$1, 2147450880(%rax)
	.loc 2 257 21 discriminator 1 view .LVU3831
	movb	$0, -80(%r12)
	.loc 2 257 29 discriminator 1 view .LVU3832
	testq	%rbx, %rbx
	je	.L2804
	testb	$7, %bl
	jne	.L2804
.L2805:
.LVL2642:
.LBB3987:
.LBI3987:
	.loc 2 222 7 is_stmt 1 view .LVU3833
.LBB3988:
	.loc 2 223 28 is_stmt 0 view .LVU3834
	testq	%rbx, %rbx
	je	.L2806
	testb	$7, %bl
	jne	.L2806
.L2807:
	.loc 2 223 28 view .LVU3835
	movq	(%rbx), %r14
.LVL2643:
	.loc 2 223 28 view .LVU3836
.LBE3988:
.LBE3987:
	.loc 2 257 31 discriminator 3 view .LVU3837
	leaq	(%r14,%r13), %rdx
	testq	%r13, %r13
	js	.L2808
	cmpq	%r14, %rdx
	jnb	.L2809
.L2810:
	movq	%r14, %rsi
	leaq	.Lubsan_data1927(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL2644:
	jmp	.L2809
.LVL2645:
.L2938:
	.loc 2 257 31 discriminator 3 view .LVU3838
.LBE3983:
.LBE3982:
.LBE3960:
.LBE3959:
.LBE3943:
.LBE3942:
.LBB4035:
.LBB3929:
.LBB3926:
.LBB3922:
.LBB3919:
.LBB3893:
	movl	$0, %esi
	leaq	.Lubsan_data1885(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2646:
	jmp	.L2719
.LVL2647:
.L2939:
.LBB3891:
.LBB3890:
	.loc 16 358 7 view .LVU3839
	movl	$0, %esi
	leaq	.Lubsan_data1887(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2648:
	jmp	.L2720
.L2940:
	.loc 16 358 7 view .LVU3840
	movq	%r14, %rdi
	call	__asan_report_store1@PLT
.LVL2649:
.L2722:
	.loc 16 358 7 view .LVU3841
.LBE3890:
.LBE3891:
.LBE3893:
.LBE3919:
	.loc 17 427 15 view .LVU3842
	movq	%rbx, %rsi
	leaq	.Lubsan_data1888(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2650:
	jmp	.L2723
.LVL2651:
.L2724:
	.loc 17 427 15 view .LVU3843
.LBE3922:
.LBE3926:
.LBE3929:
.LBE4035:
.LBB4036:
.LBB4032:
	.loc 2 1458 17 view .LVU3844
	movq	%rbx, %rsi
	leaq	.Lubsan_data1889(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2652:
	jmp	.L2725
.LVL2653:
.L2726:
.LBB4028:
.LBB3958:
	.loc 2 399 20 view .LVU3845
	movq	%rbx, %rsi
	leaq	.Lubsan_data1890(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2654:
	jmp	.L2727
.LVL2655:
.L2728:
.LBB3956:
.LBB3952:
	.loc 2 1085 57 view .LVU3846
	movq	%rbx, %rsi
	leaq	.Lubsan_data1891(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2656:
	jmp	.L2729
.LVL2657:
.L2730:
.LBB3951:
.LBB3950:
	.loc 2 342 16 view .LVU3847
	movq	%rbx, %rsi
	leaq	.Lubsan_data1892(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2658:
	jmp	.L2731
.L2941:
	.loc 2 342 16 view .LVU3848
	movl	$0, %esi
	leaq	.Lubsan_data1893(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2659:
	jmp	.L2732
.L2733:
	.loc 2 342 16 discriminator 1 view .LVU3849
	movq	%rbx, %rsi
	leaq	.Lubsan_data1894(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2660:
	jmp	.L2734
.LVL2661:
.L2942:
	.loc 2 342 16 discriminator 1 view .LVU3850
.LBE3950:
.LBE3951:
	.loc 2 1085 40 discriminator 2 view .LVU3851
	movl	$0, %esi
	leaq	.Lubsan_data1895(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2662:
	jmp	.L2735
.LVL2663:
.L2736:
	.loc 2 1085 40 discriminator 2 view .LVU3852
.LBE3952:
.LBE3956:
	.loc 2 399 36 discriminator 2 view .LVU3853
	movq	%rbx, %rsi
	leaq	.Lubsan_data1896(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2664:
	jmp	.L2737
.LVL2665:
.L2738:
.LBB3957:
.LBB3955:
	.loc 2 1072 16 view .LVU3854
	movq	%rbx, %rsi
	leaq	.Lubsan_data1897(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2666:
	jmp	.L2739
.L2943:
	.loc 2 1072 16 view .LVU3855
	movq	-232(%rbp), %rdi
	call	__asan_report_load8@PLT
.LVL2667:
.L2944:
	.loc 2 1072 16 view .LVU3856
.LBE3955:
.LBE3957:
	.loc 2 400 24 view .LVU3857
	call	__asan_handle_no_return@PLT
.LVL2668:
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L2950
	leaq	.LC22(%rip), %rdi
	call	_ZSt20__throw_length_errorPKc@PLT
.LVL2669:
.L2950:
	call	__stack_chk_fail@PLT
.LVL2670:
.L2743:
	.loc 2 400 24 view .LVU3858
.LBE3958:
.LBE4028:
	.loc 2 1459 18 view .LVU3859
	movq	%rbx, %rsi
	leaq	.Lubsan_data1898(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2671:
	jmp	.L2744
.LVL2672:
.L2745:
.LBB4029:
.LBB4025:
	.loc 17 416 47 view .LVU3860
	movq	%rbx, %rsi
	leaq	.Lubsan_data1899(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2673:
	jmp	.L2746
.LVL2674:
.L2747:
.LBB3998:
.LBB3963:
	.loc 2 1072 16 view .LVU3861
	movq	%rbx, %rsi
	leaq	.Lubsan_data1900(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2675:
	jmp	.L2748
.LVL2676:
.L2749:
	.loc 2 1072 16 view .LVU3862
.LBE3963:
.LBE3998:
	.loc 17 418 34 view .LVU3863
	movq	%rbx, %rsi
	leaq	.Lubsan_data1901(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2677:
	jmp	.L2750
.LVL2678:
.L2751:
.LBB3999:
.LBB3980:
	.loc 2 1171 20 view .LVU3864
	movq	%rbx, %rsi
	leaq	.Lubsan_data1902(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2679:
	jmp	.L2752
.LVL2680:
.L2753:
.LBB3978:
.LBB3976:
	.loc 2 264 13 view .LVU3865
	movq	%rbx, %rsi
	leaq	.Lubsan_data1903(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2681:
	jmp	.L2754
.LVL2682:
.L2755:
.LBB3974:
.LBB3970:
	.loc 2 223 28 view .LVU3866
	movq	%rbx, %rsi
	leaq	.Lubsan_data1904(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2683:
	jmp	.L2756
.L2945:
	.loc 2 223 28 view .LVU3867
	movq	%rbx, %rdi
	call	__asan_report_load8@PLT
.LVL2684:
.L2758:
	.loc 2 223 28 view .LVU3868
.LBE3970:
.LBE3974:
	.loc 2 264 32 discriminator 2 view .LVU3869
	movq	%rbx, %rsi
	leaq	.Lubsan_data1905(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2685:
	jmp	.L2759
.LVL2686:
.L2760:
.LBB3975:
.LBB3973:
	.loc 2 241 57 view .LVU3870
	movq	%rbx, %rsi
	leaq	.Lubsan_data1906(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2687:
	jmp	.L2761
.L2946:
	.loc 2 241 57 view .LVU3871
	movl	$0, %esi
	leaq	.Lubsan_data1907(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2688:
	jmp	.L2762
.L2763:
	.loc 2 241 57 discriminator 1 view .LVU3872
	movq	%rbx, %rsi
	leaq	.Lubsan_data1908(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2689:
	jmp	.L2764
.LVL2690:
.L2947:
	.loc 2 241 57 discriminator 1 view .LVU3873
.LBE3973:
.LBE3975:
	.loc 2 266 10 view .LVU3874
	testq	%rbx, %rbx
	je	.L2766
	testb	$7, %bl
	jne	.L2766
.L2767:
	.loc 2 266 6 view .LVU3875
	cmpq	$15, %r14
	ja	.L2951
.LBE3976:
.LBE3978:
	.loc 2 1171 23 discriminator 1 view .LVU3876
	movl	$15, %eax
	jmp	.L2768
.L2766:
.LBB3979:
.LBB3977:
	.loc 2 266 10 view .LVU3877
	movq	%rbx, %rsi
	leaq	.Lubsan_data1909(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2691:
	jmp	.L2767
.L2951:
	.loc 2 267 29 view .LVU3878
	call	__asan_handle_no_return@PLT
.LVL2692:
	leaq	.Lubsan_data693(%rip), %rdi
	call	__ubsan_handle_builtin_unreachable@PLT
.LVL2693:
.L2949:
	.loc 2 267 29 view .LVU3879
.LBE3977:
.LBE3979:
.LBE3980:
.LBE3999:
	.loc 17 421 33 view .LVU3880
	testq	%rbx, %rbx
	je	.L2771
	testb	$7, %bl
	jne	.L2771
.L2772:
.LVL2694:
.LBB4000:
.LBI4000:
	.loc 2 222 7 is_stmt 1 view .LVU3881
.LBB4001:
	.loc 2 223 28 is_stmt 0 view .LVU3882
	testq	%rbx, %rbx
	je	.L2773
	testb	$7, %bl
	jne	.L2773
.L2774:
.LVL2695:
	.loc 2 223 28 view .LVU3883
.LBE4001:
.LBE4000:
	.loc 17 421 48 discriminator 2 view .LVU3884
	testq	%rbx, %rbx
	je	.L2775
	testb	$7, %bl
	jne	.L2775
.L2776:
.LVL2696:
.LBB4003:
.LBI4003:
	.loc 2 1071 7 is_stmt 1 view .LVU3885
.LBB4004:
	.loc 2 1072 16 is_stmt 0 view .LVU3886
	testq	%rbx, %rbx
	je	.L2777
	testb	$7, %bl
	jne	.L2777
.L2778:
.LVL2697:
	.loc 2 1072 16 view .LVU3887
.LBE4004:
.LBE4003:
	.loc 17 421 19 discriminator 4 view .LVU3888
	movq	-216(%rbp), %rax
	leaq	(%rax,%r14), %rdx
	testq	%r14, %r14
	js	.L2779
	cmpq	%rax, %rdx
	jnb	.L2780
.L2781:
	movq	-216(%rbp), %rsi
	leaq	.Lubsan_data1914(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL2698:
	jmp	.L2780
.L2771:
	.loc 17 421 33 view .LVU3889
	movq	%rbx, %rsi
	leaq	.Lubsan_data1910(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2699:
	jmp	.L2772
.LVL2700:
.L2773:
.LBB4006:
.LBB4002:
	.loc 2 223 28 view .LVU3890
	movq	%rbx, %rsi
	leaq	.Lubsan_data1911(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2701:
	jmp	.L2774
.LVL2702:
.L2775:
	.loc 2 223 28 view .LVU3891
.LBE4002:
.LBE4006:
	.loc 17 421 48 discriminator 2 view .LVU3892
	movq	%rbx, %rsi
	leaq	.Lubsan_data1912(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2703:
	jmp	.L2776
.LVL2704:
.L2777:
.LBB4007:
.LBB4005:
	.loc 2 1072 16 view .LVU3893
	movq	%rbx, %rsi
	leaq	.Lubsan_data1913(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2705:
	jmp	.L2778
.LVL2706:
.L2779:
	.loc 2 1072 16 view .LVU3894
.LBE4005:
.LBE4007:
	.loc 17 421 19 discriminator 4 view .LVU3895
	cmpq	%rdx, -216(%rbp)
	jb	.L2781
.L2780:
	movq	-216(%rbp), %rax
	addq	%r14, %rax
	movq	%rax, %r14
.LVL2707:
.LBB4008:
.LBI4008:
	.loc 2 425 7 is_stmt 1 view .LVU3896
.LBB4009:
	.loc 2 427 2 is_stmt 0 view .LVU3897
	cmpq	$1, -224(%rbp)
	je	.L2952
.LVL2708:
.LBB4010:
.LBI4010:
	.loc 16 427 7 is_stmt 1 view .LVU3898
.LBB4011:
	.loc 16 429 2 view .LVU3899
	.loc 16 432 2 view .LVU3900
	.loc 16 435 2 view .LVU3901
	.loc 16 435 49 is_stmt 0 view .LVU3902
	testq	%rax, %rax
	je	.L2953
.LVL2709:
.L2789:
	.loc 16 435 49 view .LVU3903
	cmpq	$0, -280(%rbp)
	je	.L2954
.L2790:
	movq	-224(%rbp), %rdx
	movq	-280(%rbp), %rsi
	movq	%r14, %rdi
	call	memcpy@PLT
.LVL2710:
	.loc 16 435 49 view .LVU3904
	jmp	.L2770
.LVL2711:
.L2952:
	.loc 16 435 49 view .LVU3905
.LBE4011:
.LBE4010:
	.loc 2 428 23 view .LVU3906
	cmpq	$0, -280(%rbp)
	je	.L2955
.LVL2712:
.L2783:
	.loc 2 428 23 discriminator 1 view .LVU3907
	testq	%r14, %r14
	je	.L2956
.L2784:
.LVL2713:
.LBB4013:
.LBI4013:
	.loc 16 351 7 is_stmt 1 view .LVU3908
.LBB4014:
	.loc 16 354 2 view .LVU3909
	.loc 16 358 2 view .LVU3910
	.loc 16 358 9 is_stmt 0 view .LVU3911
	cmpq	$0, -280(%rbp)
	je	.L2957
.L2785:
	.loc 16 358 9 view .LVU3912
	movq	-280(%rbp), %rcx
	movq	%rcx, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	andl	$7, %ecx
	cmpb	%cl, %al
	jg	.L2786
	testb	%al, %al
	jne	.L2958
.L2786:
	movq	-280(%rbp), %rax
	movzbl	(%rax), %r15d
	.loc 16 358 7 view .LVU3913
	testq	%r14, %r14
	je	.L2959
.L2787:
	movq	%r14, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	movq	%r14, %rdx
	andl	$7, %edx
	cmpb	%dl, %al
	jg	.L2788
	testb	%al, %al
	jne	.L2960
.L2788:
	movb	%r15b, (%r14)
.LVL2714:
	.loc 16 359 7 view .LVU3914
	jmp	.L2770
.LVL2715:
.L2955:
	.loc 16 359 7 view .LVU3915
.LBE4014:
.LBE4013:
	.loc 2 428 23 view .LVU3916
	movl	$0, %esi
	leaq	.Lubsan_data1915(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2716:
	.loc 2 428 23 view .LVU3917
	jmp	.L2783
.L2956:
	.loc 2 428 23 discriminator 1 view .LVU3918
	movl	$0, %esi
	leaq	.Lubsan_data1916(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2717:
	jmp	.L2784
.LVL2718:
.L2957:
.LBB4016:
.LBB4015:
	.loc 16 358 9 view .LVU3919
	movl	$0, %esi
	leaq	.Lubsan_data1917(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2719:
	jmp	.L2785
.L2958:
	.loc 16 358 9 view .LVU3920
	movq	-280(%rbp), %rdi
	call	__asan_report_load1@PLT
.LVL2720:
.L2959:
	.loc 16 358 7 view .LVU3921
	movl	$0, %esi
	leaq	.Lubsan_data1918(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2721:
	jmp	.L2787
.L2960:
	.loc 16 358 7 view .LVU3922
	movq	%r14, %rdi
	call	__asan_report_store1@PLT
.LVL2722:
.L2953:
	.loc 16 358 7 view .LVU3923
.LBE4015:
.LBE4016:
.LBB4017:
.LBB4012:
	.loc 16 435 49 view .LVU3924
	leaq	.Lubsan_data846(%rip), %rdi
	call	__ubsan_handle_nonnull_arg@PLT
.LVL2723:
	.loc 16 435 49 view .LVU3925
	jmp	.L2789
.L2954:
	leaq	.Lubsan_data847(%rip), %rdi
	call	__ubsan_handle_nonnull_arg@PLT
.LVL2724:
	jmp	.L2790
.LVL2725:
.L2769:
	.loc 16 435 49 view .LVU3926
.LBE4012:
.LBE4017:
.LBE4009:
.LBE4008:
	.loc 17 424 17 view .LVU3927
	testq	%rbx, %rbx
	je	.L2791
	testb	$7, %bl
	jne	.L2791
.L2792:
	.loc 17 424 28 discriminator 1 view .LVU3928
	testq	%rbx, %rbx
	je	.L2793
	testb	$7, %bl
	jne	.L2793
.L2794:
.LVL2726:
.LBB4018:
.LBI4018:
	.loc 2 1071 7 is_stmt 1 view .LVU3929
.LBB4019:
	.loc 2 1072 16 is_stmt 0 view .LVU3930
	testq	%rbx, %rbx
	je	.L2795
	testb	$7, %bl
	jne	.L2795
.L2796:
.LVL2727:
	.loc 2 1072 16 view .LVU3931
.LBE4019:
.LBE4018:
	.loc 17 424 17 discriminator 3 view .LVU3932
	movq	-224(%rbp), %r8
	movq	-280(%rbp), %rcx
	movl	$0, %edx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEmmPKcm
.LVL2728:
.LEHE37:
	jmp	.L2770
.L2791:
	.loc 17 424 17 view .LVU3933
	movq	%rbx, %rsi
	leaq	.Lubsan_data1919(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2729:
	jmp	.L2792
.L2793:
	.loc 17 424 28 discriminator 1 view .LVU3934
	movq	%rbx, %rsi
	leaq	.Lubsan_data1920(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2730:
	jmp	.L2794
.LVL2731:
.L2795:
.LBB4021:
.LBB4020:
	.loc 2 1072 16 view .LVU3935
	movq	%rbx, %rsi
	leaq	.Lubsan_data1921(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2732:
	jmp	.L2796
.LVL2733:
.L2797:
	.loc 2 1072 16 view .LVU3936
.LBE4020:
.LBE4021:
	.loc 17 426 26 view .LVU3937
	movq	%rbx, %rsi
	leaq	.Lubsan_data1922(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2734:
	jmp	.L2798
.LVL2735:
.L2799:
.LBB4022:
.LBB3996:
	.loc 2 256 11 view .LVU3938
	movq	%rbx, %rsi
	leaq	.Lubsan_data1923(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2736:
	jmp	.L2800
.LVL2737:
.L2801:
.LBB3990:
.LBB3986:
	.loc 2 218 26 view .LVU3939
	movq	%rbx, %rsi
	leaq	.Lubsan_data1924(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2738:
	jmp	.L2802
.LVL2739:
.L2804:
	.loc 2 218 26 view .LVU3940
.LBE3986:
.LBE3990:
	.loc 2 257 29 discriminator 1 view .LVU3941
	movq	%rbx, %rsi
	leaq	.Lubsan_data1925(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2740:
	jmp	.L2805
.LVL2741:
.L2806:
.LBB3991:
.LBB3989:
	.loc 2 223 28 view .LVU3942
	movq	%rbx, %rsi
	leaq	.Lubsan_data1926(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2742:
	jmp	.L2807
.LVL2743:
.L2808:
	.loc 2 223 28 view .LVU3943
.LBE3989:
.LBE3991:
	.loc 2 257 31 discriminator 3 view .LVU3944
	cmpq	%rdx, %r14
	jb	.L2810
.L2809:
	addq	%r13, %r14
	je	.L2961
.L2811:
.LVL2744:
.LBB3992:
.LBI3992:
	.loc 16 351 7 is_stmt 1 view .LVU3945
.LBB3993:
	.loc 16 354 2 view .LVU3946
	.loc 16 358 2 view .LVU3947
	.loc 16 358 7 is_stmt 0 view .LVU3948
	testq	%r14, %r14
	je	.L2962
.L2812:
	.loc 16 358 7 view .LVU3949
	movq	%r14, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	movq	%r14, %rdx
	andl	$7, %edx
	cmpb	%dl, %al
	jg	.L2813
	testb	%al, %al
	jne	.L2963
.L2813:
	movb	$0, (%r14)
.LVL2745:
	.loc 16 358 7 view .LVU3950
.LBE3993:
.LBE3992:
	.loc 2 257 21 discriminator 5 view .LVU3951
	subq	$80, %r12
.LVL2746:
	.loc 2 257 21 discriminator 5 view .LVU3952
	shrq	$3, %r12
.LVL2747:
	.loc 2 257 21 discriminator 5 view .LVU3953
	movb	$-8, 2147450880(%r12)
.LVL2748:
	.loc 2 257 21 discriminator 5 view .LVU3954
.LBE3996:
.LBE4022:
	.loc 17 427 15 view .LVU3955
	testq	%rbx, %rbx
	je	.L2814
	testb	$7, %bl
	jne	.L2814
.LVL2749:
.L2474:
	.loc 17 427 15 view .LVU3956
.LBE4025:
.LBE4029:
.LBE4032:
.LBE4036:
	.loc 2 3528 5 view .LVU3957
	movq	-240(%rbp), %rsi
	cmpq	%rsi, -256(%rbp)
	jne	.L2964
	pxor	%xmm0, %xmm0
	movq	-264(%rbp), %rax
	movups	%xmm0, 2147450880(%rax)
.L2473:
	.loc 2 3541 5 view .LVU3958
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L2965
	movq	%rbx, %rax
	addq	$264, %rsp
	popq	%rbx
.LVL2750:
	.loc 2 3541 5 view .LVU3959
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.LVL2751:
.L2961:
	.cfi_restore_state
.LBB4037:
.LBB4033:
.LBB4030:
.LBB4026:
.LBB4023:
.LBB3997:
	.loc 2 257 31 discriminator 3 view .LVU3960
	movl	$0, %esi
	leaq	.Lubsan_data1928(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2752:
	jmp	.L2811
.LVL2753:
.L2962:
.LBB3995:
.LBB3994:
	.loc 16 358 7 view .LVU3961
	movl	$0, %esi
	leaq	.Lubsan_data1930(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2754:
	jmp	.L2812
.L2963:
	.loc 16 358 7 view .LVU3962
	movq	%r14, %rdi
	call	__asan_report_store1@PLT
.LVL2755:
.L2814:
	.loc 16 358 7 view .LVU3963
.LBE3994:
.LBE3995:
.LBE3997:
.LBE4023:
	.loc 17 427 15 view .LVU3964
	movq	%rbx, %rsi
	leaq	.Lubsan_data1931(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2756:
	.loc 17 427 15 view .LVU3965
.LBE4026:
.LBE4030:
.LBE4033:
.LBE4037:
	.loc 2 3540 14 view .LVU3966
	jmp	.L2474
.L2824:
	.loc 2 3540 14 view .LVU3967
	movq	%r12, %rdi
.LEHB38:
	call	_Unwind_Resume@PLT
.LVL2757:
.LEHE38:
.L2825:
.LBB4038:
.LBB4034:
.LBB4031:
.LBB4027:
.LBB4024:
.LBB3981:
	.loc 2 1171 23 discriminator 2 view .LVU3968
	movq	%rbx, %rsi
	leaq	.Lubsan_data1936(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2758:
	jmp	.L2826
.L2948:
	.loc 2 1171 23 discriminator 2 view .LVU3969
	movq	%r15, %rdi
	call	__asan_report_load8@PLT
.LVL2759:
.L2828:
	.loc 2 1171 23 discriminator 2 view .LVU3970
.LBE3981:
.LBE4024:
.LBE4027:
.LBE4031:
.LBE4034:
.LBE4038:
.LBB4039:
.LBB3930:
.LBB3927:
.LBB3923:
.LBB3920:
.LBB3877:
	movq	%rbx, %rsi
	leaq	.Lubsan_data1937(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2760:
	jmp	.L2829
.L2885:
	.loc 2 1171 23 discriminator 2 view .LVU3971
	movq	%r15, %rdi
	call	__asan_report_load8@PLT
.LVL2761:
.L2831:
	.loc 2 1171 23 discriminator 2 view .LVU3972
.LBE3877:
.LBE3920:
.LBE3923:
.LBE3927:
.LBE3930:
.LBE4039:
.LBB4040:
.LBB3837:
.LBB3833:
.LBB3820:
	.loc 2 283 14 view .LVU3973
	movq	%rbx, %rsi
	leaq	.Lubsan_data1938(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2762:
	jmp	.L2832
.L2833:
	.loc 2 283 14 discriminator 1 view .LVU3974
	movq	%rbx, %rsi
	leaq	.Lubsan_data1939(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2763:
	jmp	.L2834
.LVL2764:
.L2835:
.LBB3818:
.LBB3816:
	.loc 2 289 62 view .LVU3975
	movq	%rbx, %rsi
	leaq	.Lubsan_data1940(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2765:
	.loc 2 289 62 view .LVU3976
	jmp	.L2836
.LVL2766:
.L2837:
.LBB3813:
.LBB3799:
	.loc 2 223 28 view .LVU3977
	movq	%rbx, %rsi
	leaq	.Lubsan_data1941(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2767:
	jmp	.L2838
.LVL2768:
.L2839:
	.loc 2 223 28 view .LVU3978
.LBE3799:
.LBE3813:
	.loc 2 289 51 discriminator 2 view .LVU3979
	movq	%rbx, %rsi
	leaq	.Lubsan_data1942(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2769:
	jmp	.L2840
.LVL2770:
.L2841:
.LBB3814:
.LBB3802:
	.loc 2 337 16 view .LVU3980
	movq	%rbx, %rsi
	leaq	.Lubsan_data1943(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2771:
	jmp	.L2842
.L2914:
	.loc 2 337 16 view .LVU3981
	movl	$0, %esi
	leaq	.Lubsan_data1944(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2772:
	jmp	.L2843
.LVL2773:
.L2915:
	.loc 2 337 16 view .LVU3982
.LBE3802:
.LBE3814:
	.loc 2 289 34 discriminator 4 view .LVU3983
	movl	$0, %esi
	leaq	.Lubsan_data1945(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2774:
	jmp	.L2844
.LVL2775:
.L2916:
.LBB3815:
.LBB3812:
	.loc 9 517 23 view .LVU3984
	movl	$0, %esi
	leaq	.Lubsan_data1946(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2776:
	jmp	.L2845
.LVL2777:
.L2917:
.LBB3811:
.LBB3810:
	.loc 10 210 35 view .LVU3985
	movl	$0, %esi
	leaq	.Lubsan_data1947(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2778:
	jmp	.L2846
.LVL2779:
.L2847:
	.loc 10 210 35 view .LVU3986
.LBE3810:
.LBE3811:
.LBE3812:
.LBE3815:
.LBE3816:
.LBE3818:
.LBE3820:
.LBE3833:
.LBB3834:
.LBB3705:
	.loc 2 1171 23 discriminator 2 view .LVU3987
	movq	%rbx, %rsi
	leaq	.Lubsan_data1948(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2780:
	jmp	.L2848
.L2876:
	.loc 2 1171 23 discriminator 2 view .LVU3988
	movq	%r15, %rdi
	call	__asan_report_load8@PLT
.LVL2781:
.L2964:
	.loc 2 1171 23 discriminator 2 view .LVU3989
.LBE3705:
.LBE3834:
.LBE3837:
.LBE4040:
	.loc 2 3528 5 view .LVU3990
	movq	$1172321806, (%rsi)
	movdqa	.LC1(%rip), %xmm0
	movq	-264(%rbp), %rdi
	movups	%xmm0, 2147450880(%rdi)
	movq	120(%rsi), %rax
	movb	$0, (%rax)
	jmp	.L2473
.L2965:
	.loc 2 3541 5 view .LVU3991
	call	__stack_chk_fail@PLT
.LVL2782:
	.cfi_endproc
.LFE7136:
	.section	.gcc_except_table
.LLSDA7136:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE7136-.LLSDACSB7136
.LLSDACSB7136:
	.uleb128 .LEHB37-.LFB7136
	.uleb128 .LEHE37-.LEHB37
	.uleb128 .L2854-.LFB7136
	.uleb128 0
	.uleb128 .LEHB38-.LFB7136
	.uleb128 .LEHE38-.LEHB38
	.uleb128 0
	.uleb128 0
.LLSDACSE7136:
	.section	.text._ZSt12__str_concatINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEET_PKNS6_10value_typeENS6_9size_typeES9_SA_RKNS6_14allocator_typeE,"axG",@progbits,_ZSt12__str_concatINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEET_PKNS6_10value_typeENS6_9size_typeES9_SA_RKNS6_14allocator_typeE,comdat
	.size	_ZSt12__str_concatINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEET_PKNS6_10value_typeENS6_9size_typeES9_SA_RKNS6_14allocator_typeE, .-_ZSt12__str_concatINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEET_PKNS6_10value_typeENS6_9size_typeES9_SA_RKNS6_14allocator_typeE
	.section	.rodata._ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_.str1.1,"aMS",@progbits,1
.LC23:
	.string	"1 32 1 9 <unknown>"
	.section	.text._ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_,"axG",@progbits,_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_,comdat
	.weak	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_
	.type	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_, @function
_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_:
.LASANPC6864:
.LVL2783:
.LFB6864:
	.loc 2 3607 5 is_stmt 1 view -0
	.cfi_startproc
	.loc 2 3607 5 is_stmt 0 view .LVU3993
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$136, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rdi, %r12
	movq	%rsi, %rbx
	movq	%rdx, %r14
	leaq	-144(%rbp), %r13
	movq	%r13, -168(%rbp)
	cmpl	$0, __asan_option_detect_stack_use_after_return(%rip)
	jne	.L3000
.LVL2784:
.L2966:
	.loc 2 3607 5 view .LVU3994
	leaq	96(%r13), %rax
	movq	%rax, -176(%rbp)
	movq	$1102416563, 0(%r13)
	leaq	.LC23(%rip), %rax
	movq	%rax, 8(%r13)
	leaq	.LASANPC6864(%rip), %rax
	movq	%rax, 16(%r13)
	movq	%r13, %r15
	shrq	$3, %r15
	movl	$-235802127, 2147450880(%r15)
	movl	$-202116351, 2147450884(%r15)
	.loc 2 3607 5 view .LVU3995
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
.LVL2785:
.LBB4058:
.LBI4058:
	.loc 2 2629 7 is_stmt 1 view .LVU3996
.LBB4059:
	.loc 2 2630 32 is_stmt 0 view .LVU3997
	testq	%rbx, %rbx
	je	.L2970
	testb	$7, %bl
	jne	.L2970
.L2971:
.LVL2786:
.LBB4060:
.LBI4060:
	.loc 2 341 7 is_stmt 1 view .LVU3998
.LBB4061:
	.loc 2 342 16 is_stmt 0 view .LVU3999
	testq	%rbx, %rbx
	je	.L2972
	testb	$7, %bl
	jne	.L2972
.L2973:
	.loc 2 342 16 view .LVU4000
	testq	%rbx, %rbx
	je	.L3001
.L2974:
	.loc 2 342 16 discriminator 1 view .LVU4001
	testq	%rbx, %rbx
	je	.L2975
	testb	$7, %bl
	jne	.L2975
.L2976:
.LVL2787:
	.loc 2 342 16 discriminator 1 view .LVU4002
.LBE4061:
.LBE4060:
	.loc 2 2630 33 discriminator 2 view .LVU4003
	testq	%rbx, %rbx
	je	.L3002
.L2977:
.LVL2788:
.LBB4063:
.LBI4063:
	.loc 10 167 7 is_stmt 1 view .LVU4004
.LBB4064:
	.loc 10 168 34 is_stmt 0 discriminator 1 view .LVU4005
	testq	%rbx, %rbx
	je	.L3003
.L2978:
.LVL2789:
.LBB4065:
.LBI4065:
	.loc 11 92 7 is_stmt 1 view .LVU4006
	.loc 11 92 7 is_stmt 0 view .LVU4007
.LBE4065:
.LBE4064:
.LBE4063:
.LBE4059:
.LBE4058:
.LBB4070:
.LBI4070:
	.loc 16 393 7 is_stmt 1 view .LVU4008
.LBB4071:
	.loc 16 396 2 view .LVU4009
	.loc 16 399 2 view .LVU4010
	.loc 16 399 25 is_stmt 0 view .LVU4011
	testq	%r14, %r14
	je	.L3004
.L2979:
	.loc 16 399 25 view .LVU4012
	movq	%r14, %rdi
	call	strlen@PLT
.LVL2790:
	movq	%rax, -160(%rbp)
.LVL2791:
	.loc 16 399 25 view .LVU4013
.LBE4071:
.LBE4070:
	.loc 2 3612 63 view .LVU4014
	testq	%rbx, %rbx
	je	.L2980
	testb	$7, %bl
	jne	.L2980
.L2981:
.LVL2792:
.LBB4073:
.LBI4073:
	.loc 2 1071 7 is_stmt 1 view .LVU4015
.LBB4074:
	.loc 2 1072 16 is_stmt 0 view .LVU4016
	testq	%rbx, %rbx
	je	.L2982
	testb	$7, %bl
	jne	.L2982
.L2983:
	.loc 2 1072 16 view .LVU4017
	leaq	8(%rbx), %rdx
	cmpq	$-8, %rbx
	jnb	.L3005
.L2984:
	leaq	8(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L3006
	movq	8(%rbx), %rax
	movq	%rax, -152(%rbp)
.LVL2793:
	.loc 2 1072 16 view .LVU4018
.LBE4074:
.LBE4073:
	.loc 2 3612 49 view .LVU4019
	testq	%rbx, %rbx
	je	.L2986
	testb	$7, %bl
	jne	.L2986
.L2987:
.LVL2794:
.LBB4076:
.LBI4076:
	.loc 2 2595 7 is_stmt 1 view .LVU4020
.LBB4077:
	.loc 2 2596 23 is_stmt 0 view .LVU4021
	testq	%rbx, %rbx
	je	.L2988
	testb	$7, %bl
	jne	.L2988
.L2989:
.LVL2795:
.LBB4078:
.LBI4078:
	.loc 2 222 7 is_stmt 1 view .LVU4022
.LBB4079:
	.loc 2 223 28 is_stmt 0 view .LVU4023
	testq	%rbx, %rbx
	je	.L2990
	testb	$7, %bl
	jne	.L2990
.L2991:
	.loc 2 223 28 view .LVU4024
	movq	%rbx, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L3007
	movq	(%rbx), %rbx
.LVL2796:
	.loc 2 223 28 view .LVU4025
.LBE4079:
.LBE4078:
.LBE4077:
.LBE4076:
	.loc 2 3614 31 discriminator 2 view .LVU4026
	testq	%r12, %r12
	je	.L2993
	testb	$7, %r12b
	jne	.L2993
.L2994:
	movq	%r12, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %ecx
	leaq	31(%r12), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %edx
	andl	$7, %eax
	cmpb	%al, %dl
	setle	%sil
	testb	%dl, %dl
	setne	%al
	testb	%al, %sil
	jne	.L2998
	testb	%cl, %cl
	setne	%dl
	setle	%al
	testb	%al, %dl
	jne	.L2998
	movq	-176(%rbp), %r9
	subq	$64, %r9
	movq	-160(%rbp), %r8
	movq	%r14, %rcx
	movq	-152(%rbp), %rdx
	movq	%rbx, %rsi
	movq	%r12, %rdi
	call	_ZSt12__str_concatINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEET_PKNS6_10value_typeENS6_9size_typeES9_SA_RKNS6_14allocator_typeE
.LVL2797:
.LBB4083:
.LBI4083:
	.loc 10 184 7 is_stmt 1 view .LVU4027
.LBE4083:
	.loc 2 3607 5 is_stmt 0 view .LVU4028
	cmpq	%r13, -168(%rbp)
	jne	.L3008
	movq	$0, 2147450880(%r15)
.L2968:
	.loc 2 3615 5 view .LVU4029
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L3009
	movq	%r12, %rax
	addq	$136, %rsp
	popq	%rbx
	popq	%r12
.LVL2798:
	.loc 2 3615 5 view .LVU4030
	popq	%r13
.LVL2799:
	.loc 2 3615 5 view .LVU4031
	popq	%r14
.LVL2800:
	.loc 2 3615 5 view .LVU4032
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.LVL2801:
.L3000:
	.cfi_restore_state
	.loc 2 3607 5 view .LVU4033
	movl	$64, %edi
.LVL2802:
	.loc 2 3607 5 view .LVU4034
	call	__asan_stack_malloc_0@PLT
.LVL2803:
	.loc 2 3607 5 view .LVU4035
	testq	%rax, %rax
	cmovne	%rax, %r13
	jmp	.L2966
.LVL2804:
.L2970:
.LBB4084:
.LBB4069:
	.loc 2 2630 32 view .LVU4036
	movq	%rbx, %rsi
	leaq	.Lubsan_data1949(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2805:
	jmp	.L2971
.LVL2806:
.L2972:
.LBB4067:
.LBB4062:
	.loc 2 342 16 view .LVU4037
	movq	%rbx, %rsi
	leaq	.Lubsan_data1950(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2807:
	jmp	.L2973
.L3001:
	.loc 2 342 16 view .LVU4038
	movl	$0, %esi
	leaq	.Lubsan_data1951(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2808:
	jmp	.L2974
.L2975:
	.loc 2 342 16 discriminator 1 view .LVU4039
	movq	%rbx, %rsi
	leaq	.Lubsan_data1952(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2809:
	jmp	.L2976
.LVL2810:
.L3002:
	.loc 2 342 16 discriminator 1 view .LVU4040
.LBE4062:
.LBE4067:
	.loc 2 2630 33 discriminator 2 view .LVU4041
	movl	$0, %esi
	leaq	.Lubsan_data1953(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2811:
	jmp	.L2977
.LVL2812:
.L3003:
.LBB4068:
.LBB4066:
	.loc 10 168 34 discriminator 1 view .LVU4042
	movl	$0, %esi
	leaq	.Lubsan_data1955(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2813:
	jmp	.L2978
.LVL2814:
.L3004:
	.loc 10 168 34 discriminator 1 view .LVU4043
.LBE4066:
.LBE4068:
.LBE4069:
.LBE4084:
.LBB4085:
.LBB4072:
	.loc 16 399 25 view .LVU4044
	leaq	.Lubsan_data844(%rip), %rdi
	call	__ubsan_handle_nonnull_arg@PLT
.LVL2815:
	jmp	.L2979
.LVL2816:
.L2980:
	.loc 16 399 25 view .LVU4045
.LBE4072:
.LBE4085:
	.loc 2 3612 63 view .LVU4046
	movq	%rbx, %rsi
	leaq	.Lubsan_data1956(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2817:
	jmp	.L2981
.LVL2818:
.L2982:
.LBB4086:
.LBB4075:
	.loc 2 1072 16 view .LVU4047
	movq	%rbx, %rsi
	leaq	.Lubsan_data1957(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2819:
	jmp	.L2983
.L3005:
	.loc 2 1072 16 view .LVU4048
	movq	%rbx, %rsi
	leaq	.Lubsan_data1958(%rip), %rdi
	call	__ubsan_handle_pointer_overflow@PLT
.LVL2820:
	jmp	.L2984
.L3006:
	.loc 2 1072 16 view .LVU4049
	call	__asan_report_load8@PLT
.LVL2821:
.L2986:
	.loc 2 1072 16 view .LVU4050
.LBE4075:
.LBE4086:
	.loc 2 3612 49 view .LVU4051
	movq	%rbx, %rsi
	leaq	.Lubsan_data1959(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2822:
	jmp	.L2987
.LVL2823:
.L2988:
.LBB4087:
.LBB4082:
	.loc 2 2596 23 view .LVU4052
	movq	%rbx, %rsi
	leaq	.Lubsan_data1960(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2824:
	jmp	.L2989
.LVL2825:
.L2990:
.LBB4081:
.LBB4080:
	.loc 2 223 28 view .LVU4053
	movq	%rbx, %rsi
	leaq	.Lubsan_data1961(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2826:
	jmp	.L2991
.L3007:
	.loc 2 223 28 view .LVU4054
	movq	%rbx, %rdi
	call	__asan_report_load8@PLT
.LVL2827:
.L2993:
	.loc 2 223 28 view .LVU4055
.LBE4080:
.LBE4081:
.LBE4082:
.LBE4087:
	.loc 2 3614 31 discriminator 2 view .LVU4056
	movq	%r12, %rsi
	leaq	.Lubsan_data1962(%rip), %rdi
	call	__ubsan_handle_type_mismatch_v1@PLT
.LVL2828:
	jmp	.L2994
.L2998:
	.loc 2 3614 31 discriminator 2 view .LVU4057
	movl	$32, %esi
	movq	%r12, %rdi
	call	__asan_report_store_n@PLT
.LVL2829:
.L3008:
	.loc 2 3607 5 view .LVU4058
	movq	$1172321806, 0(%r13)
	movabsq	$-723401728380766731, %rax
	movq	%rax, 2147450880(%r15)
	movq	56(%r13), %rax
	movb	$0, (%rax)
	jmp	.L2968
.L3009:
	.loc 2 3615 5 view .LVU4059
	call	__stack_chk_fail@PLT
.LVL2830:
	.cfi_endproc
.LFE6864:
	.size	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_, .-_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_
	.globl	__asan_stack_malloc_8
	.section	.rodata.str1.8
	.align 8
.LC24:
	.ascii	"130 48 1 9 <unknown> 64 1 9 <unknown> 80 1 9 <unknown> 96 1 "
	.ascii	"9 <unknown> 112 1 9 <unknown> 128 1 9 <unknown> 144 1 9 <unk"
	.ascii	"nown> 160 1 9 <unknown> 176 1 9 <unknown> 192 1 7 __elem0 20"
	.ascii	"8 1 7 __c:179 224 8 7 __n:179 256 8 4 k:58 288 8 5 f:179 320"
	.ascii	" 8 5 f:179 352 8 4 k:85 384 8 4 k:80 416 8 4 k:90 448 8 11 b"
	.ascii	"ounded:108 480 8 9 empty:111 512 8 7 bad:112 544 8 7 bad:113"
	.ascii	" 576 8 5 a:116 608 8 5 b:116 640 8 5 k:141 672 8 5 k:149 704"
	.ascii	" 8 5 k:159 736 8 10 replay:172 768 8 9 start:175 800 8 5 f:1"
	.ascii	"79 832 8 5 p:168 864 8 5 f:179 896 8 5 p:169 928 8 5 f:179 9"
	.ascii	"60 8 5 p:170 992 8 5 f:179 1024 8 5 p:171 1056 16 9 <unknown"
	.ascii	"> 1088 16 9 <unknown> 1120 16 9 <unknown> 1152 16 9 <unknown"
	.ascii	"> 1184 16 9 <unknown> 1216 16 9 <unknown> 1248 16 9 <unknown"
	.ascii	"> 1280 16 9 <unknown> 1312 16 9 <unknown> 1344 24 9 before:6"
	.ascii	"0 1408 24 9 <unknown> 1472 24 9 <unknown> 1536 24 9 <unknown"
	.ascii	"> 1600 24 9 <unknown> 1664 24 7 tmg:159 1728 24 7 bad:168 17"
	.ascii	"92 24 9 entry:175 1856 32 9 <unknown> 1920 32 9 <unknown> 19"
	.ascii	"84 32 9 <unknown> 2048 32 9 <unknown> 2112 40 7 lut:148 2192"
	.ascii	" 48 9 <unknown> 2272 48 9 <unknown> 2352 48 9 <unknown> 2432"
	.ascii	" 48 9 <unknown> 2512 48 4 e:90 2592 48 9 future:94 2672 48 1"
	.ascii	"1 invalid:104 2752 48 9 <unknown> 2832 48 9 <unknown> 2912 4"
	.ascii	"8 5 x:116 2992 48 5 y:116 3072 48 9 <unknown> 3152 48 9 <unk"
	.ascii	"nown> 3232 48 9 <unknown> 3312 48 9 <unknown> 3392 48 9 <unk"
	.ascii	"nown> 3472 48 9 <unknown> 3552 48 9 <unknown> 3632 48 9 <unk"
	.ascii	"nown> 3712 20 10 indices:78 3776 32 9 <unknown> 3840 32 9 <u"
	.ascii	"nknown> 3904 32 9 <unknown> 3968 32 9 <unknown> 4032 32 9 <u"
	.ascii	"nknown> 4096 32 9 <unknown> 4160 32 9 <unknown> 4224 32 9 <u"
	.ascii	"nknown> 4288 32 9 <unknown> 4352 32 9 <unknown> 4416 32 9 <u"
	.ascii	"nknown> 4480 32 9 <unknown> 4544 32 9 <unknown> 4608 32 9 <u"
	.ascii	"nknown> 4672 32 9 <unknown> 4736 32 9 <unknown> 4800 32 11 e"
	.ascii	"xpected:78 4864 32 9 <unknown> 4928 32 9 <unknown> 4992 32 9"
	.ascii	" <unknown> 5056 32 9 <unknown> 5120 32 9 <unknown> 5184 32 9"
	.ascii	" <unknown> 5248 32 9 <unknown> 5312 32 9 <unknown> 5376 48 9"
	.ascii	" <unknown> 5456 48 9 <unknown> 5536 48 9 <unknown> 5616 48 9"
	.ascii	" <unknown> 5696 64 1"
	.ascii	"2 expected:166 5792 184 15 insufficient:61 6048 184 9 commit"
	.ascii	":65 6304 184 9 <unknown> 6560 184 9 <unknown> 6816 184 9 rep"
	.ascii	"ort:87 7072 184 9 report:81 7328 184 9 <unknown> 7584 184 9 "
	.ascii	"<unknown> 7840 184 9 "
	.string	"<unknown> 8096 184 9 <unknown> 8352 184 9 <unknown> 8608 184 9 <unknown> 8864 184 5 r:142 9120 184 9 <unknown> 9376 184 9 <unknown> 9632 184 9 <unknown> 9888 184 6 r1:162 10144 184 9 <unknown> 10400 184 9 <unknown> 10656 240 9 events:76 10960 520 7 file:36"
	.globl	__asan_stack_free_8
	.section	.rodata
	.align 32
.LC25:
	.string	"assets/lognet"
	.zero	50
	.align 32
.LC26:
	.string	"ecs/vendor/tomk/examples/exact19_rule.tmg"
	.zero	54
	.align 32
.LC27:
	.string	""
	.zero	63
	.align 32
.LC28:
	.string	"e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
	.zero	63
	.align 32
.LC29:
	.string	"SHA256 empty KAT"
	.zero	47
	.align 32
.LC30:
	.string	"abc"
	.zero	60
	.align 32
.LC31:
	.string	"ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad"
	.zero	63
	.align 32
.LC32:
	.string	"SHA256 abc KAT"
	.zero	49
	.align 32
.LC33:
	.string	"abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq"
	.zero	39
	.align 32
.LC34:
	.string	"248d6a61d20638b8e5c026930c3e6039a33ce45964ff2167f6ecedd419db06c1"
	.zero	63
	.align 32
.LC35:
	.string	"SHA256 padding KAT"
	.zero	45
	.align 32
.LC36:
	.string	"cdc76e5c9914fb9281a1c7e284d73e67f1809a48a497200e046d39ccc7112cd0"
	.zero	63
	.align 32
.LC37:
	.string	"SHA256 multiblock KAT"
	.zero	42
	.align 32
.LC38:
	.string	"Pair admission"
	.zero	49
	.align 32
.LC39:
	.string	"Budget changed state or queue"
	.zero	34
	.align 32
.LC40:
	.string	"Operation budget changed state"
	.zero	33
	.align 32
.LC41:
	.string	"Commit allocated memory"
	.zero	40
	.align 32
.LC42:
	.string	"Act used wrong snapshot"
	.zero	40
	.align 32
.LC43:
	.string	"Rewrite did not use pre-event snapshot"
	.zero	57
	.align 32
.LC44:
	.string	"Next-event admission"
	.zero	43
	.align 32
.LC45:
	.string	"Rewritten rule did not become active next event"
	.zero	48
	.align 32
.LC46:
	.string	"Second rewrite snapshot"
	.zero	40
	.align 32
.LC47:
	.string	"Setup mutation after publication accepted"
	.zero	54
	.align 32
.LC48:
	.string	"Rule setup after publication accepted"
	.zero	58
	.align 32
.LC49:
	.string	"Permuted input admission"
	.zero	39
	.align 32
.LC50:
	.string	"Canonical replay unexpectedly rejected input"
	.zero	51
	.align 32
.LC51:
	.string	"Lexicographic event order changed arithmetic result"
	.zero	44
	.align 32
.LC52:
	.string	"Arrival order changed state or receipts"
	.zero	56
	.align 32
.LC53:
	.string	"Sequence test admission1"
	.zero	39
	.align 32
.LC54:
	.string	"Sequence test admission2"
	.zero	39
	.align 32
.LC55:
	.string	"Out-of-order source sequence not rejected"
	.zero	54
	.align 32
.LC56:
	.string	"Identical duplicate contract"
	.zero	35
	.align 32
.LC57:
	.string	"Duplicate was executed twice"
	.zero	35
	.align 32
.LC58:
	.string	"Published frontier accepted late event"
	.zero	57
	.align 32
.LC59:
	.string	"Previously consumed sequence reused"
	.zero	60
	.align 32
.LC60:
	.string	"Unknown epoch accepted"
	.zero	41
	.align 32
.LC61:
	.string	"Explicit epoch barrier failed"
	.zero	34
	.align 32
.LC62:
	.string	"New epoch sequence reset rejected"
	.zero	62
	.align 32
.LC63:
	.string	"Epoch changed with pending events"
	.zero	62
	.align 32
.LC64:
	.string	"New epoch did not execute"
	.zero	38
	.align 32
.LC65:
	.string	"Clock frontier regressed"
	.zero	39
	.align 32
.LC66:
	.string	"Unknown opcode admitted"
	.zero	40
	.align 32
.LC67:
	.string	"Unknown flags admitted"
	.zero	41
	.align 32
.LC68:
	.string	"Bounded queue first"
	.zero	44
	.align 32
.LC69:
	.string	"Queue bound ignored"
	.zero	44
	.align 32
.LC70:
	.string	"Empty commit"
	.zero	51
	.align 32
.LC71:
	.string	"Zero capacity accepted"
	.zero	41
	.align 32
.LC72:
	.string	"Component bitset overflow accepted"
	.zero	61
	.align 32
.LC73:
	.string	"Conflict admission1"
	.zero	44
	.align 32
.LC74:
	.string	"Conflict admission2"
	.zero	44
	.align 32
.LC75:
	.string	"Conflicting duplicate arrival changed pending representation"
	.zero	35
	.align 32
.LC76:
	.string	"Conflicting identity was executed"
	.zero	62
	.align 32
.LC77:
	.string	"Conflicting duplicate changed result"
	.zero	59
	.align 32
.LC78:
	.string	"Rewrite capability bypass"
	.zero	38
	.align 32
.LC79:
	.string	"Mutation capability bypass"
	.zero	37
	.align 32
.LC80:
	.string	"/hex_validity_bits.bin"
	.zero	41
	.align 32
.LC81:
	.string	"/hex_q16_bitplanes.bin"
	.zero	41
	.align 32
.LC82:
	.string	"LUT module failed"
	.zero	46
	.align 32
.LC83:
	.string	"LUT module changed source sample"
	.zero	63
	.align 32
.LC84:
	.string	"No invalid source fixture sample"
	.zero	63
	.align 32
.LC85:
	.string	"Invalid sample became measured zero"
	.zero	60
	.align 32
.LC86:
	.string	"Missing fixture: "
	.zero	46
	.align 32
.LC87:
	.string	"Original initial rho"
	.zero	43
	.align 32
.LC88:
	.string	"TOMAGI tick allocation/work contract"
	.zero	59
	.align 32
.LC89:
	.string	"TOMAGI first source trace mismatch"
	.zero	61
	.align 32
.LC90:
	.string	"TOMAGI second step failed"
	.zero	38
	.align 32
.LC91:
	.string	"TOMAGI published source final state mismatch"
	.zero	51
	.align 32
.LC92:
	.string	"TOMAGI reserved words accepted"
	.zero	33
	.align 32
.LC93:
	.string	"Truncated TOMAGI accepted"
	.zero	38
	.align 32
.LC94:
	.string	"Unknown TOMAGI opcode accepted"
	.zero	33
	.align 32
.LC95:
	.string	"Invalid TOMAGI successor accepted"
	.zero	62
	.align 32
.LC96:
	.string	"Actual source model replay changed canonical state"
	.zero	45
	.align 32
.LC97:
	.string	"Fresh model ignored original entry field"
	.zero	55
	.align 32
.LC98:
	.string	"\"equal\":true"
	.zero	51
	.align 32
.LC