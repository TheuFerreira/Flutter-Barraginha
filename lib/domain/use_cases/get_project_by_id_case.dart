import 'package:flutter_barraginha/domain/entities/display_project_response.dart';
import 'package:flutter_barraginha/domain/repositories/project_repository.dart';

abstract class GetProjectByIdCase {
  Future<DisplayProjectResponse> call(int id);
}

class GetProjectByIdCaseImpl implements GetProjectByIdCase {
  final ProjectRepository _projectRepository;

  GetProjectByIdCaseImpl(this._projectRepository);

  @override
  Future<DisplayProjectResponse> call(int id) async {
    final project = await _projectRepository.getById(id);
    return project;
  }
}
