import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/assets_constants.dart';
import '../../constants/ui_constants.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _page = 0;

  void onPageChange(int index) {
    setState(() {
      _page = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _page, children: UIConstants.bottomTabBarPages),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: CupertinoTabBar(
            currentIndex: _page,
            onTap: onPageChange,
            border: Border.all(style: BorderStyle.none),
            backgroundColor: Colors.transparent,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  _page == 0 ? Icons.home : Icons.home,
                  color: _page == 0 ? const Color(0xffFA4A0C) : Colors.grey,
                ),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  _page == 2 ? AssetsConstants.like : AssetsConstants.like,
                  color: _page == 1 ? const Color(0xffFA4A0C) : Colors.grey,
                ),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  _page == 2
                      ? AssetsConstants.profile
                      : AssetsConstants.profile,
                  color: _page == 2 ? const Color(0xffFA4A0C) : Colors.grey,
                ),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  _page == 3
                      ? AssetsConstants.dimTime
                      : AssetsConstants.dimTime,
                  color: _page == 3 ? const Color(0xffFA4A0C) : Colors.grey,
                ),
              ),
            ]),
      ),
    );
  }
}
