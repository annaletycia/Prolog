/* html//1, reply_html_page  */
:- use_module(library(http/html_write)).
/* html_requires  */
:- use_module(library(http/html_head)).

:- encoding(utf8).

:- use_module(bd(reservas_has_convidados)).

cadastro(_Pedido):-
    reply_html_page(
        
        [ title('Bookmarks')],
        [ div(class(container),
              [ 
                \html_requires(js('rest.js')),
                \html_requires(js('reservas_has_convidados.js')),
                h1('Meus bookmarks'),
                \form_bookmark
              ]) ]).

form_bookmark -->
    html(form([ id('bookmark-form'),
                onsubmit("redirecionaResposta(event, '/')"),
                action('/api/v1/reservas_has_convidados/'), method('POST') ],
              [ \campo(cat_desc_reservas_has_convidados, 'Titulo', text),
                \campo(cat_end_imagem, 'URL', text),
                button([type(submit), class('btn btn-primary')], 'Enviar')
             ])).


campo(Nome, Rotulo, Tipo) -->
    html(div(class('mb-3'),
             [ label([for(Nome), class('form-label')], Rotulo),
               input([type(Tipo), class('form-control'), id(Nome), name(Nome)])
             ] )).



cadastro(_Pedido) :-
    reply_html_page( title('Formulario Reservas Has Convidados'),
        [
            form([id('bookmark-form'),
            onsubmit("redirecionaResposta(event, '/')"),
            action('/api/v1/reservas_has_convidados'), method('POST') ],
                [
                    
                    p([], [ label([for=cat_desc_reservas_has_convidados], 'Descrição Reservas Has Convidados: '),
                            input([name=cat_desc_reservas_has_convidados, type=textarea]) ]),
                    p([], [ label([for=cat_end_imagem], 'Endereço de imagem para Reservas Has Convidados: '),
                            input([name=cat_end_imagem, type=textarea]) ]),
                    p([], input([name=submit, type=submit, value='Enviar'], []))
                ])
        ]).


