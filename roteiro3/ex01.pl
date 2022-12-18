% Ex. 1

membro(X,[X|_]).
membro(X,[_|T]):-
		membro(X,T).

% [trace] ?- membro(a,[1,2,a,b]).
%   Call: (10) membro(a, [1, 2, a, b]) ? creep
%   Call: (11) membro(a, [2, a, b]) ? creep
%   Call: (12) membro(a, [a, b]) ? creep
%   Exit: (12) membro(a, [a, b]) ? creep
%   Exit: (11) membro(a, [2, a, b]) ? creep
%   Exit: (10) membro(a, [1, 2, a, b]) ? creep
% true 

% [trace]  ?- membro(z,[1,2,a,b]).
%   Call: (10) membro(z, [1, 2, a, b]) ? creep
%   Call: (11) membro(z, [2, a, b]) ? creep
%   Call: (12) membro(z, [a, b]) ? creep
%   Call: (13) membro(z, [b]) ? creep
%   Call: (14) membro(z, []) ? creep
%   Fail: (14) membro(z, []) ? creep
%   Fail: (13) membro(z, [b]) ? creep
%   Fail: (12) membro(z, [a, b]) ? creep
%   Fail: (11) membro(z, [2, a, b]) ? creep
%   Fail: (10) membro(z, [1, 2, a, b]) ? creep
% false

% Em todos os casos, a recursao termina por uma porta de saida com sucesso(exit), quando eh possivel emparelhar as clausulas desejadas, ou por uma porta por falha (fail), quando o predicado nao eh satisfeito e nao ha outra opcao de emparelhamento.
