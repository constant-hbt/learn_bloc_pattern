import 'package:bloc_pattern/src/shared/themes/app_color_scheme.dart';
import 'package:bloc_pattern/src/shared/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';

class SearchViewWidget extends StatelessWidget {
  const SearchViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CustomOutlinedTextFieldWidget(
                hintText: 'search your course',
                icon: Image.asset('assets/icons/search.png'),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                  border: Border.all(color: AppColorScheme.primaryElement),
                  color: AppColorScheme.primaryElement,
                ),
                child: Image.asset('assets/icons/options.png'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
