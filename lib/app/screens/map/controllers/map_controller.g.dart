// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MapController on _MapControllerBase, Store {
  final _$markersAtom = Atom(name: '_MapControllerBase.markers');

  @override
  List<Marker> get markers {
    _$markersAtom.reportRead();
    return super.markers;
  }

  @override
  set markers(List<Marker> value) {
    _$markersAtom.reportWrite(value, super.markers, () {
      super.markers = value;
    });
  }

  final _$initialPositionAtom =
      Atom(name: '_MapControllerBase.initialPosition');

  @override
  CameraPosition? get initialPosition {
    _$initialPositionAtom.reportRead();
    return super.initialPosition;
  }

  @override
  set initialPosition(CameraPosition? value) {
    _$initialPositionAtom.reportWrite(value, super.initialPosition, () {
      super.initialPosition = value;
    });
  }

  final _$statusAtom = Atom(name: '_MapControllerBase.status');

  @override
  PageStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(PageStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$_getCurrentLocationAsyncAction =
      AsyncAction('_MapControllerBase._getCurrentLocation');

  @override
  Future<dynamic> _getCurrentLocation() {
    return _$_getCurrentLocationAsyncAction
        .run(() => super._getCurrentLocation());
  }

  final _$_MapControllerBaseActionController =
      ActionController(name: '_MapControllerBase');

  @override
  void clickMap(BuildContext context, LatLng position) {
    final _$actionInfo = _$_MapControllerBaseActionController.startAction(
        name: '_MapControllerBase.clickMap');
    try {
      return super.clickMap(context, position);
    } finally {
      _$_MapControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addMarker(BuildContext context, LatLng position) {
    final _$actionInfo = _$_MapControllerBaseActionController.startAction(
        name: '_MapControllerBase.addMarker');
    try {
      return super.addMarker(context, position);
    } finally {
      _$_MapControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
markers: ${markers},
initialPosition: ${initialPosition},
status: ${status}
    ''';
  }
}
