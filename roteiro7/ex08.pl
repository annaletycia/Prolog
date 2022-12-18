% Ex. 8

subconjunto([], _).
subconjunto([X|XS],findall([X|XSS])):- subconjunto(XS,XSS).
subconjunto([X|XS],[_|XSS]):- subconjunto([X|XS],XSS).

conj_potencia([],_).
conj_potencia([X|XS],P):-
	findall(subconjunto(N,[X|XS]),_,P).