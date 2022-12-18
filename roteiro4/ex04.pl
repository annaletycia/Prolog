% Ex. 4

sem_repeticao([],[]).
sem_repeticao([X|L1],L):-
    member(X,L1),
    sem_repeticao(L1,L).
sem_repeticao([X|L1],[X|L]):-
    sem_repeticao(L1,L).