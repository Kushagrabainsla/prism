# Prism: Declarative Deconstruction
**Team:** Krishna Mula, Kushagra Bainsla, Tejas Chakkarwar

*(Target duration: 5 minutes)*

---

## 1. The Motivation: Why Prism?
**Goal:** Make breaking down complex data structures effortless.
- **Problem:** Imperative data extraction is verbose and error-prone.
- **Solution:** A hybrid PL combining tiny imperative core with powerful functional features.
- **Use Cases:** Rule engines, symbolic math, and configuration logic.

*(Speaker Note: Emphasize that we wanted the safety of functional pattern matching but the familiarity of imperative assignments. Keep this under 45 seconds.)*

---

## 2. Interesting PL Ideas
- **Recursive Lists & `cons`:** First-class support for `[]` and `h:t`.
- **Deep Pattern Matching:** The `match` expression drives the language.
- **Lexical Scoping:** Variables stay safe inside recursive function calls.
- **Static Analysis:** (Stretch Goal) Catches missing variables before execution.

*(Speaker Note: Highlight that pattern matching isn't just a switch statement, it binds variables recursively. 45 seconds.)*

---

## 3. Prism in Action (Example)
```haskell
// Advanced Pattern Matching & Recursion
fun filter_even(xs) =
  match xs with
  | [] -> []
  | h:t -> 
      if (h / 2) * 2 == h 
      then h : filter_even(t) 
      else filter_even(t)

my_list = [1, 2, 3, 4, 5, 6];
evens = filter_even(my_list);
```
*(Speaker Note: Walk the audience through the `match` block. Show how cleanly `h:t` pulls the list apart. 1 minute.)*

---

## 4. Under the Hood (Implementation)
- **Frontend**
  - Built with **Parsec** (Parser Combinators).
- **Backend**
  - **State Monad**: Manages the environment (variable bindings).
  - **ExceptT Monad**: Graceful, typed error handling.
- **Clean Design**
  - Strongly separated AST, Parser, and Interpreter.

*(Speaker Note: Mention why Monads were crucial for handling errors like "unbound variable" without crashing Haskell. 1 minute.)*

---

## 5. Successes & Challenges
**Success:** 
- Graceful runtime errors instead of crashes.
- Achieved our Stretch Goal (Static Analysis).

**Challenge & Solution:** 
- *Challenge:* Handling infinite loops in recursion.
- *Solution:* Strict environment scoping to ensure clean function environments.

*(Speaker Note: Keep it brief. 45 seconds.)*

---

## 6. Live Demo
**Let's see it run!**
- Recursion (`recursion_test.lp`)
- List Operations (`list_ops.lp`)
- Error Cases (`error_cases.lp`)

*(Speaker Note: Switch to terminal. 1 minute for demo. Leave remaining 2 minutes for open Q&A.)*
