import 'package:help_desk/features/ticket/data/model/ticket_response.dart';
import 'package:help_desk/features/ticket/data/model/ticket_response_model.dart';

abstract class TicketState {}

class TicketInitial extends TicketState {}

class TicketLoading extends TicketState {}

class TicketSuccess extends TicketState {
  final TicketResponse response;
  TicketSuccess(this.response);
}

class TicketFailure extends TicketState {
  final String message;
  TicketFailure(this.message);
}


abstract class TicketListState{}

class TicketListInitial extends TicketListState{}

class TicketListLoading extends TicketListState{}

class TicketListSucess extends TicketListState{


  final List<TicketResponse> tickets;
  TicketListSucess(this.tickets);
}

class TicketListFailure extends TicketListState{
  final String message;
  TicketListFailure(this.message);
}

