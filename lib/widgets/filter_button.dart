import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:what_to_eat/models/Filters.dart';
import 'package:what_to_eat/models/filter.dart';
import 'package:what_to_eat/utils/app_colors.dart';

class FilterButton extends StatelessWidget {
  final Filter filter;
  final bool isPressed;

  const FilterButton({Key key, this.filter, this.isPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filtersModel = Provider.of<Filters>(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      child: RaisedButton(
        color: filter.color,
        onPressed: () => isPressed
            ? filtersModel.removeSelectedFilter(filter)
            : filtersModel.addSelectedFilter(filter),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: isPressed ? 0 : 20,
        child: Text("${filter.name} ${filter.emoji}",
            style: TextStyle(color: AppColors.textColor, fontSize: 20)),
      ),
    );
  }
}
