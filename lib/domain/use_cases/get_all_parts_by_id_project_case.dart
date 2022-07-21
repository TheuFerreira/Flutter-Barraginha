import 'package:flutter_barraginha/domain/entities/display_part.dart';
import 'package:flutter_barraginha/domain/entities/display_project_response.dart';
import 'package:flutter_barraginha/domain/repositories/part_repository.dart';

abstract class GetAllPartsByIdProjectCase {
  Future<List<DisplayPart>> call(DisplayProjectResponse project);
}

class GetAllPartsByIdProjectCaseImpl implements GetAllPartsByIdProjectCase {
  final PartRepository _partRepository;

  GetAllPartsByIdProjectCaseImpl(this._partRepository);

  @override
  Future<List<DisplayPart>> call(DisplayProjectResponse project) async {
    final parts = await _partRepository.getAll(project.id!);
    return parts;
  }
}
