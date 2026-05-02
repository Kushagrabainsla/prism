# Prism: Declarative Deconstruction
**Team:** Krishna Mula, Kushagra Bainsla, Tejas Chakkarwar

*(Target duration: 5 minutes – Practice to fit exactly!)*

---

## 1. The Motivation: Why Prism? (45 seconds)
**Goal:** Make breaking down complex data structures effortless.
- **Problem:** Imperative data extraction is verbose and error-prone (e.g., loops with indices in Python lead to off-by-one bugs).
- **Solution:** A hybrid PL combining tiny imperative core with powerful functional features.
- **Use Cases:** Rule engines, symbolic math, and configuration logic.

*(Speaker Script: "Hi everyone, today we're presenting Prism, our custom programming language designed for 'Declarative Deconstruction'—making data processing simple and safe. Imagine writing code to filter a list: in Python, you'd loop with indices, risking bugs like off-by-one errors. Prism lets you declaratively break data apart using pattern matching, reducing code by up to 70%. We built this hybrid language—imperative for familiarity, functional for safety—to tackle real-world tasks like rule engines for business logic or symbolic math in compilers. This isn't just another interpreter; it's a fresh take on PL design for data-heavy apps." [Pause for emphasis, show a quick slide with buggy code vs. Prism.])* 

---

## 2. Interesting PL Ideas (45 seconds)
- **Recursive Lists & `cons`:** First-class support for `[]` and `h:t` (efficient $O(1)$ cons).
- **Deep Pattern Matching:** The `match` expression drives the language—binds variables recursively, enabling declarative data breakdown.
- **Lexical Scoping:** Variables stay safe inside recursive function calls (prevents global pollution).
- **Static Analysis:** (Stretch Goal) Catches missing variables before execution.

*(Speaker Script: "What makes Prism interesting? First, recursive lists with cons—`h:t` splits a list instantly, O(1) time, no loops needed. Second, deep pattern matching: our `match` isn't just a switch; it's an expression that binds variables recursively, letting you deconstruct data anywhere. For example, `match list with | h:t -> h + sum(t)` pulls apart and processes in one go. Third, lexical scoping keeps functions clean—no global leaks. And we added static analysis to catch errors early, like unbound variables. These ideas blend imperative ease with functional power, setting Prism apart from basic languages." [Use a visual diagram of list splitting. Speak clearly, avoid rushing.])* 

---

## 3. Prism in Action (Example) (1 minute)
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
evens = filter_even(my_list);  // Result: [2, 4, 6]
```
*(Speaker Script: "Let's see Prism in action. This function filters even numbers from a list. Look at the `match`: it checks if the list is empty `[]`, or splits into head `h` and tail `t`. If `h` is even, add it to the filtered tail; else, skip. No indices, no loops—just declare what to do. In imperative code, you'd write a for-loop with counters. Prism's way is concise and bug-free. Running this on [1,2,3,4,5,6] gives [2,4,6]. This showcases functions, lists, and pattern matching all together." [Highlight code on slide, explain line-by-line slowly. Show result visually.])* 

---

## 4. Under the Hood (Implementation) (1 minute)
- **Frontend:** Built with **Parsec** (Parser Combinators) for robust, recursive parsing.
- **Backend:** 
  - **State Monad:** Manages environment (variable bindings) safely.
  - **ExceptT Monad:** Graceful error handling (e.g., "unbound variable" without crashes).
- **Clean Design:** Strongly separated AST, Parser, Interpreter for modularity.

*(Speaker Script: "How did we build this? The frontend uses Parsec, a Haskell library for parsing, to handle Prism's recursive syntax reliably. The backend leverages Haskell's monads: State for tracking variables safely, and ExceptT for errors—like catching 'unbound variable' gracefully instead of crashing. We kept it modular: AST for structure, Parser for syntax, Interpreter for logic. This clean design made development smooth and shows real PL implementation chops. Monads here aren't just academic; they enable composable, safe code for a language like Prism." [Show a simple architecture diagram. Speak with enthusiasm to engage tech-savvy audience.])* 

---

## 5. Successes & Challenges (45 seconds)
**Successes:** 
- Graceful runtime errors (no crashes).
- Achieved stretch goal (static analysis).

**Challenge & Solution:** 
- *Challenge:* Infinite recursion risks.
- *Solution:* Strict scoping + depth checks.

*(Speaker Script: "We succeeded in making Prism robust—errors like division by zero are handled nicely, no crashes. We even hit our stretch goal with basic static analysis. The big challenge was recursion: infinite loops could hang the interpreter. We solved it with strict lexical scoping and added depth checks to prevent runaway calls. This taught us that safety is key in PL design. Overall, Prism works as intended and pushes PL boundaries." [Keep upbeat, smile. Tie to audience interest in reliable systems.])* 

---

## 6. Live Demo (1 minute)
**Let's see it run!**
- Recursion: Factorial & Fibonacci.
- List Ops: Reverse & map.
- Data Pipeline: ETL-style filtering.

*(Speaker Script: "Time for proof—let's demo Prism live. First, recursion: factorial of 10 is 3,628,800. Fibonacci too. Next, list operations: reversing [1,2,3] gives [3,2,1]. Finally, our data pipeline filters credits from transactions. Prism handles it all smoothly. Questions? What do you think makes Prism unique?" [Run terminal commands clearly. End with Q&A to fit time.])* 

---

**Total Time Check:** 5 minutes. Practice pacing!

*(Style Tips for Max Score: Use visuals (code snippets, diagrams of `h:t`). Engage with questions. Avoid text-heavy slides—speak naturally. Motivation: Start with problem. Examples: Keep simple.)*
