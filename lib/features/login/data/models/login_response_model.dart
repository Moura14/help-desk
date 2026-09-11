import 'package:help_desk/features/login/data/models/register_response_model.dart';

class LoginResponseModel {
  final String accessToken;
  final String tokenType;
  final RegisterResponseModel usuario;

  LoginResponseModel({
    required this.accessToken,
    required this.tokenType,
    required this.usuario,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      accessToken: json['access_token'],
      tokenType: json['token_type'],
      usuario: RegisterResponseModel.fromJson(json['usuario']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'token_type': tokenType,
      'usuario': usuario.toJson(),
    };
  }
}


