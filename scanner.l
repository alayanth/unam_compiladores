%{

#include <stdlib.h>
#include <stdio.h>
#include "y.tab.h"


void count(void);
int check_id(void);

%}

/*Variables de expresiones regulares*/

digito    [0-9]
letra     [a-zA-Z]
letrag    [a-zA-Z_]
hexa	    [a-fA-F0-9]
exponent  ([Ee][+-]?{digito}+)
sufijo 	  [fFlL]
id        {letrag}({letrag}|{digito})*
real      {digito}*"."{digito}+
entero    {digito}+
caracter  \'([\x20-\x21\x23-\xFE])?\'
cteFloat  {digito}*("."({digito}+{exponent}{sufijo}?))?
cadena 	   ({letrag}*{caracter}*{digito}*)+

%%


"//"[^\n]* {}

"int"          { count(); return INT;}
"float"        { count(); return FLOAT;}
"char"         { count(); return CHAR;}
"double"       { count(); return DOUBLE;}
"void"         { count(); return VOID;}
"for"          { count(); return FOR;}
"while"        { count(); return WHILE;}
"if"           { count(); return IF;}
"else"         { count(); return ELSE;}
"case"         { count(); return CASE;}
"switch"       { count(); return SWITCH;}
"break"        { count(); return BREAK;}
"do"           { count(); return DO;}
"default"      { count(); return DEFAULT;}
"scan"         { count(); return SCAN;}
"print"        { count(); return PRINT;}
"return"       { count(); return RETURN;}
"struct"       { count(); return STRUCT;}




"("       { count(); return LPAR; }
")"       { count(); return RPAR; }
"["       { count(); return LCOR; }
"]"       { count(); return RCOR; }
"{"       { count(); return LLLA; }
"}"       { count(); return RLLA; }
"++"      { count(); return MAS2; }
"--"      { count(); return MENOS2; }
"!"       { count(); return ADM; }
"*"       { count(); return MUL; }
"/"       { count(); return DIV; }
"%"       { count(); return MOD; }
"+"       { count(); return MAS; }
"-"       { count(); return MENOS; }
"<"       { count(); return MENQ; }
"<="      { count(); return MENEQ; }
">"       { count(); return MAY; }
">="      { count(); return MAYEQ; }
"=="      { count(); return EQUAL2; }
"!="      { count(); return NOTEQ; }
"&&"      { count(); return AND; }
"||"      { count(); return OR; }
"="       { count(); return EQUAL; }
"+="      { count(); return MASEQ; }
"-="      { count(); return MENOSEQ; }
"/="      { count(); return DIVEQ; }
"*="      { count(); return MULEQ; }
"%="      { count(); return MODEQ; }
";"		  { count(); return PC; }
","		  { count(); return COMA; }
":"		  { count(); return DP; }
{entero}	{return ENTERO;}
{hexa}		{return HEXA;}
{cteFloat} { return CTEFLOAT;}
{id}		{return ID;}
{caracter}	{return CARACTER;}
{cadena}	{return CADENA;}




[ \t\v\n\f]   { }
.			{ printf("Lexical error D=");}

%%

int yywrap(void)
{
	return 1;
}

int column = 0;

void count(void)
{
	int i;

	for (i = 0; yytext[i] != '\0'; i++)
		if (yytext[i] == '\n')
			column = 0;
		else
			column++;
}


