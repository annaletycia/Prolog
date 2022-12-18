:- module(
	reservas_has_convidados,
	[reservas_has_convidados/6, insere/3, remove/1, atualiza/3]
  ).

:- use_module(library(persistency)).

:- use_module(bd(chave)).

:- persistent
   reservas_has_convidados( 			reservas_usuarios_pk_id_usuario:integer,
			reservas_pk_hora_reserva:atom,
			reservas_pk_data_reserva:atom,
			reservas_ambiente_pk_id_ambiente:integer,
			reservas_pk_id_reserva:integer,
        		convidados_pk_id_convidado:integer
        		).

:- initialization( ( db_attac('.\backend\bd\tbl_reservas_has_convidados.pl', []),
                     at_halt(db_sync(gc(always))) )).

insere(IdUsuarioRes,HoraRes,DataRes,IdAmbienteRes,IdRes,IdConvidado):-
   chave:pk(reservas_has_convidados,IdUsuarioRes),
   with_mutex(reservas_has_convidados,
	      assert_reservas_has_convidados(IdUsuarioRes,HoraRes,DataRes,IdAmbienteRes,IdRes,IdConvidado)).

remove(IdUsuarioRes):-
   with_mutex(reservas_has_convidados,
	      retract_reservas_has_convidados(IdUsuarioRes,_HoraRes,_DataRes,_IdAmbienteRes,_IdRes,_IdConvidado)).

atualiza(IdUsuarioRes,HoraRes,DataRes,IdAmbienteRes,IdRes,IdConvidado):-
   with_mutex(reservas_has_convidados,
	     ( retractall_reservas_has_convidados(IdUsuarioRes,HoraRes,DataRes,IdAmbienteRes,IdRes,IdConvidado),
	       assert_reservas_has_convidados(IdUsuarioRes,HoraRes,DataRes,IdAmbienteRes,IdRes,IdConvidado)) ).
