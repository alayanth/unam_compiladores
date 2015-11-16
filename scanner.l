%token	ID NUM
%token	INT FLOAT DOUBLE CHAR VOID STRUCT
%token	IF ELSE WHILE DO SWITCH CASE DEFAULT BREAK FOR PRINT
%token	SCAN RETURN

%token LPAR RPAR LCOR LCOR LLLA RLLA 
%token MAS2 MENOS2 ADM 
%token MUL DIV MOD 
%token MAS MENOS
%token MENQ MENEQ MAY MAYEQ 
%token EQUAL2 NOTEQ
%token AND 
%token OR 
%token EQUAL MASEQ MENOSEQ DIVEQ MULEQ MODEQ

%start programa
%%

%%
#include <stdio.h>

void yyerror(const char *s)
{
	fflush(stdout);
	fprintf(stderr, "*** %s\n", s);
}
