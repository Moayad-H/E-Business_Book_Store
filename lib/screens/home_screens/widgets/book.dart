import 'package:flutter/material.dart';
import 'package:sectionweek2/models/book.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sectionweek2/screens/details_screens/bookDetails.dart';

Widget makeBookEl(Book book, dynamic context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailScreen()),
      );
    },
    child: Container(
      width: 100.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(book.image, height: 140.0),
          const SizedBox(height: 10.0),
          Text(
            book.title,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.0),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 5.0),
          RatingBar.builder(
            initialRating: 3.5,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 10,
            ignoreGestures: true,
            itemPadding: EdgeInsets.symmetric(horizontal: 0.5),
            itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
            onRatingUpdate: (rating) {},
          ),
          // Text("★️ 3.5", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12.0, color: Colors.orangeAccent)),
        ],
      ),
    ),
  );
}
