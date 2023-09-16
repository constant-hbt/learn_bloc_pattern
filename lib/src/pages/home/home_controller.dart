import 'package:bloc_pattern/src/global.dart';
import 'package:bloc_pattern/src/shared/models/entities.dart';
import 'package:flutter/widgets.dart';

class HomeController {
  final BuildContext context;
  late final UserItem? userProfile;

  HomeController(this.context) {
    userProfile = Global.storageService.getUserProfile();
  }

  void init() {
    debugPrint('home controller initialized');
  }
}
