% Ex. 9

% ?- assert(q(a,b)), assertz(q(1,2)), asserta(q(foo,blug)).
% true.

% A base de dados consta com

% q((foo,blug).
% q(a,b).
% q(1,2).

% ?- retract(q(1,2)), assertz((p(X):-h(X))).
% true.

% A base de dados consta com

% q(foo, blug).
% q(a, b).
% p(X):- h(X).

% ?- retract(q(_,_)), fail.
% false.

% A base de dados consta com

% p(X) :- h(X).

