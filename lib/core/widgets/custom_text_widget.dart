import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final int? maxLines;
  FontWeight fontWeight;

  CustomTextWidget({
    Key? key,
    required this.text,
    required this.fontSize,
     this.color=Colors.black,
    this.fontWeight=FontWeight.normal, this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight,
        ),
      maxLines: maxLines,
    );
  }
}