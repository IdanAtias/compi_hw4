%{

/* Declarations section */
#include <stdio.h>
#include "hw4.hpp"
#include "hw4.tab.hpp"
#include "printError.h"

%}

%option yylineno
%option noyywrap
	
mulDiv 			([\/\*])	
number			([1-9][0-9]*|0)
type			(int|matrix)		
identifier		([a-zA-Z][a-zA-Z0-9_]*)	
ignoreA			("//"[^\n]*\n)
ignoreB			([\n\r\t ]*)		
fullIgnore		({ignoreA}|{ignoreB})								

	
%%

\(															return LP;												
\)															return RP;
\{															return LC;
\}															return RC;
\[															return LB;
\]															return RB;
\,															return CS;
\;															return SC;	
=															return ASSIGN;	
\-															return MINUS;
\+															return PLUS;
\*															return MUL;
\/															return DIV;
::						                                    return CONCAT;
{number}													{	
																yylval.val = atoi(yytext);
																yylval.type = "int";
																yylval.constVar = true;
																return NUM;
															}
\^															return ITERATION;
transpose													return TRANSPOSE;
{type}														{	
																yylval.type = yytext;
																return TYPE;
															}
{identifier}												{	
																yylval.id = yytext;
																yylval.constVar = false;
																return ID;
															}
{fullIgnore}												{;}
.															{	
																printError(LexicalError);
																exit(1);
															}

%%
