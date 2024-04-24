import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  final _secureStorage = const FlutterSecureStorage();

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  Future<void> writeSecureData(
    String key,
    String data,
  ) async {
    debugPrint("Writing new data having key ${key}");
    await _secureStorage.write(
        key: key, value: data, aOptions: _getAndroidOptions());
  }

  Future<String?> readSecureData(String key) async {
    debugPrint("Reading data having key $key");
    var readData =
        await _secureStorage.read(key: key, aOptions: _getAndroidOptions());
    return readData;
  }

  Future<void> deleteAllSecureData() async {
    debugPrint("Deleting all secured data");
    await _secureStorage.deleteAll(aOptions: _getAndroidOptions());
  }

  Future<bool> containsKeyInSecureData(String key) async {
    debugPrint("Checking data for the key $key");
    var containsKey = await _secureStorage.containsKey(
        key: key, aOptions: _getAndroidOptions());
    return containsKey;
  }

  Future<bool> isFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    bool returnValue = false;
    if (prefs.getBool('first_run') ?? true) {
      returnValue = true;
      await StorageService().deleteAllSecureData();
      await prefs.setBool('first_run', false);
    } else {
      returnValue = false;
    }
    return returnValue;
  }
}
