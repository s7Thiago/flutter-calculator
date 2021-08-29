// ignore_for_file: prefer_const_constructors

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
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Display('12345'),
          Keyboard(),
        ],
      ),
    );
  }
}
