%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(const char *s);
%}


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
%token CTEFLOAT ENTERO HEXA COMA CARACTER CADENA

%start program
%%

program : ld
		;

ld 	: ld d 
   	| d
   	;

d 	: dv
	| df
	| ts
	;

dv 	: t lv PC
	;

lv	: lv COMA l
	| l
	;

l 	: ID a
	;

a 	: LCOR NUM RCOR a 
	| 
	;

t 	: INT
	| FLOAT
	| DOUBLE
	| CHAR
	| VOID
	| ts
	;

ts 	: STRUCT tsp;
tsp : ID tspp
	| LLLA cs RLLA;
tspp : LLLA cs RLLA
	 | e;

cs 	: cs dv
	| dv
	;

df 	: t ID LPAR pms RPAR b
	;

pms : lpms
	| VOID
	;

lpms : lpms COMA pm
	 | pm
	 ;

pm 	: t ID apm
	;

apm : LCOR RCOR apm
	| //añadir simbolo epsilon.
	;

b 	: LLLA dl ls RLLA
	;

dl 	: dl dv
	| //añadir simbolo epsilon.
	;

ls 	: ls s
	| //añadir simbolo epsilon.
	;

s 	: se
	| sif
	| swh
	| sdo
	| ssw
	| sfor
	| sbr
	| sret
	| b
	| simp
	| slee
	;

se 	: e PC
	| PC
	;

sif : IF LPAR e RPAR s s sels
	;

sels : ELSE s 
	 | //añadir simbolo epsilon.
	 ;

swh : WHILE LPAR e RPAR s
	;

sdo : DO s WHILE LPAR e RPAR
	;

ssw : SWITCH LPAR ID RPAR LLLA lc cd RLLA;

lc 	: lc sc 
	| sc
	;

sc 	: CASE ENTERO DP s sbr
	;

cd : DEFAULT DP s sbr
	| ;


sfor : FOR LPAR e PC e PC sinc RPAR s;

sbr : BREAK PC;

sinc : ID MAS2
     | ID MENOS2;

simp : PRINT LPAR e RPAR PC;

sret : RETURN sretp;

sretp : PC | e PC;

e : v opasing e 
  | es;

opasing : EQUAL | MASEQ | MENOSEQ | MUL | DIVEQ | MODEQ ; 

v : ID varr | ;

varr : LCOR e RCOR varr
	 | ;
es : es esp
   | op;

 esp : oprel op
     | oplog op;
 oplog : AND
       | OR;
oprel : MENEQ | MAYEQ | MENQ | MAY | EQUAL2 | NOTEQ;

op : op opadd tr
   | tr;

opadd : MAS | MENOS;

tr : tr opmul f
   | f;

opmul : MUL
      | DIV
      | MOD;

f : v
  | ll
  | LPAR e RPAR
  | ENTERO
  | CTEFLOAT
  | CARACTER
  | CADENA
  | ADM e
  | MENOS e;

ll : ID LPAR arg RPAR;

arg : larg ;     //epsilon

larg : larg COMA e
     | e ;

slee : SCAN LPAR ID RPAR PC;



%%
extern FILE *yyin;

void yyerror(const char *s)
{
	fflush(stdout);
	fprintf(stderr, "*** %s\n", s);
}

int main(int argc, char **argv)
{
	if(argc>0)
		yyin=fopen(argv[1],"r");
	else
		yyin=stdin;

	yylex();
	return 0;
}

