// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_info_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ItemInfoController on _ItemInfoControllerBase, Store {
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

  @override
  String toString() {
    return '''
rainVolume: ${rainVolume}
    ''';
  }
}
