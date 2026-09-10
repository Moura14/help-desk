import 'package:help_desk/features/home/data/datasource/home_datasource.dart';
import 'package:help_desk/features/home/data/models/info_model_response.dart';
import 'package:help_desk/features/home/domain/repositories/home_repositories_domain.dart';


class HomeRepositoriesDataImpl implements HomeRepositoriesDomain {
  final HomeDataSource homeDataSource;

  HomeRepositoriesDataImpl({required this.homeDataSource});

  @override
  Future<InfoResponseModel> listarUsuario() {
    return homeDataSource.listarUsuario();
  }  
}
