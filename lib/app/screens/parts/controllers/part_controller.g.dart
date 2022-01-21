// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'part_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PartController on _PartControllerBase, Store {
  final _$projectAtom = Atom(name: '_PartControllerBase.project');

  @override
  ProjectPartResponse? get project {
    _$projectAtom.reportRead();
    return super.project;
  }

  @override
  set project(ProjectPartResponse? value) {
    _$projectAtom.reportWrite(value, super.project, () {
      super.project = value;
    });
  }

  final _$partsAtom = Atom(name: '_PartControllerBase.parts');

  @override
  List<PartResponse> get parts {
    _$partsAtom.reportRead();
    return super.parts;
  }

  @override
  set parts(List<PartResponse> value) {
    _$partsAtom.reportWrite(value, super.parts, () {
      super.parts = value;
    });
  }

  final _$loadAllAsyncAction = AsyncAction('_PartControllerBase.loadAll');

  @override
  Future<dynamic> loadAll() {
    return _$loadAllAsyncAction.run(() => super.loadAll());
  }

  final _$calculatePartAsyncAction =
      AsyncAction('_PartControllerBase.calculatePart');

  @override
  Future<dynamic> calculatePart(PartResponse part) {
    return _$calculatePartAsyncAction.run(() => super.calculatePart(part));
  }

  final _$updateTitleProjectAsyncAction =
      AsyncAction('_PartControllerBase.updateTitleProject');

  @override
  Future<dynamic> updateTitleProject(String newTitle) {
    return _$updateTitleProjectAsyncAction
        .run(() => super.updateTitleProject(newTitle));
  }

  final _$updateRainVolumeProjectAsyncAction =
      AsyncAction('_PartControllerBase.updateRainVolumeProject');

  @override
  Future<dynamic> updateRainVolumeProject(num newRainVolume) {
    return _$updateRainVolumeProjectAsyncAction
        .run(() => super.updateRainVolumeProject(newRainVolume));
  }

  @override
  String toString() {
    return '''
project: ${project},
parts: ${parts}
    ''';
  }
}
