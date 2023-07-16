import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fooda/data/cartItems.dart';
import 'package:meta/meta.dart';

import '../../products/models/post_data_ui_model.dart';

part 'about_event.dart';
part 'about_state.dart';

class AboutBloc extends Bloc<AboutEvent, AboutState> {
  AboutBloc() : super(AboutInitial()) {
    on<AboutButtonClicked>(aboutButtonClicked);
    on<CartButtonClickedEvent>(cartButtonClickedEvent);
  }

  FutureOr<void> aboutButtonClicked(
      AboutButtonClicked event, Emitter<AboutState> emit) {
    print('onto cart!');
  }

  FutureOr<void> cartButtonClickedEvent(
      CartButtonClickedEvent event, Emitter<AboutState> emit) {
    print('off to the cart!');

    cartItems.add(event.clickedProduct);
    emit(NavigateToCartState());
  }
}
