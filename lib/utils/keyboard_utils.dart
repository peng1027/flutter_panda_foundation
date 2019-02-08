/*
 * keyboard_utils.dart
 * flutter_panda_foundation
 *
 * Developed by zhudelun on 2/8/19 1:49 AM.
 * Copyright (c) 2019 by Farfetch. All rights reserved.
 *
 */

import 'package:flutter/widgets.dart';

void dismissKeyboard(BuildContext context) {
  debugPrint("** dismissKeyboard called.");
  FocusScope.of(context).requestFocus(new FocusNode());
}
