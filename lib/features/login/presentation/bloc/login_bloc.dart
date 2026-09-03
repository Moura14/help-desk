import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_desk/features/login/data/models/register_response_model.dart';
import 'package:help_desk/features/login/presentation/bloc/login_event.dart';
import 'package:help_desk/features/login/presentation/bloc/login_state.dart';
import 'package:help_desk/features/login/domain/usecase/login_usecase.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final LoginUsecase loginUseCase;

  LoginBloc({required this.loginUseCase}) : super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading());
      try {
        final RegisterResponseModel response =
            await loginUseCase.login(event.email, event.senha);
        emit(LoginSuccess(response));
      } catch (e) {
        emit(LoginFailure(e.toString()));
      }
    });
    on<LogoutRequested>((event, emit) {
      emit(LoginInitial());
    });
  }
}
