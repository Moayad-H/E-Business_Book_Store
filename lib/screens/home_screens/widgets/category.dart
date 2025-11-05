import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sectionweek2/controllers/categoryProvider.dart';
import 'package:sectionweek2/data/category_list.dart';

Widget makeCategoryEl(String title, BuildContext context) {
  return InkWell(
    onTap: () {
      if (title == 'All') {
        Provider.of<CategoryProvider>(
          context,
          listen: false,
        ).setSelectedCategory(null);
      } else {
        Provider.of<CategoryProvider>(
          context,
          listen: false,
        ).setSelectedCategory(
          title == 'Business' ? CategoryList.business : CategoryList.novel,
        );
      }
    },

    child: Consumer<CategoryProvider>(
      builder: (context, categoryProvider, child) {
        return Container(
          height: 40.0,
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            color: categoryProvider.selectedCategory?.name == title
                ? Colors.brown
                : categoryProvider.selectedCategory?.name == null &&
                      title == 'All'
                ? Colors.brown
                : Colors.grey[200],
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: categoryProvider.selectedCategory?.name == title
                    ? Colors.white
                    : categoryProvider.selectedCategory?.name == null &&
                          title == 'All'
                    ? Colors.white
                    : Colors.black,
              ),
            ),
          ),
        );
      },
    ),
  );
}
