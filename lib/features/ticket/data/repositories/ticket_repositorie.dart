import 'package:help_desk/features/ticket/data/datasource/ticket_datasource.dart';
import 'package:help_desk/features/ticket/data/model/editar_ticket_model.dart';
import 'package:help_desk/features/ticket/data/model/ticket_create_model.dart';
import 'package:help_desk/features/ticket/data/model/ticket_response.dart';
import 'package:help_desk/features/ticket/data/model/ticket_response_model.dart';
import 'package:help_desk/features/ticket/domain/repositories/ticket_repositorie_domain.dart';

class TicketRepositoriesDataImpl implements TicketRepositorieDomain {
  final TicketDatasource ticketDatasource;

  TicketRepositoriesDataImpl({required this.ticketDatasource});

  @override
  Future<TicketResponseModel> criarTicket(TicketModel ticket) {
    return ticketDatasource.criarTicket(ticket);
  }

  @override
  Future<TicketListResponse> listarTicket(){
    return ticketDatasource.listarTicket();
  }

  @override
  Future<TicketResponseModel> editarTicket(int id, EditarTicketModel editarTicket){
    return ticketDatasource.editarTicket(id, editarTicket);
  }

 

  
}
