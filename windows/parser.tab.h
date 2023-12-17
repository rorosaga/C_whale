
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     CLOSE_BRACE = 258,
     OPEN_BRACE = 259,
     SEMI = 260,
     ARROW = 261,
     DOLPHIN = 262,
     BLUEWHALE = 263,
     BELUGA = 264,
     ORCA = 265,
     LIST_IMAGES = 266,
     REMOVE_IMAGES = 267,
     LIST_CONTAINERS = 268,
     REMOVE_CONTAINERS = 269,
     SYSTEM_INFO = 270,
     FROM = 271,
     WHERE = 272,
     COMMANDS = 273,
     IMAGE_NAME = 274,
     CREATE = 275,
     PRUNE_IMAGES = 276,
     PRUNE_CONTAINERS = 277,
     PRUNE_VOLUMES = 278,
     PRUNE_NETWORKS = 279,
     PRUNE_SYSTEM = 280,
     STRING_LITERAL = 281,
     RUN = 282,
     BASE = 283,
     ENV = 284
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 1676 of yacc.c  */
#line 83 "parser.y"

    char* strVal;
    int intVal;
    // Add other types as needed



/* Line 1676 of yacc.c  */
#line 89 "parser.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


