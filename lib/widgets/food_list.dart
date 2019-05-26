import 'package:flutter/material.dart';
import 'package:what_to_eat/models/food.dart';
import 'package:what_to_eat/widgets/food_list_item.dart';

class FoodList extends StatefulWidget {
  final List<Food> foods;

  const FoodList({Key key, this.foods}) : super(key: key);

  @override
  _FoodListState createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.foods.length,
        itemBuilder: (context, index) {
          var food = widget.foods[index];
          return FoodListItem(food: food);
        },
      ),
    );
  }
}
