import 'package:flutter_barraginha/app/shared/database/entities/soil_type.dart';

abstract class ISoilTypeRepository {
  List<SoilType> getAll();
  SoilType getById(int id);
}

class SoilTypeRepository implements ISoilTypeRepository {
  final List<SoilType> _soilTypes = [
    SoilType(id: 1, text: "Latossolo", value: 1.25),
    SoilType(id: 2, text: "Argissolos", value: 0.95),
    SoilType(id: 3, text: "Cambissolos", value: 0.75),
  ];

  @override
  List<SoilType> getAll() {
    return _soilTypes;
  }

  @override
  SoilType getById(int id) =>
      _soilTypes.where((element) => element.id == id).first;
}
