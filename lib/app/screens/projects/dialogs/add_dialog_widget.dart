import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/shared/components/dropdown_button_form_widget.dart';
import 'package:flutter_barraginha/app/shared/components/text_form_widget.dart';
import 'package:flutter_barraginha/app/shared/database/dao/dao_soil_type.dart';
import 'package:flutter_barraginha/app/shared/dialogs/base_dialog.dart';
import 'package:flutter_barraginha/app/shared/models/soil_type_model.dart';

class AddDialogWidget extends StatefulWidget {
  const AddDialogWidget({Key? key}) : super(key: key);

  @override
  State<AddDialogWidget> createState() => _AddDialogWidgetState();
}

class _AddDialogWidgetState extends State<AddDialogWidget> {
  final _formController = GlobalKey<FormState>();
  final _nameTextController = TextEditingController();
  final _volumeTextController = TextEditingController();

  late SoilTypeModel _soilTypeSelected;
  final _daoSoilType = DAOSoilType();

  @override
  void initState() {
    super.initState();

    _soilTypeSelected = _daoSoilType.getById(1);
  }

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
              const SizedBox(height: 16.0),
              Container(
                constraints: const BoxConstraints(
                  minHeight: 42,
                ),
                child: DropdownButtonFormWidget<SoilTypeModel>(
                  labelText: 'Tipo de solo',
                  onChanged: _changeSoilType,
                  value: _soilTypeSelected,
                  items: _daoSoilType
                      .getAll()
                      .map(
                        (e) => DropdownMenuItem(
                          child: Text(e.text),
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

  void _changeSoilType(SoilTypeModel? soilType) {
    setState(() => _soilTypeSelected = soilType!);
  }

  void _onConfirm(BuildContext context) {
    if (_formController.currentState!.validate() == false) {
      return;
    }

    final textRainVolume = _volumeTextController.text.replaceAll(',', '.');
    final textName = _nameTextController.text.trim();

    final result = {
      'title': textName,
      'rain_volume': double.parse(textRainVolume),
      'soil_type': _soilTypeSelected,
    };

    Navigator.pop(context, result);
  }
}
