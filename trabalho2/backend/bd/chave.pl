:- module(
	chave,
	[ carrega_tab/1,
	pk/2,
	inicia_pk/2 ]
).

:- use_module(library(persistency)).

:- persistent
chave( nome:atom,
	valor:positive_integer ).

:- initialization( ( db_attach('.\projeto\backend\bd\tbl_chave.pl', []),
                  at_halt(db_sync(gc(always))) ) ).

% Informa onde os arquivos de dados serão colocados
carrega_tab(ArqTabela):-
	db_attach(ArqTabela, []).

pk(Nome, Valor):-
 atom_concat(pk, Nome, Mutex),
 with_mutex(Mutex,
            (
                ( chave(Nome, ValorAtual) ->
                  ValorAntigo = ValorAtual;
                  ValorAntigo = 0 ),
                Valor is ValorAntigo + 1,
                retractall_chave(Nome,_), % remove o valor antigo
                assert_chave(Nome, Valor)) ). % atualiza com o novo


% Talvez você queira um valor inicial diferente de 1

inicia_pk(Nome, ValorInicial):-
 atom_concat(pk, Nome, Mutex),
 with_mutex(Mutex,
            ( chave(Nome, _) ->
              true; 
              assert_chave(Nome, ValorInicial) ) ).