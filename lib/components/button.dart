import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final bool big;

  const Button({
    Key? key,
    required this.text,
    this.big = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: big ? 2 : 1,
      child: ElevatedButton(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 32,
            color: Colors.white,
            fontWeight: FontWeight.w200,
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}
