all:
	bison -d hw4.ypp
	flex hw4.lex
	g++ hw4.tab.cpp lex.yy.c output.cpp symTable.cpp -o hw4
clean:
	rm -f hw4
