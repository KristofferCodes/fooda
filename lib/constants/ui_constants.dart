import 'package:flutter/material.dart';

import '../features/about/ui/about.dart';
import '../features/cart/ui/cart.dart';
import '../features/home/home.dart';
import '../features/liked/likedPage.dart';

class UIConstants {
  static List<Widget> bottomTabBarPages = [
    const Home(),
    const LikePage(),
    Cart(),
  ];
}
