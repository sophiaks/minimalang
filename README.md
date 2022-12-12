# minimalang

## TESTES
Foram realizados unit tests para cada arquivo de input. Os arquivos de código fonte para teste estão dentro da pasta `tests`, e os testes de unidade estão implementados no arquivo `test.py`. Para testar, rode o comando
```
python3 test.py
```
## EBNF
```
LETTER = ( A | B | C | D | E | F | G | H | I | J | K | L | M | N | O | P | Q | R | S | T | U | V | W | Y | Z | a | b | c | d | e | f | g | h | i | j | k | l | m | n | o | p | q | r | s | t | u | v | y | x | y | z ) ;

DIGIT = ( 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 ) ;

NUM = DIGIT [ { DIGIT } ] ;

STR = '"', { LETTER | DIGIT }, '"';

TYPE = "int" | "str" ;

PROGRAM = { FUNCDEC } ;

UNARY= ( "+" | "-" | "!" ) ;

IDENTIFIER = LETTER, { LETTER | DIGIT | "_" } ;

VARDEC = TYPE, IDENTIFIER ;

FUNCDEC = TYPE, IDENTIFIER , "(" [ , TYPE, IDENTIFIER [ , { "," , TYPE, IDENTIFIER } ] ] , ")" , FUNCBODY;

FUNCBODY = "{", { STATEMENT }, ["return", EXPRESSION] "}" ;

IF = "?" , "(" , RELEXPR , ")",  BLOCK , [ "!!" , BLOCK ] ;

WHILE = "~" , "(" , RELEXPR , ")" , BLOCK ;

STATEMENT =  ( λ | VARDEC | FUNCDEC | FUNCCALL | ASSIGNMENT | BLOCK | WHILE | IF ), ";"

BLOCK = "{" { STATEMENT } "}";

SDTIN = "_<", "(", ")" ;

STDOUT = ">_", "(" RELEXPR ")" ;

FACTOR = ( NUM | STR | IDENTIFIER | FUNCCALL | "(" , RELEXPR , ")" ) ;

TERM = FACTOR, { ("*" | "/" | "&&"), FACTOR } ;

EXPRESSION = TERM, { ("+" | "-" | "||"), TERM } ;

RELEXPR =  EXPRESSION , { ("<" | "==" | ">" ) , EXPRESSION } ;

ASSIGNMENT = IDENTIFIER, "=", RELEXPR ;
```
