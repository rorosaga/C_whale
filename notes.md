# Key Concepts:

- A **lexical analyzer** is a program that transforms a stream of characters into a stream of tokens. The computer doesn't need all of the spaces and newlines and comments and other things that are in the source code. It just needs the tokens, which are the meaningful units of the language. This is the **first** phase of compilation.

- A **token** is a sequence of characters that can be treated as a unit in the grammar of the programming language. For example, `int` is a token in C. `int main` is not a token, because it is two tokens. `int main()` is a token, because it is a sequence of characters that can be treated as a unit in the grammar of the programming language.

- A **parser** is a program that transforms a stream of tokens into a parse tree. In this step, the tokens are arranged according to the grammar rules of the language. This is the **second** phase of compilation.

- **Error handling** is a big part of the parser. If the parser encounters a syntax error, it should report the error and then try to recover and continue parsing. This is called **error recovery**. When an invalid token is encountered, the tokenizer can report an error, indicating the location and nature of the lexical issue.