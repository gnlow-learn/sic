cloop	JSUB	rdrec	. rdrec()
	LDA	LENGTH
	COMP	#0
	JEQ	endfil	. if (length == 0) endfil()
	JSUB	wrrec	. else wrrec()
	STL	RETADR	.. JSUBEQ가 없어서 이렇게 한건가?
	J	cloop	. cloop()

endfil	LDA	EOF
	STA	BUFFER	. buffer = eof
	LDA	#3
	STA	LENGTH	. length = 3
	JSUB	wrrec	. wrrec()
	LDL	RETADR
	RSUB

rdrec	LDX	#0
	LDA	#0
rloop	TD	STDIN
	JEQ	rloop
	RD	STDIN
	COMP	ASEN
	JEQ	exit
	STCH	BUFFER, X
	TIX	MAXLEN
	JLT	rloop
exit	STX	LENGTH
	RSUB

wrrec	LDX	#0
wloop	TD	STDOUT
	JEQ	wloop
	LDCH	BUFFER, X
	WD	STDOUT
	TIX	LENGTH
	JLT	wloop
	RSUB

RETADR	RESW	1
LENGTH	RESW	1
BUFFER	RESB	4096

EOF	BYTE	C'EOF'
ASEN	WORD	10
MAXLEN	WORD	4096

STDIN	BYTE	0
STDOUT	BYTE	1
