/* SPDX-License-Identifier: GPL-2.0 */
/*
 * This file is subject to the terms and conditions of the GNU General Public
 * License.  See the file "COPYING" in the main directory of this archive
 * for more details.
 *
 * Copyright (C) 2019 Pei Huang <huangpei@loongson.cn>
 * Copyright (C) 2019 Lu Zeng <zenglu@loongson.cn>
 * Copyright (C) 2020 Huacai Chen <chenhuacai@loongson.cn>
 * Copyright (C) 2020 Loongson Technology Corporation Limited
 */
#include <asm/asm.h>
#include <asm/asmmacro.h>
#include <asm/errno.h>
#include <asm/export.h>
#include <asm/fpregdef.h>
#include <asm/loongarchregs.h>
#include <asm/asm-extable.h>
#include <asm/asm-offsets.h>
#include <asm/regdef.h>

#define FPU_REG_WIDTH		8
#define LSX_REG_WIDTH		16
#define LASX_REG_WIDTH		32

	.macro	EX insn, reg, src, offs
.ex\@:	\insn	\reg, \src, \offs
	_asm_extable .ex\@, .L_fault
	.endm

	.macro	EX_V insn, reg, src, offs
	parse_v __insn, \insn
	parse_v __offs, \offs
	parse_r __src, \src
	parse_vr __reg, \reg
.ex\@:
	.word __insn << 22 | __offs << 10 | __src << 5 | __reg
	_asm_extable .ex\@, .L_fault
	.endm

	.macro	EX_XV insn, reg, src, offs
	parse_v __insn, \insn
	parse_v __offs, \offs
	parse_r __src, \src
	parse_xr __reg, \reg
.ex\@:
	.word __insn << 22 | __offs << 10 | __src << 5 | __reg
	_asm_extable .ex\@, .L_fault
	.endm

	.macro sc_save_fp base
	EX	fst.d $f0,  \base, (0 * FPU_REG_WIDTH)
	EX	fst.d $f1,  \base, (1 * FPU_REG_WIDTH)
	EX	fst.d $f2,  \base, (2 * FPU_REG_WIDTH)
	EX	fst.d $f3,  \base, (3 * FPU_REG_WIDTH)
	EX	fst.d $f4,  \base, (4 * FPU_REG_WIDTH)
	EX	fst.d $f5,  \base, (5 * FPU_REG_WIDTH)
	EX	fst.d $f6,  \base, (6 * FPU_REG_WIDTH)
	EX	fst.d $f7,  \base, (7 * FPU_REG_WIDTH)
	EX	fst.d $f8,  \base, (8 * FPU_REG_WIDTH)
	EX	fst.d $f9,  \base, (9 * FPU_REG_WIDTH)
	EX	fst.d $f10, \base, (10 * FPU_REG_WIDTH)
	EX	fst.d $f11, \base, (11 * FPU_REG_WIDTH)
	EX	fst.d $f12, \base, (12 * FPU_REG_WIDTH)
	EX	fst.d $f13, \base, (13 * FPU_REG_WIDTH)
	EX	fst.d $f14, \base, (14 * FPU_REG_WIDTH)
	EX	fst.d $f15, \base, (15 * FPU_REG_WIDTH)
	EX	fst.d $f16, \base, (16 * FPU_REG_WIDTH)
	EX	fst.d $f17, \base, (17 * FPU_REG_WIDTH)
	EX	fst.d $f18, \base, (18 * FPU_REG_WIDTH)
	EX	fst.d $f19, \base, (19 * FPU_REG_WIDTH)
	EX	fst.d $f20, \base, (20 * FPU_REG_WIDTH)
	EX	fst.d $f21, \base, (21 * FPU_REG_WIDTH)
	EX	fst.d $f22, \base, (22 * FPU_REG_WIDTH)
	EX	fst.d $f23, \base, (23 * FPU_REG_WIDTH)
	EX	fst.d $f24, \base, (24 * FPU_REG_WIDTH)
	EX	fst.d $f25, \base, (25 * FPU_REG_WIDTH)
	EX	fst.d $f26, \base, (26 * FPU_REG_WIDTH)
	EX	fst.d $f27, \base, (27 * FPU_REG_WIDTH)
	EX	fst.d $f28, \base, (28 * FPU_REG_WIDTH)
	EX	fst.d $f29, \base, (29 * FPU_REG_WIDTH)
	EX	fst.d $f30, \base, (30 * FPU_REG_WIDTH)
	EX	fst.d $f31, \base, (31 * FPU_REG_WIDTH)
	.endm

	.macro sc_restore_fp base
	EX	fld.d $f0,  \base, (0 * FPU_REG_WIDTH)
	EX	fld.d $f1,  \base, (1 * FPU_REG_WIDTH)
	EX	fld.d $f2,  \base, (2 * FPU_REG_WIDTH)
	EX	fld.d $f3,  \base, (3 * FPU_REG_WIDTH)
	EX	fld.d $f4,  \base, (4 * FPU_REG_WIDTH)
	EX	fld.d $f5,  \base, (5 * FPU_REG_WIDTH)
	EX	fld.d $f6,  \base, (6 * FPU_REG_WIDTH)
	EX	fld.d $f7,  \base, (7 * FPU_REG_WIDTH)
	EX	fld.d $f8,  \base, (8 * FPU_REG_WIDTH)
	EX	fld.d $f9,  \base, (9 * FPU_REG_WIDTH)
	EX	fld.d $f10, \base, (10 * FPU_REG_WIDTH)
	EX	fld.d $f11, \base, (11 * FPU_REG_WIDTH)
	EX	fld.d $f12, \base, (12 * FPU_REG_WIDTH)
	EX	fld.d $f13, \base, (13 * FPU_REG_WIDTH)
	EX	fld.d $f14, \base, (14 * FPU_REG_WIDTH)
	EX	fld.d $f15, \base, (15 * FPU_REG_WIDTH)
	EX	fld.d $f16, \base, (16 * FPU_REG_WIDTH)
	EX	fld.d $f17, \base, (17 * FPU_REG_WIDTH)
	EX	fld.d $f18, \base, (18 * FPU_REG_WIDTH)
	EX	fld.d $f19, \base, (19 * FPU_REG_WIDTH)
	EX	fld.d $f20, \base, (20 * FPU_REG_WIDTH)
	EX	fld.d $f21, \base, (21 * FPU_REG_WIDTH)
	EX	fld.d $f22, \base, (22 * FPU_REG_WIDTH)
	EX	fld.d $f23, \base, (23 * FPU_REG_WIDTH)
	EX	fld.d $f24, \base, (24 * FPU_REG_WIDTH)
	EX	fld.d $f25, \base, (25 * FPU_REG_WIDTH)
	EX	fld.d $f26, \base, (26 * FPU_REG_WIDTH)
	EX	fld.d $f27, \base, (27 * FPU_REG_WIDTH)
	EX	fld.d $f28, \base, (28 * FPU_REG_WIDTH)
	EX	fld.d $f29, \base, (29 * FPU_REG_WIDTH)
	EX	fld.d $f30, \base, (30 * FPU_REG_WIDTH)
	EX	fld.d $f31, \base, (31 * FPU_REG_WIDTH)
	.endm

	.macro sc_save_fcc base, tmp0, tmp1
	movcf2gr	\tmp0, $fcc0
	move	\tmp1, \tmp0
	movcf2gr	\tmp0, $fcc1
	bstrins.d	\tmp1, \tmp0, 15, 8
	movcf2gr	\tmp0, $fcc2
	bstrins.d	\tmp1, \tmp0, 23, 16
	movcf2gr	\tmp0, $fcc3
	bstrins.d	\tmp1, \tmp0, 31, 24
	movcf2gr	\tmp0, $fcc4
	bstrins.d	\tmp1, \tmp0, 39, 32
	movcf2gr	\tmp0, $fcc5
	bstrins.d	\tmp1, \tmp0, 47, 40
	movcf2gr	\tmp0, $fcc6
	bstrins.d	\tmp1, \tmp0, 55, 48
	movcf2gr	\tmp0, $fcc7
	bstrins.d	\tmp1, \tmp0, 63, 56
	EX	st.d \tmp1, \base, 0
	.endm

	.macro sc_restore_fcc base, tmp0, tmp1
	EX	ld.d \tmp0, \base, 0
	bstrpick.d	\tmp1, \tmp0, 7, 0
	movgr2cf	$fcc0, \tmp1
	bstrpick.d	\tmp1, \tmp0, 15, 8
	movgr2cf	$fcc1, \tmp1
	bstrpick.d	\tmp1, \tmp0, 23, 16
	movgr2cf	$fcc2, \tmp1
	bstrpick.d	\tmp1, \tmp0, 31, 24
	movgr2cf	$fcc3, \tmp1
	bstrpick.d	\tmp1, \tmp0, 39, 32
	movgr2cf	$fcc4, \tmp1
	bstrpick.d	\tmp1, \tmp0, 47, 40
	movgr2cf	$fcc5, \tmp1
	bstrpick.d	\tmp1, \tmp0, 55, 48
	movgr2cf	$fcc6, \tmp1
	bstrpick.d	\tmp1, \tmp0, 63, 56
	movgr2cf	$fcc7, \tmp1
	.endm

	.macro sc_save_fcsr base, tmp0
	movfcsr2gr	\tmp0, fcsr0
	EX	st.w \tmp0, \base, 0
#if defined(CONFIG_CPU_HAS_LBT)
	/* TM bit is always 0 if LBT not supported */
	andi	\tmp0, \tmp0, FPU_CSR_TM
	beqz	\tmp0, 1f
	bstrins.d \tmp0, $r0, FPU_CSR_TM_SHIFT, FPU_CSR_TM_SHIFT
	movgr2fcsr      fcsr0, \tmp0
1:
#endif
	.endm

	.macro sc_restore_fcsr base, tmp0
	EX	ld.w \tmp0, \base, 0
	movgr2fcsr	fcsr0, \tmp0
	.endm

#if defined(CONFIG_CPU_HAS_LBT)
	.macro sc_save_scr base, tmp0
	movscr2gr	\tmp0, $scr0
	EX	st.d \tmp0, \base, 0
	movscr2gr	\tmp0, $scr1
	EX	st.d \tmp0, \base, 8
	movscr2gr	\tmp0, $scr2
	EX	st.d \tmp0, \base, 16
	movscr2gr	\tmp0, $scr3
	EX	st.d \tmp0, \base, 24
	.endm

	.macro sc_restore_scr base, tmp0
	EX	ld.d \tmp0, \base, 0
	movgr2scr	$scr0, \tmp0
	EX	ld.d \tmp0, \base, 8
	movgr2scr	$scr1, \tmp0
	EX	ld.d \tmp0, \base, 16
	movgr2scr	$scr2, \tmp0
	EX	ld.d \tmp0, \base, 24
	movgr2scr	$scr3, \tmp0
	.endm
#endif
	.macro sc_save_lsx base
	EX_V 0xb1 $vr0,  \base,	(0 * LSX_REG_WIDTH)
	EX_V 0xb1 $vr1,  \base,	(1 * LSX_REG_WIDTH)
	EX_V 0xb1 $vr2,  \base,	(2 * LSX_REG_WIDTH)
	EX_V 0xb1 $vr3,  \base,	(3 * LSX_REG_WIDTH)
	EX_V 0xb1 $vr4,  \base,	(4 * LSX_REG_WIDTH)
	EX_V 0xb1 $vr5,  \base,	(5 * LSX_REG_WIDTH)
	EX_V 0xb1 $vr6,  \base,	(6 * LSX_REG_WIDTH)
	EX_V 0xb1 $vr7,  \base,	(7 * LSX_REG_WIDTH)
	EX_V 0xb1 $vr8,  \base,	(8 * LSX_REG_WIDTH)
	EX_V 0xb1 $vr9,  \base,	(9 * LSX_REG_WIDTH)
	EX_V 0xb1 $vr10,  \base, (10 * LSX_REG_WIDTH)
	EX_V 0xb1 $vr11,  \base, (11 * LSX_REG_WIDTH)
	EX_V 0xb1 $vr12,  \base, (12 * LSX_REG_WIDTH)
	EX_V 0xb1 $vr13,  \base, (13 * LSX_REG_WIDTH)
	EX_V 0xb1 $vr14,  \base, (14 * LSX_REG_WIDTH)
	EX_V 0xb1 $vr15,  \base, (15 * LSX_REG_WIDTH)
	EX_V 0xb1 $vr16,  \base, (16 * LSX_REG_WIDTH)
	EX_V 0xb1 $vr17,  \base, (17 * LSX_REG_WIDTH)
	EX_V 0xb1 $vr18,  \base, (18 * LSX_REG_WIDTH)
	EX_V 0xb1 $vr19,  \base, (19 * LSX_REG_WIDTH)
	EX_V 0xb1 $vr20,  \base, (20 * LSX_REG_WIDTH)
	EX_V 0xb1 $vr21,  \base, (21 * LSX_REG_WIDTH)
	EX_V 0xb1 $vr22,  \base, (22 * LSX_REG_WIDTH)
	EX_V 0xb1 $vr23,  \base, (23 * LSX_REG_WIDTH)
	EX_V 0xb1 $vr24,  \base, (24 * LSX_REG_WIDTH)
	EX_V 0xb1 $vr25,  \base, (25 * LSX_REG_WIDTH)
	EX_V 0xb1 $vr26,  \base, (26 * LSX_REG_WIDTH)
	EX_V 0xb1 $vr27,  \base, (27 * LSX_REG_WIDTH)
	EX_V 0xb1 $vr28,  \base, (28 * LSX_REG_WIDTH)
	EX_V 0xb1 $vr29,  \base, (29 * LSX_REG_WIDTH)
	EX_V 0xb1 $vr30,  \base, (30 * LSX_REG_WIDTH)
	EX_V 0xb1 $vr31,  \base, (31 * LSX_REG_WIDTH)
	.endm

	.macro sc_restore_lsx base
	EX_V 0xb0 $vr0,  \base, (0 * LSX_REG_WIDTH)
	EX_V 0xb0 $vr1,  \base, (1 * LSX_REG_WIDTH)
	EX_V 0xb0 $vr2,  \base, (2 * LSX_REG_WIDTH)
	EX_V 0xb0 $vr3,  \base, (3 * LSX_REG_WIDTH)
	EX_V 0xb0 $vr4,  \base, (4 * LSX_REG_WIDTH)
	EX_V 0xb0 $vr5,  \base, (5 * LSX_REG_WIDTH)
	EX_V 0xb0 $vr6,  \base, (6 * LSX_REG_WIDTH)
	EX_V 0xb0 $vr7,  \base, (7 * LSX_REG_WIDTH)
	EX_V 0xb0 $vr8,  \base, (8 * LSX_REG_WIDTH)
	EX_V 0xb0 $vr9,  \base, (9 * LSX_REG_WIDTH)
	EX_V 0xb0 $vr10,  \base, (10 * LSX_REG_WIDTH)
	EX_V 0xb0 $vr11,  \base, (11 * LSX_REG_WIDTH)
	EX_V 0xb0 $vr12,  \base, (12 * LSX_REG_WIDTH)
	EX_V 0xb0 $vr13,  \base, (13 * LSX_REG_WIDTH)
	EX_V 0xb0 $vr14,  \base, (14 * LSX_REG_WIDTH)
	EX_V 0xb0 $vr15,  \base, (15 * LSX_REG_WIDTH)
	EX_V 0xb0 $vr16,  \base, (16 * LSX_REG_WIDTH)
	EX_V 0xb0 $vr17,  \base, (17 * LSX_REG_WIDTH)
	EX_V 0xb0 $vr18,  \base, (18 * LSX_REG_WIDTH)
	EX_V 0xb0 $vr19,  \base, (19 * LSX_REG_WIDTH)
	EX_V 0xb0 $vr20,  \base, (20 * LSX_REG_WIDTH)
	EX_V 0xb0 $vr21,  \base, (21 * LSX_REG_WIDTH)
	EX_V 0xb0 $vr22,  \base, (22 * LSX_REG_WIDTH)
	EX_V 0xb0 $vr23,  \base, (23 * LSX_REG_WIDTH)
	EX_V 0xb0 $vr24,  \base, (24 * LSX_REG_WIDTH)
	EX_V 0xb0 $vr25,  \base, (25 * LSX_REG_WIDTH)
	EX_V 0xb0 $vr26,  \base, (26 * LSX_REG_WIDTH)
	EX_V 0xb0 $vr27,  \base, (27 * LSX_REG_WIDTH)
	EX_V 0xb0 $vr28,  \base, (28 * LSX_REG_WIDTH)
	EX_V 0xb0 $vr29,  \base, (29 * LSX_REG_WIDTH)
	EX_V 0xb0 $vr30,  \base, (30 * LSX_REG_WIDTH)
	EX_V 0xb0 $vr31,  \base, (31 * LSX_REG_WIDTH)
	.endm

	.macro sc_save_lasx base
	EX_XV	0xb3 $xr0,  \base, (0 * LASX_REG_WIDTH)
	EX_XV	0xb3 $xr1,  \base, (1 * LASX_REG_WIDTH)
	EX_XV	0xb3 $xr2,  \base, (2 * LASX_REG_WIDTH)
	EX_XV	0xb3 $xr3,  \base, (3 * LASX_REG_WIDTH)
	EX_XV	0xb3 $xr4,  \base, (4 * LASX_REG_WIDTH)
	EX_XV	0xb3 $xr5,  \base, (5 * LASX_REG_WIDTH)
	EX_XV	0xb3 $xr6,  \base, (6 * LASX_REG_WIDTH)
	EX_XV	0xb3 $xr7,  \base, (7 * LASX_REG_WIDTH)
	EX_XV	0xb3 $xr8,  \base, (8 * LASX_REG_WIDTH)
	EX_XV	0xb3 $xr9,  \base, (9 * LASX_REG_WIDTH)
	EX_XV	0xb3 $xr10, \base, (10 * LASX_REG_WIDTH)
	EX_XV	0xb3 $xr11, \base, (11 * LASX_REG_WIDTH)
	EX_XV	0xb3 $xr12, \base, (12 * LASX_REG_WIDTH)
	EX_XV	0xb3 $xr13, \base, (13 * LASX_REG_WIDTH)
	EX_XV	0xb3 $xr14, \base, (14 * LASX_REG_WIDTH)
	EX_XV	0xb3 $xr15, \base, (15 * LASX_REG_WIDTH)
	EX_XV	0xb3 $xr16, \base, (16 * LASX_REG_WIDTH)
	EX_XV	0xb3 $xr17, \base, (17 * LASX_REG_WIDTH)
	EX_XV	0xb3 $xr18, \base, (18 * LASX_REG_WIDTH)
	EX_XV	0xb3 $xr19, \base, (19 * LASX_REG_WIDTH)
	EX_XV	0xb3 $xr20, \base, (20 * LASX_REG_WIDTH)
	EX_XV	0xb3 $xr21, \base, (21 * LASX_REG_WIDTH)
	EX_XV	0xb3 $xr22, \base, (22 * LASX_REG_WIDTH)
	EX_XV	0xb3 $xr23, \base, (23 * LASX_REG_WIDTH)
	EX_XV	0xb3 $xr24, \base, (24 * LASX_REG_WIDTH)
	EX_XV	0xb3 $xr25, \base, (25 * LASX_REG_WIDTH)
	EX_XV	0xb3 $xr26, \base, (26 * LASX_REG_WIDTH)
	EX_XV	0xb3 $xr27, \base, (27 * LASX_REG_WIDTH)
	EX_XV	0xb3 $xr28, \base, (28 * LASX_REG_WIDTH)
	EX_XV	0xb3 $xr29, \base, (29 * LASX_REG_WIDTH)
	EX_XV	0xb3 $xr30, \base, (30 * LASX_REG_WIDTH)
	EX_XV	0xb3 $xr31, \base, (31 * LASX_REG_WIDTH)
	.endm

	.macro sc_restore_lasx base
	EX_XV	0xb2 $xr0,  \base, (0 * LASX_REG_WIDTH)
	EX_XV	0xb2 $xr1,  \base, (1 * LASX_REG_WIDTH)
	EX_XV	0xb2 $xr2,  \base, (2 * LASX_REG_WIDTH)
	EX_XV	0xb2 $xr3,  \base, (3 * LASX_REG_WIDTH)
	EX_XV	0xb2 $xr4,  \base, (4 * LASX_REG_WIDTH)
	EX_XV	0xb2 $xr5,  \base, (5 * LASX_REG_WIDTH)
	EX_XV	0xb2 $xr6,  \base, (6 * LASX_REG_WIDTH)
	EX_XV	0xb2 $xr7,  \base, (7 * LASX_REG_WIDTH)
	EX_XV	0xb2 $xr8,  \base, (8 * LASX_REG_WIDTH)
	EX_XV	0xb2 $xr9,  \base, (9 * LASX_REG_WIDTH)
	EX_XV	0xb2 $xr10, \base, (10 * LASX_REG_WIDTH)
	EX_XV	0xb2 $xr11, \base, (11 * LASX_REG_WIDTH)
	EX_XV	0xb2 $xr12, \base, (12 * LASX_REG_WIDTH)
	EX_XV	0xb2 $xr13, \base, (13 * LASX_REG_WIDTH)
	EX_XV	0xb2 $xr14, \base, (14 * LASX_REG_WIDTH)
	EX_XV	0xb2 $xr15, \base, (15 * LASX_REG_WIDTH)
	EX_XV	0xb2 $xr16, \base, (16 * LASX_REG_WIDTH)
	EX_XV	0xb2 $xr17, \base, (17 * LASX_REG_WIDTH)
	EX_XV	0xb2 $xr18, \base, (18 * LASX_REG_WIDTH)
	EX_XV	0xb2 $xr19, \base, (19 * LASX_REG_WIDTH)
	EX_XV	0xb2 $xr20, \base, (20 * LASX_REG_WIDTH)
	EX_XV	0xb2 $xr21, \base, (21 * LASX_REG_WIDTH)
	EX_XV	0xb2 $xr22, \base, (22 * LASX_REG_WIDTH)
	EX_XV	0xb2 $xr23, \base, (23 * LASX_REG_WIDTH)
	EX_XV	0xb2 $xr24, \base, (24 * LASX_REG_WIDTH)
	EX_XV	0xb2 $xr25, \base, (25 * LASX_REG_WIDTH)
	EX_XV	0xb2 $xr26, \base, (26 * LASX_REG_WIDTH)
	EX_XV	0xb2 $xr27, \base, (27 * LASX_REG_WIDTH)
	EX_XV	0xb2 $xr28, \base, (28 * LASX_REG_WIDTH)
	EX_XV	0xb2 $xr29, \base, (29 * LASX_REG_WIDTH)
	EX_XV	0xb2 $xr30, \base, (30 * LASX_REG_WIDTH)
	EX_XV	0xb2 $xr31, \base, (31 * LASX_REG_WIDTH)
	.endm

/*
 * Save a thread's fp context.
 */
SYM_FUNC_START(_save_fp)
	/*
	 * since TM bit of FSCR may afftect fpr0-fp7
	 * fcsr save need before FPR save
	 */
	fpu_save_csr	a0 t1
	fpu_save_double a0 t1			# clobbers t1
	fpu_save_cc	a0 t1 t2		# clobbers t1, t2
	jirl zero, ra, 0
SYM_FUNC_END(_save_fp)
EXPORT_SYMBOL(_save_fp)

/*
 * Restore a thread's fp context.
 */
SYM_FUNC_START(_restore_fp)
	fpu_restore_double a0 t1		# clobbers t1
	/*
	 * since TM bit of FSCR may afftect fpr0-fp7
	 * fscr restore need be after FPR store
	 */
	fpu_restore_csr	a0 t1
	fpu_restore_cc	a0 t1 t2		# clobbers t1, t2
	jirl zero, ra, 0
SYM_FUNC_END(_restore_fp)

#ifdef CONFIG_CPU_HAS_LSX

/*
 * Save a thread's LSX vector context.
 */
SYM_FUNC_START(_save_lsx)
	lsx_save_all	a0 t1 t2
	jirl zero, ra, 0
SYM_FUNC_END(_save_lsx)
EXPORT_SYMBOL(_save_lsx)

/*
 * Restore a thread's LSX vector context.
 */
SYM_FUNC_START(_restore_lsx)
	lsx_restore_all	a0 t1 t2
	jirl zero, ra, 0
SYM_FUNC_END(_restore_lsx)

SYM_FUNC_START(_save_lsx_upper)
	lsx_save_all_upper a0 t0 t1
	jirl zero, ra, 0
SYM_FUNC_END(_save_lsx_upper)

SYM_FUNC_START(_restore_lsx_upper)
	lsx_restore_all_upper a0 t0 t1
	jirl zero, ra, 0
SYM_FUNC_END(_restore_lsx_upper)

SYM_FUNC_START(_init_lsx_upper)
	lsx_init_all_upper t1
	jirl zero, ra, 0
SYM_FUNC_END(_init_lsx_upper)
#endif

#ifdef CONFIG_CPU_HAS_LASX

/*
 * Save a thread's LASX vector context.
 */
SYM_FUNC_START(_save_lasx)
	lasx_save_all	a0 t1 t2
	jirl zero, ra, 0
SYM_FUNC_END(_save_lasx)
EXPORT_SYMBOL(_save_lasx)

/*
 * Restore a thread's LASX vector context.
 */
SYM_FUNC_START(_restore_lasx)
	lasx_restore_all a0 t1 t2
	jirl zero, ra, 0
SYM_FUNC_END(_restore_lasx)

SYM_FUNC_START(_save_lasx_upper)
	lasx_save_all_upper a0 t0 t1
	jirl zero, ra, 0
SYM_FUNC_END(_save_lasx_upper)

SYM_FUNC_START(_restore_lasx_upper)
	lasx_restore_all_upper a0 t0 t1
	jirl	zero, ra, 0
SYM_FUNC_END(_restore_lasx_upper)

SYM_FUNC_START(_init_lasx_upper)
	lasx_init_all_upper t1
	jirl	zero, ra, 0
SYM_FUNC_END(_init_lasx_upper)
#endif

/*
 * Load the FPU with signalling NANS.  This bit pattern we're using has
 * the property that no matter whether considered as single or as double
 * precision represents signaling NANS.
 *
 * The value to initialize fcsr0 to comes in $a0.
 */

SYM_FUNC_START(_init_fpu)
	li.w	t1, CSR_EUEN_FPEN
	csrxchg	t1, t1, LOONGARCH_CSR_EUEN

	movgr2fcsr	fcsr0, a0

	li.w	t1, -1				# SNaN

	movgr2fr.d	$f0, t1
	movgr2fr.d	$f1, t1
	movgr2fr.d	$f2, t1
	movgr2fr.d	$f3, t1
	movgr2fr.d	$f4, t1
	movgr2fr.d	$f5, t1
	movgr2fr.d	$f6, t1
	movgr2fr.d	$f7, t1
	movgr2fr.d	$f8, t1
	movgr2fr.d	$f9, t1
	movgr2fr.d	$f10, t1
	movgr2fr.d	$f11, t1
	movgr2fr.d	$f12, t1
	movgr2fr.d	$f13, t1
	movgr2fr.d	$f14, t1
	movgr2fr.d	$f15, t1
	movgr2fr.d	$f16, t1
	movgr2fr.d	$f17, t1
	movgr2fr.d	$f18, t1
	movgr2fr.d	$f19, t1
	movgr2fr.d	$f20, t1
	movgr2fr.d	$f21, t1
	movgr2fr.d	$f22, t1
	movgr2fr.d	$f23, t1
	movgr2fr.d	$f24, t1
	movgr2fr.d	$f25, t1
	movgr2fr.d	$f26, t1
	movgr2fr.d	$f27, t1
	movgr2fr.d	$f28, t1
	movgr2fr.d	$f29, t1
	movgr2fr.d	$f30, t1
	movgr2fr.d	$f31, t1

	jirl zero, ra, 0
SYM_FUNC_END(_init_fpu)

/*
 * a0: fpregs
 * a1: fcc
 * a2: fcsr
 */
SYM_FUNC_START(_save_fp_context)
	sc_save_fcc a1 t1 t2
	sc_save_fcsr a2 t1
	sc_save_fp a0
	li.w	a0, 0					# success
	jirl zero, ra, 0
SYM_FUNC_END(_save_fp_context)

/*
 * a0: fpregs
 * a1: fcc
 * a2: fcsr
 */
SYM_FUNC_START(_restore_fp_context)
	sc_restore_fp a0
	sc_restore_fcc a1 t1 t2
	sc_restore_fcsr a2 t1
	li.w	a0, 0					# success
	jirl zero, ra, 0
SYM_FUNC_END(_restore_fp_context)

/*
 * a0: fpregs
 * a1: fcc
 * a2: fcsr
 */
SYM_FUNC_START(_save_lsx_context)
	sc_save_fcc a1, t0, t1
	sc_save_fcsr a2, t0
	sc_save_lsx a0
	li.w	a0, 0					# success
	jirl zero, ra, 0
SYM_FUNC_END(_save_lsx_context)

/*
 * a0: fpregs
 * a1: fcc
 * a2: fcsr
 */
SYM_FUNC_START(_restore_lsx_context)
	sc_restore_lsx a0
	sc_restore_fcc a1, t1, t2
	sc_restore_fcsr a2, t1
	li.w	a0, 0					# success
	jirl zero, ra, 0
SYM_FUNC_END(_restore_lsx_context)

#if defined(CONFIG_CPU_HAS_LBT)
/*
 * Load scr/eflag with zero.
 */
SYM_FUNC_START(_init_lbt)
	movgr2scr	$scr0, zero
	movgr2scr	$scr1, zero
	movgr2scr	$scr2, zero
	movgr2scr	$scr3, zero

	x86mtflag	zero, 0x3f
	jr	ra
SYM_FUNC_END(_init_lbt)

/*
 * a0: scr
 */
SYM_FUNC_START(_save_scr_context)
	/* eflags */
	x86mfflag t0, 0x3f
	EX st.w	t0, a1, 0

	sc_save_scr a0, t0

	li.w	a0, 0					# success
	jirl zero, ra, 0
SYM_FUNC_END(_save_scr_context)

/*
 * a0: scr
 */
SYM_FUNC_START(_restore_scr_context)
	/* eflags */
	EX ld.w	t0, a1, 0
	x86mtflag t0, 0x3f

	sc_restore_scr a0, t1

	li.w	a0, 0					# success
	jirl zero, ra, 0
SYM_FUNC_END(_restore_scr_context)
#endif

/*
 * a0: fpregs
 * a1: fcc
 * a2: fcsr
 */
SYM_FUNC_START(_save_lasx_context)
	sc_save_fcc a1, t0, t1
	sc_save_fcsr a2, t0
	sc_save_lasx a0
	li.w	a0, 0					# success
	jirl zero, ra, 0
SYM_FUNC_END(_save_lasx_context)

/*
 * a0: fpregs
 * a1: fcc
 * a2: fcsr
 */
SYM_FUNC_START(_restore_lasx_context)
	sc_restore_lasx a0
	sc_restore_fcc a1, t1, t2
	sc_restore_fcsr a2, t1
	li.w	a0, 0					# success
	jirl zero, ra, 0
SYM_FUNC_END(_restore_lasx_context)

.L_fault:
	li.w	a0, -EFAULT				# failure
	jirl zero, ra, 0
