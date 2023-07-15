import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fooda/constants/assets_constants.dart';
import 'package:fooda/widgets/longButton.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                long_Button(
                  text: 'Get Started',
                  onTap: () {},
                  btnColor: Colors.white,
                  textColor: const Color(0xffFF460A),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
