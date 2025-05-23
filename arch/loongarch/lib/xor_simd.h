/* SPDX-License-Identifier: GPL-2.0-or-later */
/*
 * Simple interface to link xor_simd.c and xor_simd_glue.c
 *
 * Separating these files ensures that no SIMD instructions are run outside of
 * the kfpu critical section.
 */

#ifndef __LOONGARCH_LIB_XOR_SIMD_H
#define __LOONGARCH_LIB_XOR_SIMD_H

#ifdef CONFIG_CPU_HAS_LSX
void __xor_lsx_2(unsigned long bytes, unsigned long *p1,
		 unsigned long *p2);
void __xor_lsx_3(unsigned long bytes, unsigned long *p1,
		 unsigned long *p2, unsigned long *p3);
void __xor_lsx_4(unsigned long bytes, unsigned long *p1,
		 unsigned long *p2, unsigned long *p3,
		 unsigned long *p4);
void __xor_lsx_5(unsigned long bytes, unsigned long *p1,
		 unsigned long *p2, unsigned long *p3,
		 unsigned long *p4, unsigned long *p5);
#endif /* CONFIG_CPU_HAS_LSX */

#ifdef CONFIG_CPU_HAS_LASX
void __xor_lasx_2(unsigned long bytes, unsigned long *p1,
		  unsigned long *p2);
void __xor_lasx_3(unsigned long bytes, unsigned long *p1,
		  unsigned long *p2, unsigned long *p3);
void __xor_lasx_4(unsigned long bytes, unsigned long *p1,
		  unsigned long *p2, unsigned long *p3,
		  unsigned long *p4);
void __xor_lasx_5(unsigned long bytes, unsigned long *p1,
		  unsigned long *p2, unsigned long *p3,
		  unsigned long *p4, unsigned long *p5);
#endif /* CONFIG_CPU_HAS_LASX */

#endif /* __LOONGARCH_LIB_XOR_SIMD_H */
