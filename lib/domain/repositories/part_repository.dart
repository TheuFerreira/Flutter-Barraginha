import 'package:flutter_barraginha/app/shared/database/responses/display_part.dart';

abstract class PartRepository {
  Future<List<DisplayPart>> getAll(int idProject);
  Future save(DisplayPart part);
}
