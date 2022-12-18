% Ex. 14

multiEsc(_,[],[]).
multiEsc(Y,[X|L1],[Z|L2]) :- Z is Y*X, 
			    multiEsc(Y,L1,L2).

% ?- multiEsc(3,[2,7,4],Resultado).
% Resultado = [6,21,12]