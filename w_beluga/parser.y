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
char containerName[256];
char portName[256];
char volumeName[256];
char detachMode[100];
char memoryName[256];
char envName[256];
char networkName[256];





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

void stopRemoveInspectStartContainer(const char* containerName, const char* action) {
    char buildCommand[1024];
    snprintf(buildCommand, sizeof(buildCommand), "docker %s %s", action, containerName);

    printf("Executing command: %s\n", buildCommand);
    fflush(stdout);
    int status = system(buildCommand);
    if (status == -1) {
        printf("Failed to execute command: %s\n", buildCommand);
    }
}

/* port missing */
void spinUpDockerContainer(const char* containerName, const char* imageName, const char* volumeName, const char* detachMode, const char* memoryName, const char* envName, const char* networkName) {
    char buildCommand[1024];
    snprintf(buildCommand, sizeof(buildCommand), "docker run %s %s %s %s %s %s %s", containerName, detachMode, volumeName, memoryName, envName, networkName, imageName);

    printf("Executing command: %s\n", buildCommand);
    fflush(stdout);
    int status = system(buildCommand);
    if (status == -1) {
        printf("Failed to execute command: %s\n", buildCommand);
    }

}



%}

%token CLOSE_BRACE OPEN_BRACE SEMI ARROW
%token DOLPHIN BLUEWHALE BELUGA ORCA
%token LIST_IMAGES REMOVE_IMAGES LIST_CONTAINERS REMOVE_CONTAINERS SYSTEM_INFO
%token FROM WHERE COMMANDS IMAGE_NAME CREATE
%token PRUNE_IMAGES PRUNE_CONTAINERS PRUNE_VOLUMES PRUNE_NETWORKS PRUNE_SYSTEM
%token RUN STOP REMOVE INSPECT START
%token CONTAINER_NAME VOLUME DETACH PORT MEMORY NETWORK


%union {
    char* strVal;
    int intVal;
    // Add other types as needed
}

%token<strVal> STRING_LITERAL
%token<intVal> RUN BASE 


%%

keywords:
    ORCA structure
    | DOLPHIN structure
    | BELUGA structure
    | BLUEWHALE structure
    | ORCA structure keywords
    | DOLPHIN structure keywords
    | BELUGA structure keywords
    | BLUEWHALE structure keywords;


structure:
    OPEN_BRACE dolphin_action CLOSE_BRACE SEMI
    | OPEN_BRACE orca_action CLOSE_BRACE SEMI
    | OPEN_BRACE bluewhale_action CLOSE_BRACE SEMI
    | OPEN_BRACE beluga_action CLOSE_BRACE SEMI
    ;


orca_action:
    CREATE OPEN_BRACE orca_subcommands CLOSE_BRACE {
        createAndBuildDockerImage("Dockerfile", imageName, fromValue, commandsValue);
    }
    | REMOVE OPEN_BRACE STRING_LITERAL CLOSE_BRACE {
        executeDockerCommand("docker rmi )
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


beluga_action:
    RUN OPEN_BRACE beluga_subcommands CLOSE_BRACE {
        /* code for running container with params */
        spinUpDockerContainer(containerInput, portName, imageName, volumeInput, detachMode, memoryInput, envInput, networkInput);
    }
    | STOP OPEN_BRACE STRING_LITERAL CLOSE_BRACE {
        strncpy(containerName, $3, sizeof(containerName) - 1);
        char* action = "stop";
        stopRemoveInspectStartContainer(containerName, action);
    }
    | REMOVE OPEN_BRACE STRING_LITERAL CLOSE_BRACE {
        strncpy(containerName, $3, sizeof(containerName) - 1);
        char* action = "rm";
        stopRemoveInspectStartContainer(containerName, action);
    }
    | INSPECT OPEN_BRACE STRING_LITERAL CLOSE_BRACE {
        strncpy(containerName, $3, sizeof(containerName) - 1);
        char* action = "inspect";
        stopRemoveInspectStartContainer(containerName, action);
    }
    | START OPEN_BRACE STRING_LITERAL CLOSE_BRACE {
        strncpy(containerName, $3, sizeof(containerName) - 1);
        char* action = "start";
        stopRemoveInspectStartContainer(containerName, action);
    }

beluga_subcommands:
    | beluga_subcommands beluga_subcommand
    ;

beluga_subcommand:
    CONTAINER_NAME ARROW STRING_LITERAL SEMI { 
        strncpy(containerName, $3, sizeof(containerName) - 1);
        const char* cn_prefix = "--name";
        size_t newStringLength = strlen(cn_prefix) + 1 + strlen(containerName) + 1;
        char *containerInput = (char *)malloc(newStringLength);
        if (containerInput != NULL) {
            snprintf(containerInput, newStringLength, "%s %s", prefix, containerName);
            /* saves variable to '--name inputName' */
        } else {
            fprintf(stderr, "Memory allocation failed\n");
            strcpy(containerInput, "");
        }
        }

    | PORT ARROW STRING_LITERAL SEMI { 
        strtol($3, portName, 10); 
        const char* p_prefix = "-p"
    }

    | IMAGE_NAME ARROW STRING_LITERAL SEMI {  
        strncpy(imageName, $3, sizeof(imageName) - 1); 
        
        }

    | VOLUME ARROW STRING_LITERAL SEMI { 
        strncpy(volumeName, $3, sizeof(volumeName) - 1); 
        const char* v_prefix = "-v";
        size_t newStringLength = strlen(v_prefix) + 1 + strlen(volumeName) + 1;
        char *volumeInput = (char *)malloc(newStringLength);
        if (volumeInput != NULL) {
            snprintf(volumeInput, newStringLength, "%s %s", v_prefix, volumeName);

        } else {
            fprintf(stderr, "Memory allocation failed\n");
            strcpy(volumeInput, "");
        }
        }
    | DETACH ARROW STRING_LITERAL SEMI {  
        /* sample: detach -> true; */
        if (strcmp($3, "true") == 0) {
            strcpy(detachMode, "-d");
        } else if (strcmp($3, "false") == 0) {
            strcpy(detachMode, "");
        } else {
            fprintf(stderr, "Invalid boolean value: %s\n", $3);
            // Handle the error as needed
    }
     }
    | MEMORY ARROW STRING_LITERAL SEMI { 
        strncpy(memoryNameName, $3, sizeof(memoryName) - 1); 
        const char* m_prefix = "--memory";
        size_t newStringLength = strlen(m_prefix) + 1 + strlen(memoryName) + 1;
        char *memoryInput = (char *)malloc(newStringLength);
        if (memoryInput != NULL) {
            snprintf(memoryInput, newStringLength, "%s %s", m_prefix, memoryName);

        } else {
            fprintf(stderr, "Memory allocation failed\n");
            strcpy(memoryInput, "");
        }
        }

    | ENV ARROW STRING_LITERAL SEMI { 
        strncpy(envName, $3, sizeof(envName) - 1);  
        const char* e_prefix = "-e";
        size_t newStringLength = strlen(e_prefix) + 1 + strlen(envName) + 1;
        char *envInput = (char *)malloc(newStringLength);
        if (envInput != NULL) {
            snprintf(envInput, newStringLength, "%s %s", e_prefix, envName);

        } else {
            fprintf(stderr, "Memory allocation failed\n");
            strcpy(envInput, "");
        }
        }
    | NETWORK ARROW STRING_LITERAL SEMI {  
        strncpy(networkName, $3, sizeof(networkName) - 1); 
        const char* nw_prefix = "--network";
        size_t newStringLength = strlen(nw_prefix) + 1 + strlen(nwName) + 1;
        char *networkInput = (char *)malloc(newStringLength);
        if (networkInput != NULL) {
            snprintf(networkInput, newStringLength, "%s %s", nw_prefix, networkName);

        } else {
            fprintf(stderr, "Memory allocation failed\n");
            strcpy(networkInput, "");
        }
        }



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
    memset(containerName, 0, sizeof(containerName));
    memset(portName, 0, sizeof(portName));
    memset(volumeName, 0, sizeof(volumeName));
    memset(detachMode, 0, sizeof(detachMode));
    memset(memoryName, 0, sizeof(memoryName));
    memset(envName, 0, sizeof(envName));
    memset(networkName, 0, sizeof(networkName));

    yyparse();
    return 0;
}
