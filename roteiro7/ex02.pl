% Ex. 2

% corte com fail

aprecia(vicente,X):- bigKahunaBurger(X), !, fail.
aprecia(vicente,X):- hamburguer(X).

hamburguer(X):-  bigMac(X).
hamburguer(X):-  bigKahunaBurger(X).
hamburguer(X):-  whopper(X).

bigMac(a). 
bigKahunaBurger(b).
bigMac(c).
whopper(d).

% negacao como falha corretamente

aprecia(vicente,X):- 
	hamburguer(X),
	\+ bigKahunaBurger(X).

hamburguer(X):-  bigMac(X).
hamburguer(X):-  bigKahunaBurger(X).
hamburguer(X):-  whopper(X).

bigMac(a). 
bigKahunaBurger(b).
bigMac(c).
whopper(d).

% negacao como falha erroneamente

aprecia(vicente,X):- 
	\+ bigKahunaBurger(X),
	hamburguer(X).

hamburguer(X):-  bigMac(X).
hamburguer(X):-  bigKahunaBurger(X).
hamburguer(X):-  whopper(X).

bigMac(a). 
bigKahunaBurger(b).
bigMac(c).
whopper(d).