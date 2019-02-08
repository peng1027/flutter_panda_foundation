/*
 * enum_type.dart
 * flutter_panda_foundation
 *
 * Developed by zhudelun on 2/8/19 1:49 AM.
 * Copyright (c) 2019 by Farfetch. All rights reserved.
 *
 */

class EnumType<T, V> {
  final T typeValue;
  final V rawValue;

  const EnumType(this.typeValue, this.rawValue);

  int get hashCode => toString().hashCode;

  @override
  operator ==(dynamic other) => (this.typeValue == other.typeValue && this.rawValue == other.rawValue);

  String toString() => "[EnumType] type:${typeValue}, raw:${rawValue}";
}

class EnumValue<V> {
  final V rawValue;

  const EnumValue(this.rawValue);

  int get hashCode => toString().hashCode;

  @override
  operator ==(dynamic other) => this.rawValue == other.rawValue;

  String toString() => "[EnumValue] raw:${rawValue}";
}
