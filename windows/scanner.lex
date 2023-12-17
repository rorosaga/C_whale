%{
    #include <stdio.h>
    #include <string.h>
    #include "parser.h"

    void comment();
%}

%option yylineno
%option noyywrap

%%

"{"                    { printf("Open Brace\n"); return OPEN_BRACE; }
"}"                    { printf("Close Brace\n"); return CLOSE_BRACE; }
"->"                   { printf("Arrow\n"); return ARROW; }
";"                    { printf("Semicolon\n"); return SEMI; }
\"(\\.|[^"\\])*\"      { yylval.strVal = strdup(yytext); return STRING_LITERAL; }

"orca"                 { printf("Keyword: orca\n"); return ORCA; }
"dolphin"              { printf("Keyword: dolphin\n"); return DOLPHIN; }
"bluewhale"            { printf("Keyword: bluewhale\n"); return BLUEWHALE; }

"prune_images"         { printf("Action: prune_images\n"); return PRUNE_IMAGES; }
"prune_containers"     { printf("Action: prune_containers\n"); return PRUNE_CONTAINERS; }
"prune_volumes"        { printf("Action: prune_volumes\n"); return PRUNE_VOLUMES; }
"prune_networks"       { printf("Action: prune_networks\n"); return PRUNE_NETWORKS; }
"system_info"          { printf("Action: system_info\n"); return SYSTEM_INFO; }

"create"               { printf("Action: create\n"); return CREATE; }
"commands"             { printf("Option: commands\n"); return COMMANDS;}

"from"                 { printf("Option: image base to create the image from\n"); return FROM;}

"image_name"            { printf("Option: naming the image to be created\n"); return IMAGE_NAME;}

"list_images"          { return LIST_IMAGES; }
"remove_images"         { return REMOVE_IMAGES; }
"list_containers"       { return LIST_CONTAINERS; }
"remove_containers"     { return REMOVE_CONTAINERS; }


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