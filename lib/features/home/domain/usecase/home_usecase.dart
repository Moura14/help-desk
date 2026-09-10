import 'package:help_desk/features/home/data/models/info_model_response.dart';
import 'package:help_desk/features/home/domain/repositories/home_repositories_domain.dart';


class HomeUsecase {


  final HomeRepositoriesDomain homeRepositoriesDomain;

  HomeUsecase({required this.homeRepositoriesDomain});


  Future<InfoResponseModel> listarUsuario() async{
    return await homeRepositoriesDomain.listarUsuario();
  }

}