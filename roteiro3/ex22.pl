% Ex. 22

remove3(X,[X|L1],L1).
remove3(X,[Y|L1],[Y|L2]) :- remove3(X,L1,L2). 

arranjo(0,_,[]).
arranjo(N,L,[H|T]):- N>0, N1 is N - 1,
    remove3(H, L, A),
    arranjo(N1,A,T).