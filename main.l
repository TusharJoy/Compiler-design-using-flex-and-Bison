/* C Declarations */

%{
	#include<stdio.h>
	#include "main.tab.h"
	#include<stdlib.h>
	extern int yylval;
%}

/* RE and Actions */

%%

[0-9]+	{ 
			yylval = atoi(yytext);
			return NUM;
		}

[a-z]	{
			yylval = *yytext - 'a';
			return	VAR;
		}

"jodi"	{ 
			return IF;
		}
"najodi"	{ 
			return ELSE;	
		}

[-+/*<>=,(){};:] 	{
					yylval = yytext[0];
					return *yytext;
				}



"vag"		{ return '/'		;}
"minus"		{ return '-'		;}
"guun"		{ return '*'		;}
"plus"		{ return '+'		;}
"shoman"	{ return '='		;}

"shuru"     { return(VOIDMAIN)  	;}

"print"  	{ return PRINT 		;}

"int"    	{ return(INT)		;}

"float"  	{ return(FLOAT)		;}

"char"   	{ return(CHAR)		;}

"ghurao"	{ return LOOP 		;}
"khetro"		{ return CASE  		;}

"thikvalue"        {return DEFAULT	;}

"nirbachon"	{ return SWITCH 	;}

[ \t\n]*	;

.	{
		
		yyerror("Unknown Character.\n");
	}
%%

main(){
	yyin = freopen("in.txt","r",stdin);
	yyout = freopen("out.txt","w",stdout);
	yyparse();
}

