%{
   #include <stdio.h>
   #include <stdlib.h>
   #include <string.h>
   
   void parse_actions();
   void parse_options();
   void parse_sub_commands();

   void yyerror(const char *s);
%}

%option noyywrap

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

/* Grammar rules */

orca_command: ORCA STRING_LITERAL OPEN_BRACE
              {
                 printf("Orca Command: %s\n", $2);
                 parse_actions();
                 parse_sub_commands();
                 printf("End of Orca Command\n");
              }
              CLOSE_BRACE { /* Do nothing for now */ }

orca_actions: CREATE { printf("Action: Create\n"); parse_options(); }
              | REMOVE { printf("Action: Remove\n"); parse_options(); }
              | LIST { printf("Action: List\n"); }

orca_options: BASE STRING_LITERAL { printf("Option: Base %s\n", $2); }
             | RUN STRING_LITERAL { printf("Option: Run %s\n", $2); }
             | EXPOSE STRING_LITERAL { printf("Option: Expose %s\n", $2); }
             | ENV STRING_LITERAL STRING_LITERAL { printf("Option: Env %s=%s\n", $2, $3); }
             | COPY STRING_LITERAL STRING_LITERAL { printf("Option: Copy %s to %s\n", $2, $3); }

parse_sub_commands: /* You can define rules for sub-commands here */

%%



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