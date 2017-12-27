                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_tim4
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _TIM4_DeInit
                                     12 	.globl _TIM4_TimeBaseInit
                                     13 	.globl _TIM4_Cmd
                                     14 	.globl _TIM4_ITConfig
                                     15 	.globl _TIM4_GetCounter
                                     16 	.globl _TIM4_GetFlagStatus
                                     17 	.globl _TIM4_ClearFlag
                                     18 	.globl _TIM4_ClearITPendingBit
                                     19 ;--------------------------------------------------------
                                     20 ; ram data
                                     21 ;--------------------------------------------------------
                                     22 	.area DATA
                                     23 ;--------------------------------------------------------
                                     24 ; ram data
                                     25 ;--------------------------------------------------------
                                     26 	.area INITIALIZED
                                     27 ;--------------------------------------------------------
                                     28 ; absolute external ram data
                                     29 ;--------------------------------------------------------
                                     30 	.area DABS (ABS)
                                     31 ;--------------------------------------------------------
                                     32 ; global & static initialisations
                                     33 ;--------------------------------------------------------
                                     34 	.area HOME
                                     35 	.area GSINIT
                                     36 	.area GSFINAL
                                     37 	.area GSINIT
                                     38 ;--------------------------------------------------------
                                     39 ; Home
                                     40 ;--------------------------------------------------------
                                     41 	.area HOME
                                     42 	.area HOME
                                     43 ;--------------------------------------------------------
                                     44 ; code
                                     45 ;--------------------------------------------------------
                                     46 	.area CODE
                                     47 ;	lib/stm8s_tim4.c: 13: void TIM4_DeInit(void)
                                     48 ;	-----------------------------------------
                                     49 ;	 function TIM4_DeInit
                                     50 ;	-----------------------------------------
      0095EF                         51 _TIM4_DeInit:
                                     52 ;	lib/stm8s_tim4.c: 15: TIM4->CR1 = TIM4_CR1_RESET_VALUE;
      0095EF 35 00 53 40      [ 1]   53 	mov	0x5340+0, #0x00
                                     54 ;	lib/stm8s_tim4.c: 16: TIM4->IER = TIM4_IER_RESET_VALUE;
      0095F3 35 00 53 43      [ 1]   55 	mov	0x5343+0, #0x00
                                     56 ;	lib/stm8s_tim4.c: 17: TIM4->CNTR = TIM4_CNTR_RESET_VALUE;
      0095F7 35 00 53 46      [ 1]   57 	mov	0x5346+0, #0x00
                                     58 ;	lib/stm8s_tim4.c: 18: TIM4->PSCR = TIM4_PSCR_RESET_VALUE;
      0095FB 35 00 53 47      [ 1]   59 	mov	0x5347+0, #0x00
                                     60 ;	lib/stm8s_tim4.c: 19: TIM4->ARR = TIM4_ARR_RESET_VALUE;
      0095FF 35 FF 53 48      [ 1]   61 	mov	0x5348+0, #0xff
                                     62 ;	lib/stm8s_tim4.c: 20: TIM4->SR1 = TIM4_SR1_RESET_VALUE;
      009603 35 00 53 44      [ 1]   63 	mov	0x5344+0, #0x00
      009607 81               [ 4]   64 	ret
                                     65 ;	lib/stm8s_tim4.c: 23: void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler, uint8_t TIM4_Period)
                                     66 ;	-----------------------------------------
                                     67 ;	 function TIM4_TimeBaseInit
                                     68 ;	-----------------------------------------
      009608                         69 _TIM4_TimeBaseInit:
                                     70 ;	lib/stm8s_tim4.c: 26: TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
      009608 AE 53 47         [ 2]   71 	ldw	x, #0x5347
      00960B 7B 03            [ 1]   72 	ld	a, (0x03, sp)
      00960D F7               [ 1]   73 	ld	(x), a
                                     74 ;	lib/stm8s_tim4.c: 28: TIM4->ARR = (uint8_t)(TIM4_Period);
      00960E AE 53 48         [ 2]   75 	ldw	x, #0x5348
      009611 7B 04            [ 1]   76 	ld	a, (0x04, sp)
      009613 F7               [ 1]   77 	ld	(x), a
      009614 81               [ 4]   78 	ret
                                     79 ;	lib/stm8s_tim4.c: 31: void TIM4_Cmd(FunctionalState NewState)
                                     80 ;	-----------------------------------------
                                     81 ;	 function TIM4_Cmd
                                     82 ;	-----------------------------------------
      009615                         83 _TIM4_Cmd:
                                     84 ;	lib/stm8s_tim4.c: 34: TIM4->CR1 |= TIM4_CR1_CEN;
      009615 72 10 53 40      [ 1]   85 	bset	0x5340, #0
      009619 81               [ 4]   86 	ret
                                     87 ;	lib/stm8s_tim4.c: 37: void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
                                     88 ;	-----------------------------------------
                                     89 ;	 function TIM4_ITConfig
                                     90 ;	-----------------------------------------
      00961A                         91 _TIM4_ITConfig:
                                     92 ;	lib/stm8s_tim4.c: 41: TIM4->IER |= (uint8_t)TIM4_IT;
      00961A AE 53 43         [ 2]   93 	ldw	x, #0x5343
      00961D F6               [ 1]   94 	ld	a, (x)
      00961E 1A 03            [ 1]   95 	or	a, (0x03, sp)
      009620 AE 53 43         [ 2]   96 	ldw	x, #0x5343
      009623 F7               [ 1]   97 	ld	(x), a
      009624 81               [ 4]   98 	ret
                                     99 ;	lib/stm8s_tim4.c: 44: uint8_t TIM4_GetCounter(void)
                                    100 ;	-----------------------------------------
                                    101 ;	 function TIM4_GetCounter
                                    102 ;	-----------------------------------------
      009625                        103 _TIM4_GetCounter:
                                    104 ;	lib/stm8s_tim4.c: 47: return (uint8_t)(TIM4->CNTR);
      009625 AE 53 46         [ 2]  105 	ldw	x, #0x5346
      009628 F6               [ 1]  106 	ld	a, (x)
      009629 81               [ 4]  107 	ret
                                    108 ;	lib/stm8s_tim4.c: 50: FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
                                    109 ;	-----------------------------------------
                                    110 ;	 function TIM4_GetFlagStatus
                                    111 ;	-----------------------------------------
      00962A                        112 _TIM4_GetFlagStatus:
                                    113 ;	lib/stm8s_tim4.c: 53: if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
      00962A AE 53 44         [ 2]  114 	ldw	x, #0x5344
      00962D F6               [ 1]  115 	ld	a, (x)
      00962E 14 03            [ 1]  116 	and	a, (0x03, sp)
      009630 4D               [ 1]  117 	tnz	a
      009631 27 03            [ 1]  118 	jreq	00102$
                                    119 ;	lib/stm8s_tim4.c: 55: bitstatus = SET;
      009633 A6 01            [ 1]  120 	ld	a, #0x01
      009635 81               [ 4]  121 	ret
      009636                        122 00102$:
                                    123 ;	lib/stm8s_tim4.c: 59: bitstatus = RESET;
      009636 4F               [ 1]  124 	clr	a
                                    125 ;	lib/stm8s_tim4.c: 61: return ((FlagStatus)bitstatus);
      009637 81               [ 4]  126 	ret
                                    127 ;	lib/stm8s_tim4.c: 64: void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
                                    128 ;	-----------------------------------------
                                    129 ;	 function TIM4_ClearFlag
                                    130 ;	-----------------------------------------
      009638                        131 _TIM4_ClearFlag:
                                    132 ;	lib/stm8s_tim4.c: 67: TIM4->SR1 = (uint8_t)(~TIM4_FLAG);
      009638 7B 03            [ 1]  133 	ld	a, (0x03, sp)
      00963A 43               [ 1]  134 	cpl	a
      00963B AE 53 44         [ 2]  135 	ldw	x, #0x5344
      00963E F7               [ 1]  136 	ld	(x), a
      00963F 81               [ 4]  137 	ret
                                    138 ;	lib/stm8s_tim4.c: 70: void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
                                    139 ;	-----------------------------------------
                                    140 ;	 function TIM4_ClearITPendingBit
                                    141 ;	-----------------------------------------
      009640                        142 _TIM4_ClearITPendingBit:
                                    143 ;	lib/stm8s_tim4.c: 73: TIM4->SR1 = (uint8_t)(~TIM4_IT);
      009640 7B 03            [ 1]  144 	ld	a, (0x03, sp)
      009642 43               [ 1]  145 	cpl	a
      009643 AE 53 44         [ 2]  146 	ldw	x, #0x5344
      009646 F7               [ 1]  147 	ld	(x), a
      009647 81               [ 4]  148 	ret
                                    149 	.area CODE
                                    150 	.area INITIALIZER
                                    151 	.area CABS (ABS)
