import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:what_to_eat/blocs/food_bloc.dart';
import 'package:what_to_eat/blocs/food_bloc_delegate.dart';
import 'package:what_to_eat/models/food_model.dart';
import 'package:what_to_eat/providers/firestore_provider.dart';
import 'package:what_to_eat/screens/search.dart';

void main() {
  BlocSupervisor().delegate = FoodBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  static final _firebaseProvider = FirebaseProvider();
  final foodBloc = FoodBloc(firebaseProvider: MyHomePage._firebaseProvider);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final foodModel = FoodModel();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScopedModel<FoodModel>(
          model: foodModel,
          child: Search(),
        ),
      ),
    );
  }
}
