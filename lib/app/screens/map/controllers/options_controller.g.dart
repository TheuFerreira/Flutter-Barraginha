// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'options_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OptionsController on _OptionsControllerBase, Store {
  Computed<int>? _$selectedComputed;

  @override
  int get selected =>
      (_$selectedComputed ??= Computed<int>(() => super.selected,
              name: '_OptionsControllerBase.selected'))
          .value;

  final _$valuesAtom = Atom(name: '_OptionsControllerBase.values');

  @override
  List<bool> get values {
    _$valuesAtom.reportRead();
    return super.values;
  }

  @override
  set values(List<bool> value) {
    _$valuesAtom.reportWrite(value, super.values, () {
      super.values = value;
    });
  }

  final _$_OptionsControllerBaseActionController =
      ActionController(name: '_OptionsControllerBase');

  @override
  void onSelect(int index) {
    final _$actionInfo = _$_OptionsControllerBaseActionController.startAction(
        name: '_OptionsControllerBase.onSelect');
    try {
      return super.onSelect(index);
    } finally {
      _$_OptionsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
values: ${values},
selected: ${selected}
    ''';
  }
}