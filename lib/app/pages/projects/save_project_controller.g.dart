// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_project_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SaveProjectController on _SaveProjectControllerBase, Store {
  late final _$soilTypeSelectedAtom = Atom(
      name: '_SaveProjectControllerBase.soilTypeSelected', context: context);

  @override
  SoilType? get soilTypeSelected {
    _$soilTypeSelectedAtom.reportRead();
    return super.soilTypeSelected;
  }

  @override
  set soilTypeSelected(SoilType? value) {
    _$soilTypeSelectedAtom.reportWrite(value, super.soilTypeSelected, () {
      super.soilTypeSelected = value;
    });
  }

  late final _$soilTypesAtom =
      Atom(name: '_SaveProjectControllerBase.soilTypes', context: context);

  @override
  ObservableList<SoilType> get soilTypes {
    _$soilTypesAtom.reportRead();
    return super.soilTypes;
  }

  @override
  set soilTypes(ObservableList<SoilType> value) {
    _$soilTypesAtom.reportWrite(value, super.soilTypes, () {
      super.soilTypes = value;
    });
  }

  late final _$_SaveProjectControllerBaseActionController =
      ActionController(name: '_SaveProjectControllerBase', context: context);

  @override
  void getSoilType() {
    final _$actionInfo = _$_SaveProjectControllerBaseActionController
        .startAction(name: '_SaveProjectControllerBase.getSoilType');
    try {
      return super.getSoilType();
    } finally {
      _$_SaveProjectControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSoilType(SoilType? soilType) {
    final _$actionInfo = _$_SaveProjectControllerBaseActionController
        .startAction(name: '_SaveProjectControllerBase.changeSoilType');
    try {
      return super.changeSoilType(soilType);
    } finally {
      _$_SaveProjectControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
soilTypeSelected: ${soilTypeSelected},
soilTypes: ${soilTypes}
    ''';
  }
}
