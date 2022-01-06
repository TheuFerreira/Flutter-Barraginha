// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'groups_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GroupsController on _GroupControllerBase, Store {
  final _$oldGroupsAtom = Atom(name: '_GroupControllerBase.oldGroups');

  @override
  List<GroupModel> get oldGroups {
    _$oldGroupsAtom.reportRead();
    return super.oldGroups;
  }

  @override
  set oldGroups(List<GroupModel> value) {
    _$oldGroupsAtom.reportWrite(value, super.oldGroups, () {
      super.oldGroups = value;
    });
  }

  final _$groupsAtom = Atom(name: '_GroupControllerBase.groups');

  @override
  List<GroupModel> get groups {
    _$groupsAtom.reportRead();
    return super.groups;
  }

  @override
  set groups(List<GroupModel> value) {
    _$groupsAtom.reportWrite(value, super.groups, () {
      super.groups = value;
    });
  }

  final _$statusAtom = Atom(name: '_GroupControllerBase.status');

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

  final _$messageAtom = Atom(name: '_GroupControllerBase.message');

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

  final _$_GroupControllerBaseActionController =
      ActionController(name: '_GroupControllerBase');

  @override
  void reloadGroups() {
    final _$actionInfo = _$_GroupControllerBaseActionController.startAction(
        name: '_GroupControllerBase.reloadGroups');
    try {
      return super.reloadGroups();
    } finally {
      _$_GroupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteGroup(int index) {
    final _$actionInfo = _$_GroupControllerBaseActionController.startAction(
        name: '_GroupControllerBase.deleteGroup');
    try {
      return super.deleteGroup(index);
    } finally {
      _$_GroupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void search(String value) {
    final _$actionInfo = _$_GroupControllerBaseActionController.startAction(
        name: '_GroupControllerBase.search');
    try {
      return super.search(value);
    } finally {
      _$_GroupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
oldGroups: ${oldGroups},
groups: ${groups},
status: ${status},
message: ${message}
    ''';
  }
}
