import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barraginha/app/screens/projects/projects_page.dart';
import 'package:flutter_barraginha/app/shared/dialogs/base_dialog.dart';
class AddDialogWidgetTest extends StatefulWidget {
  const AddDialogWidgetTest({Key? key}) : super(key: key);

  @override
  _AddDialogWidgetTestState createState() => _AddDialogWidgetTestState();
}

class _AddDialogWidgetTestState extends State<AddDialogWidgetTest> {

  final _form = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _rain = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: 'Nome do projeto',
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Form
            (
              key:  _form,

              child: Column(
                children: [
                  TextFormField
                  (
                    controller: _name,
                    style: const TextStyle
                    (
                      fontSize: 17,
                    ),

                    decoration: InputDecoration
                    (
                      border: OutlineInputBorder
                      (
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none

                      ),

                        contentPadding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                        alignLabelWithHint: true,
                        hintText: 'Nome',
                        fillColor:Colors.grey[200],
                        filled: true
                    ),

                    validator: (value)
                    {
                      if(value!.isEmpty)
                        {
                          return 'Informe o nome';
                        }
                    },

                  ),

                  SizedBox(height: 20),


                  TextFormField
                    (
                    controller: _rain,
                    style: const TextStyle
                      (
                      fontSize: 17,
                    ),

                    decoration: InputDecoration
                      (
                        border: OutlineInputBorder
                          (
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none

                        ),

                        contentPadding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                        alignLabelWithHint: true,
                        hintText: 'Volume de chuva',
                        fillColor:Colors.grey[200],
                        filled: true
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],

                    validator: (value)
                    {
                      if(value!.isEmpty)
                      {
                        return 'Informe o volume de chuva';
                      }
                    },
                  ),
                ],
              ),



            ),


          ],
        ),
      ),
      onCancel: () => Navigator.pop(context),
      onConfirm: () => _onConfirm(context),
    );


  }

  void _onConfirm(BuildContext context) {


    if(_form.currentState!.validate())
    {
      final name = _name.text.trim();
      final rain = _rain.text;
      final result =
      {
        'title': name,
        'rain_volume': int.parse(rain),
      };

      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar
        (
          const SnackBar
            (
            content: Text
              (
                'Projeto criado'
            ),
          )
      );
    }



  }
}
