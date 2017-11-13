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






sibling(X,Y) :- father(F, X), father(F, Y), male(F), mother(M, X), mother(M, Y), female(M).
sister(X,Y) :- sibling(X, Y), female(X). 
uncle(X,Y) :- father(F, Y), sibling(F, X), male(X).




