part of 'products_bloc.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsActionState extends ProductsState {}

class ProductLoadingState extends ProductsState {}

class ProductsSuccessState extends ProductsState {
  final List<DataModel> products;
  ProductsSuccessState({required this.products});
}

class Products2SuccessState extends ProductsState {
  final List<DataModel> products;
  Products2SuccessState({required this.products});
}

class Products3SuccessState extends ProductsState {
  final List<DataModel> products;
  Products3SuccessState({required this.products});
}
