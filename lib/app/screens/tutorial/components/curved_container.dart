import 'package:flutter/cupertino.dart';

class CurvedContainer extends CustomClipper<Path>
{
   @override
  Path getClip(Size size) {

    Path path = Path();
    //inicio
    path.lineTo(0, size.height-80);

    var firstStart = Offset(size.width/3, size.height+15);
    var firstEnd = Offset(size.width / 1.7, size.height -50);
    path.quadraticBezierTo
    (
      firstStart.dx, 
      firstStart.dy, 
      firstEnd.dx, 
      firstEnd.dy

    );

    var secondStart = Offset
    (
      size.width - (size.width/5), 
      size.height - 95
    );
    var secondEnd = Offset(size.width, size.height-80);

    path.quadraticBezierTo
    (
      secondStart.dx, 
      secondStart.dy, 
      secondEnd.dx, 
      secondEnd.dy
    );
    

    path.lineTo(size.width, 0);
//fim


    /*path.lineTo(0, size.height-80);

    var thirdStart = Offset(size.width/3, size.height/5);
    var thirdtEnd = Offset(size.width / 1.7, size.height/4);
    
    path.quadraticBezierTo
    (
      thirdStart.dx, 
      thirdStart.dy, 
      thirdtEnd.dx, 
      thirdtEnd.dy
    );

     var fourthStart = Offset
    (
      size.width - (size.width/5), 
      - 95
    );
    var fourthEnd = Offset(size.height, 0);

    path.quadraticBezierTo
    (
      fourthStart.dx, 
      fourthStart.dy, 
      fourthEnd.dx, 
      fourthEnd.dy
    );

    path.lineTo(size.width, 0);*/


    path.close();
    return path;

  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

 /* @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
        return oldClipper !=this;
  }*/
  
}