import 'package:bloc_pattern/src/pages/sign_in/widgets/custom_widgets.dart';
import 'package:bloc_pattern/src/pages/sign_in/widgets/third_party_login_widget.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomWidgets.buildAppBar('Log In'),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ThirdPartyLoginWidget(),
          Center(
              child:
                  CustomWidgets.reusableText('Or use your account to login')),
          Container(
            margin: const EdgeInsets.only(top: 60),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      autocorrect: false,
                      decoration: const InputDecoration(
                        label: Text('Email'),
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    )
                  ],
                )),
          )
        ],
      )),
    );
  }
}
