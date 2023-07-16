import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'about_event.dart';
part 'about_state.dart';

class AboutBloc extends Bloc<AboutEvent, AboutState> {
  AboutBloc() : super(AboutInitial()) {
    on<AboutButtonClicked>(aboutButtonClicked);
  }

  FutureOr<void> aboutButtonClicked(
      AboutButtonClicked event, Emitter<AboutState> emit) {
    print('onto cart!');
    emit(NavigateToCartState());
  }
}
