% Ex. 1

soma_acum(L,K):-
    somaAcc(L,0,K).

somaAcc([],_,[]).
somaAcc([X|L],Acc,[Acc1|L1]):-
	Acc1 is X+Acc,
	somaAcc(L,Acc1,L1).