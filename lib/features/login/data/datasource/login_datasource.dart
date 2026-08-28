import 'package:dio/dio.dart';
import 'package:help_desk/core/endpoints/endpoint.dart';
import 'package:help_desk/features/login/data/models/register_model.dart';

abstract class LoginDatasource {

  Future<RegisterModel> registrar(RegisterModel registro);

}

class LoginDataSourceImpl implements LoginDatasource{


  final Dio dio;

  LoginDataSourceImpl({required this.dio});

  @override
  Future<RegisterModel> registrar(RegisterModel registro) async{

    try{
      final response = await dio.post(
        Endpoint.registro,
        data: registro.toJson(),
      );

      if(response.statusCode == 200 || response.statusCode == 201){
        final registerModel = RegisterModel.fromJson(response.data);
        return registerModel;
      }else{
       throw Exception("Erro ao registrar: ${response.statusCode}");
      }
    }catch(e){
      print(e.hashCode);

      rethrow;
    }

  }

}