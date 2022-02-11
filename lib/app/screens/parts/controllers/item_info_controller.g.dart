// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_info_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ItemInfoController on _ItemInfoControllerBase, Store {
  final _$countPartsAtom = Atom(name: '_ItemInfoControllerBase.countParts');

  @override
  String get countParts {
    _$countPartsAtom.reportRead();
    return super.countParts;
  }

  @override
  set countParts(String value) {
    _$countPartsAtom.reportWrite(value, super.countParts, () {
      super.countParts = value;
    });
  }

  final _$countBarrageAtom = Atom(name: '_ItemInfoControllerBase.countBarrage');

  @override
  String get countBarrage {
    _$countBarrageAtom.reportRead();
    return super.countBarrage;
  }

  @override
  set countBarrage(String value) {
    _$countBarrageAtom.reportWrite(value, super.countBarrage, () {
      super.countBarrage = value;
    });
  }

  final _$rainVolumeAtom = Atom(name: '_ItemInfoControllerBase.rainVolume');

  @override
  String get rainVolume {
    _$rainVolumeAtom.reportRead();
    return super.rainVolume;
  }

  @override
  set rainVolume(String value) {
    _$rainVolumeAtom.reportWrite(value, super.rainVolume, () {
      super.rainVolume = value;
    });
  }

  final _$_ItemInfoControllerBaseActionController =
      ActionController(name: '_ItemInfoControllerBase');

  @override
  void setCountParts(int value) {
    final _$actionInfo = _$_ItemInfoControllerBaseActionController.startAction(
        name: '_ItemInfoControllerBase.setCountParts');
    try {
      return super.setCountParts(value);
    } finally {
      _$_ItemInfoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCountBarrage(int value) {
    final _$actionInfo = _$_ItemInfoControllerBaseActionController.startAction(
        name: '_ItemInfoControllerBase.setCountBarrage');
    try {
      return super.setCountBarrage(value);
    } finally {
      _$_ItemInfoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
countParts: ${countParts},
countBarrage: ${countBarrage},
rainVolume: ${rainVolume}
    ''';
  }
}
