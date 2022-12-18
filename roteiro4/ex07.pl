% Ex. 7

romano(0, []).
romano(N, ['I'|R]) :-
    N > 0,
    N < 4,
    N1 is N-1,
    romano(N1, R).
romano(4, ['I','V']). 
romano(N, ['V'|R]) :-
    N > 4,
    N < 9,
    N1 is N-5,
    romano(N1, R).
romano(9, ['I','X']). 
romano(N, ['X'|R]) :-
    N > 9,
    N < 40,
    N1 is N -10,
    romano(N1, R).
romano(N, ['X','L'|R]) :-
    N > 39,
    N < 50,
    N1 is N-40,
    romano(N1, R).
romano(N, ['L'|R]) :-
    N > 49,
    N < 90,
    N1 is N-50,
    romano(N1, R).
romano(N, ['X','C'|R]) :-
    N > 89,
    N < 100,
    N1 is N-90,
    romano(N1, R).
romano(N, ['C'|R]) :-
    N > 99,
    N < 400,
    N1 is N-100,
    romano(N1, R).
romano(N, ['C','D'|R]) :-
    N > 399,
    N < 500,
    N1 is N-400,
    romano(N1, R).
romano(N, ['D'|R]) :-
    N > 499,
    N < 900,
    N1 is N -500,
    romano(N1, R).
romano(N, ['C','M'|R]) :-
    N > 899,
    N < 1000,
    N1 is N-900,
    romano(N1, R).
romano(N, ['M'|R]) :-
    N > 999,
    N < 4000,
    N1 is N-1000,
    romano(N1, R).