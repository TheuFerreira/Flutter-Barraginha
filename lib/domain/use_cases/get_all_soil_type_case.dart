import 'package:flutter_barraginha/app/shared/database/entities/soil_type.dart';
import 'package:flutter_barraginha/domain/repositories/soil_type_repository.dart';

abstract class GetAllSoilTypeCase {
  Future<List<SoilType>> call();
}

class GetAllSoilTypeCaseImpl implements GetAllSoilTypeCase {
  final SoilTypeRepository _soilTypeRepository;

  GetAllSoilTypeCaseImpl(this._soilTypeRepository);

  @override
  Future<List<SoilType>> call() async {
    final soilTypes = await _soilTypeRepository.getAll();
    return soilTypes;
  }
}
