import 'package:flutter/material.dart';
class Navigation extends StatefulWidget {

  final index;
  final pc;
  const Navigation({Key? key,  required this.index, required this.pc}) : super(key: key);
  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 0),
      child: SizedBox(
        height: 30,
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Theme.of(context).colorScheme.primary,
          currentIndex: widget.index,
          selectedItemColor: Colors.white,
          onTap: (page)
          {
            widget.pc.animateToPage(page,
                duration: Duration(milliseconds: 400),
                curve: Curves.elasticInOut);
          },
          iconSize: 10,
          enableFeedback: false,
          selectedFontSize: 0,
          unselectedFontSize: 0,

          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem
              (
              backgroundColor: Colors.transparent,
              icon: Icon
                (
                Icons.circle,
                size: 10,
              ),
              label: '',
            ),
            BottomNavigationBarItem
              (
              icon: Icon
                (
                Icons.circle,
                size: 10,
              ),
              label: '',
            ),
            BottomNavigationBarItem
              (
              icon: Icon
                (
                Icons.circle,
                size: 10,
              ),
              label: '',
            ),


          ],


        ),
      ),
    );
  }
}
