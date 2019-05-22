import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:what_to_eat/blocs/food_bloc.dart';
import 'package:what_to_eat/blocs/food_state.dart';
import 'package:what_to_eat/models/food.dart';
import 'package:what_to_eat/models/food_model.dart';
import 'package:what_to_eat/providers/firestore_provider.dart';
import 'package:what_to_eat/widgets/food_list_item.dart';

class FoodList extends StatefulWidget {
  @override
  _FoodListState createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<FoodModel>(
        builder: (BuildContext contex, child, model) {
      return StreamBuilder<QuerySnapshot>(
          stream: FirebaseProvider.myFoods(model.filters),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                  child: RaisedButton(child: Text("Loading...")),
                );
              default:
                var foods = snapshot.data.documents
                    .map((ds) => Food(
                        name: ds.data['name'],
                        url: ds.data['url'],
                        tags: List<String>.from(ds.data['tags'])))
                    .toList();

                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      var food = foods[index];
                      return FoodListItem(food: food);
                    },
                  ),
                );
            }
          });
    });
  }
}
