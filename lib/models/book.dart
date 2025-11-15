import 'package:sectionweek2/models/category.dart';

/// Book model
class Book {
  final String title;
  final int price;
  final String image;
  final String? author;
  final double? rating;
  final int? pages;
  final String? description;
  final String? publisher;
  final String? publishedDate;
  final String? isbn;
  final Category category;
  final bool? isPopular;
  int quantity;

  Book({
    required this.title,
    required this.price,
    required this.image,
    required this.category,
    this.isPopular,
    this.author,
    this.rating,
    this.pages,
    this.description,
    this.publisher,
    this.publishedDate,
    this.isbn,
    this.quantity = 1,
  });
}
