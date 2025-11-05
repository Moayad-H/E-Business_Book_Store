import 'package:flutter/material.dart';
import 'package:sectionweek2/models/book.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sectionweek2/screens/details_screens/bookDetails.dart';

Widget makeBookHorizontal(Book book, dynamic context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailScreen(book: book)),
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

Widget makeBookVertical(Book book, dynamic context, int index) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailScreen(book: book)),
      );
    },
    child: Container(
      padding: EdgeInsets.all(10.0),
      height: 150.0,
      child: Row(
        spacing: 5.0,
        children: [
          Text(
            '${index + 1}',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.0),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(width: 10.0),
          Image.asset(book.image, height: 140.0),
          const SizedBox(width: 10.0),
          Column(
            spacing: 5.0,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: 10.0,
                children: [
                  Text(
                    book.title,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.0,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  RatingBar.builder(
                    initialRating: 3.5,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 10,
                    ignoreGestures: true,
                    itemPadding: EdgeInsets.symmetric(horizontal: 0.5),
                    itemBuilder: (context, _) =>
                        Icon(Icons.star, color: Colors.amber),
                    onRatingUpdate: (rating) {},
                  ),
                ],
              ),
              Text(
                book.category.name,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12.0,
                  color: Colors.grey,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '${book.price.toString()} EGP',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.0),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          // Text("★️ 3.5", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12.0, color: Colors.orangeAccent)),
        ],
      ),
    ),
  );
}
