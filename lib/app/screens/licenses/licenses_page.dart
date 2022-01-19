import 'package:flutter/material.dart';

class LicensesPage extends StatelessWidget {
  const LicensesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => LicensePage
    (
    applicationName: 'Nome do app',
    applicationIcon: Image.asset('images/funcao.png', width: 50, height: 50,),
    applicationVersion: '0.0.1',
    applicationLegalese: 'Copyright ${DateTime.now().year}',
  );
}
