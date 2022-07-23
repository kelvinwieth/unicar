import 'package:flutter/material.dart';
import 'package:unicar/commom/themes/uni_theme.dart';

class FloatingAddButton extends StatelessWidget {
  const FloatingAddButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Container(
        height: 60,
        width: 60,
        decoration: UniTheme.circularGradientDecoration,
        child: const Icon(Icons.add),
      ),
    );
  }
}
