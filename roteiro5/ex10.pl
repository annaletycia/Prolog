% Ex. 10

f(Conta) --> x(Conta), y(Conta), y(Conta).

x(0) --> [a].
x(suc((Conta))) --> [a], x(Conta).

y(0) --> [b].
y(suc((Conta))) --> [b], y(Conta).

% ?- f(C,S,[]).
% C = 0,
% S = [a, b, b] ;
% C = suc(0),
% S = [a, a, b, b, b, b] ;
% C = suc(suc(0)),
% S = [a, a, a, b, b, b, b, b, b] ;
% . . . 