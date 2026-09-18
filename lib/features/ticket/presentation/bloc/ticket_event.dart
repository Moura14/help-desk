import 'package:help_desk/features/ticket/data/model/editar_ticket_model.dart';
import 'package:help_desk/features/ticket/data/model/ticket_create_model.dart';
import 'package:help_desk/features/ticket/data/model/ticket_response_model.dart';

abstract class TicketEvent {}

class TicketButtonPressed extends TicketEvent {
  final TicketModel ticket;

  TicketButtonPressed(this.ticket);
}

abstract class TicktListEvent{}

class FetchTickets extends TicktListEvent{}

class EditarTicketPressed extends TicketEvent{
  final int id;
  final EditarTicketModel ticket;


  EditarTicketPressed(this.id, this.ticket);
}