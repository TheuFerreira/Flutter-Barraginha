import 'package:flutter/material.dart';

class InfoPartnerWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const InfoPartnerWidget({
    required this.imagePath,
    Key? key,
    this.title = 'Title',
    this.description = 'Description',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double containerWidth = MediaQuery.of(context).size.width - 30;
    double imageWidth = MediaQuery.of(context).size.width / 2.7;
    double textWidth = MediaQuery.of(context).size.width - imageWidth - 40;
    return Container(
      width: containerWidth,
      padding: const EdgeInsets.symmetric(vertical: 28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            spreadRadius: 0,
            blurRadius: 1,
            blurStyle: BlurStyle.normal,
            offset: Offset.fromDirection(90),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            width: imageWidth,
            height: MediaQuery.of(context).size.width / 2.7,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: textWidth,
                  child: Text(
                    description,
                    style: const TextStyle(
                      color: Colors.black38,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
