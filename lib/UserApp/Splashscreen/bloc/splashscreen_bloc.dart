import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'splashscreen_event.dart';
part 'splashscreen_state.dart';

class SplashscreenBloc extends Bloc<SplashscreenEvent, SplashscreenState> {
  SplashscreenBloc() : super(SplashscreenInitial()) {
    on<SplashScreenRountingEvent>(splashScreenRountingEvent);
  }

  FutureOr<void> splashScreenRountingEvent(
      SplashScreenRountingEvent event, Emitter<SplashscreenState> emit) async {
    await Future.delayed(Duration(seconds: 4));
    emit(SplashScreenRoutingState());
  }
}
