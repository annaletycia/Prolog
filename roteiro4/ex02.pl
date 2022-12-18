% Ex. 2

soma_ate(0,0).
soma_ate(N,S) :- N>0,
    		N1 is N-1,
    		soma_ate(N1,S1),
    		S is N + S1. 

