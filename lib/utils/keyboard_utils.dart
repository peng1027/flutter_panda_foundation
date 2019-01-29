/*
 * keyboard_utils.dart
 * flutter_panda_foundation
 *
 * Developed by zhudelun on 1/29/19 10:12 PM
 * Copyright (c) 2019. Farfetch. All rights reserved.
 */

import 'package:flutter/widgets.dart';

void dismissKeyboard(BuildContext context) {
  debugPrint("** dismissKeyboard called.");
  FocusScope.of(context).requestFocus(new FocusNode());
}
