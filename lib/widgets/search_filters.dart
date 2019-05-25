import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:what_to_eat/models/filter.dart';
import 'package:what_to_eat/models/filters.dart';
import 'package:what_to_eat/widgets/filter_button.dart';

class SearchFilters extends StatelessWidget {
  final List<Filter> selectedFilters;

  SearchFilters({this.selectedFilters});

  final List<Filter> filters = [
    Filter(
        name: "Kasvis",
        emoji: "🥕",
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
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 16),
      color: Color(0xfff4cae0),
      child: Wrap(
        direction: Axis.horizontal,
        children: filters
            .map((filter) => FilterButton(
                  filter: filter,
                ))
            .toList(),
      ),
    );
  }
}
