# Random notes

cf `examples.ml` for examples

## Typing

### Base

cf *Revisiting Occurence Typing* draft  

- 201: t^-\_{env,e,t}(omega) = t^+_{env,e,not t}(omega)   ->    Redundant notation?
- 214: What does equivalent mean?
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

### Adding polymorphism

## Type inference

- For records, we must be able to infer that an expression need to have a new field.    Case 2 of EX 02: x (and y) must have a field quantity
