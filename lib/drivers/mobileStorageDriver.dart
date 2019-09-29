import 'dart:async';
import 'package:local_storage/drivers/baseStorageDriver.dart';
import 'package:shared_preferences/shared_preferences.dart';
export 'package:local_storage/drivers/baseStorageDriver.dart';

StorageDriver createStorageDriver() => MobileStorageDriver();

class MobileStorageDriver implements StorageDriver {
  SharedPreferences _storage;
  MobileStorageDriver();
  String operator [](String key) => this._storage.getString(key);
  void operator []=(String key, String value) => this._storage.setString(key, value);
  Future<void> init() async => this._storage = await SharedPreferences.getInstance();
  Future<void> close() async => this._storage = null;
}