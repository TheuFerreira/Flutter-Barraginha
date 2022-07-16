// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutorial_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TutorialController on _TutorialControllerBase, Store {
  late final _$pagesAtom =
      Atom(name: '_TutorialControllerBase.pages', context: context);

  @override
  List<PageWidget> get pages {
    _$pagesAtom.reportRead();
    return super.pages;
  }

  @override
  set pages(List<PageWidget> value) {
    _$pagesAtom.reportWrite(value, super.pages, () {
      super.pages = value;
    });
  }

  late final _$selectedPageAtom =
      Atom(name: '_TutorialControllerBase.selectedPage', context: context);

  @override
  int get selectedPage {
    _$selectedPageAtom.reportRead();
    return super.selectedPage;
  }

  @override
  set selectedPage(int value) {
    _$selectedPageAtom.reportWrite(value, super.selectedPage, () {
      super.selectedPage = value;
    });
  }

  late final _$showPreviousAtom =
      Atom(name: '_TutorialControllerBase.showPrevious', context: context);

  @override
  bool get showPrevious {
    _$showPreviousAtom.reportRead();
    return super.showPrevious;
  }

  @override
  set showPrevious(bool value) {
    _$showPreviousAtom.reportWrite(value, super.showPrevious, () {
      super.showPrevious = value;
    });
  }

  late final _$showContinueAtom =
      Atom(name: '_TutorialControllerBase.showContinue', context: context);

  @override
  bool get showContinue {
    _$showContinueAtom.reportRead();
    return super.showContinue;
  }

  @override
  set showContinue(bool value) {
    _$showContinueAtom.reportWrite(value, super.showContinue, () {
      super.showContinue = value;
    });
  }

  late final _$_TutorialControllerBaseActionController =
      ActionController(name: '_TutorialControllerBase', context: context);

  @override
  void updatePage(int index) {
    final _$actionInfo = _$_TutorialControllerBaseActionController.startAction(
        name: '_TutorialControllerBase.updatePage');
    try {
      return super.updatePage(index);
    } finally {
      _$_TutorialControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pages: ${pages},
selectedPage: ${selectedPage},
showPrevious: ${showPrevious},
showContinue: ${showContinue}
    ''';
  }
}
