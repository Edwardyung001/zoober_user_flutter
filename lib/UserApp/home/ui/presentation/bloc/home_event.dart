part of 'home_bloc.dart';

abstract class HomeEvent {}

class FavouriteListRequested extends HomeEvent {
  final String title;
  final String description;

  FavouriteListRequested({required this.title, required this.description,});
}


class FetchingProfileRequested extends HomeEvent {
  final String userId;

  FetchingProfileRequested({required this.userId,});
}


class UpdateProfileRequested extends HomeEvent {
  final String userId;
  final String mobile;
  final String email;
  final String firstName;
  final String lastName;
  final String gender;
  final String dob;
  final String image;

  UpdateProfileRequested({required this.userId,required this.mobile, required this.email, required this.firstName, required this.lastName,required this.gender,required this.dob,required this.image});
}


