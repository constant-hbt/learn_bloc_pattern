import 'package:bloc_pattern/src/pages/application/bloc/application_bloc.dart';
import 'package:bloc_pattern/src/pages/application/bloc/application_events.dart';
import 'package:bloc_pattern/src/pages/settings/settings_controller.dart';
import 'package:bloc_pattern/src/shared/routes/routes.dart';
import 'package:bloc_pattern/src/shared/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late final SettingsController settingsController;

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: const BaseTextWidget('Settings'),
    );
  }

  void _logout() async {
    if (await settingsController.logoutUser() && context.mounted) {
      context.read<ApplicationBloc>().add(const TriggerApplicationEvent(0));
      Navigator.of(context)
          .pushNamedAndRemoveUntil(AppRouteNames.SIGN_IN, (route) => false);
    }
  }

  void _showConfirmLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm logout'),
          content: const Text('Confirm logout'),
          actions: [
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel')),
            TextButton(
              onPressed: _logout,
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    settingsController = SettingsController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: _showConfirmLogoutDialog,
                  child: SizedBox(
                    height: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/icons/Logout.png',
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
