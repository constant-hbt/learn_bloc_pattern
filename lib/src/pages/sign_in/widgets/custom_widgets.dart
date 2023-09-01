import 'package:flutter/material.dart';

class CustomWidgets {
  static AppBar buildAppBar(String title) {
    return AppBar(
      title: Text(title),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          height: 1,
          color: Colors.grey.withOpacity(0.5),
        ),
      ),
    );
  }

  static Widget reusableText(String text) => Container(
        margin: const EdgeInsets.only(
          bottom: 5,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.grey.withOpacity(0.8),
            fontWeight: FontWeight.normal,
            fontSize: 14,
          ),
        ),
      );
}
