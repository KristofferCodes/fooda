import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fooda/widgets/longButton.dart';

import '../../../constants/assets_constants.dart';
import '../../../widgets/cartTile.dart';
import '../../products/models/post_data_ui_model.dart';
import '../bloc/cart_bloc.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: SvgPicture.asset(AssetsConstants.back)),
                      SvgPicture.asset(AssetsConstants.cartText),
                      const SizedBox(height: 1),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SvgPicture.asset(AssetsConstants.swipe),
                  BlocConsumer<CartBloc, CartState>(
                    bloc: cartBloc,
                    listenWhen: (previous, current) =>
                        current is CartActionState,
                    buildWhen: (previous, current) =>
                        current is! CartActionState,
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      switch (state.runtimeType) {
                        case CartSuccessState:
                          final successState = state as CartSuccessState;
                          return ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: successState.cartItems.length,
                              itemBuilder: (_, index) {
                                return CartTile(
                                  cartBloc: cartBloc,
                                  dataModel: successState.cartItems[index],
                                );
                              });

                        default:
                      }
                      return Container();
                    },
                  ),
                ],
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: long_Button(
                      text: 'Checkout',
                      onTap: () {},
                      btnColor: const Color(0xffFA4A0C),
                      textColor: Colors.white),
                ))
          ],
        ),
      ),
    );
  }

  void doNothing(BuildContext context) {}
}
