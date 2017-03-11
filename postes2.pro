PREDICATES
nondeterm anak(symbol,symbol)
nondeterm istri(symbol,symbol)
nondeterm pria(symbol)
nondeterm wanita(symbol)
nondeterm usia(symbol,integer)
%nondeterm cucu(symbol)
%nondeterm ibu(symbol)
%nondeterm adik(symbol)
nondeterm kakek(symbol)

CLAUSES
%cucu(X):-anak(Z,Y),anak(X,Z).
%ibu(X):-istri(X,Y),wanita(X).
%adik(X):-usia(X,Y),pria(X).
kakek(X):-anak(A,B),anak(B,X).

anak(jhon, james).
anak(james, peter).
anak(sue, ann).

istri(mary, peter).
istri(ann, james).

pria(jhon).
pria(james).
pria(peter).

wanita(mary).
wanita(sue).
wanita(ann).

usia(jhon, 10).
usia(sue, 13).

GOAL
%cucu(Siapa).
%ibu(Siapa).
%adik(Siapa).
kakek(Siapa).