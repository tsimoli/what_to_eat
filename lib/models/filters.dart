import 'package:flutter/material.dart';
import 'package:what_to_eat/models/filter.dart';

class Filters with ChangeNotifier {
  List<Filter> _selectedFilters;
  bool _isVisible;

  Filters(this._selectedFilters, this._isVisible);

  List<Filter> getSelectedFilters() => _selectedFilters;

  addSelectedFilter(Filter filter) {
    _selectedFilters.add(filter);
    notifyListeners();
  }

  removeSelectedFilter(Filter filter) {
    _selectedFilters
        .removeWhere((Filter f) => f.filterName == filter.filterName);
    notifyListeners();
  }

  bool getIsVisible() => _isVisible;

  void toggleIsVisible() {
    _isVisible = !_isVisible;
    notifyListeners();
  }
}
