# Prism vs Other Languages: Declarative Deconstruction Showcase

This document compares Prism's declarative deconstruction capabilities with Python and Java for symbolic manipulation. The example implements a simple arithmetic expression evaluator that processes nested list expressions like `["+", 1, ["*", 2, 3]]` (representing 1 + (2 * 3)).

Prism's pattern matching allows direct deconstruction of nested structures, making it highly concise for symbolic computation tasks.

## Prism Code

```prism
// Evaluate arithmetic expressions using declarative pattern matching
fun eval(expr) =
  match expr with
  | num:int -> num
  | ["+", left, right] -> eval(left) + eval(right)
  | ["*", left, right] -> eval(left) * eval(right)
  | ["-", left, right] -> eval(left) - eval(right)
  | ["/", left, right] -> eval(left) / eval(right);

// Sample expression: 1 + (2 * 3) - 4
expr = ["-", ["+", 1, ["*", 2, 3]], 4];

// Evaluate
result = eval(expr);
result
```

**Lines of code**: ~8 lines (core evaluator).

## Python Code

```python
def eval_expr(expr):
    if isinstance(expr, int):
        return expr
    elif isinstance(expr, list) and len(expr) == 3:
        op, left, right = expr
        left_val = eval_expr(left)
        right_val = eval_expr(right)
        if op == "+":
            return left_val + right_val
        elif op == "*":
            return left_val * right_val
        elif op == "-":
            return left_val - right_val
        elif op == "/":
            return left_val / right_val
    raise ValueError("Invalid expression")

# Sample expression: 1 + (2 * 3) - 4
expr = ["-", ["+", 1, ["*", 2, 3]], 4]

# Evaluate
result = eval_expr(expr)
print(result)
```

**Lines of code**: ~15 lines. Python requires type checks, manual unpacking, and explicit recursion handling.

## Java Code

```java
import java.util.*;

public class ExpressionEvaluator {
    public static Object eval(Object expr) {
        if (expr instanceof Integer) {
            return (Integer) expr;
        } else if (expr instanceof List) {
            List<?> list = (List<?>) expr;
            if (list.size() == 3) {
                String op = (String) list.get(0);
                Object left = list.get(1);
                Object right = list.get(2);
                int leftVal = (Integer) eval(left);
                int rightVal = (Integer) eval(right);
                switch (op) {
                    case "+": return leftVal + rightVal;
                    case "*": return leftVal * rightVal;
                    case "-": return leftVal - rightVal;
                    case "/": return leftVal / rightVal;
                    default: throw new IllegalArgumentException("Unknown operator");
                }
            }
        }
        throw new IllegalArgumentException("Invalid expression");
    }

    public static void main(String[] args) {
        // Sample expression: 1 + (2 * 3) - 4
        List<Object> expr = Arrays.asList("-", 
            Arrays.asList("+", 1, Arrays.asList("*", 2, 3)), 
            4
        );
        Object result = eval(expr);
        System.out.println(result);
    }
}
```

**Lines of code**: ~30 lines. Java requires casting, instanceof checks, and switch statements, making it cumbersome for symbolic manipulation.

## Comparison

- **Prism**: Declarative pattern matching directly deconstructs nested lists in a single match expression, enabling concise symbolic computation.
- **Python**: Functional recursion with type guards and manual structure unpacking; more verbose than Prism.
- **Java**: Highly verbose due to type casting, instanceof checks, and lack of pattern matching.

Prism significantly outperforms in lines of code and readability for symbolic manipulation and declarative deconstruction tasks.