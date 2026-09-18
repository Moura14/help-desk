import 'package:help_desk/features/ticket/data/model/editar_ticket_model.dart';
import 'package:help_desk/features/ticket/data/model/ticket_create_model.dart';
import 'package:help_desk/features/ticket/data/model/ticket_response.dart';
import 'package:help_desk/features/ticket/data/model/ticket_response_model.dart';
import 'package:help_desk/features/ticket/domain/repositories/ticket_repositorie_domain.dart';

class TicketUsecase {


  final TicketRepositorieDomain ticketRepositorieDomain;

  TicketUsecase({required this.ticketRepositorieDomain});


  Future<TicketResponseModel> criarTicket(TicketModel ticket) async{
    return await ticketRepositorieDomain.criarTicket(ticket);
  }

  Future<TicketListResponse> listarTicket() async{
    return await ticketRepositorieDomain.listarTicket();
  }

  Future<TicketResponseModel> editarTicket(int id, EditarTicketModel editarTicketModel) async{
    return await ticketRepositorieDomain.editarTicket(id, editarTicketModel);
  }

  Future<void> deletarTicket(int id) async{
    return await ticketRepositorieDomain.deletarTicket(id);
  }

 

}