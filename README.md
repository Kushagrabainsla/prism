# CS 252 Final Project: Prism Language

## Overview
Prism is a custom programming language implemented in Haskell. It combines a small imperative core with powerful functional features. It is designed for **"Declarative Deconstruction"**, which is the easy breakdown of complex data structures. It works well for rule engines, symbolic manipulation, data transformation, and dynamic configuration logic.

## Project Structure
- **src/AST.hs**: Abstract Syntax Tree and Value definitions.
- **src/Parser.hs**: Parsec-based grammar implementation.
- **src/Interpreter.hs**: State-based evaluator with monadic error handling.
- **src/Main.hs**: Command-line interface.
- **docs/DesignDocumentation.md**: Detailed rationale, Clean Code analysis, and formal references.
- **test/demo.lp**: Main demonstration script.
- **test/**: A collection of specialized test programs (`recursion_test.lp`, `list_ops.lp`, `error_cases.lp`, `data_deconstruction.lp`, `mutability_test.lp`).

## How to Run
Ensure you have GHC (Glasgow Haskell Compiler) installed.

### Run the Demo
```bash
cd src && runghc Main.hs ../test/demo.lp
```

### Run Specialized Tests
```bash
# Test Recursion (Factorial & Fibonacci)
cd src && runghc Main.hs ../test/recursion_test.lp

# Test List Operations (Reverse & Map)
cd src && runghc Main.hs ../test/list_ops.lp

# Test Error Handling
cd src && runghc Main.hs ../test/error_cases.lp

# Test Data Deconstruction (ETL Pipeline)
cd src && runghc Main.hs ../test/data_deconstruction.lp

# Test Mutability
cd src && runghc Main.hs ../test/mutability_test.lp
```

## Features
1. **User-defined Functions**: Full support for recursive calls and local scoping.
2. **Recursive Lists**: Native list literals, `cons` operator, and empty list support.
3. **Pattern Matching**: Robust `match` expressions with variable binding and list deconstruction.
4. **Error Handling**: Graceful reporting of runtime errors (division by zero, unbound variables, type mismatches).

## Authors
- Kushagra Bainsla
- Krishna Mula
- Tejas Chakkarwar
