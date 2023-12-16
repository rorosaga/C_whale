%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylineno;
extern int yylex();
extern char* yytext;
void yyerror(const char *s) { fprintf(stderr, "Error at line %d: %s\n", yylineno, s); }

void executeDockerCommand() {
    printf("Executing Docker Command: docker pull ubuntu\n");
    system("docker pull ubuntu");
}

%}

%token ORCA

%union {
    char* strVal;
    int intVal;
    // Add other types as needed
}

%token<strVal> STRING_LITERAL
%token<intVal> RUN BASE ENV

%%

commands:
    ORCA { executeDockerCommand(); }
    ;

%%

int main() {
    yyparse();
    return 0;
}