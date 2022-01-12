import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/shared/components/text_field_widget.dart';
import 'package:flutter_barraginha/app/shared/dialogs/base_dialog.dart';
import 'package:flutter_barraginha/app/shared/services/toast_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EditMarkerDialog extends StatelessWidget {
  final textLongitude = TextEditingController();
  final textLatitude = TextEditingController();
  EditMarkerDialog(LatLng position, {Key? key}) : super(key: key) {
    textLongitude.text = position.longitude.toString();
    textLatitude.text = position.latitude.toString();
  }

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: 'Editar Marcador',
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFieldWidget(
              controller: textLongitude,
              hintText: 'Ex: 15',
              labelText: 'Longitude',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            TextFieldWidget(
              controller: textLatitude,
              hintText: 'Ex: 50',
              labelText: 'Latitude',
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ),
      onCancel: () => Navigator.pop(context, null),
      onConfirm: () {
        if (textLongitude.text.isEmpty || textLatitude.text.isEmpty) {
          ToastService.show('Insira valores válidos!!!');
          return;
        }

        final latitude = double.parse(textLatitude.text);
        final longitude = double.parse(textLongitude.text);
        LatLng position = LatLng(latitude, longitude);
        Navigator.pop(context, position);
      },
    );
  }
}
