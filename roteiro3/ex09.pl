% Ex. 9 Como o Prolog responde as seguintes consultas?

% 1)
% ?- X = 3*4.
% X = 3*4.
% Nesse caso, a "3*4" eh apenas um termo Prolog, tal que * eh o funtor e 3 e 4 os argumentos, por isso nenhuma conta eh realizada.

% 2)
% ?- X is 3*4.
% X = 12.
% Nesse caso a variavel X recebe o resultado de 3 multiplicado por 4, que eh 12.

% 3)
% ?- 4 is X.
% ERROR: Arguments are not sufficiently instantiated
% Um erro eh apresentado pois a maneira correta eh a variavel vir antes do "is".

% 4) 
% ?- X = Y.
% X = Y.
% Prolog unifica X e Y, instanciando se for o caso alguma variavel em X e Y.

% 5)
% ?- 3 is 1+2.
% true.
% Prolog realiza a soma 1+2 e compara o resultado dela com 3, constatando a igualdade.

% 6)
% ?- 3 is +(1,2).
% true.
% A conta +(1,2) eh equivalente a 1+2, que resulta 3 e portanto a igualdade eh verdadeira.

% 7)
% ?- 3 is X+2.
% ERROR: Arguments are not sufficiently instantiated
% As variaveis contidas na expressao devem estar instanciadas com numeros, o que nao eh o caso, por isso a mensagem de erro. 

% 8)
% ?- X is 1+2.
% X = 3.
% Prolog realiza primeiro a soma e depois instancia o resultado em X, tal que X resulta 3. 

% 9)
% ?- 1+2 is 1+2.
% false.
% Nao eh possivel utilizar o operador "is" nesse caso, se o objetivo era realizar uma valiacao aritmetica, o correto seria "1+2 =:= 1+2". 
 

% 10)
% ?- is(X,+(1,2)).
% X = 3.
% Primeiro eh realizada a soma entre 1 e 2 e depois X recebe o resultado da operacao.

% 11)
% ?- 3+2 = +(3,2).
% true.
% A unificacao eh possivel, visto que nao ha variaveis a serem instanciadas e o resultado de ambas as operacoes sejam iguais, 3+2 e +(3,2) resultam em 5.

% 12)
% ?- *(7,5)  = 7*5.
% true.
% A unificacao eh possivel, visto que nao ha variaveis a serem instanciadas e o resultado de ambas as operacoes sejam iguais, *(7,5) e 7*5 resultam em 35.

% 13)
% ?- *(7,+(3,2))  = 7*(3+2).
% true.
% A unificacao eh possivel, visto que nao ha variaveis a serem instanciadas e o resultado de ambas as operacoes sejam iguais, *(7,+(3,2)) e 7*(3+2) em 35.

% 14)
% ?- *(7,(3+2)) = 7*(3+2).
% true.
% A unificacao eh possivel, visto que nao ha variaveis a serem instanciadas e o resultado de ambas as operacoes sejam iguais, *(7,(3+2)) e 7*(3+2) em 35.

% 15)
% ?- *(7,(3+2)) = 7*(+(3,2)).
% true.
% A unificacao eh possivel, visto que nao ha variaveis a serem instanciadas e o resultado de ambas as operacoes sejam iguais, *(7,(3+2)) e 7*(+(3,2)) em 35.
