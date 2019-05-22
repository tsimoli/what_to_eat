import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_helpers/firestore_helpers.dart';
import 'package:what_to_eat/models/food.dart';

class FirebaseProvider {
  Firestore _firestore = Firestore.instance;

  static Stream<QuerySnapshot> myFoods(List<String> tags) {
    /*CollectionReference foodsCollection = _firestore.collection("foods");
    List<QueryConstraint> constraints = tags
        .map((tag) => QueryConstraint(field: "tags", arrayContains: tag))
        .toList();
      Query ref =
          buildQuery(collection: foodsCollection, constraints: constraints);

      return ref.snapshots().map((snap) {
        return snap.documents
            .map((ds) => Food(
                name: ds.data['name'],
                url: ds.data['url'],
                tags: List<String>.from(ds.data['tags'])))
            .toList();
      });
    */
/*
    var foods = [
      Food(name: "Lasagne", url: "", tags: ["CHEAP", "HEALTHY"]),
      Food(name: "Lohikeitto", url: "", tags: ["HEALTHY", "FAST"])
    ];
    return Stream.fromIterable([foods]);
  }
  */
    CollectionReference foodsCollection =
        Firestore.instance.collection("foods");
    List<QueryConstraint> constraints =
        tags.map((tag) => QueryConstraint(field: "tags")).toList();
    Query ref =
        buildQuery(collection: foodsCollection, constraints: constraints);

    return ref.snapshots();
  }
}
