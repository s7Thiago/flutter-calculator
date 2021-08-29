import 'package:flutter/material.dart';

import '../components/display.dart';
import '../components/keyboard.dart';

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Column(
        children: [
          Display('12345'),
          Keyboard(),
        ],
      ),
    );
  }
}
