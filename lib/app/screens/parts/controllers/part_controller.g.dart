// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'part_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PartController on _PartControllerBase, Store {
  Computed<int>? _$countPartsComputed;

  @override
  int get countParts =>
      (_$countPartsComputed ??= Computed<int>(() => super.countParts,
              name: '_PartControllerBase.countParts'))
          .value;

  final _$partsAtom = Atom(name: '_PartControllerBase.parts');

  @override
  List<DisplayPart> get parts {
    _$partsAtom.reportRead();
    return super.parts;
  }

  @override
  set parts(List<DisplayPart> value) {
    _$partsAtom.reportWrite(value, super.parts, () {
      super.parts = value;
    });
  }

  final _$countBarrageAtom = Atom(name: '_PartControllerBase.countBarrage');

  @override
  num get countBarrage {
    _$countBarrageAtom.reportRead();
    return super.countBarrage;
  }

  @override
  set countBarrage(num value) {
    _$countBarrageAtom.reportWrite(value, super.countBarrage, () {
      super.countBarrage = value;
    });
  }

  final _$deleteAsyncAction = AsyncAction('_PartControllerBase.delete');

  @override
  Future<dynamic> delete(DisplayPart part) {
    return _$deleteAsyncAction.run(() => super.delete(part));
  }

  final _$loadAllAsyncAction = AsyncAction('_PartControllerBase.loadAll');

  @override
  Future<dynamic> loadAll(int idProject) {
    return _$loadAllAsyncAction.run(() => super.loadAll(idProject));
  }

  final _$_PartControllerBaseActionController =
      ActionController(name: '_PartControllerBase');

  @override
  void addBarrageNumber(num barrageNumber) {
    final _$actionInfo = _$_PartControllerBaseActionController.startAction(
        name: '_PartControllerBase.addBarrageNumber');
    try {
      return super.addBarrageNumber(barrageNumber);
    } finally {
      _$_PartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
parts: ${parts},
countBarrage: ${countBarrage},
countParts: ${countParts}
    ''';
  }
}
