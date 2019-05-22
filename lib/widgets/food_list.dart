import 'package:flutter/material.dart';
import 'package:what_to_eat/widgets/food_list_item.dart';

class FoodList extends StatefulWidget {
  @override
  _FoodListState createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  @override
  Widget build(BuildContext context) {
    var foods = [];

    return Expanded(
      child: ListView.builder(
        itemCount: foods.length,
        itemBuilder: (context, index) {
          var food = foods[index];
          return FoodListItem(food: food);
        },
      ),
    );
  }
}
