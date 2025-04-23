import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zooberuserapp/UserApp/auth/domain/usecase/login_usecase.dart';
import 'package:zooberuserapp/UserApp/auth/domain/usecase/signup_usecase.dart';
part 'auth_state.dart';
part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignupUseCase signupUseCase;
  final LoginUseCase loginUseCase;

  AuthBloc(this.signupUseCase, this.loginUseCase) : super(AuthInitial()) {
    on<SignupRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final response = await signupUseCase(event.name, event.email,event.phoneNumber, event.password);
        emit(SignupSuccess(response.message));
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });
    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final response = await loginUseCase(event.phoneNumber,event.password);
        emit(LoginSuccess(response.message));
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });
  }
}
