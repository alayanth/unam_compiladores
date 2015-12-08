%token	ID NUM
%token	INT FLOAT DOUBLE CHAR VOID STRUCT
%token	IF ELSE WHILE DO SWITCH CASE DEFAULT BREAK FOR PRINT
%token	SCAN RETURN

%token LPAR RPAR LCOR RCOR LLLA RLLA PC DP
%token MAS2 MENOS2 ADM 
%token MUL DIV MOD 
%token MAS MENOS
%token MENORQ MENOREQ MAYORQ MAYOREQ 
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

Ts 	: STRUCT Tsp
	;

Tsp : ID TSpp
	| LLLA Cs RLLA
	;

Tspp : LLLA Cs RLLA
	 | //añadir simbolo epsilon
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
	| Slee
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

Sc 	: CASE INT DP S Sbr // revisar INT dado que en la producción lo marca como entero
	;

Cd 	: DEFAULT DP S Sbr
	| //añadir simbolo epsilon.
	;

Sfor : FOR LPAR E PC E PC Sinc RPAR S
	 ;

Sbr : BREAK PC
	;

Sinc : ID MAS2
	 | ID MENOS2
	 ;

Simp : PRINT LPAR E RPAR
	 ;

Slee : Scon LPAR ID RPAR
	 ;


Sret : RETURN Sretp
	 ;

Sretp : PC
	  | E PC
	  ;

E 	:  V Opasig E
	| Es
	;

Opasig : EQUAL 
	   | MASEQ
	   | MENOSEQ
	   | MUL
	   | DIVEQ
	   | MODEQ
	   ;

V 	: ID Varr
	| //añadir simbolo epsilon.
	;

Varr : LCOR E RCOR
	 | //añadir simbolo epsilon.
	 ;

Es 	: Es Esp 
	| Op
	;

Esp : Oprel Op
	| Oplog Op
	;

Oplog : AND
	  | OR
	  ;

Oprel : MENOREQ
	  | MAYOREQ
	  | MENORQ
	  | MAYORQ
	  | EQUAL2
	  | NOTEQ
	  ;

Op 	: Op Opadd Tr
	| Tr
	;

Opadd : MAS
	  | MENOS
	  ;

Tr 	: Tr  Opmul F 
	| F
	;

Opmul : MUL
	  | DIV
	  | MOD
	  ;

F 	: V
	| Ll
	| LPAR E RPAR
	| //entero
	| //flotante
	| //caracter
	| //cadena
	| //dobleprecisión
	| ADM E
	| MENOS E
	;

Ll 	: ID LPAR Arg RPAR
	;

Arg : Larg
	| //añadir epsilon.
	;

Larg : Larg COMA E
	 | E
	 ;

%%
#include <stdio.h>

void yyerror(const char *s)
{
	fflush(stdout);
	fprintf(stderr, "*** %s\n", s);
}
