import 'package:flutter/material.dart';
import 'package:sectionweek2/models/category.dart';

/// Category list
class CategoryList {
  static final Category business = Category(
    "Business",
    const Color.fromRGBO(33, 150, 243, 1).withOpacity(0.3),
    const Color.fromRGBO(63, 81, 181, 1),
  );
  static final Category novel = Category(
    "Novel",
    const Color.fromRGBO(255, 64, 129, 1).withOpacity(0.2),
    Colors.black54,
  );
  static final Category biography = Category(
    "Biography",
    Colors.lightGreenAccent.withOpacity(0.3),
    Colors.teal,
  );
}
