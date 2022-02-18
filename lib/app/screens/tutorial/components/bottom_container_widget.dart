import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/screens/tutorial/clippers/bottom_custom_clipper.dart';
import 'package:flutter_barraginha/app/screens/tutorial/clippers/top_custom_clipper.dart';

class BottomContainerWidget extends StatelessWidget {
  final Widget? child;
  final Color backgroundColor;
  const BottomContainerWidget({
    Key? key,
    this.child,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return /*Column(

      children: [
        RotatedBox(
          quarterTurns: 2,
          child: ClipPath(
            clipper: BottomCustomClipper(),
            child: Container(
              height: 85,

              decoration: BoxDecoration(
                  color: backgroundColor,
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: backgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(child: child),
              ],
            ),
          ),
        ),
      ],
    );*/

    Expanded(
      child: Container(
        color: Color(0xfff1f1f1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: RotatedBox(
                quarterTurns: 2,

                  child: ClipPath(
                    clipper: BottomCustomClipper(),
                    child: Container(
                      width: double.infinity,
                      height: 100,

                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          top: BorderSide(
                            color: Colors.white,
                            width: 0,
                            style: BorderStyle.solid,
                          )
                        )
                      ),


                    ),
                  ),
                ),
            ),
           /*Expanded(
             child: Container(
               color: Colors.black,
             ),
           )*/

            Container(
              color: Colors.white,
              child: RotatedBox(
                quarterTurns: 2,
                child: ClipPath(
                  clipper: BottomCustomClipper(),
                  child: Container(
                    width: double.infinity,
                    height: 120,

                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        border: Border(
                            top: BorderSide(
                              color: Colors.white,
                              width: 0,
                              style: BorderStyle.solid,
                            )
                        )
                    ),


                  ),
                ),
              ),
            ),




          ],
        ),
      ),
    );
  }
}
