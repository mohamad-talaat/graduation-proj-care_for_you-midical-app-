import 'package:flutter/material.dart';
import 'package:graduation_project/core/services/colors.dart';


class CustomTextBodyAuth extends StatelessWidget {
  final String text;
  const CustomTextBodyAuth({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark=Theme.of(context).brightness==Brightness.dark;
  dynamic fontcolor=isDark?grayColor:mainColor;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(color: fontcolor ,fontSize: 20 ),
      ),
    );
  }
}
