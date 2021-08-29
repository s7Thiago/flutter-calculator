import 'package:flutter/material.dart';

import './button.dart';

class ButtonRow extends StatelessWidget {
  final List<Button> buttons;

  const ButtonRow({Key? key, required this.buttons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: buttons.fold(<Widget>[], (previousList, button) {
          previousList.isEmpty
              ? previousList.add(button)
              : previousList.addAll(
                  [const SizedBox(width: 1), button],
                );
          return previousList;
        }),
      ),
    );
  }
}
