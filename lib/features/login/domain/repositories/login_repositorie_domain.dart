import 'package:help_desk/features/login/data/models/register_model.dart';
import 'package:help_desk/features/login/data/models/register_response_model.dart';

abstract class LoginRepositorieDomain {
  Future<RegisterResponseModel> registrar(RegisterModel registro);
  Future<RegisterResponseModel> login(String email, String senha);
}
