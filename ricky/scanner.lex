%{
    #include <stdio.h>
    #include <string.h>
    #include "parser.h"

    #define ARROW 3
    #define COLON 4
    #define BELUGA 8
    #define BLUEWHALE 10
    #define PRUNE_IMAGES 11
    #define PRUNE_CONTAINERS 12
    #define PRUNE_VOLUMES 13
    #define PRUNE_NETWORKS 14
    #define SYSTEM_INFO 15
    #define ALL 16
    #define FORCE 17
    #define STOP 19
    #define REMOVE 20
    #define INSPECT 21
    #define LIST 22
    #define CREATE 23
    #define REMOVE_BASE 24 
    #define PORT 28
    #define FROM 29
    #define VOLUME 30
    #define DETACH 31
    #define MEMORY 32
    #define COMMANDS 35
    #define EXPOSED 36
    #define CONTAINERS 37
    #define IMAGES 38
    #define NETWORKS 39
    #define VOLUMES 40
    #define ORCA 41

    void comment();
%}

%option yylineno
%option noyywrap

%%

"{"                    { printf("Open Brace\n"); return OPEN_BRACE; }
"}"                    { printf("Close Brace\n"); return CLOSE_BRACE; }
"->"                   { printf("Arrow\n"); return ARROW; }
":"                    { printf("Colon\n"); return COLON; }
";"                    { printf("Semicolon\n"); return SEMI; }
\"(\\.|[^"\\])*\"      { yylval.strVal = strdup(yytext); return STRING_LITERAL; }

"orca"                 { printf("Keyword: orca\n"); return ORCA; }
"beluga"               { printf("Keyword: beluga\n"); return BELUGA; }
"dolphin"              { printf("Keyword: dolphin\n"); return DOLPHIN; }
"bluewhale"            { printf("Keyword: bluewhale\n"); return BLUEWHALE; }

"prune_images"         { printf("Action: prune_images\n"); return PRUNE_IMAGES; }
"prune_containers"     { printf("Action: prune_containers\n"); return PRUNE_CONTAINERS; }
"prune_volumes"        { printf("Action: prune_volumes\n"); return PRUNE_VOLUMES; }
"prune_networks"       { printf("Action: prune_networks\n"); return PRUNE_NETWORKS; }
"system_info"          { printf("Action: system_info\n"); return SYSTEM_INFO; }

"all"                  { printf("Option: all\n"); return ALL; }
"force"                { printf("Option: force\n"); return FORCE; }

"containers"           { printf("Action: containers\n"); return CONTAINERS; }
"images"               { printf("Action: images\n"); return IMAGES; }
"networks"             { printf("Action: networks\n"); return NETWORKS; }
"volumes"              { printf("Action: volumes\n"); return VOLUMES; }

"run"                  { printf("Action: run\n"); return RUN; }
"stop"                 { printf("Action: stop\n"); return STOP; }
"remove"               { printf("Action: remove\n"); return REMOVE; }
"inspect"              { printf("Action: inspect\n"); return INSPECT; }

"from"                 { printf("Option: from\n"); return FROM;}
"port"                 { printf("Option: port\n"); return PORT;} 
"volume"               { printf("Option: volume\n"); return VOLUME;}
"detach"               { printf("Option: detach\n"); return DETACH;}
"memory"               { printf("Option: memory\n"); return MEMORY;}

"create"               { printf("Action: create\n"); return CREATE; }
"remove_img"               { printf("Action: remove_base\n"); return REMOVE_BASE; }

"base"                 { printf("Option: base\n"); return BASE;}
"commands"             { printf("Option: commands\n"); return COMMANDS;}
"exposes"              { printf("Option: exposes\n"); return EXPOSED;}

"list_images"          { return LIST_IMAGES; }
"remove_images"         { return REMOVE_IMAGES; }
"list_containers"       { return LIST_CONTAINERS; }
"remove_containers"     { return REMOVE_CONTAINERS; }

"env"                  { printf("Option: env\n"); return ENV; }

"//"                   { /* Single line comment - consume and ignore */ }
"/*"                   { comment(); }


[ \t\r\n]+             { /* Ignore whitespace */ }
.                      { printf("Unrecognized character: %s\n", yytext); }


%%

void comment() {
    int c;
    while ((c = input()) != 0) {
        if (c == '*' && input() == '/') {
            break;
        }
    }
}
