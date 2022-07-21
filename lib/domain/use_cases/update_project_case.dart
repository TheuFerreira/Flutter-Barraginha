import 'package:flutter_barraginha/domain/entities/display_project_response.dart';
import 'package:flutter_barraginha/domain/repositories/project_repository.dart';

abstract class UpdateProjectCase {
  Future<void> call(DisplayProjectResponse project);
}

class UpdateProjectCaseImpl implements UpdateProjectCase {
  final ProjectRepository _projectRepository;

  UpdateProjectCaseImpl(this._projectRepository);

  @override
  Future<void> call(DisplayProjectResponse project) async {
    await _projectRepository.save(project);
  }
}
