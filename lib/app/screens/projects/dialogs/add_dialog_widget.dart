import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/shared/components/text_field_widget.dart';
import 'package:flutter_barraginha/app/shared/dialogs/base_dialog.dart';
import 'package:flutter_barraginha/app/shared/services/toast_service.dart';

class AddDialogWidget extends StatelessWidget {
  final _nameTextController = TextEditingController();
  final _volumeTextController = TextEditingController();
  AddDialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: 'Nome do projeto',
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 42,
              child: TextFieldWidget(
                controller: _nameTextController,
                labelText: 'Nome do Projeto',
                hintText: 'Ex: Roça do Zé',
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              height: 42,
              child: TextFieldWidget(
                controller: _volumeTextController,
                labelText: 'Volume de Chuva',
                hintText: 'Ex: 22',
                keyboardType: TextInputType.number,
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
    final textRainVolume = _volumeTextController.text;
    final textName = _nameTextController.text.trim();
    if (textRainVolume.isEmpty || textName.isEmpty) {
      ToastService.show('Insira valores válidos!!!');
      return;
    }

    final result = {
      'title': textName,
      'rain_volume': int.parse(textRainVolume),
    };

    Navigator.pop(context, result);
  }
}
