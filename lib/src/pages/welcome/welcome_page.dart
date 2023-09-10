import 'package:bloc_pattern/src/global.dart';
import 'package:bloc_pattern/src/pages/welcome/blocs/welcome_bloc.dart';
import 'package:bloc_pattern/src/pages/welcome/blocs/welcome_events.dart';
import 'package:bloc_pattern/src/pages/welcome/blocs/welcome_states.dart';
import 'package:bloc_pattern/src/pages/welcome/widgets/page_widget.dart';
import 'package:bloc_pattern/src/shared/values/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_pattern/src/shared/routes/routes.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _LandingPageState();
}

class _LandingPageState extends State<WelcomePage> {
  final _controller = PageController();

  void _changePage(index) {
    if (index < 2) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    } else {
      Global.storageService
          .setBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME, true);
      Navigator.of(context).pushNamedAndRemoveUntil(
        AppRouteNames.SIGN_IN,
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (BuildContext context, state) {
            final bloc = BlocProvider.of<WelcomeBloc>(context);
            return PageView(
              controller: _controller,
              onPageChanged: (index) {
                return bloc.add(WelcomeEvent(page: index));
              },
              children: [
                PageWidget(
                  index: 0,
                  buttonName: 'next',
                  title: 'First See Learning',
                  subTitle:
                      'Forget about a for paper knowledge in one learning',
                  imagePath: 'assets/images/reading.png',
                  func: _changePage,
                ),
                PageWidget(
                  index: 1,
                  buttonName: 'next',
                  title: 'Connect With Everyone',
                  subTitle:
                      "Always keep in touch with your tutor & friend. Let's get connected",
                  imagePath: 'assets/images/boy.png',
                  func: _changePage,
                ),
                PageWidget(
                  index: 2,
                  buttonName: 'get started',
                  title: 'Always Fascinated Learning',
                  subTitle:
                      'Anywhere, anytime. The time is at our discrition, so study whenever you want',
                  imagePath: 'assets/images/man.png',
                  func: _changePage,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
