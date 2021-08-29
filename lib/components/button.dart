import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;

  const Button({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: ElevatedButton(
        child: Text(text),
        onPressed: () {},
      ),
    );
  }
}
