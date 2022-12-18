% Ex. 11

somatorio(0,N):- N is 0,
		assert(res_somatorio(0,0)).

somatorio(N,S) :- N>0,
    		N1 is N-1,
    		somatorio(N1,S1),
    		S is N + S1, 
		assert(res_somatorio(N,S)).