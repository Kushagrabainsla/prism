# Prism: Declarative Deconstruction
**Team:** Krishna Mula, Kushagra Bainsla, Tejas Chakkarwar

*(Target duration: 5 minutes – Practice to fit exactly!)*

---

## 1. The Motivation: Why Prism? (45 seconds)
**Goal:** Make breaking down complex data structures effortless.
- **Problem:** Imperative data extraction is verbose and error-prone (e.g., loops with indices in Python lead to off-by-one bugs).
- **Solution:** A hybrid PL combining tiny imperative core with powerful functional features.
- **Prism Metaphor:** Just as a prism breaks light into colors, Prism uses pattern matching to break complex data into basic parts.
- **Deeper Reasoning:** Imperative languages force thinking about *how* to traverse data; functional languages offer pattern matching but require advanced concepts. Prism bridges this gap.
- **Use Cases:** Rule engines, symbolic math, data transformation, and configuration logic.

*(Speaker Script: "Hi everyone, today we're presenting Prism, our custom programming language designed for 'Declarative Deconstruction'—making data processing simple and safe. Imagine writing code to filter a list: in Python, you'd loop with indices, risking bugs like off-by-one errors. Prism lets you declaratively break data apart using pattern matching, reducing code by up to 70%. We built this hybrid language—imperative for familiarity, functional for safety—to tackle real-world tasks like rule engines for business logic or symbolic math in compilers. The name Prism reflects how it breaks down data, just like a prism splits light. This isn't just another interpreter; it's a fresh take on PL design for data-heavy apps." [Pause for emphasis, show a quick slide with buggy code vs. Prism.])* 

---

## 2. Under the Hood: Implementation & Interesting PL Ideas (2 minutes)
- **Interesting PL Ideas Integrated:**
  - **Deep Pattern Matching:** The `match` expression drives the language—binds variables recursively, enabling declarative data breakdown. First-class: `match` as an expression, not just in functions.
  - **Lexical Scoping:** Variables stay safe inside recursive function calls (prevents global pollution).
  - **Static Analysis:** Catches missing variables before execution.
- **Execution Model:** Uses State and ExceptT monads for safe, composable evaluation—State tracks variables, ExceptT handles errors without crashes.
- **Function Calls:** Create isolated scopes by unioning locals with globals; mutations inside don't affect globals.
- **How Match Works:** Tries patterns in order, binds variables on match, evaluates corresponding expression.
- **Clean Design:** Strongly separated AST, Parser, Interpreter for modularity. Follows Clean Code principles: meaningful names, small functions, single responsibility.

*(Speaker Script: "Now, let's dive under the hood—how we built Prism and what makes its ideas interesting. Prism's core ideas include deep pattern matching that's first-class and expression-based for flexible deconstruction, lexical scoping to avoid global pollution, and static analysis for early error catching. The execution model uses Haskell's State and ExceptT monads: State manages variables safely, ExceptT ensures errors like 'unbound variable' don't crash the program. When a function is called, we create an isolated scope by unioning local params with global vars—mutations inside stay local. Match works by trying patterns sequentially: on match, it binds vars and runs the expression. This clean design with separated AST, Parser, Interpreter follows Clean Code for maintainability. These ideas blend imperative ease with functional safety." [Show diagrams of monads, scoping, pattern matching flow. Speak with enthusiasm, weave ideas into implementation explanation.])* 

### Slide Visual for Execution Model:
- **Top: Journey Diagram**  
  Source Code → Parser (Parsec) → AST → Interpreter (Monads) → Output Value  
  *(Flowchart with arrows and icons.)*
- **Section 1: State Monad**  
  - **Purpose**: Manages variable state (e.g., assignments) across evaluations.  
  - **How**: Threads immutable maps through computations, simulating mutation safely.  
  *(Speaker Note: "State tracks variables like a safe 'mutable' environment—each assignment creates a new map, but the monad handles the flow.")*
- **Section 2: ExceptT Monad**  
  - **Purpose**: Handles errors (e.g., unbound vars, type mismatches) gracefully.  
  - **How**: Short-circuits on errors, returning messages instead of crashing.  
  *(Speaker Note: "ExceptT wraps evaluations to catch issues early, ensuring robust execution without halting the host Haskell program.")*

### Introducing Prism Language Features (After Problem Statement):
- **Scoping**  
  - **Single-Line Point**: Lexical scoping keeps variables safe in recursive calls, preventing global pollution.  
  *(Speaker Note: "Unlike dynamic scoping, lexical scoping ensures functions see only their locals and globals, avoiding name conflicts in recursion.")*
- **Mutability**  
  - **Single-Line Point**: Controlled mutations via assignments, with immutable data under the hood for safety.  
  *(Speaker Note: "Assignments change state, but Haskell's immutability means each update creates a new map, blending imperative feel with functional safety.")*
- **Pattern Matching**  
  - **Single-Line Point**: First-class `match` expressions bind variables recursively for declarative data breakdown.  
  *(Speaker Note: "Match isn't just for functions—it's an expression that destructures data anywhere, like splitting lists with h:t for clean, bug-free processing.")*

---

## 3. Prism in Action (Live Demo) (1 minute)
**Let's see it run!**
- Recursion: Factorial & Fibonacci.
- List Ops: Reverse & map.
- Data Pipeline: ETL-style filtering.
- Example: Filter evens from [1,2,3,4,5,6] → [2,4,6].

*(Speaker Script: "Time for proof—let's demo Prism live. First, recursion: factorial of 10 is 3,628,800. Fibonacci too. Next, list operations: reversing [1,2,3] gives [3,2,1]. Finally, our data pipeline filters credits from transactions. As an example, filtering evens from [1,2,3,4,5,6] gives [2,4,6]. Prism handles it all smoothly. Questions? What do you think makes Prism unique?" [Run terminal commands clearly. Show code snippets and results. End with Q&A to fit time.])* 

---

**Total Time Check:** 5 minutes. Practice pacing!

*(Style Tips for Max Score: Use visuals (code snippets, diagrams of `h:t`). Engage with questions. Avoid text-heavy slides—speak naturally. Motivation: Start with problem. Examples: Keep simple.)*
