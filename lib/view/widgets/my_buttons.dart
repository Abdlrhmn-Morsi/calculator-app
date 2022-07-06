import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyButtons extends StatelessWidget {
  dynamic text;
  dynamic onTap;
  Color bgColor;
  Color textColor;
  double fontSize;
  double myPadding;
  MyButtons({
    Key? key,
    required this.myPadding,
    required this.fontSize,
    required this.text,
    required this.onTap,
    required this.bgColor,
    required this.textColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: bgColor,
              boxShadow: [
                BoxShadow(
                  blurRadius: 15,
                  color: Colors.red.shade900,
                  offset: const Offset(5, 5),
                  spreadRadius: 1,
                ),
                BoxShadow(
                  blurRadius: 8,
                  color: Colors.red.shade500,
                  offset: const Offset(-5, -5),
                  spreadRadius: 1,
                )
              ],
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops:const [0.1, 0.3, 0.6, 0.8],
                colors: [
                  Colors.red.shade500,
                  Colors.red.shade600,
                  Colors.red.shade700,
                  Colors.red.shade800,
                 
                ],
              )),
          child: Padding(
            padding: EdgeInsets.only(bottom: myPadding),
            child: Text(
              text,
              style: TextStyle(fontSize: fontSize, color: textColor),
            ),
          ),
        ),
      ),
    );
  }
}
