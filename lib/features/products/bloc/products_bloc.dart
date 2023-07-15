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
  }

  FutureOr<void> productsInitialFetchEvent(
      ProductsInitialFetchEvent event, Emitter<ProductsState> emit) async {
    var client = http.Client();
    List<DataModel> products = [];
    try {
      var response = await client.get(Uri.parse(
          'https://api.escuelajs.co/api/v1/categories/1/products?limit=4&offset=1'));
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
}
