% Ex. 9

ocorrencias(_,[],0).
ocorrencias(X,[X|L],N):-
    ocorrencias(X,L,N1),
    N is N1+1.
ocorrencias(X,[_|L],N1):-
    ocorrencias(X,L,N1).