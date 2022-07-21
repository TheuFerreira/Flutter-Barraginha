import 'package:flutter_barraginha/domain/entities/display_project_response.dart';
import 'package:flutter_barraginha/domain/repositories/project_repository.dart';

abstract class SearchProjectsCase {
  Future<List<DisplayProjectResponse>> call({String search = ''});
}

class SearchProjectsCaseImpl implements SearchProjectsCase {
  final ProjectRepository _projectRepository;

  SearchProjectsCaseImpl(this._projectRepository);

  @override
  Future<List<DisplayProjectResponse>> call({String search = ''}) async {
    final projects = await _projectRepository.search(search: search);
    return projects;
  }
}
