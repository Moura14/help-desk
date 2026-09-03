import 'package:help_desk/features/login/data/models/register_response_model.dart';

abstract class LoginState {}


class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final RegisterResponseModel response;
  LoginSuccess(this.response);
}

class LoginFailure extends LoginState {
  final String message;
  LoginFailure(this.message);
}