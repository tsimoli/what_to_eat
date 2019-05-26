import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:what_to_eat/models/filters.dart';
import 'package:what_to_eat/utils/filter_list.dart';
import 'package:what_to_eat/widgets/filter_button.dart';

class SearchFilters extends StatefulWidget {
  @override
  _SearchFiltersState createState() => _SearchFiltersState();
}

class _SearchFiltersState extends State<SearchFilters>
    with SingleTickerProviderStateMixin {
  AnimationController searchFilterAC;
  Animation filtersAnimation;
  Tween<double> offsetTween;
  double _notchWidth = 40;
  double _notchLeftMargin = 8;

  @override
  void initState() {
    super.initState();

    searchFilterAC = AnimationController(
        duration: const Duration(milliseconds: 100), vsync: this);
    offsetTween = Tween<double>(begin: 0, end: 0);
    filtersAnimation = offsetTween.animate(
      CurvedAnimation(parent: searchFilterAC, curve: Curves.easeOut),
    )..addListener(() {
        setState(() {});
      });
  }

  void _animate() {
    if (searchFilterAC.status == AnimationStatus.completed) {
      searchFilterAC.reverse();
    } else {
      searchFilterAC.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final filtersModel = Provider.of<Filters>(context);

    double translateAmount =
        MediaQuery.of(context).size.width - (_notchWidth + _notchLeftMargin);

    offsetTween.begin = translateAmount;

    return Transform.translate(
      offset: Offset(filtersAnimation.value, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              _animate();
              filtersModel.toggleIsVisible();
            },
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: _notchWidth,
              ),
              child: Container(
                margin: EdgeInsets.only(left: _notchLeftMargin),
                width: _notchWidth,
                decoration: BoxDecoration(
                    color: Color(0xfff4cae0),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5))),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.filter_list),
                    if (!filtersModel.getIsVisible())
                      ...filtersModel.getSelectedFilters().map((filter) =>
                          Padding(
                              padding: EdgeInsets.all(4),
                              child: Text(filter.emoji,
                                  style: TextStyle(fontSize: 25))))
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(right: 8, bottom: 8),
              decoration: BoxDecoration(
                  color: Color(0xfff4cae0),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Container(
                padding: EdgeInsets.all(8),
                child: Wrap(
                  direction: Axis.horizontal,
                  children: filters
                      .map((filter) => FilterButton(
                            filter: filter,
                          ))
                      .toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
