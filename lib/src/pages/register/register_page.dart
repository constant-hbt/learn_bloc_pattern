import 'package:bloc_pattern/src/pages/register/register_controller.dart';
import 'package:bloc_pattern/src/shared/utils/validation_mixins.dart';
import 'package:bloc_pattern/src/shared/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with ValidationMixins {
  final _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _registerController = RegisterController();

  AutovalidateMode _autoValidate = AutovalidateMode.disabled;

  void _setAutoValidateMode() {
    if (_autoValidate == AutovalidateMode.disabled) {
      setState(() {
        _autoValidate = AutovalidateMode.always;
      });
    }
  }

  Future<void> _register() async {
    if (_formKey.currentState != null &&
        _formKey.currentState!.validate() &&
        await _registerController.handleRegister(
          userName: _userNameController.text,
          email: _emailController.text,
          password: _passwordController.text,
          confirmPassword: _confirmPasswordController.text,
        )) {
      if (context.mounted) {
        Navigator.of(context).pop();
      }
    }
  }

  String? _confirmPasswordValidation(String? confirmPassword) {
    String? confirmPasswordError;
    final password = _passwordController.text;
    final validationError = passwordValidation(
      password: confirmPassword,
      isConfirmPassword: true,
    );

    if (validationError != null) {
      confirmPasswordError = validationError;
    } else if (confirmPassword != password) {
      confirmPasswordError = 'A senha de confirmação deve ser igual a senha';
    }

    return confirmPasswordError;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildFunctions.buildAppBar('Sign Up'),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: BuildFunctions.reusableText(
                      'Enter your details below & free sign up')),
              Container(
                margin: const EdgeInsets.only(top: 32),
                child: Form(
                  key: _formKey,
                  autovalidateMode: _autoValidate,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextFormField(
                        controller: _userNameController,
                        labelText: 'User nane',
                        textType: TextInputType.name,
                        hintText: 'Enter your user name',
                        icon: Icons.person,
                        onChange: _setAutoValidateMode,
                        validator: (userName) => minimumTextLenght(userName, 3,
                            msgError:
                                'O nome de usuário deve possuir no mínimo 3 caracteres'),
                      ),
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
                      CustomTextFormField(
                        controller: _confirmPasswordController,
                        labelText: 'Re-enter your password',
                        textType: TextInputType.visiblePassword,
                        hintText: 'Re-enter your password to confirm',
                        icon: Icons.password,
                        obscureText: true,
                        onChange: _setAutoValidateMode,
                        validator: _confirmPasswordValidation,
                      ),
                      BuildFunctions.reusableText(
                          'By creating an account you have to agree with our team & condication.'),
                      const SizedBox(
                        height: 64,
                      ),
                      CustomElevatedButtonWidget(
                          text: 'Sign Up', func: _register),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
