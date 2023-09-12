import 'package:bloc_pattern/src/pages/home/widgets/hello_user_widget.dart';
import 'package:bloc_pattern/src/pages/home/widgets/home_widgets.dart';
import 'package:bloc_pattern/src/pages/home/widgets/search_view_widget.dart';
import 'package:bloc_pattern/src/pages/home/widgets/slider_view_widget.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeWidgets.buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HelloUserWidget(
                userName: 'Henrique',
              ),
              const SizedBox(
                height: 20,
              ),
              const SearchViewWidget(),
              const SizedBox(
                height: 20,
              ),
              SliderViewWidget(
                pathImages: sliderViewImages,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
