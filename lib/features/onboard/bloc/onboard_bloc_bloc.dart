import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'onboard_bloc_event.dart';
part 'onboard_bloc_state.dart';

class OnboardBlocBloc extends Bloc<OnboardBlocEvent, OnboardBlocState> {
  OnboardBlocBloc() : super(OnboardBlocInitial()) {
    on<HomeButtonClickedEvent>(homeButtonClickedEvent);
  }

  FutureOr<void> homeButtonClickedEvent(
      HomeButtonClickedEvent event, Emitter<OnboardBlocState> emit) {
    print('Home page!');
    emit(NavigateToHomeState());
  }
}
