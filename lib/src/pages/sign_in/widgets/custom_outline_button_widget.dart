import 'package:flutter/material.dart';

class CustomOutlineButtonWidget extends StatelessWidget {
  const CustomOutlineButtonWidget({
    super.key,
    required this.text,
    required this.func,
  });

  final String text;
  final Function func;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: OutlinedButton(
        onPressed: () => func,
        child: Text(text),
      ),
    );
  }
}
