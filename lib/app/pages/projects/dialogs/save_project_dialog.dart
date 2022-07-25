import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/pages/projects/save_project_controller.dart';
import 'package:flutter_barraginha/app/components/dropdown_button_form_widget.dart';
import 'package:flutter_barraginha/app/components/text_form_widget.dart';
import 'package:flutter_barraginha/domain/entities/soil_type.dart';
import 'package:flutter_barraginha/domain/entities/display_project_response.dart';
import 'package:flutter_barraginha/app/dialogs/base_dialog.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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
  late SaveProjectController _controller;

  @override
  void initState() {
    super.initState();

    _controller = SaveProjectController(widget.project);
  }

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: widget.title,
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Form(
          key: _controller.formController,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                constraints: const BoxConstraints(
                  minHeight: 42,
                ),
                child: TextFormWidget(
                  controller: _controller.nameController,
                  labelText: 'Nome do Projeto',
                  hintText: 'Ex: Roça do Zé',
                  errorText: 'Informe o nome',
                  validator: _controller.validateName,
                ),
              ),
              const SizedBox(height: 16.0),
              Container(
                constraints: const BoxConstraints(
                  minHeight: 42,
                ),
                child: TextFormWidget(
                  controller: _controller.volumeRainController,
                  labelText: 'Volume de Chuva em mm',
                  hintText: 'Ex: 22',
                  keyboardType: TextInputType.number,
                  errorText: 'Informe o volume de chuva em mm',
                  validator: _controller.validateVolumeRain,
                ),
              ),
              const SizedBox(height: 16.0),
              Container(
                constraints: const BoxConstraints(
                  minHeight: 42,
                ),
                child: Observer(
                  builder: (context) {
                    final soilTypeSelected = _controller.soilTypeSelected;
                    final soilTypes = _controller.soilTypes;

                    if (soilTypeSelected == null || soilTypes.isEmpty) {
                      return Container();
                    }

                    return DropdownButtonFormWidget<SoilType>(
                      labelText: 'Tipo de solo',
                      onChanged: _controller.changeSoilType,
                      value: soilTypeSelected,
                      items: soilTypes
                          .map((e) => DropdownMenuItem(
                                child: Text(e.text ?? ''),
                                value: e,
                              ))
                          .toList(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      onCancel: () => Navigator.pop(context),
      onConfirm: () => _controller.onConfirm(context),
    );
  }
}
