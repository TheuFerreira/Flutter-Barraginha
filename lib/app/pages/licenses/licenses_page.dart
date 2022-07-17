import 'package:flutter/material.dart';

class LicensesPage extends StatelessWidget {
  const LicensesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => LicensePage
    (
    applicationName: 'Calculand',
    applicationIcon: Image.asset('images/logoApp.png', width: 100, height: 100,),
    applicationVersion: '0.0.1',
    applicationLegalese: 'Copyright ${DateTime.now().year}',
  );
}
