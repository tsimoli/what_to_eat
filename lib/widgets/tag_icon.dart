import 'package:flutter/material.dart';

class TagIcon extends StatelessWidget {
  final String emoji;
  final Color color;

  const TagIcon({Key key, this.emoji, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(shape: BoxShape.circle, color: this.color),
      child: Text(
        emoji,
        style: TextStyle(fontSize: 25),
      ),
    );
  }
}
