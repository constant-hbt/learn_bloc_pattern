import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FlutterToast {
  static Future<bool?> toastInfo({
    required String msg,
    Color backgroundColor = Colors.black,
    Color textColor = Colors.white,
  }) {
    return Fluttertoast.showToast(
      msg: msg,
      backgroundColor: backgroundColor,
      textColor: textColor,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 2,
      fontSize: 16,
    );
  }
}
