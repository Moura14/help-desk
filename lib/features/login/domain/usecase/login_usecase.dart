import 'package:help_desk/features/login/data/models/register_model.dart';
import 'package:help_desk/features/login/data/models/register_response_model.dart';
import 'package:help_desk/features/login/domain/repositories/login_repositorie_domain.dart';

class LoginUsecase {


  final LoginRepositorieDomain loginRepositorieDomain;

  LoginUsecase({required this.loginRepositorieDomain});


  Future<RegisterResponseModel> registro(RegisterModel registro) async{
    return await loginRepositorieDomain.registrar(registro);
  }


}