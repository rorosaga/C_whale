
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
     ORCA = 258,
     BELUGA = 259,
     DOLPHIN = 260,
     BLUEWHALE = 261,
     PRUNE_IMAGES = 262,
     PRUNE_CONTAINERS = 263,
     PRUNE_VOLUMES = 264,
     PRUNE_NETWORKS = 265,
     SYSTEM_INFO = 266,
     RUN = 267,
     STOP = 268,
     REMOVE = 269,
     INSPECT = 270,
     LIST = 271,
     CREATE = 272,
     CONTAINERS = 273,
     IMAGES = 274,
     NETWORKS = 275,
     VOLUMES = 276,
     COMMANDS = 277,
     ALL = 278,
     FORCE = 279,
     FROM = 280,
     PORT = 281,
     VOLUME = 282,
     DETACH = 283,
     MEMORY = 284,
     ENV = 285,
     BASE = 286,
     EXPOSE = 287,
     COPY = 288,
     LABEL = 289,
     STRING_LITERAL = 290,
     ARROW = 291
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


