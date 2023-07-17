import 'package:flutter/material.dart';

import '../features/cart/ui/cart.dart';
import '../features/favourites/favourites.dart';
import '../features/home/home.dart';
import '../features/profile/profile.dart';
import '../features/purchases/purchases.dart';

class UIConstants {
  static List<Widget> bottomTabBarPages = const [
    Home(),
    Favourites(),
    Profile(),
    Purchases()
  ];
}
