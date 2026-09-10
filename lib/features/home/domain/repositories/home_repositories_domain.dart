import 'package:help_desk/features/home/data/models/info_model_response.dart';


abstract class HomeRepositoriesDomain {
  Future<InfoResponseModel> listarUsuario();
  
}
