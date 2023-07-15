part of 'onboard_bloc_bloc.dart';

@immutable
abstract class OnboardBlocState {}

abstract class OnboardActionState extends OnboardBlocState {}

class OnboardBlocInitial extends OnboardBlocState {}

class NavigateToHomeState extends OnboardActionState {}
