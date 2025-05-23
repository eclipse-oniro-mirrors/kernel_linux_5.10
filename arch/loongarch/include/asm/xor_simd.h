/* SPDX-License-Identifier: GPL-2.0-or-later */
/*
 * Copyright (C) 2023 WANG Xuerui <git@xen0n.name>
 */
#ifndef _ASM_LOONGARCH_XOR_SIMD_H
#define _ASM_LOONGARCH_XOR_SIMD_H

#ifdef CONFIG_CPU_HAS_LSX
void xor_lsx_2(unsigned long bytes, unsigned long *p1,
	       unsigned long *p2);
void xor_lsx_3(unsigned long bytes, unsigned long *p1,
	       unsigned long *p2, unsigned long *p3);
void xor_lsx_4(unsigned long bytes, unsigned long *p1,
	       unsigned long *p2, unsigned long *p3,
	       unsigned long *p4);
void xor_lsx_5(unsigned long bytes, unsigned long *p1,
	       unsigned long *p2, unsigned long *p3,
	       unsigned long *p4, unsigned long *p5);
#endif /* CONFIG_CPU_HAS_LSX */

#ifdef CONFIG_CPU_HAS_LASX
void xor_lasx_2(unsigned long bytes, unsigned long *p1,
	        unsigned long *p2);
void xor_lasx_3(unsigned long bytes, unsigned long *p1,
	        unsigned long *p2, unsigned long *p3);
void xor_lasx_4(unsigned long bytes, unsigned long *p1,
	        unsigned long *p2, unsigned long *p3,
	        unsigned long *p4);
void xor_lasx_5(unsigned long bytes, unsigned long *p1,
	        unsigned long *p2, unsigned long *p3,
	        unsigned long *p4, unsigned long *p5);
#endif /* CONFIG_CPU_HAS_LASX */

#endif /* _ASM_LOONGARCH_XOR_SIMD_H */
