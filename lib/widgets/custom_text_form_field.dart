import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  //final TextEditingController controller;
  final String labelText;
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final TextStyle? hintStyle;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final Function(String?)? onSaved;
  final InputDecoration? decoration;

  const CustomTextFormField(
      {super.key,
      //this.controller,
      required this.labelText,
      required this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      this.obscureText = false,
      this.keyboardType = TextInputType.text,
      this.textInputAction = TextInputAction.done,
      this.validator,
      this.onFieldSubmitted,
      this.decoration,
      this.hintStyle,
      this.onSaved});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        hintStyle: hintStyle,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
      
    );
  }
}
