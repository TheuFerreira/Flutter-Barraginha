import 'package:package_info_plus/package_info_plus.dart';

abstract class IInfoService {
  Future<String> getName();
  Future<String> getVersion();
}

class InfoService implements IInfoService {
  @override
  Future<String> getName() async {
    final info = await PackageInfo.fromPlatform();
    return info.appName;
  }

  @override
  Future<String> getVersion() async {
    final info = await PackageInfo.fromPlatform();
    return info.version;
  }
}
