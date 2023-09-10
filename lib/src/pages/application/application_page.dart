import 'package:bloc_pattern/src/pages/application/bloc/application_bloc.dart';
import 'package:bloc_pattern/src/pages/application/bloc/application_events.dart';
import 'package:bloc_pattern/src/pages/application/bloc/application_states.dart';
import 'package:bloc_pattern/src/pages/application/widgets/app_navigation_bar_widget.dart';
import 'package:bloc_pattern/src/pages/application/widgets/application_widgets.dart';
import 'package:bloc_pattern/src/shared/themes/app_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplicationBloc, ApplicationState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: ApplicationWidgets.buildPage(state.index),
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: AppColorScheme.primaryElement,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 1,
                )
              ],
            ),
            child: AppNavigationBarWidget(
                index: state.index,
                onChangePage: (index) => context
                    .read<ApplicationBloc>()
                    .add(TriggerApplicationEvent(index))),
          ),
        );
      },
    );
  }
}
