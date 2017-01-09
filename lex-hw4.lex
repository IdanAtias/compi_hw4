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
whitespace		([ ])
ignore			({nlAndTab}|{cpp_comment}|{whitespace})

%%

{ignore}		{};
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
{string}	{
				yylval.id = yytext; 	  
				return STRING;     	
			};
print			handleToken(PRINT);
input 			handleToken(INPUT);
true			{
					yylval.type = "BOOL";   
					return TRUE;	
				};
false			{
					yylval.type = "BOOL";   
					return FALSE;	
				};
if				handleToken(IF);
else			handleToken(ELSE);
while			handleToken(WHILE);
break			handleToken(BREAK);
not				handleToken(NOT);
bool			{
					yylval.type = "BOOL";   
					return BOOL;
				};
{num}			{
					yylval.type = "INT";
					return NUM;
				};
switch			handleToken(SWITCH);
case 			handleToken(CASE);


{rel_op}		handleToken(REL_OP);
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
