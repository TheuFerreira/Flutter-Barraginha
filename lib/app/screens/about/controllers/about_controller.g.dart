// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AboutController on _AboutControllerBase, Store {
  late final _$infoAtom =
      Atom(name: '_AboutControllerBase.info', context: context);

  @override
  String get info {
    _$infoAtom.reportRead();
    return super.info;
  }

  @override
  set info(String value) {
    _$infoAtom.reportWrite(value, super.info, () {
      super.info = value;
    });
  }

  late final _$_setInfoAsyncAction =
      AsyncAction('_AboutControllerBase._setInfo', context: context);

  @override
  Future<dynamic> _setInfo() {
    return _$_setInfoAsyncAction.run(() => super._setInfo());
  }

  @override
  String toString() {
    return '''
info: ${info}
    ''';
  }
}
