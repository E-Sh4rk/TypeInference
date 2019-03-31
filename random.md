# Random notes

cf `examples.ml` for examples

## Typing

### *Revisiting Occurence Typing* draft  

- Line 201: t^-\_{env,e,t}(omega) = t^+_{env,e,not t}(omega)   ->    Redundant notation?

- Line 214: What does the equivalent symbol mean? (syntactic equivalence)

- Line 214: add typeof(e') to the intersection and use t instead of Env ? (less redundant, and the definition of Env is not needed anymore)

- Line 231: should use the 'circle' operator to type App?

- Line 234: Call to back-typeof: should call it on t & t_0 (instead of just t). It's "free" and can give a more precise result.

- "Path expressions" --> "Selector expressions" ?

- Line 597: Limitation of Let binding:
We could support it by remembering the definitions of variables introduced by a let and expanding (=inlining) them in the left expressions of ITE (just for the typing, not during the execution).
More precisely:
  - When introducing a new variable x with a let statement, we type the corresponding expression e and add this type in the environment for the expression e (no need to add it for x). We also remember that x is defined by the (more complex) expression e with a mapping m. When we want to type x later, if x is mapped to an expression e in m, we can look at the type of e in the environment.
  - We should alpha-rename all variables so that a variable is never erased (or use De Bruijn indexes).
  - When using a let-defined variable x in the left part of an ite expression, we replace x by its definition. Then we do as usual.

- Line 601: Limitation of condition nestling:  
If we have a good type inference engine, we could put the nested condition in a lambda abstraction taking y as parameter, and apply it to the wanted expression for y. In this way, we will be able to refine the type of the subexpressions of y if the inferred type for the lambda abstraction is good enough.

### Adding polymorphism

## Type inference

-------------

## Deprecated

### Adding records

- EX 01:  
  - `record_p2 \ {name}` equivalent to `record_p2 \ record_p1`
  - In the pattern matching: we should remember that `y` is an alias for `x`  
  in order to deduce that `x.name` exist and has type string in the first case.

- EX 02:  
  In the first case, we must capture the information that x.data has type string.  
  --> We must enrich paths so that an occurence can refer to a field
  (even if fields are declared and explicitely typed beforehand)

- EX 03:  
  Can we test existence of a field ? (if *x.something* exists, then do that, else do that). YES.  
  The existence of a field can be captured by our environment since `{} != {something:Any}`

- `not {}`: non-record.  
  `not {field:Any}` : non-record or records without `field`.  
  Even with negation and open records, can't simulate closed records (it would need an infinite intersection) EXCEPT if the domain of fields is finite.

- DNF form of records? See *formalisation.tex*.
