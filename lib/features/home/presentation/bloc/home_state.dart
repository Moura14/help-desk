import 'package:help_desk/features/home/data/models/info_model_response.dart';


abstract class HomeState {}


class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final InfoResponseModel response;
  HomeSuccess(this.response);
}

class HomeFailure extends HomeState {
  final String message;
  HomeFailure(this.message);
}