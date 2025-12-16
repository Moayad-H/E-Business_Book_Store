import 'package:sectionweek2/data/category_list.dart';
import 'package:sectionweek2/models/book.dart';

class Profile {
  final String name;
  final String email;
  final String image;
  final List<Book> purchasedBooks;

  Profile({
    required this.name,
    required this.email,
    required this.image,
    required this.purchasedBooks,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      image: json['image'] ?? '',
      purchasedBooks: (json['purchasedBooks'] as List<dynamic>)
          .map((book) => Book.fromJson(book as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'image': image,
      'purchasedBooks': purchasedBooks,
    };
  }
}
