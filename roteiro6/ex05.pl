% Ex. 5

:- op(300, xfx , [sao, eh_um]).
:- op(300, fx, gosta_de ).
:- op(200, xfy , e).
:- op(100, fy, famoso ).

harry         eh_um   bruxo.
hermione      eh_um   bruxo.
ron           eh_um   bruxo.
dumbledore    eh_um  (famoso(famoso mago)).

harry e ron e hermione sao amigos.
gosta_de quadribol e (harry eh_um mago).

% Quais dos termos seguintes sao bem formados? Qual  ́e o operador principal? Reescreva-os com parenteses na ordem correta de avaliacao.

% ?- X eh_um  bruxo.
% true
% eh_um eh o operador principal

% ?- harry e ron e hermione sao amigos.
% true
% sao eh o operador principal

% ?- gosta_de quadribol e harry eh_um  mago.
% Erro, nao eh bem formado. Reescrevendo fica
% ?- gosta_de quadribol e (harry eh_um mago).
% true
% gosta_de e eh_um sao os operadores principais

%?- dumbledore eh_um famoso famoso mago.
% Erro, nao eh bem formado. Reescrevendo fica
% dumbledore eh_um (famoso(famoso mago)).
% true.
% famoso eh o operador principal