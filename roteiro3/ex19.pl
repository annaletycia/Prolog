fat(0,1).
fat(X,Y):- X1 is X-1,
                  fat(X1,L),
                  Y is L * X.

npermutacoes(0,0).
npermutacoes(M, N) :- fat(M,N).