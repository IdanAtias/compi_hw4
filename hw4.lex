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
#include "hw4.hpp"
#include "hw4.tab.hpp"
#include "output.hpp"
void handleLexError(int linenum);
int handleToken(int token);

%}

%option yylineno
%option noyywrap

rel_op			(<=|>=|>|<)
eq_op			(==|!=)
id				([a-zA-Z_]+)
string			(\"[^"]*\")
num				([1-9][0-9]*|0)
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
[*] 		handleToken(MULT);
[/]			handleToken(DIV);
and			handleToken(AND);
or			handleToken(OR);
C			{
				yylval.type = "cel";
				return CELSIUS;
			};
F			{
				yylval.type = "fah";
				return FAHRENHEIT;
			};
K			{
				yylval.type = "kel";
				return KELVIN;	
			};
int			{
				yylval.type = "int";
				return INT;	
			};
print			handleToken(PRINT);
input 			handleToken(INPUT);
true			{
					yylval.type = "bool";
					yylval.val = 1;
					return TRUE;	
				};
false			{
					yylval.type = "bool";
					yylval.val = 0;
					return FALSE;	
				};
if				handleToken(IF);
else			handleToken(ELSE);
while			handleToken(WHILE);
break			handleToken(BREAK);
not				handleToken(NOT);
bool			{
					yylval.type = "bool";
					return BOOL;
				};
switch			handleToken(SWITCH);
case 			handleToken(CASE);

{num}			{
					yylval.type = "int";
					yylval.val = atoi(yytext);
					return NUM;
				}
{rel_op}		handleToken(REL_OP);
{eq_op}			handleToken(EQ_OP);
{id}			{
					yylval.id = yytext;
					return ID;
				}
{string}		handleToken(STRING);

{ignore}		;
.				{handleLexError(yylineno);}

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
