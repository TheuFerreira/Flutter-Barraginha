import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/screens/tutorial/components/bottom_container.dart';
import 'package:flutter_barraginha/app/screens/tutorial/components/curved_container.dart';

class TutorialPage extends StatefulWidget {
  const TutorialPage({Key? key}) : super(key: key);

  @override
  _TutorialPageState createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF1F1F1),
      body: Column(
        children: [
          Expanded(
            child: ClipPath(
              clipper: CurvedContainer(),
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: Center(
                  child: Text('Título'),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Text('ola'),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        RotatedBox(
                          quarterTurns: 2,
                          child: ClipPath(
                            clipper: BottomContainer(),
                            child: Container(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 35,
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Stack(
                            children: [
                              RotatedBox(
                                quarterTurns: 2,
                                child: ClipPath(
                                  clipper: BottomContainer(),
                                  child: Container(
                                    width: double.infinity,
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Theme.of(context).colorScheme.primary,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Descição'),
                            Text('Bolinhas'),
                          ],
                        ),
                      ),
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
