import 'package:flutter/cupertino.dart';
import 'package:flutter_barraginha/app/screens/map/controllers/options_controller.dart';
import 'package:flutter_barraginha/app/screens/map/enums/options_type.dart';
import 'package:flutter_barraginha/app/shared/enums/page_status.dart';
import 'package:flutter_barraginha/app/shared/services/dialog_service.dart';
import 'package:flutter_barraginha/app/shared/services/geolocator_service.dart';
import 'package:flutter_barraginha/app/shared/services/toast_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

part 'map_controller.g.dart';

class MapController = _MapControllerBase with _$MapController;

abstract class _MapControllerBase with Store {
  @observable
  List<Marker> markers = ObservableList<Marker>();

  @observable
  CameraPosition? initialPosition;

  @observable
  PageStatus status = PageStatus.loading;

  OptionsController options = OptionsController();
  MarkerId? markerToMove;

  _MapControllerBase() {
    status = PageStatus.loading;
    getCurrentLocation();
  }

  Future getCurrentLocation() async {
    final position = await GeolocatorService().getCurrentLocation();
    if (position == null) {
      ToastService.show('Um problema aconteceu');
      return;
    }

    initialPosition = CameraPosition(
      target: LatLng(
        position.latitude,
        position.longitude,
      ),
      zoom: 15,
    );

    status = PageStatus.normal;
  }

  @action
  void clickMap(BuildContext context, LatLng position) {
    final selectedOption = options.selected;
    if (selectedOption == OptionsType.add) {
      addMarker(context, position);
    } else if (selectedOption == OptionsType.move) {
      if (markerToMove == null) {
        ToastService.show('Clique em um ponto primeiro!!!');
        return;
      }

      final index = markers.indexWhere(
        (element) => element.markerId == markerToMove,
      );

      markers[index] = markers[index].copyWith(positionParam: position);
      markerToMove = null;
    }
  }

  void addMarker(BuildContext context, LatLng position) {
    if (markers.length == 2) {
      ToastService.show('Máximo de 2 Pontos Adicionados!');
      return;
    }

    MarkerId markerId = MarkerId(position.toString());

    Marker marker = Marker(
      markerId: markerId,
      position: position,
      draggable: true,
      onTap: () {
        final selectedOption = options.selected;
        if (selectedOption == OptionsType.delete) {
          deleteMarker(context, markerId);
        } else if (selectedOption == OptionsType.edit) {
          // TODO: Edit
        } else if (selectedOption == OptionsType.move) {
          markerToMove = markerId;
          ToastService.show('Clique em um ponto do mapa.');
        }
      },
    );

    markers.add(marker);
  }

  Future deleteMarker(BuildContext context, MarkerId id) async {
    final result = await DialogService.showQuestionDialog(
      context,
      'Excluir ponto',
      'Tem certeza de que deseja excluir o ponto marcado?',
    );

    if (result == false) {
      return;
    }

    final marker = markers.where((element) => element.markerId == id).first;
    markers.remove(marker);

    ToastService.show('Ponto excluido!!!');
  }
}
