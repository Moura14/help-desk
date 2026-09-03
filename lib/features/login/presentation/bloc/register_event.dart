import 'package:help_desk/features/login/data/models/register_model.dart';

abstract class RegisterEvent {}

class RegisterButtonPressed extends RegisterEvent {
  final RegisterModel registro;

  RegisterButtonPressed(this.registro);
}
