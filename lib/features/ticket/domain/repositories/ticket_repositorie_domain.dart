import 'package:help_desk/features/login/data/models/register_model.dart';
import 'package:help_desk/features/login/data/models/register_response_model.dart';
import 'package:help_desk/features/ticket/data/model/ticket_create_model.dart';
import 'package:help_desk/features/ticket/data/model/ticket_response_model.dart';

abstract class TicketRepositorieDomain {
  Future<TicketResponse> criarTicket(TicketModel ticket);
}
