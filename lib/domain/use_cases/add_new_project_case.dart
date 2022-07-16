import 'package:flutter_barraginha/app/shared/database/responses/display_project_response.dart';
import 'package:flutter_barraginha/domain/repositories/project_repository.dart';
import 'package:flutter_barraginha/domain/use_cases/get_soil_type_by_id_case.dart';

abstract class AddNewProjectCase {
  Future<DisplayProjectResponse> call(DisplayProjectResponse project);
}

class AddNewProjectCaseImpl implements AddNewProjectCase {
  final ProjectRepository _projectRepository;
  final GetSoilTypeByIdCase _getSoilTypeByIdCase;

  AddNewProjectCaseImpl(this._projectRepository, this._getSoilTypeByIdCase);

  @override
  Future<DisplayProjectResponse> call(DisplayProjectResponse project) async {
    project.date = DateTime.now();
    project.status = 1;

    final newProject = await _projectRepository.save(project);
    newProject.soilType = await _getSoilTypeByIdCase(newProject.idSoilType!);

    return newProject;
  }
}
