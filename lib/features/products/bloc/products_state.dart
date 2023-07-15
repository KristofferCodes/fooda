part of 'products_bloc.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsActionState extends ProductsState {}

class ProductsSuccessState extends ProductsState {
  final List<DataModel> products;
  ProductsSuccessState({required this.products});
}
