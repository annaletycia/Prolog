% Ex. 13

min(X,Y,X) :- X < Y.
min(X,Y,Y) :- X >= Y.

minAcum(X,[X],X).
minAcum(_,[X,Y|L1],Menor) :- 
	minAcum(_, [Y|L1], MenorL1),
	min(X, MenorL1, Menor).

menor([X,Y|L1],Menor) :- 
    	minAcum(0,[X,Y|L1],Menor).