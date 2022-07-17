import 'package:flutter_barraginha/domain/services/device_service.dart';
import 'package:package_info_plus/package_info_plus.dart';

class DeviceServiceImpl implements DeviceService {
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
