import 'package:flutter/material.dart';
import 'package:sectionweek2/data/book_list.dart';
import 'package:sectionweek2/data/category_list.dart';
import 'package:sectionweek2/models/category.dart';
import 'package:sectionweek2/screens/filtered_books.dart';
import 'package:sectionweek2/screens/home_screens/widgets/bookSlider.dart';
import 'package:sectionweek2/screens/home_screens/widgets/category.dart';
import 'package:sectionweek2/screens/home_screens/widgets/searchbar.dart';

Widget homeContent(BuildContext context) {
  return Column(
    spacing: 16.0,
    children: [
      makeSearchBoxEl(),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          spacing: 12.0,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            makeCategoryEl('All', context),
            makeCategoryEl('Business', context),
            makeCategoryEl('Novel', context),
            makeCategoryEl('Science', context),
            makeCategoryEl('History', context),
            makeCategoryEl('Biography', context),
            makeCategoryEl('Travel', context),
            makeCategoryEl('Cooking', context),
            makeCategoryEl('Art', context),
          ],
        ),
      ),
      SizedBox(height: 8.0),
      filteredBooks(context),
    ],
  );
}
