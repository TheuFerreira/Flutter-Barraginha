// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projects_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProjectsController on _ProjectControllerBase, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_ProjectControllerBase.isLoading'))
          .value;

  late final _$projectsAtom =
      Atom(name: '_ProjectControllerBase.projects', context: context);

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

  late final _$statusAtom =
      Atom(name: '_ProjectControllerBase.status', context: context);

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

  late final _$messageAtom =
      Atom(name: '_ProjectControllerBase.message', context: context);

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

  late final _$addNewProjectAsyncAction =
      AsyncAction('_ProjectControllerBase.addNewProject', context: context);

  @override
  Future<dynamic> addNewProject(
      BuildContext context, TextEditingController searchController) {
    return _$addNewProjectAsyncAction
        .run(() => super.addNewProject(context, searchController));
  }

  late final _$_editProjectAsyncAction =
      AsyncAction('_ProjectControllerBase._editProject', context: context);

  @override
  Future<dynamic> _editProject(BuildContext context,
      DisplayProjectResponse project, TextEditingController searchController) {
    return _$_editProjectAsyncAction
        .run(() => super._editProject(context, project, searchController));
  }

  late final _$_deleteProjectAsyncAction =
      AsyncAction('_ProjectControllerBase._deleteProject', context: context);

  @override
  Future<dynamic> _deleteProject(BuildContext context,
      DisplayProjectResponse project, TextEditingController searchController) {
    return _$_deleteProjectAsyncAction
        .run(() => super._deleteProject(context, project, searchController));
  }

  late final _$searchAsyncAction =
      AsyncAction('_ProjectControllerBase.search', context: context);

  @override
  Future<dynamic> search({String value = ''}) {
    return _$searchAsyncAction.run(() => super.search(value: value));
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
