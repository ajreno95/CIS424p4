male(joeseph).
male(doug).
male(joe).
male(dan).
male(tom).
male(eric).
male(matt).
male(danny).
male(alexander).
male(andrew).

female(kelley).
female(heather).
female(liz).
female(elaine).
female(abbigail).
female(doris).
female(bev).
female(joanne).
female(cath).
female(tanya).

father(joeseph, doug).
father(joeseph, joe).
father(joeseph, tom).
father(joeseph, cath).
father(doug, kelley).
father(doug, heather).
father(joe, liz).
father(joe, elaine).
father(joe, eric).
father(dan, matt).
father(dan, danny).
father(tom, alexander).
father(tom, abbigail).
father(tom, andrew).

mother(tanya,alexander).
mother(tanya, abbigail).
mother(tanya, andrew).
mother(cath, matt).
mother(cath, danny).
mother(joanne, liz).
mother(joanne, elaine).
mother(joanne, eric).
mother(bev, kelley).
mother(bev, heather).
mother(doris, doug).
mother(doris, joe).
mother(doris, tom).
mother(doris, cath).






sibling(X,Y) :- 
	father(F, X), 
	father(F, Y), 
	mother(M, X), 
	mother(M, Y),
	not(X = Y).
 
sister(X,Y) :- 
	sibling(X, Y), 
	female(X). 
uncle(X,Y) :-
	father(F, Y),
	mother(M, Y),
	father(X, C),
	mother(S, C),
	(sibling(X, F); sibling(X, M); sibling(S, F); sibling(S, M)).


grandson(X,Y) :- male(X), father(F,X), mother(M,X), (father(Y,F); mother(Y, F); father(Y, M); mother(Y, M)).
descendant(X,Y) :- (father(Y,X); mother(Y,X)); (father(Y, F); mother(Y, F)), descendant(X, F). 


poly_add(A,[],A).
poly_add([],B,B).
poly_add([A|AT],[B|BT],[R|RT]) :-
	R is A+B,
	poly_add(AT, BT, RT).

scalar_mult([],_,[]).
scalar_mult([L|LT],S,[R|RT]):-
	R is S*L,
	scalar_mult(LT,S,RT).

p_mult(_,[],[]).
p_mult([],_,[]).
p_mult(P,[Q|QT],R):-
	p_mult([0.0|P], QT, R1),
	scalar_mult(P, Q, R2),
	poly_add(R2, R1, R).
