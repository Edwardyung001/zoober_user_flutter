import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zooberuserapp/UserApp/auth/domain/usecase/login_usecase.dart';
import 'package:zooberuserapp/UserApp/home/ui/domain/usecase/favourite_usecase.dart';
import 'package:zooberuserapp/UserApp/home/ui/domain/usecase/fetching_profile_usecase.dart';
import 'package:zooberuserapp/UserApp/home/ui/domain/usecase/update_profile_usecase.dart';
part 'home_state.dart';
part 'home_event.dart';


class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FavouriteUseCase favouriteUseCase;
  final UpdateProfileUseCase updateProfileUseCase;
  final FetchingProfileUseCase fetchingProfileUseCase;

  HomeBloc(this.favouriteUseCase, this.updateProfileUseCase,this.fetchingProfileUseCase) : super(HomeInitial()) {

    on<FavouriteListRequested>((event, emit) async {
      emit(HomeLoading());
      try {
        final response = await favouriteUseCase(event.title, event.description,);
        emit(FavouriteSuccess(response.message));
      } catch (e) {
        emit(HomeFailure(e.toString()));
      }
    });
    on<UpdateProfileRequested>((event, emit) async {
      emit(HomeLoading());
      try {
        final response = await updateProfileUseCase(event.userId,event.mobile, event.email,event.firstName,event.lastName,event.gender,event.dob,event.image);
        emit(UpdateProfileSuccess(response.message));
      } catch (e) {
        emit(HomeFailure(e.toString()));
      }
    });
    on<FetchingProfileRequested>((event, emit) async {
      emit(HomeLoading());
      try {
        final response = await fetchingProfileUseCase(event.userId);
        emit(FetchingProfileSuccess(response.message));
      } catch (e) {
        emit(HomeFailure(e.toString()));
      }
    });

  }
}
