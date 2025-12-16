import 'package:sectionweek2/data/category_list.dart';
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

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'price': price,
      'image': image,
      'category': category.name,
      'quantity': quantity,
      'author': author,
      'rating': rating,
      'pages': pages,
      'description': description,
      'publisher': publisher,
      'publishedDate': publishedDate,
      'isbn': isbn,
    };
  }

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['title'] ?? '',
      price: json['price'] ?? 0,
      image: json['image'] ?? '',
      category: json['category'] == 'Business'
          ? CategoryList.business
          : json['category'] == 'Novel'
          ? CategoryList.novel
          : CategoryList.biography,
      quantity: json['quantity'] ?? 1,
      author: json['author'] ?? '',
      rating: json['rating'] ?? 0,
      pages: json['pages'] ?? 0,
      description: json['description'],
      publisher: json['publisher'] ?? '',
      publishedDate: json['publishedDate'],
      isbn: json['isbn'] ?? '',
    );
  }
}
