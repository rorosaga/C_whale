/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

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
     FROM = 270,
     WHERE = 271,
     COMMANDS = 272,
     IMAGE_NAME = 273,
     CREATE = 274,
     STRING_LITERAL = 275,
     RUN = 276,
     BASE = 277,
     ENV = 278
   };
#endif
/* Tokens.  */
#define CLOSE_BRACE 258
#define OPEN_BRACE 259
#define SEMI 260
#define ARROW 261
#define DOLPHIN 262
#define BLUEWHALE 263
#define BELUGA 264
#define ORCA 265
#define LIST_IMAGES 266
#define REMOVE_IMAGES 267
#define LIST_CONTAINERS 268
#define REMOVE_CONTAINERS 269
#define FROM 270
#define WHERE 271
#define COMMANDS 272
#define IMAGE_NAME 273
#define CREATE 274
#define STRING_LITERAL 275
#define RUN 276
#define BASE 277
#define ENV 278




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 59 "parser.y"
{
    char* strVal;
    int intVal;
    // Add other types as needed
}
/* Line 1529 of yacc.c.  */
#line 101 "parser.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

