import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final String? labelText;
  final String? hintText;
  final Color fillColor;
  final Color textColor;
  final String? errorText;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  const TextFormWidget({
    Key? key,
    this.controller,
    this.suffixIcon,
    this.labelText,
    this.hintText,
    this.fillColor = const Color(0xFFF1F1F1),
    this.textColor = const Color(0xFF666666),
    this.errorText,
    this.keyboardType,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: textColor,
      style: TextStyle(color: textColor),
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        floatingLabelStyle: TextStyle(
          color: textColor,
        ),
        hintStyle: TextStyle(
          color: Color.fromARGB(
            170,
            textColor.red,
            textColor.green,
            textColor.blue,
          ),
        ),
        contentPadding: const EdgeInsets.only(left: 16.0),
        fillColor: fillColor,
        filled: true,
        suffixIcon: suffixIcon,
        border: _defaultBorder(),
        enabledBorder: _defaultBorder(),
        focusedBorder: _defaultBorder(),
      ),
      onChanged: onChanged,
      validator: (value) {
        if (validator != null) {
          return validator!(value);
        }

        return null;
      },
    );
  }

  _defaultBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xff666666)),
      borderRadius: BorderRadius.circular(24),
    );
  }
}
