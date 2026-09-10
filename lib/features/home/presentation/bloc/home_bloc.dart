import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_desk/features/home/domain/usecase/home_usecase.dart';
import 'package:help_desk/features/home/presentation/bloc/home_event.dart';
import 'package:help_desk/features/home/presentation/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent,HomeState>{
  final HomeUsecase homeUsecase;

  HomeBloc(this.homeUsecase) : super(HomeInitial()){
    on<HomeInfo>((event, emit) async{
      emit(HomeLoading());
      try{
        final usuario = await homeUsecase.listarUsuario();
        emit(HomeSuccess(usuario));
      }catch(e){
        emit(HomeFailure(e.toString()));
      }
    }
    
    );
  }
}