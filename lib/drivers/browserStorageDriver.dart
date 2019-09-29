import 'dart:html';
import 'dart:async';
import 'package:plugfox_localstorage/drivers/baseStorageDriver.dart';
export 'package:plugfox_localstorage/drivers/baseStorageDriver.dart';

StorageDriver createStorageDriver() => BrowserStorageDriver();

class BrowserStorageDriver implements StorageDriver {
  Storage _storage;
  BrowserStorageDriver();
  String operator [](String key) => this._storage[key];
  void operator []=(String key, String value) => this._storage[key] = value;
  Future<void> init() async => this._storage = window.localStorage;
  Future<void> close() async => this._storage = null;
}