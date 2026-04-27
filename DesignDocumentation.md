# Prism Language - Design & Implementation Documentation

## 1. Introduction
Prism is a functional-imperative language designed for the CS252 final project. It has three main features beyond a basic language: user-defined functions, recursive list structures, and pattern matching.

The name **Prism** comes from the language's main idea: just as a prism breaks light into colors, the Prism language uses pattern matching to break complex data down into basic parts.

## 2. Motivation
The main reason for Prism is to provide a tool for **"Declarative Deconstruction."** In other languages, processing recursive data like lists requires complex loops, managing indexes, and nested conditionals. Prism handles this for the programmer.

### Key Use Cases:
1.  **Rule Engines**: Writing business or game logic by matching data shapes.
2.  **Symbolic Manipulation**: Good for building compilers or math tools where data is tree-like.
3.  **Data Transformation**: Fixing and changing complex list structures with less code.
4.  **Configuration with Logic**: Modern tools need smart configurations; Prism lets you generate settings dynamically.

### 2.1 Lexical Scoping
**Decision:** Function calls use their own local environment.
**Reasoning:** To keep things separate, functions should not change global variables unless meant to. By keeping the `variables` map separate during function reading, we avoid name mix-ups and follow standard scoping rules found in modern languages.

### 2.2 First-Class Pattern Matching
**Decision:** `match` is an expression, not just for making functions.
**Reasoning:** While many languages use pattern matching in function setups, making `match` an expression lets you write more flexible code. You can do different checks in the middle of a big calculation without needing to make a whole new function.

### 2.3 Recursive List Structure
**Decision:** Lists are built-in as `ListVal` in the interpreter.
**Reasoning:** This keeps `cons` operations fast ($O(1)$) and makes breaking lists down easy. By using a standard Haskell list inside the `Value` type, the interpreter stays fast and simple to understand.

### 2.4 Error Handling with ExceptT
**Decision:** Used `ExceptT String (State InterpreterState)` to run code.
**Reasoning:** Basic interpreters often crash when there is an error (like division by zero or missing variables). By using a Monad Transformer stack, Prism gives good error messages without crashing the host Haskell environment, which makes it safe to use.

## 3. Clean Code Principles (Robert C. Martin)

- **Meaningful Names:** Every function in `Interpreter.hs` and `Parser.hs` (e.g., `evalOp`, `matchPattern`, `findMatch`) explicitly states its intent.
- **Small Functions:** The evaluator is broken down into small, case-specific functions. No single function handles more than one logical step.
- **Single Responsibility:** `AST.hs` defines the structure, `Parser.hs` handles syntax, and `Interpreter.hs` handles logic. There is no mixing of concerns.
- **Don't Repeat Yourself (DRY):** Common logic like environment lookups and pattern matching are centralized.

## 4. How to Demo
To run the project, ensure you have `ghc` installed. Run the following command from the project root:

```bash
runghc -iFinal Final/Main.hs Final/demo.lp
```

## 5. References
Following the project requirements for professional citations:

1.  **Leijen, Daan.** (2001). *Parsec: Direct Style Monadic Parser Combinators for the Real World*. Department of Computer Science, Utrecht University. Accessed April 26, 2026.
2.  **Marlow, Simon (ed).** (2010). *Haskell 2010 Language Report*. Available at: https://www.haskell.org/onlinereport/haskell2010/. Accessed April 26, 2026.
3.  **Martin, Robert C.** (2008). *Clean Code: A Handbook of Agile Software Craftsmanship*. Prentice Hall. 
4.  **Meyer, Bertrand.** (1992). *Applying "Design by Contract"*. IEEE Computer, 25(10): 40-51. Accessed April 26, 2026.
5.  **Thompson, Simon.** (2011). *Haskell: The Craft of Functional Programming*. 3rd Edition. Addison-Wesley.

This will:
1. Parse the `demo.lp` file.
2. Execute the recursive `sum` and `length` functions.
3. Perform list filtering.
4. Print the final result and the state of the environment.
