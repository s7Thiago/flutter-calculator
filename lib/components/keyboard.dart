import 'package:flutter/material.dart';
import '../components/button.dart';
import '../components/button_row.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const ButtonRow(
            buttons: [
              Button(text: 'AC'),
              Button(text: '%'),
              Button(text: '/'),
            ],
          ),
          const ButtonRow(
            buttons: [
              Button(text: '7'),
              Button(text: '8'),
              Button(text: '9'),
              Button(text: 'x'),
            ],
          ),
          const ButtonRow(
            buttons: [
              Button(text: '4'),
              Button(text: '5'),
              Button(text: '6'),
              Button(text: '-'),
            ],
          ),
          const ButtonRow(
            buttons: [
              Button(text: '1'),
              Button(text: '2'),
              Button(text: '3'),
              Button(text: '+'),
            ],
          ),
          const ButtonRow(
            buttons: [
              Button(text: '0'),
              Button(text: '.'),
              Button(text: '='),
            ],
          ),
        ],
      ),
    );
  }
}
