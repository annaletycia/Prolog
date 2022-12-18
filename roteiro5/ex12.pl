% Ex. 12

% DCG para anbncn\{ε}

s(Conta) --> as(Conta), bs(Conta), cs(Conta).

as(0) --> [].
as(suc(Conta)) --> [a], as(Conta).

bs(0) --> [].
bs(suc(Conta)) --> [b], bs(Conta).

cs(0) --> [].
cs(suc(Conta)) --> [c], cs(Conta).

?- s(C,S,[]).
C = 0,
S = [] ;

C = suc(0),
S = [a, b, c] ;

C = suc(suc(0)),
S = [a, a, b, b, c, c] ;

C = suc(suc(suc(0))),
S = [a, a, a, b, b, b, c, c, c] ;
...