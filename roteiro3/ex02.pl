% Ex. 2

intercala1([],[],[]).
intercala1([X],[],[X]).
intercala1([],[Y],[Y]).
intercala1([X|L1], [Y|L2], [X,Y|L3]) :- intercala1(L1,L2,L3). 

% ?- intercala1([a,b,c],[1,2,3],X).
% X = [a, 1, b, 2, c, 3] .

% ?- intercala1([fu,ba,yip,yup],[glub,glab,glib,glob],Res).
% Res = [fu, glub, ba, glab, yip, glib, yup, glob] ;
