/*
 * hw4.lex
 *
 *  Created on: Dec 24, 2016
 *      Author: idan
 *      Author: sapir
 */


%{

/* Declarations section */
#include <stdio.h>
#include "hw4.tab.hpp"
#include "output.hpp"
void handleLexError(int linenum);
int handleToken(int token);

%}

%option yylineno
%option noyywrap

rel_op			(<=|>=|>|<)
eq_op			(==|!=)
id			([a-zA-Z_]+)
string			(\"[^"]*\")
num			([1-9][0-9]*|0)
nlAndTab		([\t\n\r])
cpp_comment		("//"[^\n]*\n)
whitespace		([ ])
ignore			({nlAndTab}|{cpp_comment}|{whitespace})

%%

\(			handleToken(LP);
\)			handleToken(RP);
\{			handleToken(LC);
\}			handleToken(RC);
\;			handleToken(SC);
\:			handleToken(COLON);
=			handleToken(ASSIGN);
[+]			handleToken(PLUS);
[-]			handleToken(MINUS);
[*] 			handleToken(MULT);
[/]			handleToken(DIV);
and			handleToken(AND);
or			handleToken(OR);
C			handleToken(CELSIUS);
F			handleToken(FAHRENHEIT);
K			handleToken(KELVIN);
int			handleToken(INT);
print			handleToken(PRINT);
input 			handleToken(INPUT);
true			handleToken(TRUE);
false			handleToken(FALSE);
if			handleToken(IF);
else			handleToken(ELSE);
while			handleToken(WHILE);
break			handleToken(BREAK);
not			handleToken(NOT);
bool			handleToken(BOOL);
switch			handleToken(SWITCH);
case 			handleToken(CASE);

{num}			handleToken(NUM);
{rel_op}		handleToken(REL_OP);
{eq_op}			handleToken(EQ_OP);
{id}			handleToken(ID);
{string}		handleToken(STRING);

{ignore}		;
.			{handleLexError(yylineno);}

%%

int handleToken(int token){
	printf("%d %s \n" , yylineno, yytext);
	return token;
}
void handleLexError(int linenum) 
{
	output::errorLex(linenum);
	exit(1);
}
