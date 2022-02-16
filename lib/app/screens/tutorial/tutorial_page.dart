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
      body: Column
      (
        children: 
        [
          Expanded
          (
            flex: 1,
            child: Container
            (
              color: Colors.amber,
            )
          ),

          Expanded
          (
            flex: 3,
            child: MainContainer()
          ),

          Expanded
          (
            
            child: Stack
            (
              fit: StackFit.loose,
              children: 
              [
                Container(color: Colors.blue,),

                Positioned
                (
                  left: 0,
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: RotatedBox
                (
                  quarterTurns: 2,
                  child: ClipPath
                  (
                    clipper: BottomContainer(),
                    child: Container
                    (
                      color: Colors.black,
                    ),
                  ),
                ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}