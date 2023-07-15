import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/assets_constants.dart';
import '../products/bloc/products_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  final ProductsBloc productsBloc = ProductsBloc();
  @override
  void initState() {
    productsBloc.add(ProductsInitialFetchEvent());
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
                          text: 'Shoes',
                        ),
                        Tab(
                          text: 'Food',
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
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Stack(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                              right: 0, top: 50, left: 10),
                                          height: 220,
                                          width: 200,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(40),
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.1),
                                                blurRadius: 20,
                                                spreadRadius: 5,
                                                offset: const Offset(
                                                    6, 8), // Shadow position
                                              ),
                                            ],
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 50.0),
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    successState.products[index]
                                                        .description
                                                        .toString()
                                                        .substring(0, 20),
                                                    maxLines: 2,
                                                    softWrap: true,
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    'Rs.${successState.products[index].price.toString()}',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color:
                                                            Color(0xffFA4A0C)),
                                                  ),
                                                ]),
                                          ),
                                        ),
                                        Positioned(
                                          left: 35,
                                          top: 0,
                                          child: Container(
                                            height: 160,
                                            width: 150,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        successState
                                                            .products[index]
                                                            .category!
                                                            .image
                                                            .toString()),
                                                    fit: BoxFit.cover)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          default:
                            return SizedBox();
                        }
                      },
                    ),
                    ListView.builder(
                        itemCount: 3,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Stack(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      right: 0, top: 50, left: 10),
                                  height: 220,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 20,
                                        spreadRadius: 5,
                                        offset: const Offset(
                                            6, 8), // Shadow position
                                      ),
                                    ],
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.only(bottom: 50.0),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            'Veggie tomato mix',
                                            maxLines: 2,
                                            softWrap: true,
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.normal),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            'N1,900',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                                color: Color(0xffFA4A0C)),
                                          ),
                                        ]),
                                  ),
                                ),
                                Positioned(
                                  left: 35,
                                  top: 0,
                                  child: Container(
                                    height: 160,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: const DecorationImage(
                                            image: AssetImage(
                                                AssetsConstants.fruits),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                    ListView.builder(
                        itemCount: 3,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Stack(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      right: 0, top: 50, left: 10),
                                  height: 220,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 20,
                                        spreadRadius: 5,
                                        offset: const Offset(
                                            6, 8), // Shadow position
                                      ),
                                    ],
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.only(bottom: 50.0),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            'Veggie tomato mix',
                                            maxLines: 2,
                                            softWrap: true,
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.normal),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            'N1,900',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                                color: Color(0xffFA4A0C)),
                                          ),
                                        ]),
                                  ),
                                ),
                                Positioned(
                                  left: 35,
                                  top: 0,
                                  child: Container(
                                    height: 160,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: const DecorationImage(
                                            image: AssetImage(
                                                AssetsConstants.fruits),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
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
