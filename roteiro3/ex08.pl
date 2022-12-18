% Ex. 8

palindromo([]).
palindromo([_]).
palindromo([X|L1]):- append(L2,[X],L1), 
		     palindromo(L2).

% ?- palindromo([r,o,d,a,d,o,r]).
% true

% ?- palindromo([a,d,r,o,g,a,d,a,g,o,r,d,a]).
% true

% ?- palindromo([e,s,s,e,n,a,o]).
% false