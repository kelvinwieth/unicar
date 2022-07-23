import 'package:flutter/material.dart';

class SubtitledIcon extends StatelessWidget {
  const SubtitledIcon({
    Key? key,
    required this.subtitle,
    required this.icon,
    this.fontSize = 12,
    this.iconSize = 30,
    this.width = 60,
  }) : super(key: key);

  final String subtitle;
  final IconData icon;
  final double fontSize;
  final double iconSize;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: iconSize,
          ),
          const SizedBox(height: 5),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white70,
              fontSize: fontSize,
            ),
          ),
        ],
      ),
    );
  }
}
