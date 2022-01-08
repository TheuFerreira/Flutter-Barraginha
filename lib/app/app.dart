import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/screens/parts/parts_page.dart';
import 'package:flutter_barraginha/app/screens/projects/projects_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 24,
            color: Colors.white,
          ),
          headline2: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 24.0,
            color: Color(0xFF666666),
          ),
          headline3: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
            color: Color(0xFF666666),
          ),
        ),
        cardTheme: const CardTheme(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24),
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
        ),
      ),
      home: const PartsPage(),
    );
  }
}
