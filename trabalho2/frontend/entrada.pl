/* html//1, reply_html_page  */
:- use_module(library(http/html_write)).
/* html_requires  */
:- use_module(library(http/html_head)).

:- encoding(utf8).

:- use_module(bd(reservas_canceladas)).
:- use_module(bd(reservas_has_convidados)).

entrada(_Pedido) :-
    reply_html_page(
        [ title('Sistema de Gestao para Clubes Recreativos e Esportivos') ],
        [ div(class(container),
              [ 
                \html_requires(js('rest.js')),
                \html_requires(js('reservas_canceladas.js')),
		\html_requires(js('reservas_has_convidados.js')),
                h1('Meus bookmarks'),
                \inicio_page
              ]) ]).

inicio_page -->
    html( [ h1('Sistema de Gestao para Clubes Recreativos e Esportivos'), 
            p(a(href('/reservas_canceladas'), 'Formulario Reservas Canceladas')),
            p(a(href('/reservas_has_convidados'), 'Formulario Reservas Has Convidados'))
        ]).
