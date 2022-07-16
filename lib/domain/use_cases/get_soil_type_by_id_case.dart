import 'package:flutter_barraginha/app/shared/database/entities/soil_type.dart';
import 'package:flutter_barraginha/domain/repositories/soil_type_repository.dart';

abstract class GetSoilTypeByIdCase {
  Future<SoilType> call(int idSoilType);
}

class GetSoilTypeByIdCaseImpl implements GetSoilTypeByIdCase {
  final SoilTypeRepository _soilTypeRepository;

  GetSoilTypeByIdCaseImpl(this._soilTypeRepository);

  @override
  Future<SoilType> call(int idSoilType) async {
    final soilType = await _soilTypeRepository.getById(idSoilType);
    return soilType;
  }
}
