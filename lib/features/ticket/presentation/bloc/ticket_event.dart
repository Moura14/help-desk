import 'package:help_desk/features/ticket/data/model/ticket_create_model.dart';

abstract class TicketEvent {}

class TicketButtonPressed extends TicketEvent {
  final TicketModel ticket;

  TicketButtonPressed(this.ticket);
}
