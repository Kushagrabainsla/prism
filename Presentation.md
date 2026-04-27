# Prism Language - Project Presentation
**By: Krishna Mula, Kushagra Bainsla, Tejas Chakkarwar**

---

## 1. Project Goal: "Declarative Deconstruction"
- Build a language that makes it easy to look *inside* complex data.
- Go beyond basic math to support reading lists and advanced control flow.

---

## 2. Key Features
- **User-Defined Functions**: Recursive calls with local scope.
- **Recursive Lists**: Support for `cons`, empty lists, and list literals.
- **Pattern Matching**: Strong `match` expression for easy list processing.
- **Static Analysis**: Check for missing variables before running (Stretch Goal).

---

## 3. Language Syntax (Demo)
```haskell
fun sum(xs) =
  match xs with
  | [] -> 0
  | h:t -> h + sum(t)

x = [1, 2, 3, 4];
sum(x) // Result: 10
```

---

## 4. Implementation Details
- **Frontend**: Parsec (Parser Combinators).
- **Backend**: `State` and `ExceptT` monads for easy state and error handling.
- **Scoping**: Keep local variables safe during function calls.

---

## 5. Clean Code & Design Choices
- **Small Functions**: Every step uses specific helpers.
- **Descriptive Errors**: Clear "Static Analysis Error", "Runtime Error", and "Parse Error".
- **Sound Reasoning**: Why use a standard Haskell list? Why make `match` an expression?

---

## 6. Outcomes
- Successfully built all planned features.
- Achieved "Stretch Goal" of checking names before running.
- Made a strong test suite for recursion, lists, and tricky cases.

---

## 7. Demo
*Run:* `runghc -iFinal Final/Main.hs Final/demo.lp`
