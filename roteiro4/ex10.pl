% Ex. 10

ocorre([X|_],1,X).
ocorre([_|L],N,X):-
    ocorre(L,N1,X),
    N is N1+1.