# Random notes

cf `examples.ml` for examples

## Typing

### *Revisiting Occurence Typing* draft  

- "Path expressions" --> "Selector expressions" ?

- Line 597: Limitation of Let binding:  
We could support it by inlining the definiton of the variable (just for the typing, not during the execution). It may seem bad for the complexity, but indeed we will not have to type the expression more than once since its type will be remembered in the environment.

- Line 601: Limitation of condition nestling:  
If we have a good type inference engine, we could put the nested condition in a lambda abstraction taking y as parameter, and apply it to the wanted expression for y. In this way, we will be able to refine the type of the subexpressions of y if the inferred type for the lambda abstraction is good enough.

- Automatic case disjunction when application has a right argument of the form (t1 | t2)? See `test.ml`.

- If side effects, we should only keep variables and non-reducible expressions in the environment (or at least we should not keep occurences containing an application).  
EX: if (fun (Unit->Any) _ -> if random then 0 else false) () is Int then ... else ...

------

- Implementation part: should precise constraints on the DNF form (clauses not empty)

- Could remove all expressions containing 'x' of the environment when typing a lambda-abstraction.  
Example: if x + 1 is Even then (fun (Bool -> Int) x -> x + 1) true else x  
Could also suppose that every lambda abstraction has a different variable name,
but in this case :  
  - the new semantics must apply substitutions up to alpha-renaming
  in order to be invariant by alpha-renaming.
  - the typing system must operate up to alpha-renaming when building Gamma^p and testing e \in dom Gamma
  in the typing rules.

- Rule "Empty" should be removed. Instead, test inclusion in the ite rule and generate a special environment bottom if necessary.

- Should add constraints to types of lambda abstractions and tests

- Should "normalize" every type so that values always match their base type? Or use type schemes.
  The two are not equivalent!  
  EX:  
  f=fun (Int->Int) x -> x  
  if f is Even->Even then 0 else bottom

- Should forbid unabstracted ite inside tests ?  
EX: if ((x,y), (if x is Int then y else 0)) is ((Int,Int)|(Bool,Bool), Int|Bool)  
    then (if x is Int then y else 0) else ...

- Should add let statements to the target langage

### Adding polymorphism

- In my current implementation, let are inlined. Would it still work with polymorphism?

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

### *Revisiting Occurence Typing* draft

- Line 201: t^-\_{env,e,t}(omega) = t^+_{env,e,not t}(omega)   ->    Redundant notation?

- Line 214: What does the equivalent symbol mean? (syntactic equivalence)

- ( Line 214: add typeof(e') to the intersection and use t instead of Env ? (less redundant, and the definition of Env is not needed anymore) ) (Other pending changes could discard this remark)

- Line 230: Add the following rule: If there is a bottom in the env, then any expr can be typed bottom.
See example `let_pairs` in the implementation.

- Line 231: should use the 'circle' operator to type App?

- Line 234: Use Env everywhere instead of t!  
More precise results, and it will also simplify some case (for instance, get rid of the `cap ... (Any x Any)` for pairs).  
See example `two_steps` in the implementation.

- Line 260: 'square' operator could be stronger! See example `two_steps` in the implementation.

- Record: must remove the field l before merging for the u_l and r_l cases?

- Record: In the definiton of record\l operator, should require that t <= {l=Any ..}

- Improvement of the worra operator implementation

- Left App case not correct
