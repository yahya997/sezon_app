import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.textEditingController,
    this.label,
    this.keyboardType,
    this.hint='',
    this.borderRadius= 6,
    this.suffixIcon,
    this.prefixIcon,
     this.validator,
     this.onChanged,
     this.onSaved,
      this.onFieldSubmitted, this.fillColor,
  });

  final TextEditingController textEditingController;
  final String? label;
  final String? hint;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double borderRadius;
  final Color? fillColor;
  final String? Function(String? v)? validator;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final void Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: textEditingController,
      cursorColor: Colors.redAccent,
      keyboardType: keyboardType,
      onChanged: onChanged,
      onSaved:onSaved,
      onFieldSubmitted: onFieldSubmitted,
      decoration:  InputDecoration(
        filled: fillColor != null,
        fillColor: fillColor,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:suffixIcon,
        prefixIcon:prefixIcon ,
        floatingLabelStyle: const TextStyle(color: Colors.redAccent),
        labelText: label,
        // label: Text(,style: const TextStyle(color: Colors.grey),),
        hintText:hint,
        hintStyle: const TextStyle(color: Colors.grey),
        contentPadding: const EdgeInsets.symmetric(vertical: 4,horizontal: 8),
        border:  OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
        focusedBorder:  OutlineInputBorder(
          borderSide: BorderSide(color:hint == null ? Colors.redAccent :Colors.grey.shade200, width: 1.5),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
        enabledBorder:  OutlineInputBorder(
          borderSide:BorderSide(color: Colors.grey.shade200, width: 1.5),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
      ),
    );
  }
}
