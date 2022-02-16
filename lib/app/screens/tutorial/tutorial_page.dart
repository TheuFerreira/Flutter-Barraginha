// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/screens/tutorial/components/bottom_container.dart';
import 'package:flutter_barraginha/app/screens/tutorial/components/curved_container.dart';
import 'package:flutter_barraginha/app/screens/tutorial/components/main_container.dart';

class TutorialPage extends StatefulWidget {
  const TutorialPage({ Key? key }) : super(key: key);

  @override
  _TutorialPageState createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      backgroundColor: Colors.white,
      body: Stack
      (
        children: 
        [
          Positioned
          (
            top: 0,
            child: Container
            (
              height: 100,
              color: Colors.black,
            ),
          ),

         /* Positioned
          (
            bottom: 200,
            child: MainContainer()
          ),
          
          Positioned
          (
            bottom: 0,
            child: RotatedBox
            (
              quarterTurns: 2,
              child: ClipPath
              (
                clipper: BottomContainer(),
                child: Container
                (
                  width: double.infinity,
                  height: 100,
                  color: Color(0xff439889),
                ),
              ),
            ),
          )
          */
          
          
        ],
      ),
    );
  }
}