// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'options_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OptionsController on _OptionsControllerBase, Store {
  Computed<OptionsType>? _$selectedComputed;

  @override
  OptionsType get selected =>
      (_$selectedComputed ??= Computed<OptionsType>(() => super.selected,
              name: '_OptionsControllerBase.selected'))
          .value;

  late final _$valuesAtom =
      Atom(name: '_OptionsControllerBase.values', context: context);

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

  late final _$_OptionsControllerBaseActionController =
      ActionController(name: '_OptionsControllerBase', context: context);

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
