import 'package:bloc_pattern/src/shared/themes/app_color_scheme.dart';
import 'package:bloc_pattern/src/shared/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';

class BuildFunctions {
  static AppBar buildAppBar(String title) {
    return AppBar(
      title: BaseTextWidget(
        title,
        fontWeight: FontWeight.normal,
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          height: 1,
          color: AppColorScheme.primarySecondaryBackground,
        ),
      ),
    );
  }
}
