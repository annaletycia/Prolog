% Ex. 21

fat1(0,1).
fat1(X,Y):- X1 is X-1,
                  fat1(X1,L),
                  Y is L * X.


ncombinacoes(0,_,0).
ncombinacoes(M,P,N):- 
	fat1(M,Z),
	M1 is M-P,
	fat1(M1,Z1),
	fat1(P,Z2),
	N is Z/(Z1*Z2).

% conferindo os valores do exercicio 20-a)
% ?- ncombinacoes(10,5,N).
% N = 252

%conferindo os valores do exercicio 20-b)
% ?- ncombinacoes(9,3,N).
% N = 84

% ?- ncombinacoes(11,4,N).
% N = 330
			 