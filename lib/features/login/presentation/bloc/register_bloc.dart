import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:help_desk/features/login/data/models/register_response_model.dart';
import 'package:help_desk/features/login/domain/usecase/login_usecase.dart';
import 'package:help_desk/features/login/presentation/bloc/register_event.dart';
import 'package:help_desk/features/login/presentation/bloc/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final LoginUsecase loginUsecase;

  RegisterBloc(this.loginUsecase) : super(RegisterInitial()) {
    on<RegisterButtonPressed>((event, emit) async {
      emit(RegisterLoading());
      try {
        final RegisterResponseModel response =
            await loginUsecase.registro(event.registro);
        emit(RegisterSuccess(response));
      } catch (e) {
        emit(RegisterFailure(e.toString()));
      }
    });
  }
}
