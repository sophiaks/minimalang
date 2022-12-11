%{
#include <stdio.h>
#include <string.h>
#include "comp.tab.h"
%}
%option noyywrap

%%

[ \t]	; // ignore all whitespace

"="  {return EQ;}
"=="  {return ISEQUAL;}
"<"   {return LT;}
">"   {return GT;}
"!"   {return NOT;}
"&&"  {return AND;}
"||"  {return OR;}
"("   {return OPEN_PAR;}
")"   {return CLOSE_PAR;}
"{"   {return OPEN_BRACKET;}
"}"   {return CLOSE_BRACKET;}
";"   {return SEMICOLON;}
">_"  {return PRINT;}
"_<"  {return READ;}
"~"   {return WHILE;}
"?"   {return IF;}
"!!"  {return ELSE;}
"int" {return TYPE;}
"str" {return TYPE;}
"return" {return RETURN;}
"."   {return CONCAT;}
","   {return COMMA;}
"+"   {return PLUS;}
"-"   {return MINUS;}
"*"   {return MULT;}
"/"   {return DIV;}
"fn"   {return FN;}

[a-zA-Z0-9] {return STR;}
[a-zA-Z_][_a-zA-Z0-9] {return IDENTIFIER;}
[0-9]+ {return INT;}

.                      printf("UNRECOGNIZED TOKEN!\n"); yyterminate();

%%