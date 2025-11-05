import 'package:flutter/material.dart';
import 'package:sectionweek2/models/category.dart';

class CategoryProvider extends ChangeNotifier {
  Category? selectedCategory;

  void setSelectedCategory(Category? category) {
    selectedCategory = category;
    notifyListeners();
  }
}
