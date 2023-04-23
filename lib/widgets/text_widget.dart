import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  bool isTitle;
  int maxLines;

  TextWidget({
    Key? key,
    required this.text,
    required this.color,
    required this.size,
    this.isTitle = false,
    this.maxLines = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: isTitle ? FontWeight.bold : FontWeight.normal,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
