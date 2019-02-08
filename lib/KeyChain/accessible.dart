/*
 * accessible.dart
 * flutter_panda_foundation
 *
 * Developed by zhudelun on 2/8/19 1:54 AM.
 * Copyright (c) 2019 by Farfetch. All rights reserved.
 *
 */

import '../common/enum_type.dart';

class Accessible extends EnumType<int, String> {
  static const int whenUnlocked = 0;
  static const int afterFirstUnlock = whenUnlocked + 1;
  static const int always = afterFirstUnlock + 1;
  static const int whenUnlockedThisDeviceOnly = always + 1;
  static const int afterFirstUnlockThisDeviceOnly = whenUnlockedThisDeviceOnly + 1;
  static const int alwaysThisDeviceOnly = afterFirstUnlockThisDeviceOnly + 1;

  const Accessible(int type, String value) : super(type, value);
}
