%{
#include <stdio.h>
#include <string.h>
%}

%token OPEN_BRACE CLOSE_BRACE ARROW COLON SEMI STRING_LITERAL
%token ORCA BELUGA DOLPHIN BLUEWHALE
%token PRUNE_IMAGES PRUNE_CONTAINERS PRUNE_VOLUMES PRUNE_NETWORKS SYSTEM_INFO
%token ALL FORCE RUN STOP REMOVE INSPECT LIST CREATE REMOVE_BASE ENV COPY
%token EXPOSE PORT FROM VOLUME DETACH MEMORY BASE COMMANDS EXPOSED CONTAINERS
%token IMAGES NETWORKS VOLUMES

%start program

%%
program: /* empty */ | statement_list;

statement_list: statement | statement_list statement;

statement:
    '{' statement_list '}'       { /* Handle statements inside braces */ }
  | action ';'                   { /* Handle standalone actions */ }
  | option ':'                   { /* Handle options */ }
  | command ':' statement_list   { /* Handle commands with nested statements */ }
  ;

action:
    ORCA | BELUGA | DOLPHIN | BLUEWHALE
  | PRUNE_IMAGES | PRUNE_CONTAINERS | PRUNE_VOLUMES | PRUNE_NETWORKS | SYSTEM_INFO
  | RUN | STOP | REMOVE | INSPECT | LIST | CREATE | REMOVE_BASE
  ;

option:
    ALL | FORCE | FROM | PORT | VOLUME | DETACH | MEMORY | BASE | COMMANDS | EXPOSED | ENV | COPY
  ;

command:
    CONTAINERS | IMAGES | NETWORKS | VOLUMES
  ;
