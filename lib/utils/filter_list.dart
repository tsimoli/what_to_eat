import 'package:flutter/material.dart';
import 'package:what_to_eat/models/filter.dart';

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
  Filter(
      name: "Herkku", emoji: "🍕", filterName: "TREAT", color: Colors.yellow),
  Filter(
      name: "Nopea", emoji: "⏳", filterName: "FAST", color: Colors.blue[200]),
  Filter(
      name: "Halpa", emoji: "💰", filterName: "CHEAP", color: Colors.pink[200]),
];
