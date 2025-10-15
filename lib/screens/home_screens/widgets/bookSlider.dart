import 'package:flutter/material.dart';
import 'package:sectionweek2/models/book.dart';
import 'package:sectionweek2/screens/home_screens/widgets/book.dart';

Widget makeBookSlider(List<Book> books, dynamic context) {
  List<Widget> contents = [];
  for (Book book in books) {
    contents.add(makeBookEl(book, context));
    contents.add(SizedBox(width: 20.0));
  }
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(children: contents),
  );
}
