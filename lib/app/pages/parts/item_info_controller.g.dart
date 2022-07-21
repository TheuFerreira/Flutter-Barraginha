// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_info_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ItemInfoController on _ItemInfoControllerBase, Store {
  late final _$countPartsAtom =
      Atom(name: '_ItemInfoControllerBase.countParts', context: context);

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

  late final _$countBarrageAtom =
      Atom(name: '_ItemInfoControllerBase.countBarrage', context: context);

  @override
  int get countBarrage {
    _$countBarrageAtom.reportRead();
    return super.countBarrage;
  }

  @override
  set countBarrage(int value) {
    _$countBarrageAtom.reportWrite(value, super.countBarrage, () {
      super.countBarrage = value;
    });
  }

  late final _$rainVolumeAtom =
      Atom(name: '_ItemInfoControllerBase.rainVolume', context: context);

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

  late final _$_ItemInfoControllerBaseActionController =
      ActionController(name: '_ItemInfoControllerBase', context: context);

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
  void resetCountBarrage() {
    final _$actionInfo = _$_ItemInfoControllerBaseActionController.startAction(
        name: '_ItemInfoControllerBase.resetCountBarrage');
    try {
      return super.resetCountBarrage();
    } finally {
      _$_ItemInfoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addCountBarrage(int value) {
    final _$actionInfo = _$_ItemInfoControllerBaseActionController.startAction(
        name: '_ItemInfoControllerBase.addCountBarrage');
    try {
      return super.addCountBarrage(value);
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
