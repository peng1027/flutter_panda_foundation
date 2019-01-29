/*
 * KeyValueStore.dart
 * flutter_panda_foundation
 *
 * Developed by zhudelun on 1/29/19 10:12 PM
 * Copyright (c) 2019. Farfetch. All rights reserved.
 */

import 'dart:core';
import 'package:shared_preferences/shared_preferences.dart';

class KeyValueStore {
  factory KeyValueStore() => _getInstance();
  static KeyValueStore get instance => _getInstance();
  static KeyValueStore _instance;

  KeyValueStore._internal();

  static KeyValueStore _getInstance() {
    if (_instance == null) {
      _instance = new KeyValueStore._internal();
    }
    return _instance;
  }

  void synchronize() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.commit();
  }

  void resetAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Set<String> allKeys = prefs.getKeys();
    for (String eachKey in allKeys) {
      prefs.remove(eachKey);
    }
  }

  void setIntForKey(int value, String key) {
    this.setObjectForKey(value, key);
  }

  int intForKey(String key) {
    dynamic obj = this.objectForKey(key);
    if (obj is int) {
      return obj;
    } else {
      return null;
    }
  }

  void setDoubleForKey(double value, String key) {
    this.setObjectForKey(value, key);
  }

  double doubleForKey(String key) {
    dynamic obj = this.objectForKey(key);
    if (obj is double) {
      return obj;
    } else {
      return null;
    }
  }

  void setBoolForKey(bool value, String key) {
    this.setObjectForKey(value, key);
  }

  bool boolForKey(String key) {
    dynamic obj = this.objectForKey(key);
    if (obj is bool) {
      return obj;
    } else {
      return null;
    }
  }

  void setStringForKey(String value, String key) {
    this.setObjectForKey(value, key);
  }

  String stringForKey(String key) {
    dynamic obj = this.objectForKey(key);
    if (obj is String) {
      return obj;
    } else {
      return null;
    }
  }

  void setStringListForKey(List<String> value, String key) {
    this.setObjectForKey(value, key);
  }

  List<String> stringListForKey(String key) {
    dynamic obj = this.objectForKey(key);
    if (obj is List<String>) {
      return obj;
    } else {
      return null;
    }
  }

  void setStringSetForKey(Set<String> value, String key) {
    this.setObjectForKey(value, key);
  }

  Set<String> stringSetForKey(String key) {
    dynamic obj = this.objectForKey(key);
    if (obj is List<String>) {
      return obj.toSet();
    } else {
      return null;
    }
  }

  dynamic operator [](String key) {
    return this.objectForKey(key);
  }

  void setObjectForKey(dynamic value, String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value is int) {
      prefs.setInt(key, value);
    } else if (value is double) {
      prefs.setDouble(key, value);
    } else if (value is bool) {
      prefs.setBool(key, value);
    } else if (value is String) {
      prefs.setString(key, value);
    } else if (value is List<String>) {
      prefs.setStringList(key, value);
    } else if (value is Set<String>) {
      prefs.setStringList(key, value.toList());
    } else {
      assert(false, "** fatal: un-supported value type");
    }
  }

  dynamic objectForKey(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }

  void removeObject(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  static String get _isBiometricEnabled => "FFSUserDefaultKeyEnableTouchId";
  static String get _isBiometricRequested =>
      "FFSUserDefaultKeyRequestedBiometricId";

  bool isBiometricEnabled() => this[KeyValueStore._isBiometricEnabled];
  void setIsBiometricEnabled(bool enable) =>
      this.setBoolForKey(enable, KeyValueStore._isBiometricEnabled);

  bool isBiometricRequested() => this[KeyValueStore._isBiometricRequested];
  void setIsBiometricRequested(bool enable) =>
      this.setBoolForKey(enable, KeyValueStore._isBiometricRequested);
}
