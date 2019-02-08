/*
 * device_info.dart
 * flutter_panda_foundation
 *
 * Developed by zhudelun on 2/8/19 1:49 AM.
 * Copyright (c) 2019 by Farfetch. All rights reserved.
 *
 */

import 'dart:io' show Platform;

class DeviceInfo {
  static bool isAppleDevice() {
    return isIosDevice() || isMacOSDevice();
  }

  static bool isIosDevice() {
    return Platform.isIOS;
  }

  static bool isMacOSDevice() {
    return Platform.isMacOS;
  }

  static bool isAndroidDevice() {
    return Platform.isAndroid;
  }
}
