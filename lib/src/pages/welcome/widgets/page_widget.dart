import 'package:bloc_pattern/src/pages/welcome/blocs/welcome_bloc.dart';
import 'package:bloc_pattern/src/pages/welcome/blocs/welcome_states.dart';
import 'package:bloc_pattern/src/pages/welcome/widgets/custom_button_widget.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageWidget extends StatelessWidget {
  const PageWidget({
    super.key,
    required this.index,
    required this.buttonName,
    required this.title,
    required this.subTitle,
    required this.imagePath,
  });

  final int index;
  final String buttonName;
  final String title;
  final String subTitle;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.normal),
                ),
                Text(
                  subTitle,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.left,
                ),
                Expanded(
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButtonWidget(
                        text: buttonName,
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 32),
                        child: BlocBuilder<WelcomeBloc, WelcomeState>(
                          builder: (BuildContext context, WelcomeState state) {
                            debugPrint('posicao: ${state.page}');
                            return DotsIndicator(
                              dotsCount: 3,
                              position: state.page,
                              mainAxisAlignment: MainAxisAlignment.center,
                              decorator: DotsDecorator(
                                  activeColor: Colors.blue,
                                  activeSize: const Size(16.0, 9.0),
                                  activeShape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(5.0))),
                            );
                          },
                        ),
                      )
                    ],
                  )),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
