// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ItemController on _ItemControllerBase, Store {
  final _$infoAtom = Atom(name: '_ItemControllerBase.info');

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

  final _$stateAtom = Atom(name: '_ItemControllerBase.state');

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

  final _$calculateAsyncAction = AsyncAction('_ItemControllerBase.calculate');

  @override
  Future<dynamic> calculate(dynamic Function(num) onCaculated) {
    return _$calculateAsyncAction.run(() => super.calculate(onCaculated));
  }

  final _$_ItemControllerBaseActionController =
      ActionController(name: '_ItemControllerBase');

  @override
  void changeItemState(StateItem newState) {
    final _$actionInfo = _$_ItemControllerBaseActionController.startAction(
        name: '_ItemControllerBase.changeItemState');
    try {
      return super.changeItemState(newState);
    } finally {
      _$_ItemControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
info: ${info},
state: ${state}
    ''';
  }
}
