``` 
%{
#include <stdio.h>
#include <string.h>
%} 
```

The `%{ ... %}` block allows you to include C code that will be directly copied into the generated parser.
yacc
Copy code
%token ORCA BELUGA DOLPHIN BLUEWHALE
%token STRING_LITERAL ACTION
%token declarations define terminal symbols (tokens) used in the grammar.
ORCA, BELUGA, DOLPHIN, and BLUEWHALE represent the actions.
STRING_LITERAL represents a string literal (e.g., image or container name).
ACTION is used to represent the action keyword.
yacc
Copy code
%%

program: /* empty */ | statement_list;

statement_list: statement | statement_list statement;

statement:
    orca_statement
  | beluga_statement
  | dolphin_statement
  | bluewhale_statement
  ;
The program rule represents the top-level structure of your language. It consists of an optional list of statements.
statement_list is a list of statements, and a statement can be one of the specific actions.
yacc
Copy code
orca_statement:
    ORCA ACTION STRING_LITERAL '{' subcommands '}'
  ;
orca_statement represents the syntax for the Orca action.
It starts with the keyword ORCA, followed by the action (e.g., ACTION), a string literal (STRING_LITERAL), and a block of subcommands enclosed in curly braces.
yacc
Copy code
beluga_statement:
    BELUGA ACTION STRING_LITERAL options '{' subcommands '}'
  ;

options:
    /* empty */
  | options option
  ;

option:
    STRING_LITERAL
  ;
beluga_statement represents the syntax for the Beluga action.
It starts with the keyword BELUGA, followed by the action, a string literal, optional options (specified as a list of option rules), and a block of subcommands.
yacc
Copy code
dolphin_statement:
    DOLPHIN ACTION '{' '}'
  ;
dolphin_statement represents the syntax for the Dolphin action.
It starts with the keyword DOLPHIN, followed by the action, and an empty block.
yacc
Copy code
bluewhale_statement:
    BLUEWHALE ACTION '{' subcommands '}'
  ;
bluewhale_statement represents the syntax for the Bluewhale action.
It starts with the keyword BLUEWHALE, followed by the action, and a block of subcommands.
yacc
Copy code
subcommands:
    /* empty */
  | subcommands subcommand
  ;

subcommand:
    orca_statement
  | beluga_statement
  | dolphin_statement
  | bluewhale_statement
  ;
subcommands is a list of subcommands, and a subcommand can be one of the specific actions.
yacc
Copy code
%%

void yyerror(const char* s) {
    fprintf(stderr, "Parser error: %s\n", s);
}

int main() {
    yyparse();
    return 0;
}
The yyerror function is called in case of a parser error and prints an error message.
The main function calls yyparse to initiate the parsing process.




