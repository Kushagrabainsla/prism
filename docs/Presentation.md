# Prism: Declarative Deconstruction
**Team:** Krishna Mula, Kushagra Bainsla, Tejas Chakkarwar

*(Target duration: 5 minutes)*

---

## 1. The Motivation: Why Prism?
**Goal:** Make breaking down complex data structures effortless.
- **Problem:** Imperative data extraction is verbose and error-prone (e.g., loops with indices in Python lead to bugs).
- **Solution:** A hybrid PL combining tiny imperative core with powerful functional features.
- **Use Cases:** Rule engines, symbolic math, and configuration logic.

*(Speaker Note: Emphasize that we wanted the safety of functional pattern matching but the familiarity of imperative assignments. Prism reduces code for data processing by focusing on "what" not "how." Keep this under 45 seconds. Reasoning: Start with pain points to hook the audience—most CS students struggle with recursive data handling.)*

---

## 2. Interesting PL Ideas
- **Recursive Lists & `cons`:** First-class support for `[]` and `h:t` (efficient $O(1)$ cons).
- **Deep Pattern Matching:** The `match` expression drives the language—binds variables recursively.
- **Lexical Scoping:** Variables stay safe inside recursive function calls (prevents global pollution).
- **Static Analysis:** (Stretch Goal) Catches missing variables before execution.

*(Speaker Note: Highlight that pattern matching isn't just a switch statement—it binds variables recursively, enabling declarative deconstruction. Reasoning: This differentiates Prism from simple interpreters; show how `h:t` pulls apart lists without loops. 45 seconds. Use a quick visual if possible.)*

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
*(Speaker Note: Walk the audience through the `match` block. Show how cleanly `h:t` pulls the list apart—no indices or loops. Reasoning: This example demonstrates all features: functions, lists, pattern matching. Contrast with imperative version (verbose loop) to show Prism's conciseness. 1 minute.)*

---

## 4. Under the Hood (Implementation)
- **Frontend**
  - Built with **Parsec** (Parser Combinators) for robust, recursive parsing.
- **Backend**
  - **State Monad**: Manages the environment (variable bindings) safely.
  - **ExceptT Monad**: Graceful, typed error handling (no crashes).
- **Clean Design**
  - Strongly separated AST, Parser, and Interpreter for modularity.

*(Speaker Note: Mention why Monads were crucial—handling errors like "unbound variable" without crashing Haskell. Reasoning: Monads enable composable, side-effect-free code; State for mutability, ExceptT for errors. This shows PL implementation depth. 1 minute.)*

---

## 5. Successes & Challenges
**Success:** 
- Graceful runtime errors instead of crashes (via ExceptT).
- Achieved our Stretch Goal (Static Analysis for unbound vars).

**Challenge & Solution:** 
- *Challenge:* Handling infinite loops in recursion (e.g., non-terminating functions).
- *Solution:* Strict environment scoping to ensure clean function environments; added recursion depth checks in interpreter.

*(Speaker Note: Keep it brief. Reasoning: Successes show we met goals; challenges highlight learning (e.g., recursion safety is key in interpreters). 45 seconds.)*

---

## 6. Live Demo
**Let's see it run!**
- Recursion (`recursion_test.lp`) - Factorial & Fibonacci.
- List Operations (`list_ops.lp`) - Reverse & map.
- Error Cases (`error_cases.lp`) - Safe division.
- Data Deconstruction (`data_deconstruction.lp`) - ETL pipeline.

*(Speaker Note: Switch to terminal. Reasoning: Demos prove functionality; choose diverse tests to show breadth. 1 minute for demo. Leave remaining 2 minutes for open Q&A. If time short, skip one test.)*
