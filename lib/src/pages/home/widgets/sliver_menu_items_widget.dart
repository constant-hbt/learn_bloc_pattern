import 'package:bloc_pattern/src/shared/themes/app_color_scheme.dart';
import 'package:bloc_pattern/src/shared/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';

class SliverMenuItemsWidget extends StatelessWidget {
  const SliverMenuItemsWidget({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 1.6,
        ),
        delegate: SliverChildBuilderDelegate(
          childCount: images.length,
          (BuildContext context, int index) {
            return InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(images[index]),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(
                    left: 12,
                    bottom: 12,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BaseTextWidget(
                        'Best course for IT and Engineering',
                        color: AppColorScheme.primaryElementText,
                        fontSize: 11,
                        margin: EdgeInsets.only(bottom: 5),
                      ),
                      BaseTextWidget(
                        'Flutter best course',
                        color: AppColorScheme.primaryFourElementText,
                        textOverflow: TextOverflow.fade,
                        fontWeight: FontWeight.normal,
                        fontSize: 8,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
