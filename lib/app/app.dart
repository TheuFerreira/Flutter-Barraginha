import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/screens/parts/parts_info_page.dart';
import 'package:flutter_barraginha/app/screens/projects/projects_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF439889),
          secondary: Color(0xFF00695C),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: const Color(0xFF00695C),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12.0),
            minimumSize: const Size(200, 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
        listTileTheme: const ListTileThemeData(
          iconColor: Color(0xFF666666),
          textColor: Color(0xFF666666),
          style: ListTileStyle.drawer,
        ),
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
          headline4: TextStyle(
            fontSize: 18.0,
            color: Color(0xFF666666),
          ),
          headline5: TextStyle(
            fontSize: 20.0,
            color: Color(0xFF666666),
          ),
          subtitle1: TextStyle(
            height: 1.5,
            fontSize: 16.0,
            color: Color(0xFFA8A8A8),
          ),
        ),
        cardTheme: const CardTheme(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24),
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
        ),
      ),
      home: const PartsInfoPage(),
    );
  }
}
