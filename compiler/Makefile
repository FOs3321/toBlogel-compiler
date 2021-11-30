HSFILES = Parser.hs \
		  Lexer.hs


all: ${HSFILES}
	ghc --make -o cmplr

Parser.hs: Parser.y
	happy $<

Lexer.hs: Lexer.x
	alex $<

clean:
	rm -f *.o *.hi 