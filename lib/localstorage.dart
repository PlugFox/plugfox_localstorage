library plugfox_localstorage;

import 'dart:async';
import 'package:plugfox_localstorage/drivers/stubStorageDriver.dart'
  // ignore: uri_does_not_exist
  if (dart.library.html) 'package:plugfox_localstorage/drivers/browserStorageDriver.dart'
  // ignore: uri_does_not_exist
  if (dart.library.io) 'package:plugfox_localstorage/drivers/mobileStorageDriver.dart';

class LocalStorage {
  final StorageDriver _lcl = createStorageDriver();
  final Map<String,String> _mem = <String,String>{};
  String _get(String key) => key?.isEmpty ?? true ? '' : this._mem[key] ?? (this._lcl[key] ?? '');
  void _set(String key, dynamic value) {
    if (key?.isEmpty ?? true) return;
    final String valueString = this._map(value);
    this._lcl[key] = valueString;
    this._mem[key] = valueString;
  }
  String _map(dynamic value) => value is String ? value : value?.toString() ?? '';
  String operator [](String key) => _get(key);
  void operator []=(String key, dynamic value) => _set(key, value);
  Future<void> init() async => this._lcl.init();
  Future<void> close() async {
    this._mem.clear();
    await this._lcl.close();
  }
  @override
  String toString() => '<LocalStorage instance>';
  @override
  int get hashCode => 0;
  @override
  bool operator ==(Object object) => Object is LocalStorage;
  // SINGLETON +
  static final LocalStorage _this = LocalStorage._internal();
  factory LocalStorage() => _this;
  LocalStorage._internal();
  // SINGLETON -
}