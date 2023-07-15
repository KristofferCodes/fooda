import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fooda/constants/assets_constants.dart';
import 'package:fooda/widgets/longButton.dart';

import '../home/home.dart';
import '../home/nav.dart';
import 'bloc/onboard_bloc_bloc.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final OnboardBlocBloc onboardBlocBloc = OnboardBlocBloc();
    return Scaffold(
      backgroundColor: const Color(0xffFF4B3A),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Image.asset(
                    AssetsConstants.logo,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SvgPicture.asset(AssetsConstants.text1),
              ],
            ),
            Column(
              children: [
                ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                            begin: Alignment.center,
                            end: Alignment.bottomCenter,
                            colors: [Colors.white, Colors.transparent])
                        .createShader(bounds);
                  },
                  child: SizedBox(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * .5,
                    child: Stack(
                      children: [
                        Positioned(
                            child: Align(
                                alignment: Alignment.bottomRight,
                                child: Image.asset(AssetsConstants.guyDummy))),
                        Positioned(
                            child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Image.asset(AssetsConstants.ladyDummy))),
                      ],
                    ),
                  ),
                ),
                BlocConsumer<OnboardBlocBloc, OnboardBlocState>(
                  bloc: onboardBlocBloc,
                  listenWhen: (previous, current) =>
                      current is OnboardActionState,
                  buildWhen: (previous, current) =>
                      current is! OnboardActionState,
                  listener: (context, state) {
                    if (state is NavigateToHomeState) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeView()));
                    }
                  },
                  builder: (context, state) {
                    return long_Button(
                      text: 'Get Started',
                      onTap: () {
                        onboardBlocBloc.add(HomeButtonClickedEvent());
                      },
                      btnColor: Colors.white,
                      textColor: const Color(0xffFF460A),
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
