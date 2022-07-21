import 'package:flutter_barraginha/app/shared/database/responses/display_part.dart';
import 'package:flutter_barraginha/domain/repositories/part_repository.dart';

abstract class DeletePartCase {
  Future<void> call(DisplayPart part);
}

class DeletePartCaseImpl implements DeletePartCase {
  final PartRepository _partRepository;

  DeletePartCaseImpl(this._partRepository);

  @override
  Future<void> call(DisplayPart part) async {
    part.status = 0;
    await _partRepository.save(part);
  }
}
