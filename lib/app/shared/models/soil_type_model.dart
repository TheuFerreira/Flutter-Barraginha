class SoilTypeModel {
  final String text;
  final double value;

  SoilTypeModel(this.text, this.value);

  Map<String, dynamic> toMap() => {
        'text': text,
        'value': value,
      };
}

List<SoilTypeModel> soilTypes = [
  SoilTypeModel("Latossolo", 1.25),
  SoilTypeModel("Argissolos", 0.95),
  SoilTypeModel("Cambissolos", 0.75),
];
