import 'package:flutter/material.dart';
import 'package:graduation_project/core/services/colors.dart';


class CustomTextTitleAuth extends StatelessWidget {
  final String text;
  const CustomTextTitleAuth({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark=Theme.of(context).brightness==Brightness.dark;
    dynamic fontcolor=isDark?grayColor:mainColor;
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(color: fontcolor , fontSize: 40 , fontWeight: FontWeight.bold),
    );
  }
}
