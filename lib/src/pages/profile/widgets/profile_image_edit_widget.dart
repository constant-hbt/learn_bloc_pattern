import 'package:flutter/material.dart';

class ProfileImageEditWidget extends StatelessWidget {
  const ProfileImageEditWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 80,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(0),
          child: Stack(
            children: [
              Image.asset('assets/icons/headpic.png'),
              Positioned(
                bottom: 0,
                right: 6,
                child: SizedBox(
                  child: Image.asset(
                    'assets/icons/edit_3.png',
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
