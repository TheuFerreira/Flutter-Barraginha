import 'package:flutter_barraginha/app/shared/database/entities/soil_type.dart';

abstract class SoilTypeRepository {
  Future<List<SoilType>> getAll();
  Future<SoilType> getById(int id);
}
