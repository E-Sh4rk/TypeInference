# Random notes

cf `examples.ml` for examples

## Typing

### Base

cf *Revisiting Occurence Typing* draft  

- Line 201: t^-\_{env,e,t}(omega) = t^+_{env,e,not t}(omega)   ->    Redundant notation?
- Line 214: What does equivalent mean?
- EX 00: `x` is not a subexpression of the expression in the match, so how can we know anything about `x` in the first case?

### Adding records

- EX 01:  
  - `record_p2 \ {name}` equivalent to `record_p2 \ record_p1`
  - In the pattern matching: we have to remember that `y` has the same type as `x`  
  (in order to know that `y.name` have the same type as `x.name`)

- EX 02:  
  In the first case, we must capture the information that x.data has type string.  
  --> We must enrich paths so that an occurence can refer to a field
  (even if fields are declared and explicitely typed beforehand)

- EX 03:  
  Can we test existence of a field ? (if *x.something* exists, then do that, else do that)  
  The existence of a field can be captured by our environmenet since `{} != {something:Any}`

### Adding polymorphism

- Line 500: "polymorphic types as infinite intersection".  
  Computation of type operations undecidable ??? TODO: Test on a concrete example to understand the problem.

## Type inference

- For records, we must be able to infer that an expression need to have a new field.  
  Case 2 of EX 02: x (and y) must have a field quantity
