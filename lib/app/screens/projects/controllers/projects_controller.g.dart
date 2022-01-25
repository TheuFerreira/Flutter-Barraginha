// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projects_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProjectsController on _ProjectControllerBase, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_ProjectControllerBase.isLoading'))
          .value;

  final _$projectsAtom = Atom(name: '_ProjectControllerBase.projects');

  @override
  List<DisplayProjectResponse> get projects {
    _$projectsAtom.reportRead();
    return super.projects;
  }

  @override
  set projects(List<DisplayProjectResponse> value) {
    _$projectsAtom.reportWrite(value, super.projects, () {
      super.projects = value;
    });
  }

  final _$statusAtom = Atom(name: '_ProjectControllerBase.status');

  @override
  PageStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(PageStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$messageAtom = Atom(name: '_ProjectControllerBase.message');

  @override
  String get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(String value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  final _$deleteAsyncAction = AsyncAction('_ProjectControllerBase.delete');

  @override
  Future<dynamic> delete(DisplayProjectResponse project) {
    return _$deleteAsyncAction.run(() => super.delete(project));
  }

  final _$addAsyncAction = AsyncAction('_ProjectControllerBase.add');

  @override
  Future<DisplayProjectResponse> add(DisplayProjectResponse project) {
    return _$addAsyncAction.run(() => super.add(project));
  }

  final _$searchAsyncAction = AsyncAction('_ProjectControllerBase.search');

  @override
  Future<dynamic> search(String value) {
    return _$searchAsyncAction.run(() => super.search(value));
  }

  @override
  String toString() {
    return '''
projects: ${projects},
status: ${status},
message: ${message},
isLoading: ${isLoading}
    ''';
  }
}
