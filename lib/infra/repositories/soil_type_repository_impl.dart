import 'package:flutter_barraginha/domain/entities/soil_type.dart';
import 'package:flutter_barraginha/domain/repositories/soil_type_repository.dart';
import 'package:flutter_barraginha/infra/utils/soil_types.dart';

class SoilTypeRepositoryImpl implements SoilTypeRepository {
  @override
  List<SoilType> getAll() {
    return soilTypes;
  }

  @override
  SoilType getById(int id) =>
      soilTypes.where((element) => element.id == id).first;
}
