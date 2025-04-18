test	START	0
	EXTREF	stinit
	EXTREF	push
	EXTREF	pop

	LDA	#myst
	+JSUB	stinit

	LDA	#0x77
	+JSUB	push
	+JSUB	push
	+JSUB	push
	+JSUB	push
halt	J	halt

myst	RESB	4096
