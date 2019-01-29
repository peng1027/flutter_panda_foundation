/*
 * enum_type.dart
 * flutter_panda_foundation
 *
 * Developed by zhudelun on 1/31/19 1:15 AM
 * Copyright (c) 2019. Farfetch. All rights reserved.
 */

class EnumType<T, V> {
  final T typeValue;
  final V rawValue;

  EnumType({this.typeValue, this.rawValue});
}

class EnumValue<V> {
  final V rawValue;

  EnumValue({this.rawValue});
}