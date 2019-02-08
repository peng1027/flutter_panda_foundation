/*
 * uuid_utils.dart
 * flutter_panda_foundation
 *
 * Developed by zhudelun on 2/8/19 1:49 AM.
 * Copyright (c) 2019 by Farfetch. All rights reserved.
 *
 */

import 'package:uuid/uuid.dart';

class UUID {
  static String uuidString() => Uuid().v4();
}
