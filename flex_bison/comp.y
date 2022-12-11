%{
  #include<stdio.h>
  int yylex();
  void yyerror(const char *s) { printf("ERROR: %s\n", s); }
%}

%token IDENTIFIER INT STR FN
%token EQ LT GT NOT AND OR ISEQUAL
%token OPEN_PAR CLOSE_PAR OPEN_BRACKET CLOSE_BRACKET SEMICOLON
%token PRINT READ WHILE IF ELSE TYPE RETURN
%token CONCAT COMMA PLUS MINUS MULT DIV

%start program

%%

program : funcdec 
        ;

funcdec : FN IDENTIFIER OPEN_PAR TYPE IDENTIFIER CLOSE_PAR funcbody
        | 
      ;
        
funcbody : OPEN_BRACKET statement RETURN expression CLOSE_BRACKET
        |  OPEN_BRACKET statement CLOSE_BRACKET
    ;

statement : vardec
          | funcdec
          | funccall
          | assignment
          | block
          | while
          | if
          | print
          SEMICOLON
          ;
        
relexpression: expression ISEQUAL expression
             | expression LT expression
             | expression GT expression
             | expression
             ;

expression: term PLUS term
          | term MINUS term
          | term OR term
          | term CONCAT term
          | term
          ;

term: factor
    | factor MULT factor
    | factor DIV factor
    | factor AND factor
    ;

factor: INT
    | STR
    | IDENTIFIER
    | funccall
    | PLUS factor
    | MINUS factor
    | NOT factor
    | READ OPEN_PAR CLOSE_PAR
    | OPEN_PAR relexpression CLOSE_PAR
    ;

assignment: TYPE IDENTIFIER EQ relexpression;

print: PRINT OPEN_PAR relexpression CLOSE_PAR;

if: IF OPEN_PAR relexpression CLOSE_PAR block else;

while: WHILE OPEN_PAR relexpression CLOSE_PAR block;

else: ELSE block | SEMICOLON;

vardec: TYPE IDENTIFIER
      | COMMA TYPE IDENTIFIER;

block: OPEN_BRACKET statement CLOSE_BRACKET;

funccall: IDENTIFIER OPEN_PAR TYPE IDENTIFIER CLOSE_PAR

%%

int main(){
  yyparse();
  return 0;
}