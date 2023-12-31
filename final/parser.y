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

void removeQuotes(char *str) {
    char *p1 = str;
    char *p2 = str;

    while (*p2 != '\0') {
        if (*p2 != '\"') {
            *p1++ = *p2;
        }
        p2++;
    }
    *p1 = '\0';
}


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

    if (commands) {
        // Create a modifiable copy of commands
        char *modifiableCommands = strdup(commands);
        if (modifiableCommands) {
            removeQuotes(modifiableCommands);
            fprintf(dockerfile, "RUN %s\n", modifiableCommands);
            free(modifiableCommands);  // Free the allocated memory
        }
    }

    fclose(dockerfile);

    // Construct and execute the build command
    char buildCommand[1024];
    snprintf(buildCommand, sizeof(buildCommand), "docker build -t %s -f %s .", imageName, dockerfileName);
    printf("Building Docker Image: %s\n", buildCommand);
    fflush(stdout);

    int status = system(buildCommand);
    if (status == -1) {
        fprintf(stderr, "Failed to execute command: %s\n", buildCommand);
    }
}



%}

%token CLOSE_BRACE OPEN_BRACE SEMI ARROW
%token DOLPHIN BLUEWHALE BELUGA ORCA
%token LIST_IMAGES REMOVE_IMAGES LIST_CONTAINERS REMOVE_CONTAINERS SYSTEM_INFO
%token FROM WHERE COMMANDS IMAGE_NAME CREATE
%token PRUNE_IMAGES PRUNE_CONTAINERS PRUNE_VOLUMES PRUNE_NETWORKS PRUNE_SYSTEM


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
    | DOLPHIN structure keywords
    | BLUEWHALE structure keywords;


structure:
    OPEN_BRACE dolphin_action CLOSE_BRACE SEMI
    | OPEN_BRACE orca_action CLOSE_BRACE SEMI
    | OPEN_BRACE bluewhale_action CLOSE_BRACE SEMI
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
    | REMOVE_CONTAINERS SEMI { executeDockerCommand("docker rm $(docker ps -a -q)"); }
    | SYSTEM_INFO SEMI { executeDockerCommand("docker system info")}
    ;


bluewhale_action:
    PRUNE_IMAGES SEMI { executeDockerCommand("docker image prune -a"); } 
    | PRUNE_CONTAINERS SEMI { executeDockerCommand("docker container prune"); }
    | PRUNE_NETWORKS SEMI { executeDockerCommand("docker network prune"); }
    | PRUNE_VOLUMES SEMI { executeDockerCommand("docker volume prune"); }
    | PRUNE_SYSTEM SEMI { executeDockerCommand("docker system prune"); }
    |
    ;


%%

int main() {
    memset(imageName, 0, sizeof(imageName));
    memset(fromValue, 0, sizeof(fromValue));
    memset(commandsValue, 0, sizeof(commandsValue));

    yyparse();
    return 0;
}