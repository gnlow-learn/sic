
rdrec	LDX	#0
	LDA	#0
rloop	TD	STDIN
	JEQ	rloop
	RD	STDIN
	COMP	LF
	JEQ	exit
	STCH	BUFFER, X
	TIX	MAXLEN
	JLT	rloop
exit	RSUB

LF	WORD	10	. Line Feed
