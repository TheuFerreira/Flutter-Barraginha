import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/shared/components/text_form_widget.dart';
import 'package:flutter_barraginha/app/shared/dialogs/base_dialog.dart';

class AddDialogWidget extends StatelessWidget {
  final _formController = GlobalKey<FormState>();
  final _nameTextController = TextEditingController();
  final _volumeTextController = TextEditingController();
  AddDialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: 'Nome do projeto',
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Form(
          key: _formController,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                constraints: const BoxConstraints(
                  minHeight: 42,
                ),
                child: TextFormWidget(
                  controller: _nameTextController,
                  labelText: 'Nome do Projeto',
                  hintText: 'Ex: Roça do Zé',
                  errorText: 'Informe o nome',
                ),
              ),
              const SizedBox(height: 16.0),
              Container(
                constraints: const BoxConstraints(
                  minHeight: 42,
                ),
                child: TextFormWidget(
                  controller: _volumeTextController,
                  labelText: 'Volume de Chuva',
                  hintText: 'Ex: 22',
                  keyboardType: TextInputType.number,
                  errorText: 'Informe o volume de chuva',
                ),
              ),
            ],
          ),
        ),
      ),
      onCancel: () => Navigator.pop(context),
      onConfirm: () => _onConfirm(context),
    );
  }

  void _onConfirm(BuildContext context) {
    if (_formController.currentState!.validate() == false) {
      return;
    }

    final textRainVolume = _volumeTextController.text;
    final textName = _nameTextController.text.trim();

    final result = {
      'title': textName,
      'rain_volume': int.parse(textRainVolume),
    };

    Navigator.pop(context, result);
  }
}
