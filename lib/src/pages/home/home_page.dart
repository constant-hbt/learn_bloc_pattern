import 'package:bloc_pattern/src/pages/home/widgets/hello_user_widget.dart';
import 'package:bloc_pattern/src/pages/home/widgets/menu_view_widget.dart';
import 'package:bloc_pattern/src/pages/home/widgets/search_view_widget.dart';
import 'package:bloc_pattern/src/pages/home/widgets/slider_view_widget.dart';
import 'package:bloc_pattern/src/pages/home/widgets/sliver_menu_items_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: HelloUserWidget(
                userName: 'Henrique',
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
