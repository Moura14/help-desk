import 'package:help_desk/features/ticket/data/model/ticket_create_model.dart';
import 'package:help_desk/features/ticket/data/model/ticket_response.dart';
import 'package:help_desk/features/ticket/data/model/ticket_response_model.dart';
import 'package:help_desk/features/ticket/domain/repositories/ticket_repositorie_domain.dart';

class TicketUsecase {


  final TicketRepositorieDomain ticketRepositorieDomain;

  TicketUsecase({required this.ticketRepositorieDomain});


  Future<TicketResponse> criarTicket(TicketModel ticket) async{
    return await ticketRepositorieDomain.criarTicket(ticket);
  }

  Future<TicketListResponse> listarTicket() async{
    return await ticketRepositorieDomain.listarTicket();
  }

 

}