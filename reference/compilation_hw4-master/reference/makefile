all:
	bison --defines ./hw4.ypp;
	lex hw4.lex;
	g++ *.cpp lex.yy.c -o ex4.exe;
	
clean:
	rm -rf *.o *.exe;