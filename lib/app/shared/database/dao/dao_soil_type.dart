import 'package:flutter_barraginha/app/shared/models/soil_type_model.dart';

class DAOSoilType {
  final List<SoilTypeModel> _soilTypes = [
    SoilTypeModel(1, "Latossolo", 1.25),
    SoilTypeModel(2, "Argissolos", 0.95),
    SoilTypeModel(3, "Cambissolos", 0.75),
  ];

  List<SoilTypeModel> getAll() => _soilTypes;

  SoilTypeModel getById(int id) =>
      _soilTypes.where((element) => element.id == id).first;
}
