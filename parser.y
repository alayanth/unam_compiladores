%token	ID NUM
%token	INT FLOAT DOUBLE CHAR VOID STRUCT
%token	IF ELSE WHILE DO SWITCH CASE DEFAULT BREAK FOR PRINT
%token	SCAN RETURN

%token LPAR RPAR LCOR RCOR LLLA RLLA PC DP
%token MAS2 MENOS2 ADM 
%token MUL DIV MOD 
%token MAS MENOS
%token MENQ MENEQ MAY MAYEQ 
%token EQUAL2 NOTEQ
%token AND 
%token OR 
%token EQUAL MASEQ MENOSEQ DIVEQ MULEQ MODEQ

%start program
%%

program : Ld
		;

Ld 	: Ld D 
   	| D
   	;

D 	: Dv
	| Df
	| Ts
	;

Dv 	: T Lv PC
	;

Lv	: Lv COMA L
	| L
	;

L 	: ID A
	;

A 	: LCOR NUM RCOR A 
	| //añadir simbolo epsilon.
	;

T 	: INT
	| FLOAT
	| DOUBLE
	| CHAR
	| VOID
	| Ts
	;

Ts 	: STRUCT ID LLLA Cs RLLA
	| STRUCT LLLA Cs RLLA
	| STRUCT ID
	;

Cs 	: Cs Dv
	| Dv
	;

Df 	: T ID LPAR Pms RPAR B
	;

Pms : Lpms
	| VOID
	;

Lpms : Lpms COMA Pm
	 | Pm
	 ;

Pm 	: T ID Apm
	;

Apm : LCOR RCOR Apm
	| //añadir simbolo epsilon.
	;

B 	: LLLA D 	//duda con esta producción
	| Ls RLLA
	;

Dl 	: Dl Dv
	| //añadir simbolo epsilon.
	;

Ls 	: Ls S
	| //añadir simbolo epsilon.
	;

S 	: Se
	| Sif
	| Swh
	| Sdo
	| Ssw
	| Sfor
	| Sbr
	| Sret
	| B
	| Simp
	| Sels
	;

Se 	: E PC
	| PC
	;

Sif : IF LPAR E RPAR S S Sels
	;

Sels : ELSE S 
	 | //añadir simbolo epsilon.
	 ;

Swh : WHILE LPAR E RPAR S
	;

Sdo : DO S WHILE LPAR E RPAR
	;

Ssw : SWITCH LPAR ID RPAR LLLA Lc Cd RLLA
	;

Lc 	: Lc Sc 
	| Sc
	;

Sc 	: CASE INT DP S Sbr
	;




%%
#include <stdio.h>

void yyerror(const char *s)
{
	fflush(stdout);
	fprintf(stderr, "*** %s\n", s);
}
