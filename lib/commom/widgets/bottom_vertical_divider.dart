import 'package:flutter/material.dart';

class BottomVerticalDivider extends StatelessWidget {
  const BottomVerticalDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 50,
      child: VerticalDivider(color: Colors.black54),
    );
  }
}
