import 'package:flutter/material.dart';
import 'package:what_to_eat/widgets/food_list.dart';
import 'package:what_to_eat/widgets/search_filters.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          SearchFilters(),
          SizedBox(
            height: 50,
          ),
          FoodList()
        ],
      ),
    );
  }
}
