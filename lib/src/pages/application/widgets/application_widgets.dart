import 'package:flutter/material.dart';

class ApplicationWidgets {
  static Widget buildPage(int index) {
    List<Widget> pages = [
      const Center(child: Text("Home")),
      const Center(child: Text("Search")),
      const Center(child: Text("Course")),
      const Center(child: Text("Chat")),
      const Center(child: Text("Profile")),
    ];

    return pages[index];
  }
}
