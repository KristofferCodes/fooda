import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fooda/data/cartItems.dart';
import 'package:fooda/data/likedItems.dart';
import 'package:meta/meta.dart';

import '../../products/models/post_data_ui_model.dart';

part 'about_event.dart';
part 'about_state.dart';

class AboutBloc extends Bloc<AboutEvent, AboutState> {
  AboutBloc() : super(AboutInitial()) {
    on<AboutButtonClicked>(aboutButtonClicked);
    on<CartButtonClickedEvent>(cartButtonClickedEvent);
    // on<LikedButtonClicked>(likedButtonClicked);
  }

  FutureOr<void> aboutButtonClicked(
      AboutButtonClicked event, Emitter<AboutState> emit) {}

  FutureOr<void> cartButtonClickedEvent(
      CartButtonClickedEvent event, Emitter<AboutState> emit) {
    cartItems.add(event.clickedProduct);
    emit(NavigateToCartState());
  }

  // FutureOr<void> likedButtonClicked(
  //     LikedButtonClicked event, Emitter<AboutState> emit) {
  //   likedItems.add(event.clickedProduct);
  // }
}
