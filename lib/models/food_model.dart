import 'package:scoped_model/scoped_model.dart';

class FoodModel extends Model {
  List<String> _filters = [];

  List<String> get filters => _filters;

  void addFilter(String filter) {
    _filters.add(filter);
    notifyListeners();
  }

  void removeFilter(String filter) {
    _filters = List.from(
        this._filters.where((currentFilter) => currentFilter != filter));
    notifyListeners();
  }
}
