import algebra.big_operators

definition matrix (R: Type) (n m : nat)[ring R] :=  fin n →( fin m → R ) 
 
 namespace matrix 

definition add ( R : Type) [ring R] {n m: nat }(A:matrix R m n) ( B : matrix R m n): (matrix R m n):= 
begin
unfold matrix,
intros I J,
exact A I J + B I J
end

definition neg ( R : Type) [ring R] {n m: nat } (A:matrix R m n) : (matrix R m n):= 
begin
unfold matrix,
intros I J,
exact - A I J,
end

definition zero ( R : Type) [ring R] {m n: nat }: (matrix R m n):= 
begin
intros I J,
exact 0
end

theorem add_assoc1 ( R : Type) [ring R] {m n: nat }(A:matrix R m n) ( B : matrix R m n) ( C : matrix R m n) :
 add R A (add R  B C) = add R (add R A B) C :=
begin
apply funext,
intro,
apply funext,
intro y,
show A x y + (B x y + C x y) = ( A x y + B x y) + C x y,
rw [add_assoc],
end

theorem add_assoc2 ( R : Type) [ring R] {m n: nat }(A:matrix R m n) ( B : matrix R m n) ( C : matrix R m n) :
 add R (add R A B) C = add R A (add R  B C)  :=
begin
apply funext,
intro,
apply funext,
intro y,
show  ( A x y + B x y) + C x y = A x y + (B x y + C x y) ,
rw[add_assoc],
end

theorem zero_add   ( R : Type) [ring R] {m n: nat }(A:matrix R m n):
add R (zero R) A = A:=
begin
apply funext,
intro,
apply funext,
intro y,
show 0 + A x y = A x y,
rw[zero_add]
end

theorem add_zero (R : Type) [ring R] {m n: nat }(A:matrix R m n):
add R A (zero R) = A:=
begin
apply funext,
intro,
apply funext,
intro y,
show  A x y + 0 = A x y,
rw[add_zero]
end


theorem add_left_neg (R : Type) [ring R] {m n: nat }(A:matrix R m n) :
add R ( neg R A) A = zero R := 
begin
apply funext,
intro,
apply funext,
intro y,
show  - A x y + A x y = 0 ,
rw[add_left_neg]
end


theorem add_comm (R : Type) [ring R] {m n: nat }(A:matrix R m n)( B : matrix R m n):
add R A B = add R B A :=
begin
apply funext,
intro,
apply funext,
intro y,
show  A x y + B x y = B x y + A x y ,
rw [add_comm]
end


instance add_comm_group ( R : Type) [ring R] {m n: nat }: add_comm_group (matrix R m n):={
add:= matrix.add R ,
add_assoc := @matrix.add_assoc2 R _ m n,
zero := matrix.zero R ,
neg := matrix.neg R,
zero_add := @matrix.zero_add R _ m n,
add_zero := @matrix.add_zero R _ m n,
add_left_neg := @matrix.add_left_neg R _ m n,
add_comm := @matrix.add_comm R _ m n
}
end matrix

definition mul ( R : Type) [ring R] {n m l: nat }(A:matrix R m n) ( B : matrix R n l): (matrix R m l ):= 
 begin
 unfold matrix,
 intros I J,
 admit
end
