

Parser:	testParser.hs Parser.hs Lexer.hs
	ghc -Wall -i. testParser.hs

Parser.hs:	Parser.y
	happy Parser.y

Lexer.hs:	Lexer.x
	alex Lexer.x

clean:	
	rm -f Parser.hs Parser.o Parser.hi Lexer.hs Lexer.o Lexer.hi
