import 'package:bloc_pattern/src/pages/application/widgets/application_widgets.dart';
import 'package:bloc_pattern/src/shared/themes/app_color_scheme.dart';
import 'package:flutter/material.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ApplicationWidgets.buildPage(_index),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColorScheme.primaryElement,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 1,
            )
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          onTap: (index) => setState(() => _index = index),
          currentIndex: _index,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.play_arrow_rounded), label: 'Course'),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
