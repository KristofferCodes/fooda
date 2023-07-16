import 'package:flutter/material.dart';

class long_Button extends StatelessWidget {
  const long_Button(
      {Key? key,
      required this.text,
      required this.onTap,
      required this.btnColor,
      required this.textColor})
      : super(key: key);

  final String text;
  final Function() onTap;
  final Color btnColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: btnColor, borderRadius: BorderRadius.circular(30.0)),
        height: MediaQuery.of(context).size.height * 0.08,
        width: MediaQuery.of(context).size.width * .8,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: textColor, fontSize: 15, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
