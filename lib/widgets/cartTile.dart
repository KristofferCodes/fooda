import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fooda/features/products/models/post_data_ui_model.dart';

import '../features/cart/bloc/cart_bloc.dart';

class CartTile extends StatefulWidget {
  final DataModel dataModel;
  final CartBloc cartBloc;
  const CartTile({super.key, required this.dataModel, required this.cartBloc});

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  @override
  Widget build(BuildContext context) {
    final CartBloc cartBloc = CartBloc();
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const DrawerMotion(),
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(100),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                        alignment: Alignment.center,
                        width: double.infinity, // space for actionPan
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.favorite_outline,
                          color: Colors.white,
                        )),
                  ),
                ),
              ),
            ),
            Expanded(
              child: BlocConsumer<CartBloc, CartState>(
                bloc: cartBloc,
                listenWhen: (previous, current) => current is CartActionState,
                buildWhen: (previous, current) => current is! CartActionState,
                listener: (context, state) {
                  // if (state is NavigateToCartState) {
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //       const SnackBar(content: Text('Item Carted')));
                  // }
                },
                builder: (context, state) {
                  return InkWell(
                    onTap: () {
                      cartBloc.add(RemoveFromCartEvent(
                          clickedProduct: widget.dataModel));
                    },
                    borderRadius: BorderRadius.circular(100),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                          alignment: Alignment.center,
                          width: double.infinity, // space for actionPan
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.delete_outline,
                            color: Colors.white,
                          )),
                    ),
                  );
                },
              ),
            )
          ],
        ),
        child: Container(
          height: 120,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                spreadRadius: 5,
                offset: const Offset(6, 8), // Shadow position
              ),
            ],
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              widget.dataModel.images!.first.toString()),
                          fit: BoxFit.cover),
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 20,
                          spreadRadius: 5,
                          offset: const Offset(6, 8), // Shadow position
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            widget.dataModel.description
                                .toString()
                                .substring(0, 12),
                            style: const TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '\$${widget.dataModel.price}',
                            style: const TextStyle(
                                fontSize: 17,
                                color: Color(0xffFA4A0C),
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 30,
                          width: 65,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.red,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 20,
                                spreadRadius: 5,
                                offset: const Offset(6, 8), // Shadow position
                              ),
                            ],
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  '-',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  '1',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  '+',
                                  style: TextStyle(color: Colors.white),
                                )
                              ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
