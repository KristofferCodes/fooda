import 'package:flutter/material.dart';

import '../features/about/ui/about.dart';
import '../features/cart/ui/cart.dart';
import '../features/home/home.dart';

class UIConstants {
  static const List<Widget> bottomTabBarPages = [Home(), Cart(), About()];
}
