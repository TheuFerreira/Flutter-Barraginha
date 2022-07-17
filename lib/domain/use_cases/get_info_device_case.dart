import 'package:flutter_barraginha/domain/entities/device_info_result.dart';
import 'package:flutter_barraginha/domain/services/device_service.dart';

abstract class GetInfoDeviceCase {
  Future<DeviceInfoResult> call();
}

class GetInfoDeviceCaseImpl implements GetInfoDeviceCase {
  final DeviceService _deviceService;

  GetInfoDeviceCaseImpl(this._deviceService);

  @override
  Future<DeviceInfoResult> call() async {
    String name = await _deviceService.getName();
    String version = await _deviceService.getVersion();

    final info = DeviceInfoResult(
      name: name,
      version: version,
    );

    return info;
  }
}
