import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final TextInputType? textInputType;
  const TextFieldWidget({
    Key? key,
    this.controller,
    this.labelText,
    this.hintText,
    this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(
        color: Color(0xFF666666),
      ),
      keyboardType: textInputType,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        floatingLabelStyle: const TextStyle(color: Color(0xFF439889)),
        contentPadding: const EdgeInsets.only(left: 16.0),
        border: _border(const Color(0xFF439889)),
        enabledBorder: _border(const Color(0xFF439889)),
        focusedBorder: _border(const Color(0xFF00695C)),
      ),
    );
  }

  InputBorder _border(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(
        color: Color(0xFF00695C),
      ),
    );
  }
}
