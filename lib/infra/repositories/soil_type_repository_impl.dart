import 'package:flutter_barraginha/app/shared/database/entities/soil_type.dart';
import 'package:flutter_barraginha/domain/repositories/soil_type_repository.dart';
import 'package:flutter_barraginha/infra/utils/soil_types.dart';

class SoilTypeRepositoryImpl implements SoilTypeRepository {
  @override
  Future<List<SoilType>> getAll() async {
    return soilTypes;
  }

  @override
  Future<SoilType> getById(int id) async =>
      soilTypes.where((element) => element.id == id).first;
}
