import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/screens/projects/projects_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculand',
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
            color: Color(0xff666666),
            fontWeight: FontWeight.normal,
            fontSize: 17,
          ),
          headline6: TextStyle(
            color: Color(0xff666666),
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
          subtitle1: TextStyle(
            color: Color(0xffA8A8A8),
            fontWeight: FontWeight.normal,
            fontSize: 15,
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
        dividerTheme: const DividerThemeData(
          thickness: 1,
        ),
      ),
      home: const ProjectsPage(),
    );
  }
}
