/*
 * hw4.lex
 *
 *  Created on: Dec 24, 2016
 *      Author: idan
 *      Author: sapir
 */


%{
    #include <stdlib.h>
    #include <string.h>
    #include <stdio.h>
    #include <iostream>
    #include "hw4.hpp"
    #include "hw4.tab.hpp"
    #include "output.hpp"
    using namespace output;
	int handleToken(int token);
%}


%option yylineno
%option noyywrap

rel_op			(<=|>=|>|<|==|!=)
id				([a-zA-Z_]+)
string			(\"[^"]*\")
num				([1-9][0-9]*|0)
nlAndTab		([\t\n\r])
cpp_comment		("//"[^\n]*\n)
ignore			([\t\n\r ])

%%

{ignore}		{};
{cpp_comment}   {};
\(			return handleToken(LP);
\)			return handleToken(RP);
\{			return handleToken(LC);
\}			return handleToken(RC);
\;			return handleToken(SC);
=			return handleToken(ASSIGN);
[+]			return handleToken(PLUS);
[-]			return handleToken(MINUS);
[*] 		return handleToken(MULT);
[/]			return handleToken(DIV);
{rel_op}	return handleToken(REL_OP);
and			return handleToken(AND);
or			return handleToken(OR);
C			{
				yylval.type = "CELSIUS"; 
				return CELSIUS;
			};
F			{
				yylval.type = "FAHRENHEIT";
				return FAHRENHEIT;
			};
K			{
				yylval.type = "KELVIN";
				return KELVIN;	
			};
int			{
				yylval.type = "INT";
				return INT;	
			};
print			return handleToken(PRINT);
input 			return handleToken(INPUT);
{string}	{
				yylval.id = yytext; 	  
				return STRING;     	
			};
true			{
					yylval.type = "BOOL";   
					return TRUE;	
				};
false			{
					yylval.type = "BOOL";   
					return FALSE;	
				};
if				return handleToken(IF);
else			return handleToken(ELSE);
while			return handleToken(WHILE);
break			return handleToken(BREAK);
not				return handleToken(NOT);
bool			{
					yylval.type = "BOOL";   
					return BOOL;
				};
{num}			{
					yylval.type = "INT";
					return NUM;
				};
switch			return handleToken(SWITCH);
case 			return handleToken(CASE);

:               return handleToken(COLON);
{id}			{
					yylval.id = yytext;
					return ID;
				};



.				{
				errorLex(yylineno);              
				exit(1);           	
				};

%%

int handleToken(int token){
	return token;
}
