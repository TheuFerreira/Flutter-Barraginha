import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/shared/components/dropdown_button_form_widget.dart';
import 'package:flutter_barraginha/app/shared/components/text_form_widget.dart';
import 'package:flutter_barraginha/app/shared/database/entities/soil_type.dart';
import 'package:flutter_barraginha/app/shared/database/repositories/soil_type_repository.dart';
import 'package:flutter_barraginha/app/shared/database/responses/display_project_response.dart';
import 'package:flutter_barraginha/app/shared/dialogs/base_dialog.dart';

class SaveProjectDialog extends StatefulWidget {
  final String title;
  final DisplayProjectResponse project;
  const SaveProjectDialog(
    this.project, {
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  State<SaveProjectDialog> createState() => _SaveProjectDialogState();
}

class _SaveProjectDialogState extends State<SaveProjectDialog> {
  final _formController = GlobalKey<FormState>();
  late TextEditingController _nameTextController;
  late TextEditingController _volumeTextController;

  late SoilType _soilTypeSelected;
  final ISoilTypeRepository _soilType = SoilTypeRepository();

  @override
  void initState() {
    super.initState();

    _soilTypeSelected = _soilType.getById(widget.project.idSoilType!);
    _nameTextController = TextEditingController(text: widget.project.title);
    _volumeTextController =
        TextEditingController(text: widget.project.rainVolume.toString());
  }

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: widget.title,
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
              const SizedBox(height: 16.0),
              Container(
                constraints: const BoxConstraints(
                  minHeight: 42,
                ),
                child: DropdownButtonFormWidget<SoilType>(
                  labelText: 'Tipo de solo',
                  onChanged: _changeSoilType,
                  value: _soilTypeSelected,
                  items: _soilType
                      .getAll()
                      .map(
                        (e) => DropdownMenuItem(
                          child: Text(e.text ?? ''),
                          value: e,
                        ),
                      )
                      .toList(),
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

  void _changeSoilType(SoilType? soilType) {
    setState(() => _soilTypeSelected = soilType!);
  }

  void _onConfirm(BuildContext context) {
    if (_formController.currentState!.validate() == false) {
      return;
    }

    final textRainVolume = _volumeTextController.text.replaceAll(',', '.');
    final textName = _nameTextController.text.trim();

    final project = widget.project;
    project.title = textName;
    project.rainVolume = double.parse(textRainVolume);
    project.idSoilType = _soilTypeSelected.id;
    project.status = 1;

    Navigator.pop(context, project);
  }
}
