import 'package:plugfox_localstorage/drivers/baseStorageDriver.dart';
export 'package:plugfox_localstorage/drivers/baseStorageDriver.dart';

/// Implemented in `browser_client.dart` and `io_client.dart`.
StorageDriver createStorageDriver() => throw UnsupportedError('Cannot create a client without dart:html or dart:io.');