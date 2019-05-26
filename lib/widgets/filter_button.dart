import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:what_to_eat/models/filter.dart';
import 'package:what_to_eat/models/filters.dart';
import 'package:what_to_eat/utils/app_colors.dart';

class FilterButton extends StatelessWidget {
  final Filter filter;

  const FilterButton({Key key, this.filter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filtersModel = Provider.of<Filters>(context);

    bool isPressed = filtersModel
            .getSelectedFilters()
            .where((Filter f) => f.filterName == filter.filterName)
            .length >
        0;
    return Container(
      margin: EdgeInsets.all(4),
      child: GestureDetector(
        onTap: () => isPressed
            ? filtersModel.removeSelectedFilter(filter)
            : filtersModel.addSelectedFilter(filter),
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: filter.color,
              border: Border.all(
                  color: isPressed ? Colors.red : Colors.transparent, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(40.0))),
          child: Text(
            "${filter.name} ${filter.emoji}",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
