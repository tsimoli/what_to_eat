import 'package:flutter/material.dart';
import 'package:what_to_eat/models/filter.dart';
import 'package:what_to_eat/widgets/filter_button.dart';

class SearchFilters extends StatelessWidget {
  final List<Filter> filters = [
    Filter(
        name: "Suosikit",
        emoji: "⭐",
        filterName: "FAVORITE",
        color: Colors.yellow[300]),
    Filter(
        name: "Kasvis",
        emoji: "🥦",
        filterName: "VEGETABLE",
        color: Colors.green[300]),
    Filter(
        name: "Terveellinen",
        emoji: "💪",
        filterName: "HEALTHY",
        color: Colors.greenAccent),
    Filter(name: "Herkku", emoji: "🍕", filterName: "TREAT", color: Colors.red),
    Filter(
        name: "Nopea", emoji: "⏳", filterName: "FAST", color: Colors.blue[200]),
    Filter(
        name: "Halpa",
        emoji: "💰",
        filterName: "CHEAP",
        color: Colors.pink[200]),
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      children: filters
          .map((filter) => FilterButton(
                filter: filter,
                isPressed: false,
              ))
          .toList(),
    );
  }
}
