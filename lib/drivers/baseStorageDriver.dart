import 'dart:async';

abstract class StorageDriver {
  Map<String, String> _storage;
  StorageDriver();
  String operator [](String key) => this._storage[key];
  void operator []=(String key, String value) => this._storage[key] = value;
  Future<void> init() async => this._storage = <String, String>{};
  Future<void> close() async => this._storage = null;
}
