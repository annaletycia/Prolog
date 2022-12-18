/* html//1, reply_html_page  */
:- use_module(library(http/html_write)).
/* html_requires  */
:- use_module(library(http/html_head)).

:- encoding(utf8).

:- use_module(bd(reservas_canceladas)).

cadastro(_Pedido):-
    reply_html_page(
        
        [ title('Bookmarks')],
        [ div(class(container),
              [ 
                \html_requires(js('rest.js')),
                \html_requires(js('reservas_canceladas.js')),
                h1('Meus bookmarks'),
                \form_bookmark
              ]) ]).

form_bookmark -->
    html(form([ id('bookmark-form'),
                onsubmit("redirecionaResposta(event, '/')"),
                action('/api/v1/reservas_canceladas/'), method('POST') ],
              [ \campo(cat_desc_reservas_canceladas, 'Titulo', text),
                \campo(cat_end_imagem, 'URL', text),
                button([type(submit), class('btn btn-primary')], 'Enviar')
             ])).


campo(Nome, Rotulo, Tipo) -->
    html(div(class('mb-3'),
             [ label([for(Nome), class('form-label')], Rotulo),
               input([type(Tipo), class('form-control'), id(Nome), name(Nome)])
             ] )).



cadastro(_Pedido) :-
    reply_html_page( title('Formulario Reservas Canceladas'),
        [
            form([id('bookmark-form'),
            onsubmit("redirecionaResposta(event, '/')"),
            action('/api/v1/reservas_canceladas'), method('POST') ],
                [
                    
                    p([], [ label([for=cat_desc_reservas_canceladas], 'Descrição de Reservas Canceladas: '),
                            input([name=cat_desc_reservas_canceladas, type=textarea]) ]),
                    p([], [ label([for=cat_end_imagem], 'Endereço de imagem para Reservas Canceladas: '),
                            input([name=cat_end_imagem, type=textarea]) ]),
                    p([], input([name=submit, type=submit, value='Enviar'], []))
                ])
        ]).


