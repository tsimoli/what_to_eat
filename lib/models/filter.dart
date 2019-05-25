import 'dart:ui';

class Filter {
  final String name;
  final String filterName;
  final String emoji;
  final Color color;
  final Color onPressedColor;

  Filter(
      {this.name,
      this.filterName,
      this.emoji,
      this.color,
      this.onPressedColor});
}
