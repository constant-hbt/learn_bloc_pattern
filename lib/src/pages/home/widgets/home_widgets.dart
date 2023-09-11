import 'package:flutter/material.dart';

class HomeWidgets {
  static AppBar buildAppBar() {
    return AppBar(
      title: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {},
              child: SizedBox(
                height: 12,
                width: 15,
                child: Image.asset(
                  'assets/icons/menu.png',
                ),
              ),
            ),
            GestureDetector(
              child: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/icons/person.png'),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
