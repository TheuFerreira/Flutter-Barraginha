import 'package:flutter_barraginha/app/screens/groups/model/group_model.dart';
import 'package:flutter_barraginha/app/shared/models/page_status.dart';
import 'package:mobx/mobx.dart';

part 'groups_controller.g.dart';

class GroupsController = _GroupControllerBase with _$GroupsController;

abstract class _GroupControllerBase with Store {
  @observable
  ObservableList<GroupModel> groups = ObservableList<GroupModel>();

  @observable
  PageStatus status = PageStatus.normal;

  @observable
  String message = '';

  _GroupControllerBase() {
    status = PageStatus.loading;
    message = 'Carregando...';

    Future.delayed(const Duration(seconds: 5)).then((value) {
      reloadGroups();
    });
  }

  @action
  void reloadGroups() {
    groups.add(GroupModel('Fazenda do Crocodilo', DateTime(2021, 5, 13), 20));
    groups.add(GroupModel('Avenida de SJE', DateTime(2020, 12, 20), 10));
    groups.add(GroupModel('Rua do Paulão', DateTime(2022, 01, 01), 5));
    groups.add(GroupModel('Fazenda Jão Kisse', DateTime(2020, 09, 17), 17));
    groups.add(GroupModel('Rua da Igreja', DateTime(2022, 02, 28), 2));

    status = PageStatus.normal;
    message = '';
  }

  @action
  void deleteGroup(int index) {
    groups.removeAt(index);
  }
}
