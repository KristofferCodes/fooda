import 'package:flutter/material.dart';

import '../features/about/ui/about.dart';
import '../features/products/models/post_data_ui_model.dart';

class ProductCard extends StatelessWidget {
  final String imageName, title, price;
  final DataModel? dataModel;
  const ProductCard(
      {super.key,
      required this.imageName,
      required this.title,
      required this.price,
      required this.dataModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => About(
                      dataModel: dataModel,
                    )));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 0, top: 50, left: 10),
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
                    offset: const Offset(6, 8), // Shadow position
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.only(bottom: 50.0),
                child:
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Text(
                    title.toString().substring(0, 12),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    softWrap: true,
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '\$$price',
                    style: const TextStyle(
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
                    image: DecorationImage(
                        image: NetworkImage(imageName.toString()),
                        fit: BoxFit.cover)),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
