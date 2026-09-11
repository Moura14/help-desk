import 'package:dio/dio.dart';
import 'package:help_desk/core/endpoints/endpoint.dart';
import 'package:help_desk/features/login/data/models/login_response_model.dart';
import 'package:help_desk/features/login/data/models/register_model.dart';
import 'package:help_desk/features/login/data/models/register_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LoginDatasource {

  Future<RegisterResponseModel> registrar(RegisterModel registro);
  Future<LoginResponseModel> login(String email, String senha);

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
  Future<LoginResponseModel> login(String email, String senha) async{
    try{
      final response = await dio.post(
        Endpoint.login,
        data: {
          'username': email,
          'password': senha,
        },
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
  ),
      );
      if(response.statusCode == 200 || response.statusCode == 201){
        final loginModel = LoginResponseModel.fromJson(response.data);
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('access_token', loginModel.accessToken);
        return loginModel;
      }else{
        throw Exception("Erro ao logar: ${response.data}");
      }
    }catch(e){
      print("Tipo: ${e.runtimeType}");
      print("Erro: ${e}");
      rethrow;
    }
  }

}