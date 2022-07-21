import 'package:flutter_barraginha/domain/entities/soil_type.dart';

abstract class SoilTypeRepository {
  List<SoilType> getAll();
  SoilType getById(int id);
}
