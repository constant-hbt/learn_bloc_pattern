import 'package:bloc_pattern/src/shared/routes/routes.dart';
import 'package:bloc_pattern/src/shared/themes/app_color_scheme.dart';
import 'package:bloc_pattern/src/shared/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';

class ListItemsWidget extends StatelessWidget {
  const ListItemsWidget({super.key});

  static const Map<String, String> _imagesInfo = {
    "Settings": "settings.png",
    "Payment details": "credit-card.png",
    "Achievement": "award.png",
    "Love": "heart_1.png",
    "Reminders": "cube.png",
  };

  Widget _buildItem(
    BuildContext context,
    String description,
    String imagePath,
  ) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: InkWell(
          onTap: () => Navigator.of(context).pushNamed(AppRouteNames.SETTINGS),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColorScheme.primaryElement,
                ),
                child: Image.asset('assets/icons/$imagePath'),
              ),
              BaseTextWidget(description),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _imagesInfo.entries
          .map((imageInfo) =>
              _buildItem(context, imageInfo.key, imageInfo.value))
          .toList(),
    );
  }
}
