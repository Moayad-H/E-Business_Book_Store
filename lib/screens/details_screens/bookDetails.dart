import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sectionweek2/models/book.dart';

class DetailScreen extends StatefulWidget {
  final Book book;
  DetailScreen({required this.book});
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final Color _accentColor = Color.fromARGB(255, 105, 104, 104);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Iconsax.arrow_left, color: Colors.grey[600]),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20.0),
            child: Icon(Iconsax.save_add, color: Colors.grey[600]),
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          fit: StackFit.loose,
          children: [
            Align(
              alignment: Alignment(-0.8, 0),
              child: Container(
                width: 20.0,
                height: 20.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  color: Colors.green.withOpacity(0.5),
                ),
              ),
            ),
            Align(
              alignment: Alignment(-0.5, -0.9),
              child: Container(
                width: 200.0,
                height: 200.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                  color: const Color.fromARGB(
                    255,
                    244,
                    130,
                    54,
                  ).withOpacity(0.75),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0.8, -0.3),
              child: Container(
                width: 180.0,
                height: 180.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(150.0)),
                  color: Colors.blue.withOpacity(0.7),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, -0.8),
              child: Container(
                width: 250.0,
                height: 300.0,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(widget.book.image)),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, 0.5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.book.title,
                    style: TextStyle(
                      fontSize: 23.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    widget.book.author ?? '',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RatingBar.builder(
                        initialRating: widget.book.rating ?? 0,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 15,
                        ignoreGestures: true,
                        itemPadding: EdgeInsets.symmetric(horizontal: 0.5),
                        itemBuilder: (context, _) =>
                            Icon(Icons.star, color: Colors.amber),
                        onRatingUpdate: (rating) {},
                      ),
                      const SizedBox(width: 10.0),
                      Text(
                        widget.book.rating?.toString() ?? '',
                        style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text(
                      widget.book.description ?? '',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[600],
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment(0, 0.9),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                width: double.infinity,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  color: _accentColor,
                ),
                child: Center(
                  child: Text(
                    'ADD TO CART',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
