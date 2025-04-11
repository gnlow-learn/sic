stack	START	0
	LDA	#myst
	JSUB	stinit
	JSUB	stinitr

	LDA	#0x11
	JSUB	push
	
	LDA	#0x33
	JSUB	push
	
	JSUB	pushr	
	JSUB	myadd

halt	J	halt

... custom functions

myadd	JSUB	pop
	STA	foo
	JSUB	pop
	STA	bar

	LDA	foo
	ADD	bar

	JSUB	push

	JSUB	popr

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
stinitr	LDA	#retadr
	STA	spr
	RSUB

pushr	STL	@spr
	LDA	@spr
	ADD	#3
	STA	@spr

	LDA	spr
	ADD	#3
	STA	spr
	RSUB

popr	LDA	spr
	SUB	#3
	STA	spr
	LDL	@spr
	RSUB

spr	RESW	1
retadr	RESW	100	. return addresses

...

myst	RESW	100

	END	stack