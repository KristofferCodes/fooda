// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'about_bloc.dart';

@immutable
abstract class AboutEvent {}

class AboutButtonClicked extends AboutEvent {}

class CartButtonClickedEvent extends AboutEvent {
  final DataModel clickedProduct;
  CartButtonClickedEvent({
    required this.clickedProduct,
  });
}

class LikedButtonClicked extends AboutEvent {
  final DataModel clickedProduct;
  LikedButtonClicked({
    required this.clickedProduct,
  });
}
