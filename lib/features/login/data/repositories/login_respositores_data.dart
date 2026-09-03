import 'package:help_desk/features/login/domain/repositories/login_repositorie_domain.dart';
import 'package:help_desk/features/login/data/datasource/login_datasource.dart';
import 'package:help_desk/features/login/data/models/register_model.dart';
import 'package:help_desk/features/login/data/models/register_response_model.dart';

class LoginRepositoriesDataImpl implements LoginRepositorieDomain {
  final LoginDatasource loginDatasource;

  LoginRepositoriesDataImpl({required this.loginDatasource});

  @override
  Future<RegisterResponseModel> registrar(RegisterModel registro) {
    return loginDatasource.registrar(registro);
  }

  @override
  Future<RegisterResponseModel> login(String email, String senha) {
    return loginDatasource.login(email, senha);
  }

  
}
