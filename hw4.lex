%{
    #include <stdlib.h>
    #include <string.h>
    #include <stdio.h>
    #include <iostream>
    #include "hw4.hpp"
    #include "hw4.tab.hpp"
    #include "output.hpp"
    using namespace output;
%}

%option yylineno
%option noyywrap
digit            ([0-9]) 
digitplus        ([1-9]) 
id            	([a-zA-z_])
whitespace        	([\t\n\r ])

%%
{whitespace}                {                                                    	};
"//"[^\n]*\n                {                                                    	};
\(                          {                                 return LP;         	};
\)                          {                                 return RP;         	};
\{                          {                                 return LC;         	};
\}                          {                                 return RC;         	};
;                           {                                 return SC;         	};
=                           {                                 return ASSIGN;     	};
\+                          {                                 return PLUS;       	};
-                           {                                 return MINUS;      	};
\*                          {                                 return MULT;       	};
\/                          {                                 return DIV;        	};
\<=|\>=|\<|\>|==|!=         {yylval.id = yytext;      return REL_OP;     	};
and                         {                                 return AND;        	};
or                          {						          return OR;         	};
C                     		{yylval.type = "CELSIUS";         return CELSIUS;    	};
F                           {yylval.type = "FAHRENHEIT";      return FAHRENHEIT;    };
K                           {yylval.type = "KELVIN";     	  return KELVIN; 		};
int                         {yylval.type = "INT";             return INT;        	};
print                       {                                 return PRINT;      	};
input                       {                                 return INPUT;      	};
\"[^"]*\"                   {yylval.id = yytext; 	  return STRING;     	};
true                        {                                 return TRUE;       	};
false                       {                                 return FALSE;      	};
if                          {                                 return IF;         	};
else                        {                                 return ELSE;       	};
while                       {                                 return WHILE;      	};
break                       {                                 return BREAK;      	};
not                         {                                 return NOT;        	};
bool                        {yylval.type = "BOOL";            return BOOL;       	};
{digitplus}{digit}+|{digit} {yylval.type = "INT";			  return NUM;        	};
switch                      {                                 return SWITCH;     	};
case                        {                                 return CASE;       	};
:                        	{                                 return COLON;       	};
{id}+                   	{yylval.id = yytext;      return ID;         	};
.                           {errorLex(yylineno);              exit(1);           	};
%%
