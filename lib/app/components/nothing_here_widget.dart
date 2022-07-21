import 'package:flutter/material.dart';

class NothingHereWidget extends StatelessWidget {
  const NothingHereWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Icon(
            Icons.extension_off_rounded,
            color: Color(0xffaaaaaa),
            size: 60,
          ),
          Text(
            'Não há nada aqui ainda...',
            style: TextStyle(
              color: Color(0xffaaaaaa),
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
