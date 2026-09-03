abstract class LoginEvent {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginButtonPressed extends LoginEvent {
  final String email;
  final String senha;

  const LoginButtonPressed({required this.email, required this.senha});

  @override
  List<Object> get props => [email, senha];
}


class LogoutRequested extends LoginEvent {}