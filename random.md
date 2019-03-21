# Random notes

cf `examples.ml` for examples

## Typing

### Base

cf *Revisiting Occurence Typing* draft  

- Line 201: t^-\_{env,e,t}(omega) = t^+_{env,e,not t}(omega)   ->    Redundant notation?

- Line 214: What does the equivalent symbol mean? --> Syntactic equivalence

- EX 00: `x` is not a subexpression of the expression in the match, so we can't know anything about `x` in the first case. We should handle of this kind of alias.

- Thèse d'Alain Frisch p103: "Inférence de types". Filtres, schémas, utilisé pour typer les expressions. Est-ce ce qui est utilisé par CDuce?

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

### Adding polymorphism

- We could add type variables in our type algebra, but then how to decide emptiness?

- We could represent polymorphic types as infinite intersections, but how in practice? Maybe we can have a finite representation by focusing only on an interesting finite subset, and representing the rest in a symbolic way.

- We could use preestablished rules to simplify and get rid of polymorphic variables.
We would need rules for ■, ○, and subtyping.

## Type inference

- For records, we must be able to infer that an expression need to have a new field.  
  Case 2 of EX 02: x (and y) must have a field quantity
