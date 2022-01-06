import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final Function(String)? onChanged;
  const SearchWidget({
    Key? key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.white,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: 'Pesquisar',
        hintStyle: const TextStyle(
          color: Color.fromARGB(170, 255, 255, 255),
        ),
        contentPadding: const EdgeInsets.only(left: 16.0),
        fillColor: const Color.fromARGB(50, 255, 255, 255),
        filled: true,
        suffixIcon: const Icon(
          Icons.search,
          color: Colors.white,
        ),
        border: _defaultBorder(),
        enabledBorder: _defaultBorder(),
        focusedBorder: _defaultBorder(),
      ),
      onChanged: onChanged,
    );
  }

  _defaultBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.transparent,
      ),
      borderRadius: BorderRadius.circular(24),
    );
  }
}
