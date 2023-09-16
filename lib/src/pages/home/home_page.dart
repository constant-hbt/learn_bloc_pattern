import 'package:bloc_pattern/src/pages/home/home_controller.dart';
import 'package:bloc_pattern/src/pages/home/widgets/hello_user_widget.dart';
import 'package:bloc_pattern/src/pages/home/widgets/menu_view_widget.dart';
import 'package:bloc_pattern/src/pages/home/widgets/search_view_widget.dart';
import 'package:bloc_pattern/src/pages/home/widgets/slider_view_widget.dart';
import 'package:bloc_pattern/src/pages/home/widgets/sliver_menu_items_widget.dart';
import 'package:bloc_pattern/src/shared/values/app_constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeController _controller;

  final List<String> sliderViewImages = [
    "assets/icons/art.png",
    "assets/icons/image_1.png",
    "assets/icons/image_2.png",
  ];

  final List<String> sliverMenuImages = [
    "assets/icons/image_1.png",
    "assets/icons/image_2.png",
    "assets/icons/image_3.png",
    'assets/icons/image_4.png',
  ];

  Widget _spacing({EdgeInsets space = const EdgeInsets.only(top: 16)}) {
    return SliverPadding(padding: space);
  }

  Image getAvatarImage(String? imgUrl) {
    final Image defaultAvatar = Image.asset(
      'assets/icons/person.png',
      width: 40,
      height: 40,
      fit: BoxFit.cover,
    );

    if (imgUrl != null && imgUrl.isNotEmpty) {
      return Image.network(
        '${AppConstants.SERVER_API_URL}$imgUrl',
        width: 40,
        height: 40,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return defaultAvatar;
        },
      );
    }

    return defaultAvatar;
  }

  AppBar _buildAppBar() {
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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: getAvatarImage(_controller.userProfile?.avatar),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = HomeController(context);
    _controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: HelloUserWidget(
                userName: _controller.userProfile?.name ?? '',
              ),
            ),
            _spacing(),
            const SliverToBoxAdapter(
              child: SearchViewWidget(),
            ),
            _spacing(),
            SliverToBoxAdapter(
              child: SliderViewWidget(
                pathImages: sliderViewImages,
              ),
            ),
            _spacing(),
            const SliverToBoxAdapter(
              child: MenuViewWidget(),
            ),
            SliverMenuItemsWidget(
              images: sliverMenuImages,
            ),
          ],
        ),
      ),
    );
  }
}
