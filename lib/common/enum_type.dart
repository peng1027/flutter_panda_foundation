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

  const EnumType({this.typeValue, this.rawValue});

  operator ==(EnumType<T, V> other) => (this.typeValue == other.typeValue && this.rawValue == other.rawValue);
}

class EnumValue<V> {
  final V rawValue;

  const EnumValue({this.rawValue});

  operator ==(EnumValue<V> other) => this.rawValue == other.rawValue;
}
