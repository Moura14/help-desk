import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_desk/features/ticket/data/model/ticket_response_model.dart';
import 'package:help_desk/features/ticket/domain/usecase/ticket_usecase.dart';
import 'package:help_desk/features/ticket/presentation/bloc/ticket_event.dart';
import 'package:help_desk/features/ticket/presentation/bloc/ticket_state.dart';

class TicketBloc extends Bloc<TicketEvent, TicketState> {
  final TicketUsecase ticketUsecase;

  TicketBloc(this.ticketUsecase) : super(TicketInitial()) {
    on<TicketButtonPressed>((event, emit) async {
      emit(TicketLoading());
      try {
        final TicketResponse response =
            await ticketUsecase.criarTicket(event.ticket);
        emit(TicketSuccess(response));
      } catch (e) {
        emit(TicketFailure(e.toString()));
      }
    });
  }
}
