// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_project_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SaveProjectController on _SaveProjectControllerBase, Store {
  final _$soilTypeSelectedAtom =
      Atom(name: '_SaveProjectControllerBase.soilTypeSelected');

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

  final _$soilTypesAtom = Atom(name: '_SaveProjectControllerBase.soilTypes');

  @override
  List<SoilType> get soilTypes {
    _$soilTypesAtom.reportRead();
    return super.soilTypes;
  }

  @override
  set soilTypes(List<SoilType> value) {
    _$soilTypesAtom.reportWrite(value, super.soilTypes, () {
      super.soilTypes = value;
    });
  }

  final _$_SaveProjectControllerBaseActionController =
      ActionController(name: '_SaveProjectControllerBase');

  @override
  void getAllSoilType() {
    final _$actionInfo = _$_SaveProjectControllerBaseActionController
        .startAction(name: '_SaveProjectControllerBase.getAllSoilType');
    try {
      return super.getAllSoilType();
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
