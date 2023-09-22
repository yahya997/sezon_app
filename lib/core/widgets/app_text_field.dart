import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    required this.hinttext,
    required this.labeltext,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.obscuresText = false,
    required this.controller,
    this.suffixIcon,
  }) : super(key: key);
  final String hinttext;
  final String labeltext;
  final IconData? prefixIcon;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final bool obscuresText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.black),
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscuresText,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        floatingLabelStyle: const TextStyle(color: Colors.redAccent),
        hintText: hinttext,
        labelText: labeltext,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: suffixIcon,
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(color: Colors.redAccent),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder({Color color = Colors.grey}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(6.r),
      borderSide: BorderSide(color: color),
    );
  }
}
