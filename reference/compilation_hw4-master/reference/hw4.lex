%{

/* Declarations section */
#include "hw4.hpp"
#include "hw4.tab.hpp"
#include "output.hpp"

%}

%option yylineno
%option noyywrap
whitespace	([\t\n ])

%%

[(]					return LP;
[)]					return RP;
[{]					return LC;
[}]					return RC;
[;]					return SC;
[=]					return ASSIGN;
[+]					return PLUS;
[-]					return MINUS;
[*]					return MULT;
[/]					return DIV;
[><]|\<=|\>=|!=|==	return REL_OP;
and					return AND;
or					return OR;
int					{
						yylval.type = "INT";
						return INT;
					}
NIS					{
						yylval.type = "NIS";
						return NIS;
					}
AGORA				{
						yylval.type = "AGORA";
						return AGORA;
					}
print				return PRINT;
input				return INPUT;
\"[^"]*\"			return STRING;
true				{
						yylval.type = "BOOL";
						return TRUE;
					}
false				{
						yylval.type = "BOOL";
						return FALSE;
					}
if					return IF;
else				return ELSE;
while				return WHILE;
break				return BREAK;
not					return NOT;
bool				{
						yylval.type = "BOOL";
						return BOOL;
					}
[1-9][0-9]*|0		{
						yylval.type = "INT";
						return NUM;
					}
[a-zA-Z]+			{
						yylval.id = yytext;
						return ID;
					}
"//"[^\n]*\n		;
{whitespace}		;
.					{
						output::errorLex(yylineno);
						exit(1);
					}

%%