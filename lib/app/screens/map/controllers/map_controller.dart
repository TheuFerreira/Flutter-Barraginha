import 'package:flutter_barraginha/app/shared/enums/page_status.dart';
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
  void addMarker(LatLng position) {
    if (markers.length == 2) {
      ToastService.show('Máximo de 2 Pontos Adicionados!');
      return;
    }

    Marker marker = Marker(
      markerId: MarkerId('teste' + position.toString()),
      position: position,
    );
    markers.add(marker);
  }
}
