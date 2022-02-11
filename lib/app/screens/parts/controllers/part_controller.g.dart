// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'part_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PartController on _PartControllerBase, Store {
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

  final _$deletePartAsyncAction = AsyncAction('_PartControllerBase.deletePart');

  @override
  Future<dynamic> deletePart(
      BuildContext context, DisplayPart part, int index) {
    return _$deletePartAsyncAction
        .run(() => super.deletePart(context, part, index));
  }

  final _$loadAllAsyncAction = AsyncAction('_PartControllerBase.loadAll');

  @override
  Future<dynamic> loadAll() {
    return _$loadAllAsyncAction.run(() => super.loadAll());
  }

  @override
  String toString() {
    return '''
parts: ${parts},
countBarrage: ${countBarrage}
    ''';
  }
}
