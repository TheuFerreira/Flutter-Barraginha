// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AboutController on _AboutControllerBase, Store {
  late final _$deviceInfoAtom =
      Atom(name: '_AboutControllerBase.deviceInfo', context: context);

  @override
  DeviceInfoResult? get deviceInfo {
    _$deviceInfoAtom.reportRead();
    return super.deviceInfo;
  }

  @override
  set deviceInfo(DeviceInfoResult? value) {
    _$deviceInfoAtom.reportWrite(value, super.deviceInfo, () {
      super.deviceInfo = value;
    });
  }

  late final _$_setInfoAsyncAction =
      AsyncAction('_AboutControllerBase._setInfo', context: context);

  @override
  Future<dynamic> _setInfo() {
    return _$_setInfoAsyncAction.run(() => super._setInfo());
  }

  @override
  String toString() {
    return '''
deviceInfo: ${deviceInfo}
    ''';
  }
}
