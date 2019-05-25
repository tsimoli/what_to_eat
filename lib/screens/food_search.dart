import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:what_to_eat/models/filter.dart';
import 'package:what_to_eat/models/filters.dart';
import 'package:what_to_eat/utils/queries.dart';
import 'package:what_to_eat/widgets/food_list.dart';
import 'package:what_to_eat/widgets/search_filters.dart';

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

          return Container(
            width: double.infinity,
            child: Column(
              children: <Widget>[
                SearchFilters(
                    selectedFilters: filtersModel.getSelectedFilters()),
                SizedBox(
                  height: 50,
                ),
                //FoodList()
              ],
            ),
          );
        });
  }
}
