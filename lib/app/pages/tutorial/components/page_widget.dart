import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/pages/tutorial/components/bottom_container_widget.dart';
import 'package:flutter_barraginha/app/pages/tutorial/components/top_container_widget.dart';

class PageWidget extends StatelessWidget {
  final String title;
  final String image;
  final String description;
  const PageWidget({
    Key? key,
    required this.title,
    required this.image,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: TopContainerWidget(
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0xff666666),
                fontSize: 40,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              image,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      const BottomContainerWidget(),
                      Positioned(
                        top: 35,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: BottomContainerWidget(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10, left: 10),
                            child: Text(
                              description,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                letterSpacing: 0.1,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
