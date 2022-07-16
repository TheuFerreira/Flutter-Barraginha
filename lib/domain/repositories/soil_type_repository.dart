import 'package:flutter_barraginha/app/shared/database/entities/soil_type.dart';

abstract class SoilTypeRepository {
  List<SoilType> getAll();
  SoilType getById(int id);
}
