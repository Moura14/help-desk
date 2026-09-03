import 'package:dio/dio.dart';
import 'package:help_desk/core/endpoints/endpoint.dart';
import 'package:help_desk/features/login/data/models/register_model.dart';
import 'package:help_desk/features/login/data/models/register_response_model.dart';

abstract class LoginDatasource {

  Future<RegisterResponseModel> registrar(RegisterModel registro);
  Future<RegisterResponseModel> login(String email, String senha);

}

class LoginDataSourceImpl implements LoginDatasource{


  final Dio dio;

  LoginDataSourceImpl({required this.dio});

  @override
  Future<RegisterResponseModel> registrar(RegisterModel registro) async{

    try{

      print(registro.toJson());

      final response = await dio.post(
        Endpoint.registro,
        data: registro.toJson(),
      );

      if(response.statusCode == 200 || response.statusCode == 201){
        final registerModel = RegisterResponseModel.fromJson(response.data);
        return registerModel;
      }else{
       throw Exception("Erro ao registrar: ${response.data}");
      }
    }catch(e){
      print(e.hashCode);
      rethrow;
    }

  }


  @override
  Future<RegisterResponseModel> login(String email, String senha) async{
    try{
      final response = await dio.post(
        Endpoint.login,
        data: {
          'email': email,
          'senha': senha,
        },
      );
      if(response.statusCode == 200 || response.statusCode == 201){
        final registerModel = RegisterResponseModel.fromJson(response.data);
        return registerModel;
      }else{
        throw Exception("Erro ao logar: ${response.data}");
      }
    }catch(e){
      print(e.hashCode);
      rethrow;
    }
  }

}