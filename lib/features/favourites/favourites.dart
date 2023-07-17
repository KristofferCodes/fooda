import 'package:flutter/material.dart';

class Favourites extends StatelessWidget {
  const Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(child: Text('Favourites Page!'))),
    );
  }
}
