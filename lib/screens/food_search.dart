import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:what_to_eat/models/filter.dart';
import 'package:what_to_eat/models/filters.dart';
import 'package:what_to_eat/models/food.dart';
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
          var data = result.data;

          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () => _addFood(context, refetch),
              child: Icon(Icons.add),
            ),
            body: Container(
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  SearchFilters(
                      selectedFilters: filtersModel.getSelectedFilters()),
                  SizedBox(
                    height: 50,
                  ),
                  FoodList(
                      foods: data['foods']
                          .map((foodJson) => Food.fromJson(foodJson)))
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
