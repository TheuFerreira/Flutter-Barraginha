import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/shared/components/text_form_widget.dart';
import 'package:flutter_barraginha/app/shared/dialogs/base_dialog.dart';

class UpdateRainDialog extends StatefulWidget {
  final String rainVolume;
  const UpdateRainDialog(this.rainVolume, {Key? key}) : super(key: key);

  @override
  State<UpdateRainDialog> createState() => _UpdateRainDialogState();
}

class _UpdateRainDialogState extends State<UpdateRainDialog> {
  late TextEditingController _rainController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _rainController = TextEditingController(text: widget.rainVolume);
  }

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Form(
          key: _formKey,
          child: Container(
            constraints: const BoxConstraints(
              minHeight: 42,
            ),
            child: TextFormWidget(
              controller: _rainController,
              labelText: 'Volume de Chuva',
              hintText: 'Ex: 22',
              keyboardType: TextInputType.number,
              errorText: 'Informe o volume de chuva',
            ),
          ),
        ),
      ),
      onCancel: () => Navigator.pop(context),
      onConfirm: _onConfirm,
    );
  }

  void _onConfirm() {
    if (_validForm() == false) return;

    final rainVolume = double.parse(_rainController.text.replaceAll(',', '.'));
    Navigator.pop(context, rainVolume);
  }

  bool _validForm() {
    if (_formKey.currentState!.validate() == false) {
      return false;
    }
    return true;
  }
}
