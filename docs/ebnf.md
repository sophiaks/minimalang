## block
<block> ::= <statement>*

## statement
<statement> ::= <assignment>
            |   <conditional>
            |   <loop>
            |   <stdout>
            ';'

## assignment
<assignment> ::= <primary> '=' <assignment>

## conditional
<conditional> ::= '?' <expression> '->' '('<statement>')'
              |  '?' <expression> '->' '(' <statement> ')' '!' '(' <statement> ')'
              
## loop
<loop> ::= '~' <expression> '->' '('<statement>')'
       |  '~~' '(' <expression> ';' <expression> ';' <expression> ')' <statement>

## stdout
<stdout> ::= '>_' <expression>  

## stdin
<stdin> ::= '_<' <string> | <int>

## identifier
<identifier> ::= <letter>+(<letter> | <digit>)*

## logical
<logical> ::= <arithmetic>
          | <logical> '<' <arithmetic>
          | <logical> '==' <arithmetic>
          | <logical> '>' <arithmetic>

## arithmetic
<arithmetic> ::=  <term>
             | <arithmetic> '+' <term>
             | <arithmetic> '-' <term>

## term
<term> ::= <factor>
       |  <term> '*' <factor>
       |  <term> '/' <factor>
       |  <term> '&&' <factor>

## primary
<primary> ::= <identifier>
          | <constant>
          | <string>
          | ( <expression> )
    
## STRING
    can I use regeX in EBNF?
   : [a-Z]+

## INT
   : [sign] [0-9]+

## sign

<string> ::= <letter> {<letter> | <digit>}
<letter> ::= A | B | ... | Z | a | b | ... | z
<digit> ::= 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9