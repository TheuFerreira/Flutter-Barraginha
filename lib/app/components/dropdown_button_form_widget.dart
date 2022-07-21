import 'package:flutter/material.dart';

class DropdownButtonFormWidget<T> extends StatelessWidget {
  final T? value;
  final List<DropdownMenuItem<T>>? items;
  final Function(T?)? onChanged;
  final String? labelText;
  final Color fillColor;
  final Color textColor;
  const DropdownButtonFormWidget({
    Key? key,
    @required this.value,
    @required this.items,
    @required this.onChanged,
    this.labelText,
    this.fillColor = const Color(0xFFF1F1F1),
    this.textColor = const Color(0xFF666666),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      isExpanded: true,
      onChanged: onChanged,
      value: value,
      items: items,
      style: TextStyle(
        color: textColor,
        fontSize: 16.0,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        fillColor: fillColor,
        filled: true,
        labelText: labelText,
        labelStyle: TextStyle(color: textColor),
        border: _normalBorder(),
        enabledBorder: _normalBorder(),
      ),
    );
  }

  _normalBorder() => OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: const BorderSide(
          color: Color(0xFFF1F1F1),
        ),
      );
}
