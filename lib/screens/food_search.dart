import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:what_to_eat/models/filter.dart';
import 'package:what_to_eat/models/filters.dart';
import 'package:what_to_eat/models/food.dart';
import 'package:what_to_eat/utils/app_colors.dart';
import 'package:what_to_eat/utils/queries.dart';
import 'package:what_to_eat/widgets/food_list.dart';
import 'package:what_to_eat/widgets/search_filters.dart';

import 'add_food.dart';

class FoodSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final filtersModel = Provider.of<Filters>(context);

    return Query(
        options: QueryOptions(
          document: foodsQuery,
          variables: {
            'tags': filtersModel
                .getSelectedFilters()
                .map((Filter filter) => filter.filterName)
                .toList()
          },
        ),
        builder: (QueryResult result, {VoidCallback refetch}) {
          if (result.hasErrors) {
            print(result.hasErrors);
            return Text(result.errors.toString());
          }
          if (result.data == null) {
            return Text("Loading");
          }
          var data = result.data;

          List<Food> foods = (data['foods'] as List<dynamic>)
              .map((foodJson) => Food.fromJson(foodJson))
              .toList();

          return Scaffold(
            floatingActionButton: filtersModel.getIsVisible()
                ? null
                : FloatingActionButton(
                    backgroundColor: AppColors.pink,
                    onPressed: () => _addFood(context, refetch),
                    child: Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                  ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            body: Container(
              color: AppColors.grey,
              child: Column(
                children: <Widget>[
                  Center(
                      child:
                          Text("Mitä syödä?", style: TextStyle(fontSize: 40))),
                  Divider(),
                  Expanded(
                    child: Stack(children: [
                      FoodList(foods: foods),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: SearchFilters(),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          );
        });
  }

  _addFood(BuildContext context, Function refetchFoods) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddFood(
              refetchFoods: refetchFoods,
            ),
      ),
    );
  }
}
