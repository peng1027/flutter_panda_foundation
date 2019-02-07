import 'package:flutter_test/flutter_test.dart';
import '../../lib/utils/device_info.dart';

void main() {
  testDeviceInfo();
}

void testDeviceInfo() {
  test("Device info testing...", () {
    expect(DeviceInfo.isAppleDevice(), true);
    expect(DeviceInfo.isIosDevice(), false);
    expect(DeviceInfo.isMacOSDevice(), true);
    expect(DeviceInfo.isAndroidDevice(), false);
  });
}
