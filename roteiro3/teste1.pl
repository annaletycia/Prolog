fat(0,1).
fat(N,Fat) :- N>0,
    		N1 is N-1,
    		fat(N1,Fat1),
    		Fat is N * Fat1. 

npermutacoes([],0).
npermutacoes([_|L1],P) :- npermutacoes(L1,Y1),
    						 W is Y1 + 1,
    						fat(W,Fat),
    						 P is Fat+0.