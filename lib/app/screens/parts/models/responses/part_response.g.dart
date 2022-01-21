// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'part_response.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PartResponse on _PartResponseBase, Store {
  final _$calculateResponseAtom =
      Atom(name: '_PartResponseBase.calculateResponse');

  @override
  CalculateResponse? get calculateResponse {
    _$calculateResponseAtom.reportRead();
    return super.calculateResponse;
  }

  @override
  set calculateResponse(CalculateResponse? value) {
    _$calculateResponseAtom.reportWrite(value, super.calculateResponse, () {
      super.calculateResponse = value;
    });
  }

  final _$stateAtom = Atom(name: '_PartResponseBase.state');

  @override
  StateResponse get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(StateResponse value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$_PartResponseBaseActionController =
      ActionController(name: '_PartResponseBase');

  @override
  void changeState(StateResponse newState) {
    final _$actionInfo = _$_PartResponseBaseActionController.startAction(
        name: '_PartResponseBase.changeState');
    try {
      return super.changeState(newState);
    } finally {
      _$_PartResponseBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
calculateResponse: ${calculateResponse},
state: ${state}
    ''';
  }
}
