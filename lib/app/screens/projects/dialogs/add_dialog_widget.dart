import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/screens/projects/components/text_field_widget.dart';
import 'package:flutter_barraginha/app/screens/projects/model/project_model.dart';
import 'package:flutter_barraginha/app/shared/components/question_dialog_widget.dart';

class AddDialogWidget extends StatelessWidget {
  final _nameTextController = TextEditingController();
  final _volumeTextController = TextEditingController();
  AddDialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QuestionDialogWidget(
      title: 'Nome do projeto',
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFieldWidget(
            controller: _nameTextController,
            labelText: 'Nome do Projeto',
            hintText: 'Ex: Roça do Zé',
          ),
          const SizedBox(height: 16.0),
          TextFieldWidget(
            controller: _volumeTextController,
            labelText: 'Volume de Chuva',
            hintText: 'Ex: 22',
            textInputType: TextInputType.number,
          ),
        ],
      ),
      onConfirm: () => _onConfirm(context),
    );
  }

  void _onConfirm(BuildContext context) {
    final textRainVolume = _volumeTextController.text;
    final textName = _nameTextController.text.trim();
    if (textRainVolume.isEmpty || textName.isEmpty) {
      return;
    }

    final rainVolume = int.parse(textRainVolume);
    final project = ProjectModel(
      textName,
      DateTime.now(),
      rainVolume,
      0,
    );

    Navigator.pop(context, project);
  }
}
