// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../components/display.dart';
import '../components/keyboard.dart';
import '../models/memory.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final memory = Memory();

  _onPressed(String command) {
    setState(() {
      memory.applyCommand(command);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Display(memory.value),
          Keyboard(
            cb: _onPressed,
          ),
        ],
      ),
    );
  }
}
