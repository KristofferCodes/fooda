part of 'products_bloc.dart';

@immutable
abstract class ProductsEvent {}

class ProductsInitialFetchEvent extends ProductsEvent {}

class ProductsSecondFetchEvent extends ProductsEvent {}

class ProductsLastFetchEvent extends ProductsEvent {}
