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
  List<ProjectModel> get projects {
    _$projectsAtom.reportRead();
    return super.projects;
  }

  @override
  set projects(List<ProjectModel> value) {
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
  Future<dynamic> delete(int index) {
    return _$deleteAsyncAction.run(() => super.delete(index));
  }

  final _$addAsyncAction = AsyncAction('_ProjectControllerBase.add');

  @override
  Future<ProjectModel?> add(ProjectModel project) {
    return _$addAsyncAction.run(() => super.add(project));
  }

  final _$_ProjectControllerBaseActionController =
      ActionController(name: '_ProjectControllerBase');

  @override
  void reload() {
    final _$actionInfo = _$_ProjectControllerBaseActionController.startAction(
        name: '_ProjectControllerBase.reload');
    try {
      return super.reload();
    } finally {
      _$_ProjectControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void search(String value) {
    final _$actionInfo = _$_ProjectControllerBaseActionController.startAction(
        name: '_ProjectControllerBase.search');
    try {
      return super.search(value);
    } finally {
      _$_ProjectControllerBaseActionController.endAction(_$actionInfo);
    }
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
