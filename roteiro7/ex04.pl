% Ex 4

unificavel([],_,[]).
unificavel([X|Xs], Termo, [X|L2]):-
	\+(X = Termo),!,
	unificavel(Xs, Termo, L2).
unificavel([X|Xs], Termo, [X|Lista]) :-
    unificavel(Xs, Termo, Lista).