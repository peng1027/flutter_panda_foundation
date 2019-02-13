/*
 * error_type.dart
 * flutter_panda_foundation
 *
 * Developed by zhudelun on 2/15/19 12:43 AM.
 * Copyright (c) 2019 by Farfetch. All rights reserved.
 *
 */

import 'package:meta/meta.dart';

abstract class ErrorType {}

class CommonError implements ErrorType {
  final String description;

  const CommonError({@required this.description});
}
