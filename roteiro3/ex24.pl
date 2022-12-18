% Ex. 24


fat2(0,1).
fat2(X,Y):- X1 is X-1,
                  fat2(X1,L),
                  Y is L * X.

narranjos(0,_,0).
narranjos(M,P,N):-
	fat2(M,Z),
	M1 is M-P,
	fat(M1,Z1),
	N is Z/Z1.


