
%{
    #include "parser.tab.h" // Include the parser header file
    void yyerror(const char *s);
%}

/*Declaration of ALL token*/
/*Each token is what a keyword in our language would be mapped to*/
/*This tokens would be passed to the parser to execute*/

%token OPEN_BRACE CLOSE_BRACE ARROW COLON SEMI STRING_LITERAL
%token ORCA BELUGA DOLPHIN BLUEWHALE
%token PRUNE_IMAGES PRUNE_CONTAINERS PRUNE_VOLUMES PRUNE_NETWORKS SYSTEM_INFO
%token ALL FORCE
%token RUN STOP REMOVE INSPECT LIST CREATE REMOVE_BASE ENV COPY EXPOSE


/*Block of rules*/
%%

/* Symbol rules, which are just string literals each matched with a token*/
"{"                    { return OPEN_BRACE; }
"}"                    { return CLOSE_BRACE; }
"->"                   { return ARROW; }
":"                    { return COLON; }
";"                    { return SEMI; }
"\"[^\"]*\""           { yylval.strVal = strdup(yytext); return STRING_LITERAL; }

/*our four types of keywords*/
"orca"                 { return ORCA; }
"beluga"               { return BELUGA; }
"dolphin"              { return DOLPHIN; }
"bluewhale"            { return BLUEWHALE; }

/*actions for bluewhale*/
"prune_images"         { return PRUNE_IMAGES; }
"prune_containers"     { return PRUNE_CONTAINERS; }
"prune_volumes"        { return PRUNE_VOLUMES; }
"prune_networks"       { return PRUNE_NETWORKS; }
"system_info"          { return SYSTEM_INFO; }

/*options for bluewhale*/
"all"                  { return ALL; }
"force"                { return FORCE; }

/*actions for dolphin*/
"containers"            { return CONTAINERS;}
"images"                {return IMAGES;}
"networks"              {return NETWORKS;}
"volumes"               {return VOLUMES;}

/*actions for beluga*/
"run"                  { return RUN; }
"stop"                 { return STOP; }
"remove"               { return REMOVE; }
"inspect"              { return INSPECT; }

/*options for beluga*/
"from"                  { return FROM; }
"port"                  { return PORT; }
"volume"                { return VOLUME; }
"detach"                { return DETACH; }
"memory"                {return MEMORY; }

/*actions for orca*/
"create"               { return CREATE; }
"remove"               { return REMOVE_BASE; }

/*options for orca*/
"base"                 { return BASE; }
"commands"             { return COMMANDS; }
"exposes"              { return EXPOSE; }



/*actions for orca and bluewhale*/
"list"                 { return LIST; }

/*options for orca and bluewhale*/
"env"                  { return ENV; }


"//"                   { /* Single line comment */ }
"/*"                   { /* Multi-line comment start */ }
"*/"                   { /* Multi-line comment end */ }
[ \t\r\n]+             { /* Ignore whitespace */ }

.                      { /* Unrecognized characters */ }
%%

/* Additional code as needed */

int yywrap() {
    return 1; // Indicate EOF
}

