import 'package:flutter_barraginha/domain/entities/display_part.dart';
import 'package:flutter_barraginha/domain/repositories/part_repository.dart';

abstract class SavePartProjectCase {
  Future<void> call(DisplayPart part);
}

class SavePartProjectCaseImpl implements SavePartProjectCase {
  final PartRepository _partRepository;

  SavePartProjectCaseImpl(this._partRepository);

  @override
  Future<void> call(DisplayPart part) async {
    await _partRepository.save(part);
  }
}
