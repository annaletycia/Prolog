% Ex. 4 

intercala3([],[],[]).
intercala3([X],[],[junta(X)]).
intercala3([],[Y],[junta(Y)]).
intercala3([X|L1],[Y|L2],[junta(X,Y)|L3]) :- intercala3(L1,L2,L3).

% ?- intercala3([a,b,c],[1,2,3],X).
% X = [junta(a, 1), junta(b, 2), junta(c, 3)]

% ?- intercala3([fu,ba,yip,yup],[glub,glab,glib,glob],Res).
% Res = [junta(fu, glub), junta(ba, glab), junta(yip, glib), junta(yup, glob)]
