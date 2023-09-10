import 'package:bloc_pattern/src/app_widget.dart';
import 'package:bloc_pattern/src/global.dart';
import 'package:flutter/material.dart';

void main() async {
  await Global.init();

  runApp(const App());
}
