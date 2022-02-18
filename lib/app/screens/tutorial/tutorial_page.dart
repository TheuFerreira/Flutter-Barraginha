import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/screens/tutorial/components/bottom_container_widget.dart';
import 'package:flutter_barraginha/app/screens/tutorial/components/top_container_widget.dart';

class TutorialPage extends StatefulWidget {
  final String title;
  final String image;
  final String descr;

  const TutorialPage({
    Key? key,
    required this.title,
    required this.image,
    required this.descr,
  }) : super(key: key);

  @override
  _TutorialPageState createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffF1F1F1),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: TopContainerWidget(
              child: Text(
                widget.title,
                style: const TextStyle(
                  color: Color(0xff666666),
                  fontSize: 40,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  child: Image.asset(
                    widget.image,
                    width: size.width / 1.3,
                    height: size.height / 2.5,
                  ),
                  borderRadius: BorderRadius.circular(30),
                )
              ],
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
                            backgroundColor: Theme.of(context).colorScheme.primary,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10, left: 10),
                              child: Text(
                                widget.descr,
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
      ),
    );
  }
}
