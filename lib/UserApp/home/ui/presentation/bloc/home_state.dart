part of 'home_bloc.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class FavouriteSuccess extends HomeState {
  final String message;
  FavouriteSuccess(this.message);
}


class UpdateProfileSuccess extends HomeState {
  final String message;
  UpdateProfileSuccess(this.message);
}

class FetchingProfileSuccess extends HomeState {
  final String message;
  FetchingProfileSuccess(this.message);
}


class HomeFailure extends HomeState {
  final String error;
  HomeFailure(this.error);
}
