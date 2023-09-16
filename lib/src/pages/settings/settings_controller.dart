import 'package:bloc_pattern/src/global.dart';
import 'package:bloc_pattern/src/shared/values/app_constants.dart';
import 'package:flutter/foundation.dart';

class SettingsController {
  Future<bool> logoutUser() async {
    try {
      await Global.storageService.remove(AppConstants.STORAGE_USER_TOKEN_KEY);
      await Global.storageService.remove(AppConstants.STORAGE_USER_PROFILE_KEY);

      return true;
    } catch (e) {
      debugPrint('Logout User Error: $e');
    }

    return false;
  }
}
