all:
	bison -d hw4.ypp
	flex hw4.lex
	g++ lex.yy.c hw4.tab.cpp printError.cpp matrix.cpp SymTable.cpp -o ex4.exe
	
clean:
	rm -rf *.o *.exe;