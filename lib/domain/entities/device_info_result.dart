class DeviceInfoResult {
  final String name;
  final String version;

  DeviceInfoResult({required this.name, required this.version});

  @override
  String toString() => '$name $version';
}
