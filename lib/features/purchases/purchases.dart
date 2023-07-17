import 'package:flutter/material.dart';

class Purchases extends StatelessWidget {
  const Purchases({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(child: Text('Purchases Page!'))),
    );
  }
}
