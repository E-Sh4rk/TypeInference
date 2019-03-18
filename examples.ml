
(* DO NOT COMPILE. USED JUST FOR SYNTAX HIGHLIGHTING. *)

(* EX 00 *)

let foo1 x : (int -> int) & (string -> string) = match x with
    | y & int -> x + 1
    | y -> y^""

let foo2 x : (int -> int) & (string -> string) =
    let y = x in
    if y is int then x + 1 else y^""

(* ----- RECORDS ----- *)

(* EX 01 *)

type record_p1 = {id:int ; name:string}
type record_p2 = {id:int ; price:float}
type record_c  = {id:int ; name:string ; price:float}

let foo x : (record_p1 -> string) & ((record_p2 \ {name}) -> float) =
    match x with
    | y & {id:int ; name:string} -> x.name
    | y & {id:int ; price:float} -> x.price

(* EX 02 *)

type record_p1  = {quantity:int ; data:string|float}
type record_p2  = {data:string}

type record_c12 = {quantity:int ; data:string}
type record_c2 = {quantity:int ; data:float}

let foo x : (record_p2 -> string) & (record_c2 -> float) =
    match x.data with
    | y & string -> x.data
    | y & float -> x.data *. (float_of_int x.quantity)
