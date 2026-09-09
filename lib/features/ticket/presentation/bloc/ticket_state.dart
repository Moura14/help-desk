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
