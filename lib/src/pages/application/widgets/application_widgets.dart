import 'package:bloc_pattern/src/pages/home/home_page.dart';
import 'package:flutter/material.dart';

class ApplicationWidgets {
  static Widget buildPage(int index) {
    List<Widget> pages = [
      const HomePage(),
      const Center(child: Text("Search")),
      const Center(child: Text("Course")),
      const Center(child: Text("Chat")),
      const Center(child: Text("Profile")),
    ];

    return pages[index];
  }
}
