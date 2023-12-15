%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void parse_orca_command(const char* action, const char* image_name, const char* option, const char* value);
void parse_orca_create_options(const char* option, const char* value);
void parse_orca_sub_commands(const char* sub_command);
void yyerror(const char *s);
%}


%token OPEN_BRACE 
%token CLOSE_BRACE 
%token ARROW 
%token COLON 
%token SEMI 
%token STRING_LITERAL 
%token ORCA 
%token BELUGA 
%token DOLPHIN 
%token BLUEWHALE 
%token PRUNE_IMAGES 
%token PRUNE_CONTAINERS 
%token PRUNE_VOLUMES 
%token PRUNE_NETWORKS 
%token SYSTEM_INFO 
%token ALL 
%token FORCE 
%token RUN 
%token STOP 
%token REMOVE 
%token INSPECT 
%token LIST 
%token CREATE 
%token REMOVE_BASE 
%token ENV 
%token COPY 
%token EXPOSE 
%token PORT 
%token FROM 
%token VOLUME 
%token DETACH 
%token MEMORY 
%token BASE 
%token COMMANDS 
%token EXPOSED 
%token CONTAINERS 
%token IMAGES 
%token NETWORKS 
%token VOLUMES 

%%

program: /* empty */ | statement_list;

statement_list: statement | statement_list statement;

statement:
    '{' statement_list '}'       { /* Handle statements inside braces */ }
  | ORCA STRING_LITERAL OPEN_BRACE orca_body CLOSE_BRACE { parse_orca_command("orca", $2, NULL, NULL); }
  ;

orca_body: orca_statements;

orca_statements:
    orca_statement
  | orca_statements orca_statement
  ;

orca_statement:
    action option STRING_LITERAL SEMI { parse_orca_command($1, NULL, $2, $3); }
  ;

action:
    CREATE | EXPOSE | ENV | RUN | COPY
  ;

option:
    BASE | PORT | VOLUME | DETACH | MEMORY | COMMANDS | EXPOSED
  ;

%%

void parse_orca_command(const char* action, const char* image_name, const char* option, const char* value) {
    // Implement your logic for handling Orca commands

    if (strcmp(action, "create") == 0) {
        if (strcmp(option, "base") == 0) {
            printf("Creating image \"%s\" with base: %s\n", image_name, value);
            // Implement Docker image creation logic with the specified base image
        } else {
            fprintf(stderr, "Error: Invalid option \"%s\" for action \"%s\"\n", option, action);
            exit(EXIT_FAILURE);
        }
    } else if (strcmp(action, "expose") == 0) {
        printf("Exposing port %s for image \"%s\"\n", value, image_name);
        // Implement Docker image port exposing logic
    } else if (strcmp(action, "env") == 0) {
        printf("Setting environment variable \"%s=%s\" for image \"%s\"\n", option, value, image_name);
        // Implement Docker image environment variable setting logic
    } else if (strcmp(action, "run") == 0) {
        printf("Running command \"%s\" for image \"%s\"\n", value, image_name);
        // Implement Docker image run command logic
    } else if (strcmp(action, "copy") == 0) {
        printf("Copying file from host \"%s\" to container \"%s\" for image \"%s\"\n", option, value, image_name);
        // Implement Docker image file copying logic
    } else {
        fprintf(stderr, "Error: Unknown action \"%s\"\n", action);
        exit(EXIT_FAILURE);
    }
}

void yyerror(const char *s) {
    fprintf(stderr, "Syntax error: %s\n", s);
    exit(EXIT_FAILURE);
}

int main() {
    if (yyparse() == 0) {
        printf("Parsing successful.\n");
    } else {
        printf("Parsing failed.\n");
    }
    return 0;
}
