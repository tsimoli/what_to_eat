import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:what_to_eat/blocs/food_state.dart';
import 'package:what_to_eat/models/food.dart';
import 'package:what_to_eat/providers/firestore_provider.dart';

class FoodBloc extends Bloc<FoodsEvent, FoodsState> {
  final FirebaseProvider firebaseProvider;

  FoodBloc({@required this.firebaseProvider});

  @override
  Stream<FoodsEvent> transform(Stream<FoodsEvent> events) {
    return (events as Observable<FoodsEvent>);
  }

  @override
  get initialState => FoodsUnitialized();

  @override
  Stream<FoodsState> mapEventToState(
      FoodsState currentState, FoodsEvent event) async* {
    /*
    if (event is FetchFoods) {
      yield* Observable(firebaseProvider.myFoods(event.filters)).map((foods) {
        return FoodsLoaded(foods: foods, filters: event.filters);
      });
    }
    */
    if (event is AddFilter) {
      if (currentState is FoodsLoaded) {
        List<String> newFilters = List.from(currentState.filters)
          ..add(event.filter);
        yield currentState.copyWith(filters: newFilters);
        dispatch(FetchFoods(newFilters));
      }
    }
    if (event is RemoveFilter) {
      if (currentState is FoodsLoaded) {
        List<String> newFilters = List.from(
            currentState.filters.where((filter) => filter != event.filter));
        yield currentState.copyWith(filters: newFilters);
        dispatch(FetchFoods(newFilters));
      }
    }
    /*var foods = [
      Food(name: "Lasagne", url: "", tags: ["CHEAP", "HEALTHY"]),
      Food(name: "Lohikeitto", url: "", tags: ["HEALTHY", "FAST"])
    ];
    return Stream.fromIterable([FoodsLoaded(foods: foods)]);
    */
  }
}

abstract class FoodsEvent {}

class FetchFoods extends FoodsEvent {
  final List<String> filters;

  FetchFoods(this.filters);
}

class AddFilter extends FoodsEvent {
  final String filter;

  AddFilter(this.filter);
}

class RemoveFilter extends FoodsEvent {
  final String filter;

  RemoveFilter(this.filter);
}
