%Problem 1
%a)
sibling(X,Y) :- 
	father(F, X), 
	father(F, Y), 
	mother(M, X), 
	mother(M, Y),
	not(X = Y).
%b) 
sister(X,Y) :- 
	sibling(X, Y), 
	female(X). 
%c)
uncle(X,Y) :-
	father(F, Y),
	mother(M, Y),
	father(X, C),
	mother(S, C),
	(sibling(X, F); sibling(X, M); sibling(S, F); sibling(S, M)).
%d)
grandson(X,Y) :- 
	male(X), 
	father(F,X), 
	mother(M,X), 
	(father(Y,F); mother(Y, F); father(Y, M); mother(Y, M)).
%e)
descendant(X,Y) :- 
	(father(Y,X); mother(Y,X)); 
	(father(Y, F); mother(Y, F)), 
	descendant(X, F). 


%problem 2

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

%Problem 3

match(H, [H|T], T).

nonterminalZ(Input, Result):-
	(match(c, Input, NewResult), nonterminalZ(NewResult, Result));
	match(c, Input, Result).
nonterminalY(Input, Result):-
	(match(b, Input, NewResult), nonterminalY(NewResult, Result));
	match(b, Input, Result).
nonterminalX(Input, Result):-
	(match(a, Input, NewResult), nonterminalX(NewResult, Result));
	match(a, Input, Result).
s(Input, Result):-
	nonterminalX(Input, FirstResult),
	nonterminalY(FirstResult, SecondResult),
	nonterminalZ(SecondResult, Result),!.

%problem 4

over35([clinton, obama, kerry, hclinton]).
alive([clinton, obama, kerry, hclinton]).
notFormerPresident([kerry, hclinton]).
democrats([clinton, obama, kerry, hclinton]).

tests(Candidate):-
	(notFormerPresident(NFPList), member(Candidate, NFPList)),
	(alive(AliveList), member(Candidate, AliveList)),
	(over35(O35List), member(Candidate, O35List)).
	
member(Element, [Element | _]):-!.
member(Element, [_ | List]):-
	member(Element, List).
	
dem_candidate(Candidate):-
	democrats(DemList), member(Candidate, DemList), 
	tests(Candidate).
