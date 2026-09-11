import 'package:dio/dio.dart';
import 'package:help_desk/core/endpoints/endpoint.dart';
import 'package:help_desk/features/home/data/models/info_model_response.dart';
import 'package:shared_preferences/shared_preferences.dart';


abstract class HomeDataSource {

  Future<InfoResponseModel> listarUsuario();
  

}

class HomeDatasourceImpl implements HomeDataSource{


  final Dio dio;

  HomeDatasourceImpl({required this.dio});

  @override
Future<InfoResponseModel> listarUsuario() async {
  try {

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');
    
    final response = await dio.get(Endpoint.listatUsuario, options: Options(
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json"
      }
    ));

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = response.data;

      if (data is Map<String, dynamic>) {
        return InfoResponseModel.fromJson(data);
      } else {
        throw Exception("Formato inesperado: ${data.runtimeType}");
      }
    } else {
      throw Exception("Erro ao listar usuário: ${response.statusCode}");
    }
  } catch (e) {
    print("Erro no datasource: $e");
    rethrow;
  }
}


}