import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fooda/widgets/productCard.dart';

import '../../constants/assets_constants.dart';
import '../products/bloc/products_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  final ProductsBloc productsBloc = ProductsBloc();
  final ProductsBloc product2Bloc = ProductsBloc();
  final ProductsBloc product3Bloc = ProductsBloc();
  @override
  void initState() {
    productsBloc.add(ProductsInitialFetchEvent());
    product2Bloc.add(ProductsSecondFetchEvent());
    product3Bloc.add(ProductsLastFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.sizeOf(context).height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(AssetsConstants.ham),
                      SvgPicture.asset(AssetsConstants.cart),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50.0),
                  child: SvgPicture.asset(AssetsConstants.text2),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50.0, right: 60.0),
                  child: Container(
                    height: 50,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.grey.withOpacity(0.02),
                    ),
                    child: CupertinoSearchTextField(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                      controller: _tabController,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: const Color(0xffFA4A0C),
                      labelColor: const Color(0xffFA4A0C),
                      unselectedLabelColor: Colors.grey,
                      labelPadding:
                          const EdgeInsets.symmetric(horizontal: 10.0),
                      tabs: const [
                        Tab(text: 'Clothes'),
                        Tab(
                          text: 'Electronics',
                        ),
                        Tab(
                          text: 'Furniture',
                        )
                      ]),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 40,
                    top: 30,
                  ),
                  width: double.maxFinite,
                  height: 300,
                  child: TabBarView(controller: _tabController, children: [
                    BlocConsumer<ProductsBloc, ProductsState>(
                      bloc: productsBloc,
                      listenWhen: (previous, current) =>
                          current is ProductsActionState,
                      buildWhen: (previous, current) =>
                          current is! ProductsActionState,
                      listener: (context, state) {
                        // TODO: implement listener
                      },
                      builder: (context, state) {
                        switch (state.runtimeType) {
                          case ProductsSuccessState:
                            final successState = state as ProductsSuccessState;
                            return ListView.builder(
                                itemCount: successState.products.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return ProductCard(
                                      imageName: successState
                                          .products[index].images!.first,
                                      title: successState
                                          .products[index].description
                                          .toString(),
                                      price: successState.products[index].price
                                          .toString());
                                });
                          default:
                            return const SizedBox();
                        }
                      },
                    ),
                    BlocConsumer<ProductsBloc, ProductsState>(
                      bloc: product2Bloc,
                      listenWhen: (previous, current) =>
                          current is ProductsActionState,
                      buildWhen: (previous, current) =>
                          current is! ProductsActionState,
                      listener: (context, state) {
                        // TODO: implement listener
                      },
                      builder: (context, state) {
                        switch (state.runtimeType) {
                          case Products2SuccessState:
                            final successState = state as Products2SuccessState;
                            return ListView.builder(
                                itemCount: successState.products.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (_, index) {
                                  return ProductCard(
                                      imageName: successState
                                          .products[index].images!.first,
                                      title: successState
                                          .products[index].description
                                          .toString(),
                                      price: successState.products[index].price
                                          .toString());
                                });
                          default:
                            return const SizedBox();
                        }
                      },
                    ),
                    BlocConsumer<ProductsBloc, ProductsState>(
                      bloc: product3Bloc,
                      listenWhen: (previous, current) =>
                          current is ProductsActionState,
                      buildWhen: (previous, current) =>
                          current is! ProductsActionState,
                      listener: (context, state) {
                        // TODO: implement listener
                      },
                      builder: (context, state) {
                        switch (state.runtimeType) {
                          case Products3SuccessState:
                            final successState = state as Products3SuccessState;
                            return ListView.builder(
                                itemCount: successState.products.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (_, index) {
                                  return ProductCard(
                                      imageName: successState
                                          .products[index].images!.first,
                                      title: successState
                                          .products[index].description
                                          .toString(),
                                      price: successState.products[index].price
                                          .toString());
                                });
                          default:
                            return const SizedBox();
                        }
                      },
                    ),
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
