import 'package:dio/dio.dart';
import 'package:help_desk/core/endpoints/endpoint.dart';
import 'package:help_desk/features/ticket/data/model/editar_ticket_model.dart';
import 'package:help_desk/features/ticket/data/model/ticket_create_model.dart';
import 'package:help_desk/features/ticket/data/model/ticket_response.dart';
import 'package:help_desk/features/ticket/data/model/ticket_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class TicketDatasource {

  Future<TicketResponseModel> criarTicket(TicketModel ticket);
  Future<TicketListResponse> listarTicket();
  Future<TicketResponseModel> editarTicket(int id, EditarTicketModel editarTicket);


}

class TicketDataSourceImpl implements TicketDatasource{


  final Dio dio;

  TicketDataSourceImpl({required this.dio});

  @override
  Future<TicketResponseModel> criarTicket(TicketModel ticket) async{

    try{

      final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');
    
    final response = await dio.post(Endpoint.abrirTicket, data: ticket.toJson(), options: Options(
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json"
      }
    ));

      print(ticket.toJson());

  

      if(response.statusCode == 200 || response.statusCode == 201){
        final ticketResponse = TicketResponseModel.fromJson(response.data);
        return ticketResponse;
      }else{
       throw Exception("Erro ao criar ticket: ${response.data}");
      }
    }catch(e){
      print(e.hashCode);
      rethrow;
    }

  }

  @override
  Future<TicketListResponse> listarTicket() async{
    try{

      final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');
    
    final response = await dio.get(Endpoint.listarTicket, options: Options(
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json"
      }
    ));
     
      if(response.statusCode == 200 || response.statusCode == 201){
        final listarTicket = TicketListResponse.fromJson(response.data);
        return listarTicket;
      }else{
        throw Exception("Erro ao listar ticket: ${response.data}");
      }
    }catch(e){
      print(e.hashCode);
      rethrow;
    }
  }

  
  @override
  Future<TicketResponseModel> editarTicket(int id, EditarTicketModel editarTicket) async {
    try{
        final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');
    
    final response = await dio.put(Endpoint.editarTicket(id), data: editarTicket.toJson(), options: Options(
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json"
      }
    ));
    if(response.statusCode == 200 || response.statusCode == 201){
      final editarTicket = TicketResponseModel.fromJson(response.data);
      return editarTicket;
    }else{
      throw Exception('Erro ao editar ticket: ${response.data}');
    }
    }catch(e){
      print(e.hashCode);
      rethrow;
    }
  }

}