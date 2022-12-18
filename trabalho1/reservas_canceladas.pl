:- module(
	reservas_canceladas,
	[reservas_canceladas/8]
  ).

:- use_module(library(persistency)).

:- persistent
   reservas_canceladas( pk_id_reserva_cancelada:integer,
			rec_data_reserva:atom,
			rec_hora_reserva:atom,
			pk_id_ambiente:integer,
			pk_id_usuario:integer,
        		res_justificativa:atom,
        		res_datetime:atom,
        		res_user_exclusao:integer).

:-initialization(db_attach('tbl_reservas_canceladas.pl', [])).


insere(IdReserva,Data,Hora,IdAmbiente,IdUsuario,Justificativa,Datetime, User):-
   with_mutex(reserva_cancelada,
	      assert_reservas_canceladas(IdReserva,Data,Hora,IdAmbiente,IdUsuario,Justificativa,Datetime, User)).

remove(IdReserva):-
   with_mutex(reserva_cancelada,
	      retract_reservas_canceladas(IdReserva,_Data,_Hora,_IdAmbiente,_IdUsuario,_Justificativa,_Datetime,_User)).

atualiza(IdReserva,Data,Hora,IdAmbiente,IdUsuario,Justificativa,Datetime, User):-
   with_mutex(reserva_cancelada,
	     ( retractall_reservas_canceladas(IdReserva,_Data,_Hora,_IdAmbiente,_IdUsuario,_Justificativa,_Datetime,_User),
	       assert_reservas_canceladas(IdReserva,Data,Hora,IdAmbiente,IdUsuario,Justificativa,Datetime, User)) ).


sincroniza:-
	db_sync(gc(always)).
