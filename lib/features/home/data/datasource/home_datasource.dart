import 'package:dio/dio.dart';
import 'package:help_desk/core/endpoints/endpoint.dart';
import 'package:help_desk/features/home/data/models/info_model_response.dart';


abstract class HomeDataSource {

  Future<InfoResponseModel> listarUsuario();
  

}

class HomeDatasourceImpl implements HomeDataSource{


  final Dio dio;

  HomeDatasourceImpl({required this.dio});

  @override
Future<InfoResponseModel> listarUsuario() async {
  try {
    final response = await dio.get(Endpoint.listatUsuario, options: Options(
      headers: {
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZGFvQGdtYWlsLmNvbSIsImV4cCI6MTc4OTEzNjg3N30.Ill7fevGWKjk8kFbRHtU0btK2dBqqKUU6p3fFwUL8V4",
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