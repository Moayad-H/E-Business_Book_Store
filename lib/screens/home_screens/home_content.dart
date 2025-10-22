import 'package:flutter/material.dart';
import 'package:sectionweek2/data/book_list.dart';
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
            makeCategoryEl('All'),
            makeCategoryEl('Business'),
            makeCategoryEl('Programming'),
            makeCategoryEl('Science'),
            makeCategoryEl('History'),
            makeCategoryEl('Biography'),
            makeCategoryEl('Travel'),
            makeCategoryEl('Cooking'),
            makeCategoryEl('Art'),
          ],
        ),
      ),
      SizedBox(height: 8.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Popular Books",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
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
      makeBookSlider(BookList.newArrivalBooks, context),
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
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
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
      makeBookSlider(BookList.recommendBooks, context),

      // ListView.builder(
      //   itemCount: books.length,
      //   itemBuilder: (context, index) {
      //     final book = books[index];
      //     return ListTile(
      //       title: Text(book['title']!),
      //       subtitle: Text(book['author']!),
      //       onTap: () {
      //         // Navigator.push(
      //         //   context,
      //         //   MaterialPageRoute(
      //         //     builder: (context) => BookDetailsScreen(book: book),
      //         //   ),
      //         // );
      //       },
      //     );
      //   },
      // ),
    ],
  );
}
