import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zooberuserapp/UserApp/auth/domain/usecase/login_usecase.dart';
import 'package:zooberuserapp/UserApp/home/ui/data/model/fetching_favourite_model.dart';
import 'package:zooberuserapp/UserApp/home/ui/domain/usecase/favourite_usecase.dart';
import 'package:zooberuserapp/UserApp/home/ui/domain/usecase/fetching_favourite_usecase.dart';
import 'package:zooberuserapp/UserApp/home/ui/domain/usecase/fetching_profile_usecase.dart';
import 'package:zooberuserapp/UserApp/home/ui/domain/usecase/update_profile_usecase.dart';
part 'home_state.dart';
part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FavouriteUseCase favouriteUseCase;
  final UpdateProfileUseCase updateProfileUseCase;
  final FetchingProfileUseCase fetchingProfileUseCase;
  final FetchingFavouriteUseCase fetchingFavouriteUseCase;

  HomeBloc(this.favouriteUseCase, this.updateProfileUseCase,
      this.fetchingProfileUseCase, this.fetchingFavouriteUseCase)
      : super(HomeInitial()) {


    on<AddFavouriteListRequested>((event, emit) async {
      emit(HomeLoading());
      try {
        final response = await favouriteUseCase(
          event.title,
          event.description,
        );
        emit(FavouriteSuccess(response.message));
      } catch (e) {
        emit(HomeFailure(e.toString()));
      }
    });
    on<FirstProfileRequested>((event, emit) async {
      emit(HomeLoading());
      try {
        final response = await updateProfileUseCase(
          userId: event.userId,
          firstname: event.firstName,
          lastname: event.lastName,
          // You can add more if needed
        );
        emit(UpdateProfileSuccess(response.message));
      } catch (e) {
        emit(HomeFailure(e.toString()));
      }
    });
    on<MobileProfileRequested>((event, emit) async {
      emit(HomeLoading());
      try {
        final response = await updateProfileUseCase(
          userId: event.userId,
          mobile: event.mobile,
          // You can add more if needed
        );
        emit(UpdateProfileSuccess(response.message));
      } catch (e) {
        emit(HomeFailure(e.toString()));
      }
    });
    on<EmailProfileRequested>((event, emit) async {
      emit(HomeLoading());
      try {
        final response = await updateProfileUseCase(
          userId: event.userId,
          email: event.email,
          // You can add more if needed
        );
        emit(UpdateProfileSuccess(response.message));
      } catch (e) {
        emit(HomeFailure(e.toString()));
      }
    });
    on<GenderProfileRequested>((event, emit) async {
      emit(HomeLoading());
      try {
        final response = await updateProfileUseCase(
          userId: event.userId,
          gender: event.gender,
          // You can add more if needed
        );
        emit(UpdateProfileSuccess(response.message));
      } catch (e) {
        emit(HomeFailure(e.toString()));
      }
    });

    on<FetchingProfileRequested>((event, emit) async {
      emit(HomeLoading());
      try {
        final response = await fetchingProfileUseCase(event.userId);
        emit(FetchingProfileSuccess(response.userDetails));
      } catch (e) {
        emit(HomeFailure(e.toString()));
      }
    });


    on<FetchingFavouriteRequested>((event, emit) async {
      emit(HomeLoading());
      try {
        final response = await fetchingFavouriteUseCase(event.userId);

        // Convert List<FavouriteItem> to List<Map<String, dynamic>>
        final favouriteList = response.favouriteList.map((item) => {
          'title': item.title,
          'description': item.description,
          'deleted_at': item.deletedAt,
        }).toList();

        emit(FetchingFavouriteSuccess(favouriteList));
      } catch (e) {
        emit(HomeFailure(e.toString()));
      }
    });





  }
}
