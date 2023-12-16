%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylineno;
extern int yylex();
extern char* yytext;
void yyerror(const char *s) { fprintf(stderr, "Error at line %d: %s\n", yylineno, s); }

void executeDockerCommand(const char *command) {
    printf("Executing Docker Command: %s\n", command);
    fflush(stdout);  // Flush the stdout buffer
    int status = system(command);
    if (status == -1) {
        printf("Failed to execute command: %s\n", command);
    }
}

%}

%token DOLPHIN CLOSE_BRACE OPEN_BRACE SEMI
%token LIST_IMAGES REMOVE_IMAGES LIST_CONTAINERS REMOVE_CONTAINERS


%union {
    char* strVal;
    int intVal;
    // Add other types as needed
}

%token<strVal> STRING_LITERAL
%token<intVal> RUN BASE ENV 


%%
commands:
    DOLPHIN OPEN_BRACE dolphin_action CLOSE_BRACE SEMI commands
    | DOLPHIN OPEN_BRACE dolphin_action CLOSE_BRACE SEMI;

dolphin_action:
    LIST_IMAGES SEMI { executeDockerCommand("docker images"); }
    | LIST_CONTAINERS SEMI { executeDockerCommand("docker ps -a"); }
    | REMOVE_IMAGES SEMI { executeDockerCommand("docker rmi $(docker images -q)"); }
    | REMOVE_CONTAINERS SEMI { executeDockerCommand("docker rm $(docker ps -a -q)"); };
%%

int main() {
    yyparse();
    return 0;
}
