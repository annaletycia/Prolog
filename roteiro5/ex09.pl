% Ex. 9

s(Conta) --> as(Conta), bs(Conta). 
as(0) --> [a].
as(suc(Conta)) --> [a], as(Conta).
bs(0) --> [b].
bs(suc(Conta)) --> [b], bs(Conta).

% ?- s(C,S,[]).

% C = 0,
% S = [a, b]
% C = suc(0),
% S = [a, a, b, b]
% C = suc(suc(0)),
% S = [a, a, a, b, b, b]