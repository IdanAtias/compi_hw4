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
//#include <output.hpp>
void handleLexError(int linenum);
void showToken(char*);

%}

%option yylineno
%option noyywrap

rel_op			(<=|>=|==|!=|>|<)
id			([a-zA-Z_]+)
string			(\"[^"]*\")
num			([1-9][0-9]*|0)
nlAndTab		([\t\n\r])
cpp_comment		("//"[^\n]*\n)
whitespace		([ ])
ignore			({nlAndTab}|{cpp_comment}|{whitespace})

%%

\(			showToken("LP");
\)			showToken("RP");
\{			showToken("LC");
\}			showToken("RC");
\;			showToken("SC");
=			showToken("ASSIGN");
[+]			showToken("PLUS");
[-]			showToken("MINUS");
[*] 			showToken("MULT");
[/]			showToken("DIV");
and			showToken("AND");
or			showToken("OR");
C			showToken("CELSIUS");
F			showToken("FAHRENHEIT");
K			showToken("KELVIN");
int			showToken("TYPE");
print			showToken("PRINT");
input 			showToken("INPUT");
true			showToken("TRUE");
false			showToken("FALSE");
if			showToken("IF");
else			showToken("ELSE");
while			showToken("WHILE");
break			showToken("BREAK");
not			showToken("NOT");
bool			showToken("BOOL");
switch			showToken("SWITCH");
case 			showToken("CASE");

{num}			showToken("NUM");
{rel_op}		showToken("REL_OP");
{id}			showToken("ID");
{string}		showToken("STRING");

{ignore}		;
.			{handleLexError(yylineno);}

%%


void handleLexError(int linenum) 
{
	//errorLex(linenum);
	printf("error\n");
	exit(1);
}

void showToken(char* name)
{
        printf("%d %s %s\n" , yylineno, name, yytext);
}

