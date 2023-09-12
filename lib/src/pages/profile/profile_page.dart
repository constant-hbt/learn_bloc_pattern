import 'package:bloc_pattern/src/pages/profile/widgets/list_items_widget.dart';
import 'package:bloc_pattern/src/pages/profile/widgets/profile_image_edit_widget.dart';
import 'package:bloc_pattern/src/shared/themes/app_color_scheme.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  AppBar _buildAppBar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 18,
            height: 12,
            child: Image.asset('assets/icons/menu.png'),
          ),
          const Text(
            'Profile',
            style: TextStyle(
              color: AppColorScheme.primaryText,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(
            width: 24,
            height: 24,
            child: Image.asset('assets/icons/more-vertical.png'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ProfileImageEditWidget(),
                SizedBox(
                  height: 32,
                ),
                ListItemsWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
