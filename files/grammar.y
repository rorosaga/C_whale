%{

  #include <stdio.h>
  #include <string.h>

%}

/* main commands */
%token ORCA BELUGA DOLPHIN BLUEWHALE

/* actions */
%token PRUNE_IMAGES PRUNE_CONTAINERS PRUNE_VOLUMES PRUNE_NETWORKS SYSTEM_INFO
%token RUN STOP REMOVE INSPECT LIST CREATE CONTAINERS IMAGES NETWORKS VOLUMES COMMANDS

/* subcommands */
%token ALL FORCE FROM PORT VOLUME DETACH MEMORY ENV BASE EXPOSE COPY LABEL

%token STRING_LITERAL ARROW


%%
  program: /* empty */ | statement_list;

  statement_list: statement | statement_list statement;

  statement:
    orca_statement
  | beluga_statement
  | dolphin_statement
  | bluewhale_statement
  ;
  
  orca_statement:
    ORCA orca_actions STRING_LITERAL '{' orca_subcommands '}'
  ;

  beluga_statement:
      BELUGA beluga_actions STRING_LITERAL options '{' beluga_subcommands '}'
    ;

  dolphin_statement:
      DOLPHIN dolphin_actions
    ;

  bluewhale_statement:
      BLUEWHALE bluewhale_actions '{' bluewhale_subcommands '}'
    ;

  orca_actions:
      CREATE
    | REMOVE
    | LIST
    ;
  
  beluga_actions:
      RUN
    | STOP
    | REMOVE
    | INSPECT
    | LIST
    ;

  dolphin_actions:
      CONTAINERS
    | IMAGES
    | NETWORKS
    | VOLUMES
    ;
  
  bluewhale_actions:
      PRUNE_IMAGES
    | PRUNE_CONTAINERS
    | PRUNE_VOLUMES
    | PRUNE_NETWORKS
    | SYSTEM_INFO
    ;


  options: 
      /* empty */
    | options option
    ;

  option: 
      STRING_LITERAL
    ;
  
  orca_subcommands:
    /* empty */
    | orca_subcommands orca_subcommand ARROW STRING_LITERAL ','
    ;

  orca_subcommand:
      BASE
    | RUN
    | EXPOSE
    | ENV
    | COPY
    ;

  beluga_subcommands:
    /* empty */
    | beluga_subcommands beluga_subcommand ARROW STRING_LITERAL ','
    ;

  beluga_subcommand:
      FROM
    | PORT
    | VOLUME
    | DETACH
    | MEMORY
    | ENV
    | LABEL
    ; 

  bluewhale_subcommands:
    /* empty */
    | bluewhale_subcommands bluewhale_subcommand ARROW STRING_LITERAL ','
    ;

  bluewhale_subcommand:
      ALL
    | FORCE
    ;

%%