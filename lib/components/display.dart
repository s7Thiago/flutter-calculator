import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  final String text;

  const Display(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: const Color.fromRGBO(48, 48, 48, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(text),
            ),
          ],
        ),
      ),
    );
  }
}