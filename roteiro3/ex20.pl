% Ex. 20

combinacao(0,_,[]).
combinacao(N,[X|Xs],[X|Ys]):- N>0,
			      N1 is N - 1,
			      combinacao(N1,Xs,Ys).
combinacao(N,[_|Xs], Ys):- N>0,
			   combinacao(N,Xs,Ys).

% (a) Uma escola possui 10 alunos atletas a1, a2,..., a10. Quais as diferentes equipes que podem ser formadas com 5 alunos?

% ?- combinacao(5,[a1,a2,a3,a4,a5,a6,a7,a8,a9,a10],C).
% C = [a1, a2, a3, a4, a5];
% C = [a1, a2, a3, a4, a6];
% C = [a1, a2, a3, a4, a7];
% C = [a1, a2, a3, a4, a8];
% C = [a1, a2, a3, a4, a9];
% . . .

% (b)

comb(0,_,[]).
comb(N,[X|Xs],[X|Ys]):- N>0,
     N1 is N - 1,
    comb(N1,Xs,Ys).
comb(N,[_|Xs], Ys):- N>0,
comb(N,Xs,Ys).

append1([],X,X).
append1([X|Xs],Y,[X|Z]):- append1(Xs,Y,Z).


combinacao1(L1,L2,C):-
append1(L1,L2,C),
comb(3,[m1,m2,m3,m4,m5,m6,m7,m8,m9],L1),
comb(4,[c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11],L2).

% ?- combinacao(Mat,Comp,C).
% C = [m1, m2, m3, c1, c2, c3, c4],
% Comp = [c1, c2, c3, c4],
% Mat = [m1, m2, m3];
% C = [m1, m2, m3, c1, c2, c3, c5],
% Comp = [c1, c2, c3, c5],
% Mat = [m1, m2, m3];
% . . .