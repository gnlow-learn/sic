stack	START	0
	EXTDEF	stinit
	EXTDEF	push
	EXTDEF	pop

stinit	STA	sp
	RSUB

push	STA	@sp
	LDA	sp
	ADD	#3
	STA	sp
	LDA	@sp	. (A) 원상복귀
	RSUB

pop	LDA	sp
	SUB	#3
	STA	sp
	LDA	@sp
	RSUB

sp	RESW	1

	END	stack
