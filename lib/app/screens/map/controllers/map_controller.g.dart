// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MapController on _MapControllerBase, Store {
  late final _$markersAtom =
      Atom(name: '_MapControllerBase.markers', context: context);

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

  late final _$initialPositionAtom =
      Atom(name: '_MapControllerBase.initialPosition', context: context);

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

  late final _$statusAtom =
      Atom(name: '_MapControllerBase.status', context: context);

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

  late final _$_getCurrentLocationAsyncAction =
      AsyncAction('_MapControllerBase._getCurrentLocation', context: context);

  @override
  Future<dynamic> _getCurrentLocation() {
    return _$_getCurrentLocationAsyncAction
        .run(() => super._getCurrentLocation());
  }

  late final _$_MapControllerBaseActionController =
      ActionController(name: '_MapControllerBase', context: context);

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
