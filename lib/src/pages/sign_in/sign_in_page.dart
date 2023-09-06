import 'package:bloc_pattern/src/pages/sign_in/sign_in_controller.dart';
import 'package:bloc_pattern/src/pages/sign_in/widgets/custom_widgets.dart';
import 'package:bloc_pattern/src/pages/sign_in/widgets/third_party_login_widget.dart';
import 'package:bloc_pattern/src/shared/utils/validation_mixins.dart';
import 'package:bloc_pattern/src/shared/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:bloc_pattern/src/shared/routes/routes.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> with ValidationMixins {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final SignInController _signInController = SignInController();

  AutovalidateMode _autoValidate = AutovalidateMode.disabled;

  void _setAutoValidateMode() {
    setState(() {
      _autoValidate = AutovalidateMode.always;
    });
  }

  Future<void> _signIn() async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      if (await _signInController.handleSignIn(
              _emailController.text, _passwordController.text) &&
          context.mounted) {
        Navigator.of(context).pushNamedAndRemoveUntil(
            AppRouteNames.APPLICATION, (route) => false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildFunctions.buildAppBar('Log In'),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ThirdPartyLoginWidget(),
            Center(
                child: BuildFunctions.reusableText(
                    'Or use your account to login')),
            Container(
              margin: const EdgeInsets.only(top: 60),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: _formKey,
                autovalidateMode: _autoValidate,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextFormField(
                      controller: _emailController,
                      labelText: 'Email',
                      textType: TextInputType.emailAddress,
                      hintText: 'Enter your email address',
                      icon: Icons.email_outlined,
                      onChange: _setAutoValidateMode,
                      validator: (email) => emailValidation(email: email),
                    ),
                    CustomTextFormField(
                      controller: _passwordController,
                      labelText: 'Password',
                      textType: TextInputType.visiblePassword,
                      hintText: 'Enter your password',
                      icon: Icons.password,
                      obscureText: true,
                      onChange: _setAutoValidateMode,
                      validator: (password) =>
                          passwordValidation(password: password),
                    ),
                    CustomWidgets.forgotPassword(context, () {}),
                    const SizedBox(
                      height: 80,
                    ),
                    CustomElevatedButtonWidget(text: 'Log In', func: _signIn),
                    const SizedBox(
                      height: 32,
                    ),
                    CustomOutlineButtonWidget(
                        text: 'Sign Up',
                        func: () => Navigator.of(context)
                            .pushNamed(AppRouteNames.REGISTER)),
                    const SizedBox(
                      height: 32,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
