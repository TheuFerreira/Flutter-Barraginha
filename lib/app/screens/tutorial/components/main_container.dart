import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/screens/tutorial/components/curved_container.dart';

class MainContainer extends StatefulWidget {
  const MainContainer({Key? key}) : super(key: key);

  @override
  _TutorialPageState createState() => _TutorialPageState();
}

class _TutorialPageState extends State<MainContainer> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CurvedContainer(),
      child: Container(
        padding: EdgeInsets.only(bottom: 0),
        child: Stack(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                height: 600, //MediaQuery.of(context).size.height/2,
                decoration: const BoxDecoration(
                  color: Color(0xffF1F1F1),
                ),
                child: Column(
                  children: [
                    ClipPath(
                      clipper: CurvedContainer(),
                      child: Container(
                        color: Colors.white,
                        width: double.infinity,
                        height: 85,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        'images/if.png',
                        width: 100, //MediaQuery.of(context).size.width-50,
                        height: 100, //MediaQuery.of(context).size.width-50,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
