import 'package:flutter_barraginha/app/shared/database/entities/soil_type.dart';
import 'package:flutter_barraginha/domain/repositories/soil_type_repository.dart';

abstract class GetAllSoilTypeCase {
  List<SoilType> call();
}

class GetAllSoilTypeCaseImpl implements GetAllSoilTypeCase {
  final SoilTypeRepository _soilTypeRepository;

  GetAllSoilTypeCaseImpl(this._soilTypeRepository);

  @override
  List<SoilType> call() {
    final soilTypes = _soilTypeRepository.getAll();
    return soilTypes;
  }
}
