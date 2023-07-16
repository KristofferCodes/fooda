part of 'about_bloc.dart';

@immutable
abstract class AboutState {}

class AboutInitial extends AboutState {}

abstract class AboutActionState extends AboutState {}

class NavigateToCartState extends AboutActionState {}
