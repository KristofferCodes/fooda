import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fooda/widgets/longButton.dart';

import '../../../constants/assets_constants.dart';
import '../../cart/ui/cart.dart';
import '../../products/models/post_data_ui_model.dart';
import '../bloc/about_bloc.dart';

class About extends StatefulWidget {
  final DataModel? dataModel;
  const About({super.key, this.dataModel});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  int _current = 0;
  final AboutBloc aboutBloc = AboutBloc();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: SvgPicture.asset(AssetsConstants.back)),
                SvgPicture.asset(AssetsConstants.heart),
              ],
            ),
          ),
          CarouselSlider(
            items: widget.dataModel!.images!.map((image) {
              return Stack(
                children: [
                  Center(
                    child: Container(
                      height: 280,
                      width: 250,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 20,
                            spreadRadius: 15,
                            offset: const Offset(6, 8), // Shadow position
                          ),
                        ],
                      ),
                      // child: Padding(
                      //   padding: EdgeInsets.only(bottom: 50.0),
                      //   child:
                      // ),
                    ),
                  ),
                  Positioned(
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 240,
                        width: 230,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(image.toString()),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
            options: CarouselOptions(
                height: 300,
                enableInfiniteScroll: false,
                onPageChanged: ((index, reason) {
                  setState(() {
                    _current = index;
                  });
                })),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.dataModel!.images!.asMap().entries.map((e) {
              return Container(
                width: 16,
                height: 4,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffFA4A0C)
                        .withOpacity(_current == e.key ? 0.9 : 0.3)),
              );
            }).toList(),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.dataModel!.title.toString(),
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            '\$${widget.dataModel!.price.toString()}',
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xffFA4A0C)),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30),
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Description',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(widget.dataModel!.description.toString())
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30),
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Return Policy',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                          'All our products are double checked before leaving our stores so by any case you found a broken food please contact our hotline immediately.')
                    ],
                  ),
                ),
              ),
              BlocConsumer<AboutBloc, AboutState>(
                bloc: aboutBloc,
                listenWhen: (previous, current) => current is AboutActionState,
                buildWhen: (previous, current) => current is! AboutActionState,
                listener: (context, state) {
                  if (state is NavigateToCartState) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Cart()));
                  }
                },
                builder: (context, state) {
                  return long_Button(
                      text: 'Add to cart',
                      onTap: () {
                        aboutBloc.add(AboutButtonClicked());
                      },
                      btnColor: const Color(0xffFA4A0C),
                      textColor: Colors.white);
                },
              )
            ],
          )),
        ]),
      ),
    );
  }
}
