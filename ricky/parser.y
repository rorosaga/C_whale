%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylineno;
extern int yylex();
extern char* yytext;
void yyerror(const char *s) { fprintf(stderr, "Error at line %d: %s\n", yylineno, s); }

char imageName[256];
char fromValue[256];
char commandsValue[256];

void executeDockerCommand(const char *command) {
    printf("Executing Docker Command: %s\n", command);
    fflush(stdout);  // Flush the stdout buffer
    int status = system(command);
    if (status == -1) {
        printf("Failed to execute command: %s\n", command);
    }
}

void createAndBuildDockerImage(const char *dockerfileName, const char *imageName, const char *fromImage, const char *commands) {
    FILE *dockerfile = fopen(dockerfileName, "w");
    if (dockerfile == NULL) {
        fprintf(stderr, "Failed to create Dockerfile\n");
        return;
    }

    // Write to Dockerfile
    fprintf(dockerfile, "FROM %s\n", fromImage);
    if (commands) fprintf(dockerfile, "RUN %s\n", commands);
    fclose(dockerfile);

    // Construct the build command
    char buildCommand[1024];
    snprintf(buildCommand, sizeof(buildCommand), "docker build -t %s -f %s .", imageName, dockerfileName);

    // Execute the build command
    printf("Building Docker Image: %s\n", buildCommand);
    fflush(stdout);
    int status = system(buildCommand);
    if (status == -1) {
        printf("Failed to execute command: %s\n", buildCommand);
    }
}



%}

%token CLOSE_BRACE OPEN_BRACE SEMI ARROW
%token DOLPHIN BLUEWHALE BELUGA ORCA
%token LIST_IMAGES REMOVE_IMAGES LIST_CONTAINERS REMOVE_CONTAINERS
%token FROM WHERE COMMANDS IMAGE_NAME CREATE


%union {
    char* strVal;
    int intVal;
    // Add other types as needed
}

%token<strVal> STRING_LITERAL
%token<intVal> RUN BASE ENV 


%%

keywords:
    ORCA structure
    | DOLPHIN structure
    | BELUGA structure
    | BLUEWHALE structure
    | ORCA structure keywords
    | DOLPHIN structure keywords;


structure:
    OPEN_BRACE dolphin_action CLOSE_BRACE SEMI
    | OPEN_BRACE orca_action CLOSE_BRACE SEMI
    ;


orca_action:
    CREATE OPEN_BRACE orca_subcommands CLOSE_BRACE {
        createAndBuildDockerImage("Dockerfile", imageName, fromValue, commandsValue);
    }
;

orca_subcommands:
    | orca_subcommands orca_subcommand
;

orca_subcommand:
      FROM ARROW STRING_LITERAL SEMI { strncpy(fromValue, $3, sizeof(fromValue) - 1); }
    | COMMANDS ARROW STRING_LITERAL SEMI { strncpy(commandsValue, $3, sizeof(commandsValue) - 1); }
    | IMAGE_NAME ARROW STRING_LITERAL SEMI { strncpy(imageName, $3, sizeof(imageName) - 1); }
;


dolphin_action:
    LIST_IMAGES SEMI { executeDockerCommand("docker images"); }
    | LIST_CONTAINERS SEMI { executeDockerCommand("docker ps -a"); }
    | REMOVE_IMAGES SEMI { executeDockerCommand("docker rmi $(docker images -q)"); }
    | REMOVE_CONTAINERS SEMI { executeDockerCommand("docker rm $(docker ps -a -q)"); };
%%

int main() {
    memset(imageName, 0, sizeof(imageName));
    memset(fromValue, 0, sizeof(fromValue));
    memset(commandsValue, 0, sizeof(commandsValue));

    yyparse();
    return 0;
}
