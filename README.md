# minimalang

## block
```
<block> ::= "{" <statement>* "}" 
```

## statement
```
<statement> ::= <assignment>
            |   <conditional>
            |   <loop>
            |   <stdout>
            ';'
```

## assignment
```
<assignment> ::= <primary> '=' <assignment>
```
## conditional
```
<conditional> ::= '?' <expression> '->' '('<statement>')'
              |  '?' <expression> '->' '(' <statement> ')' '!' '(' <statement> ')'
```           
## loop
```
<loop> ::= '~' <expression> '->' '('<statement>')'
       |  '~~' '(' <expression> ';' <expression> ';' <expression> ')' <statement>
```

## stdout
```
<stdout> ::= '>_' <expression>  
```

## stdin
```
<stdin> ::= '_<' <string> | <int>
```

## function def
```
<func_def> ::= <type> <identifier> (<type> <identifier> [',' <type> <identifier>]*) <block>
```

# function body
```
<function_body> ::= '{' (<statement>)* 'return' <expression> '}'
```

# function
```
<function> ::= <func_def> <func_body> 
```

## identifier
```
<identifier> ::= <letter>+(<letter> | <digit>)*
```

## logical
```
<logical> ::= <arithmetic>
          | <logical> '<' <arithmetic>
          | <logical> '==' <arithmetic>
          | <logical> '>' <arithmetic>
```
## arithmetic
```
<arithmetic> ::=  <term>
             | <arithmetic> '+' <term>
             | <arithmetic> '-' <term>

```
## term
```
<term> ::= <factor>
       |  <term> '*' <factor>
       |  <term> '/' <factor>
       |  <term> '&&' <factor>
```
## factor
``` 
<factor> ::= <int>
        |    <identifier>
        |    <string>
        |    <unary> <factor>
        |    '(' <logical> ')'
        |    <stdin>
        |    <primary>
```

## unary
```
<unary> ::= '+'
        |   '='
        |   '!'
```

## primary
```
<primary> ::= <identifier>
          | <constant>
          | <string>
          | ( <expression> )

```

## string
```
<string>  ::= [a-Z]+
```

## int
```
<int> ::= [sign] [0-9]+
```

## sign
```
<string> ::= <letter> {<letter> | <digit>}
```

## letter
```
<letter> ::= A | B | C | D | E | F | G | H | I | J | K | L | M | N | O | P | Q | R | S | T | U | V | W | Y | Z | a | b | c | d | e | f | g | h | i | j | k | l | m | n | o | p | q | r | s | t | u | v | y | x | y | z
```

## digit

```
<digit> ::= 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9
```