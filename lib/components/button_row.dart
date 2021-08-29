import 'package:flutter/material.dart';

import './button.dart';

class ButtonRow extends StatelessWidget {
  final List<Button> buttons;

  const ButtonRow({Key? key, required this.buttons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: buttons,
    );
  }
}
