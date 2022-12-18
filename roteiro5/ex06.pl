% Ex. 6

s(Conta) --> as(Conta), bs(Conta), cs(Conta), ds(Conta).

as(0) --> [a].
as(suc((Conta))) --> [a], as(Conta),[a].

bs(0) --> [b,b].
bs(suc((Conta))) --> [b], bs(Conta),[b].

cs(0) --> [c,c].
cs(suc((Conta))) --> [c], cs(Conta),[c].

ds(0) --> [d].
ds(suc((Conta))) --> [d], ds(Conta),[d].

% ?- s(C,S,[]).

% C = 0,
% S = [a, b, b, c, c, d]
% C = suc(0),
% S = [a, a, a, b, b, b, b, c, c, c, c, d, d, d]
% C = suc(suc(0)),
% S = [a, a, a, a, a, b, b, b, b, b, b, c, c, c, c, c, c, d, d, d, d, d]