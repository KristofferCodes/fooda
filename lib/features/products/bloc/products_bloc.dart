import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../models/post_data_ui_model.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsInitial()) {
    on<ProductsInitialFetchEvent>(productsInitialFetchEvent);
    on<ProductsSecondFetchEvent>(productsSecondFetchEvent);
    on<ProductsLastFetchEvent>(productsLastFetchEvent);
  }

  FutureOr<void> productsInitialFetchEvent(
      ProductsInitialFetchEvent event, Emitter<ProductsState> emit) async {
    var client = http.Client();
    List<DataModel> products = [];
    try {
      var response = await client.get(Uri.parse(
          'https://api.escuelajs.co/api/v1/categories/1/products?limit=10&offset=1'));
      List result = jsonDecode(response.body);
      for (int i = 0; i < result.length; i++) {
        DataModel product =
            DataModel.fromMap(result[i] as Map<String, dynamic>);
        products.add(product);
      }

      emit(ProductsSuccessState(products: products));
      print(products);
    } catch (e, st) {
      print(st);
    }
  }

  FutureOr<void> productsSecondFetchEvent(
      ProductsSecondFetchEvent event, Emitter<ProductsState> emit) async {
    var client = http.Client();
    List<DataModel> products = [];
    try {
      var response = await client.get(Uri.parse(
          'https://api.escuelajs.co/api/v1/categories/2/products?limit=10&offset=1'));
      List result = jsonDecode(response.body);
      for (int i = 0; i < result.length; i++) {
        DataModel product =
            DataModel.fromMap(result[i] as Map<String, dynamic>);
        products.add(product);
      }

      emit(Products2SuccessState(products: products));
      print(products);
    } catch (e, st) {
      print(st);
    }
  }

  FutureOr<void> productsLastFetchEvent(
      ProductsLastFetchEvent event, Emitter<ProductsState> emit) async {
    var client = http.Client();
    List<DataModel> products = [];
    try {
      var response = await client.get(Uri.parse(
          'https://api.escuelajs.co/api/v1/categories/3/products?limit=10&offset=1'));
      List result = jsonDecode(response.body);
      for (int i = 0; i < result.length; i++) {
        DataModel product =
            DataModel.fromMap(result[i] as Map<String, dynamic>);
        products.add(product);
      }

      emit(Products3SuccessState(products: products));
      print(products);
    } catch (e, st) {
      print(st);
    }
  }
}
