/*
 * device_spec_test.dart
 * flutter_panda_foundation
 *
 * Developed by zhudelun on 1/29/19 10:12 PM
 * Copyright (c) 2019. Farfetch. All rights reserved.
 */

import 'package:flutter_test/flutter_test.dart';

import '../lib/utils/device_info.dart';

void main() {
  test("Device info testing...", () {
    expect(DeviceInfo.isAppleDevice(), true);
    expect(DeviceInfo.isIosDevice(), false);
    expect(DeviceInfo.isMacOSDevice(), true);
    expect(DeviceInfo.isAndroidDevice(), false);
  });
}
