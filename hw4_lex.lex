/*
 * hw4_lex.c
 *
 *  Created on: Dec 24, 2016
 *      Author: idan
 *      Author: sapir
 */


%{

/* Declarations section */
#include <stdio.h>
#include <output.hpp>
void handleLexError(int linenum);
s
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

\(			return LP;
\)			return RP;
\{			return LC;
\}			return RC;
\;			return SC;
\:			return COLON;
=			return ASSIGN;
[+]			return PLUS;
[-]			return MINUS;
[*] 			return MULT;
[/]			return DIV;
and			return AND;
or			return OR;
C			return CELSIUS;
F			return FAHRENHEIT;
K			return KELVIN;
int			return INT;
print			return PRINT;
input 			return INPUT;
true			return TRUE;
false			return FALSE;
if			return IF;
else			return ELSE;
while			return WHILE;
break			return BREAK;
not			return NOT;
bool			return BOOL;
switch			return SWITCH;
case 			return CASE;

{num}			return NUM;
{rel_op}		return REL_OP;
{eq_op}			return EQ_OP;
{id}			return ID;
{string}		return STRING;

{ignore}		;
.			{handleLexError(yylineno);}

%%


void handleLexError(int linenum) 
{
	errorLex(linenum);
	exit(1);
}
