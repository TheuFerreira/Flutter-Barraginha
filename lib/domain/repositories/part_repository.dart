import 'package:flutter_barraginha/domain/entities/display_part.dart';

abstract class PartRepository {
  Future<List<DisplayPart>> getAll(int idProject);
  Future save(DisplayPart part);
}
