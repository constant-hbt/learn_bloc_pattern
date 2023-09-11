import 'package:flutter/material.dart';

class SliderViewWidget extends StatelessWidget {
  const SliderViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: PageView(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/icons/art.png'),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
