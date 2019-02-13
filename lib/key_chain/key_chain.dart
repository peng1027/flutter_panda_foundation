/*
 * key_chain.dart
 * flutter_panda_foundation
 *
 * Developed by zhudelun on 2/8/19 1:49 AM.
 * Copyright (c) 2019 by Farfetch. All rights reserved.
 *
 */

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_panda_platform/flutter_panda_platform.dart';

class KeyChainKeys {
  static int get username => 0;
  static int get password => username + 1;
  static int get authToken => password + 1;

  final int _typeValue;
  final String _rawValue;

  int get type => this._typeValue;
  String get rawValue => this._rawValue;

  KeyChainKeys(this._typeValue, this._rawValue);

  static KeyChainKeys get UserName => KeyChainKeys(username, "${NativeBundle.keychain_name}.username");
  static KeyChainKeys get Password => KeyChainKeys(password, "${NativeBundle.keychain_name}.password");
  static KeyChainKeys get AuthToken => KeyChainKeys(authToken, "${NativeBundle.keychain_name}.token");
}

class KeyChainHelper {
  static final KeyChainHelper _instance = new KeyChainHelper._();
  factory KeyChainHelper() => _instance;
  KeyChainHelper._() {
    _values = Map<String, String>();
    _storage = FlutterSecureStorage();
    _readAll();
  }

  // public

  String get username => _values[KeyChainKeys.UserName.rawValue];
  String get password => _values[KeyChainKeys.Password.rawValue];
  String get authToken => _values[KeyChainKeys.AuthToken.rawValue];

  void persist(String username, String password) {
    this._write(KeyChainKeys.UserName.rawValue, username);
    this._write(KeyChainKeys.Password.rawValue, password);
  }

  void persistAuthToken(String token) {
    this._write(KeyChainKeys.AuthToken.rawValue, token);
  }

  void deletePersistedUsernameAndPassword() {
    this._delete(KeyChainKeys.UserName.rawValue);
    this._delete(KeyChainKeys.Password.rawValue);
  }

  void deletePersistedAuthToken() {
    this._delete(KeyChainKeys.AuthToken.rawValue);
  }

  void deleteAllKeychainAccounts() {
    this._deleteAll();
  }

  // private helpers

  void _readAll() => _storage.readAll().then((allValues) => _values.addAll(allValues)).catchError((error) => throw "fails in read data from keychain.");

  void _write(String key, String value) {
    _values[key] = value;
    _storage.write(key: key, value: value);
  }

  void _delete(String key) {
    _values.remove(key);
    _storage.delete(key: key);
  }

  void _deleteAll() {
    _values.clear();
    _storage.deleteAll();
  }

  FlutterSecureStorage _storage;
  Map<String, String> _values;
}
