% Ex. 13

% O programa indica a classe do numero indicado, se ele eh positivo, negativo ou zero

% Com corte

classe(0,zero).
classe(Numero ,positivo):- Numero  > 0, !.
classe(_ , negativo).