import 'package:flutter/material.dart';
import 'package:what_to_eat/models/filter.dart';
import 'package:what_to_eat/models/food_model.dart';
import 'package:what_to_eat/utils/app_colors.dart';

class FilterButton extends StatelessWidget {
  final Filter filter;
  final bool isPressed;
  final FoodModel foodModel;

  const FilterButton({Key key, this.filter, this.isPressed, this.foodModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: RaisedButton(
        color: filter.color,
        onPressed: () => isPressed
            ? foodModel.removeFilter(filter.filterName)
            : foodModel.addFilter(filter.filterName),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: isPressed ? 0 : 12,
        child: Text("${filter.name} ${filter.emoji}",
            style: TextStyle(color: AppColors.textColor, fontSize: 20)),
      ),
    );
  }
}
