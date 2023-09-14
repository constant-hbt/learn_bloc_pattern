import 'package:bloc_pattern/src/global.dart';
import 'package:bloc_pattern/src/shared/values/app_constants.dart';

class SettingsController {
  Future<bool> logoutUser() async {
    return await Global.storageService
        .logout(AppConstants.STORAGE_USER_TOKEN_KEY);
  }
}
