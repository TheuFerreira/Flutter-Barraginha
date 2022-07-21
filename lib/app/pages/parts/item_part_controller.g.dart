// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_part_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ItemPartController on _ItemPartControllerBase, Store {
  late final _$infoAtom =
      Atom(name: '_ItemPartControllerBase.info', context: context);

  @override
  InfoPart? get info {
    _$infoAtom.reportRead();
    return super.info;
  }

  @override
  set info(InfoPart? value) {
    _$infoAtom.reportWrite(value, super.info, () {
      super.info = value;
    });
  }

  late final _$stateAtom =
      Atom(name: '_ItemPartControllerBase.state', context: context);

  @override
  StateItem get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(StateItem value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$calculateAsyncAction =
      AsyncAction('_ItemPartControllerBase.calculate', context: context);

  @override
  Future<bool> calculate() {
    return _$calculateAsyncAction.run(() => super.calculate());
  }

  @override
  String toString() {
    return '''
info: ${info},
state: ${state}
    ''';
  }
}
