import 'package:flutter_barraginha/app/shared/database/entities/soil_type.dart';
import 'package:flutter_barraginha/domain/repositories/soil_type_repository.dart';

abstract class GetSoilTypeByIdCase {
  SoilType call(int idSoilType);
}

class GetSoilTypeByIdCaseImpl implements GetSoilTypeByIdCase {
  final SoilTypeRepository _soilTypeRepository;

  GetSoilTypeByIdCaseImpl(this._soilTypeRepository);

  @override
  SoilType call(int idSoilType) {
    final soilType = _soilTypeRepository.getById(idSoilType);
    return soilType;
  }
}
