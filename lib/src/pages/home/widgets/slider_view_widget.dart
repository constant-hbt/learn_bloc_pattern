import 'package:bloc_pattern/src/pages/home/bloc/home_blocs.dart';
import 'package:bloc_pattern/src/pages/home/bloc/home_events.dart';
import 'package:bloc_pattern/src/pages/home/bloc/home_states.dart';
import 'package:bloc_pattern/src/shared/themes/app_color_scheme.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliderViewWidget extends StatelessWidget {
  const SliderViewWidget({
    super.key,
    required this.pathImages,
  });

  final List<String> pathImages;

  Widget _slidersContainer(String imagePath) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(imagePath),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final images = pathImages.isEmpty ? ["assets/icons/art.png"] : pathImages;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: PageView(
            onPageChanged: (index) =>
                context.read<HomeBlocs>().add(HomeDots(index)),
            children: images
                .map((imagePath) => _slidersContainer(imagePath))
                .toList(),
          ),
        ),
        BlocBuilder<HomeBlocs, HomeStates>(
          builder: (context, state) {
            return Container(
              padding: const EdgeInsets.only(top: 4),
              child: DotsIndicator(
                dotsCount: images.length,
                position: state.index,
                decorator: DotsDecorator(
                  color: AppColorScheme.primaryThreeElementText,
                  activeColor: AppColorScheme.primaryElement,
                  size: const Size.square(8),
                  activeSize: const Size(16, 8),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
