stack	START	0
	LDA	#myst
	JSUB	stinit

	LDA	#0x77
	JSUB	push
	
	LDA	#0x77
	JSUB	push
	
	LDA	#0x77
	JSUB	push

halt	J	halt

stinit	STA	sp
	RSUB

push	STA	@sp
	LDA	sp
	ADD	#3
	STA	sp
	RSUB

pop	LDA	sp
	SUB	#3
	STA	sp
	LDA	@sp
	RSUB

sp	RESW	1

myst	RESB	4096

	END	stack
