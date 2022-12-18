% Ex. 3

intercala2([],[],[]).
intercala2([X],[],[X]).
intercala2([],[Y],[Y]).
intercala2([X|L1],[Y|L2],[[X,Y]|L3]) :- intercala2(L1,L2,L3).

% ?- intercala2([a,b,c],[1,2,3],X).
% X = [[a,1], [b,2], [c,3]]

% ?- intercala2([fu,ba,yip,yup],[glub,glab,glib,glob],Res).
% Res = [[fu,glub], [ba,glab], [yip,glib], [yup,glob]]
