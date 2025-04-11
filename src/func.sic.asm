stack	START	0
	LDA	#myst
	JSUB	stinit

	LDA	#0x11
	JSUB	push
	
	LDA	#0x33
	JSUB	push
	
	JSUB	myadd
jj	TIO

halt	J	halt

... custom functions

myadd	JSUB	pop
	STA	foo
	JSUB	pop
	STA	bar

	LDA	foo
	ADD	bar

	J	#jj

foo	RESW	1
bar	RESW	1

... stack

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

...

myst	RESB	4096

	END	stack