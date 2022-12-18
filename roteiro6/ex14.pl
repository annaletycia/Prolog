% Ex. 14

% Sem usar corte

divide([], [], []).
divide([X|L], [X|L1], L2) :- 
    X>=0, 
    divide(L, L1, L2).
divide([X|L], L1, [X|L2]) :- 
    X<0, 
    divide(L, L1, L2).

% ?- divide([3,4,-5,-1,0,4,-9],P,N).
% N = [-5, -1, -9],
% P = [3, 4, 0, 4];
% false

% Com corte 

divide([],[],[]).
    divide([X|L],[X|L1],L2):-
        X>= 0,
        !,    
        divide(L,L1,L2).
        
    divide([X|L],L1,[X|L2]):-
        divide(L,L1,L2).

% ?- divide([3,4,-5,-1,0,4,-9],P,N).
% N = [-5, -1, -9],
% P = [3, 4, 0, 4].