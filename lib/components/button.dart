import 'package:flutter/material.dart';

class Button extends StatelessWidget {
final String text;

  const Button({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(text),
      onPressed: () {},
    );
  }
}