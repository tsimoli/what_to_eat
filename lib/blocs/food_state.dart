import 'package:what_to_eat/models/food.dart';

abstract class FoodsState {}

class FoodsUnitialized extends FoodsState {}

class FoodsError extends FoodsState {}

class FoodsLoaded extends FoodsState {
  final List<Food> foods;
  final List<String> filters;

  FoodsLoaded({this.foods, this.filters});

  FoodsLoaded copyWith({List<Food> foods, List<String> filters}) {
    return FoodsLoaded(
        foods: foods ?? this.foods, filters: filters ?? this.filters);
  }
}
