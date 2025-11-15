import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sectionweek2/controllers/bookProvider.dart';
import 'package:sectionweek2/controllers/categoryProvider.dart';
import 'package:sectionweek2/data/book_list.dart';
import 'package:sectionweek2/screens/home_screens/widgets/bookSlider.dart';

Widget filteredBooks(BuildContext context) {
  return Consumer2<CategoryProvider, BookProvider>(
    builder: (context, categoryProvider, bookProvider, child) {
      return Container(
        child: categoryProvider.selectedCategory == null
            ? Column(
                spacing: 16.0,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Popular Books",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "See all",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.lightBlue,
                        ),
                      ),
                    ],
                  ),
                  makeBookSlider(
                    bookProvider.books
                        .where((book) => book.isPopular == true)
                        .toList(),
                    context,
                  ),
                  Container(
                    width: double.infinity,
                    height: 150.0,
                    decoration: BoxDecoration(
                      // shape: BoxShape.circle,
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      gradient: LinearGradient(
                        begin: FractionalOffset.topLeft,
                        end: FractionalOffset.bottomRight,
                        colors: const [Color(0xffe4a972), Color(0xff9941d8)],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Best sellers 2021',
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Recommended Books",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "See all",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.lightBlue,
                        ),
                      ),
                    ],
                  ),
                  makeBookSlider(bookProvider.books, context),
                ],
              )
            : Column(
                spacing: 16.0,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Books in ${categoryProvider.selectedCategory!.name}",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "See all",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.lightBlue,
                        ),
                      ),
                    ],
                  ),
                  makeBookSliderVertical(
                    bookProvider.books
                        .where(
                          (book) =>
                              book.category ==
                              categoryProvider.selectedCategory!,
                        )
                        .toList(),
                    context,
                  ),
                ],
              ),
      );
    },
  );
}
