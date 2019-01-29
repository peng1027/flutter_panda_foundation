/*
 * device_info.dart
 * flutter_panda_foundation
 *
 * Developed by zhudelun on 1/29/19 10:12 PM
 * Copyright (c) 2019. Farfetch. All rights reserved.
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
