import 'dart:convert';
import 'package:bloc_pattern/src/shared/models/entities.dart';
import 'package:bloc_pattern/src/shared/values/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  // ignore: unused_field
  late final SharedPreferences _prefs;

  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  bool getDeviceFirstOpen() {
    return _prefs.getBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME) ?? false;
  }

  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  bool getIsLoggedIn() {
    return _prefs.getString(AppConstants.STORAGE_USER_TOKEN_KEY) != null;
  }

  Future<bool> remove(String key) async {
    return await _prefs.remove(key);
  }

  UserItem? getUserProfile() {
    String profileOffline =
        _prefs.getString(AppConstants.STORAGE_USER_PROFILE_KEY) ?? '';

    if (profileOffline.isNotEmpty) {
      return UserItem.fromJson(jsonDecode(profileOffline));
    }

    return null;
  }

  // const StorageService._();

  // static final StorageService instance = StorageService._();

  // static SharedPreferences? _prefs;

  // Future<SharedPreferences> get prefs async {
  //   if (_prefs != null) return _prefs!;

  //   _prefs = await SharedPreferences.getInstance();
  //   return _prefs!;
  // }
}
