import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sectionweek2/data/category_list.dart';
import 'package:sectionweek2/models/book.dart';
import 'package:sectionweek2/models/category.dart';

class BookRepo {
  static List<Book> books = [];
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Fetches all books from Firebase Firestore
  /// Returns a Future<List<Book>> containing all books from the 'books' collection
  static Future<List<Book>> fetchBooks() async {
    print('Fetching books from Firebase...');
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('books').get();
      List<Book> fetchedBooks = [];
      for (var doc in querySnapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        // Map category name to Category object
        Category category = _getCategoryFromName(
          data['category']['category_name'] ?? 'Business',
        );

        Book book = Book(
          title: data['title'] ?? '',
          price: (data['price'] ?? 0).toInt(),
          image: data['image'] ?? '',
          category: category,
          author: data['author'],
          rating: data['rating']?.toDouble(),
          pages: data['pages']?.toInt(),
          description: data['description'],
          publisher: data['publisher'],
          publishedDate: data['publishedDate'],
          isbn: data['isbn'],
          quantity: data['quantity']?.toInt() ?? 1,
          isPopular: data['isPopular'] ?? false,
        );
        print('isPopular:${book.isPopular}');
        fetchedBooks.add(book);
      }

      books = fetchedBooks;
      return fetchedBooks;
    } catch (e) {
      print('Error fetching books from Firebase: $e');
      return [];
    }
  }

  /// Adds a list of books to Firebase Firestore
  /// Takes a List<Book> and adds each book to the 'books' collection
  /// Returns a Future<bool> indicating success or failure
  static Future<bool> addBooks(List<Book> booksToAdd) async {
    if (booksToAdd.isEmpty) {
      print('No books to add');
      return true;
    }

    try {
      // Use batch write for efficiency (can handle up to 500 operations)
      WriteBatch batch = _firestore.batch();
      int batchCount = 0;
      const int maxBatchSize = 500;

      for (var book in booksToAdd) {
        // Convert Book object to Firestore document format
        Map<String, dynamic> bookData = {
          'title': book.title,
          'price': book.price,
          'image': book.image,
          'category': {
            'category_name': book.category.name,
            'color1': {
              'r': book.category.bgColor.red,
              'g': book.category.bgColor.green,
              'b': book.category.bgColor.blue,
              'o': book.category.bgColor.opacity,
            },
            'color2': {
              'r': book.category.textColor.red,
              'g': book.category.textColor.green,
              'b': book.category.textColor.blue,
              'o': book.category.textColor.opacity,
            },
          },
          'quantity': book.quantity,
        };

        // Add optional fields if they exist
        if (book.author != null) {
          bookData['author'] = book.author;
        }
        if (book.rating != null) {
          bookData['rating'] = book.rating;
        }
        if (book.pages != null) {
          bookData['pages'] = book.pages;
        }
        if (book.description != null) {
          bookData['description'] = book.description;
        }
        if (book.publisher != null) {
          bookData['publisher'] = book.publisher;
        }
        if (book.publishedDate != null) {
          bookData['publishedDate'] = book.publishedDate;
        }
        if (book.isbn != null) {
          bookData['isbn'] = book.isbn;
        }
        print('added BookData');
        // Add document to batch
        DocumentReference docRef = _firestore.collection('books').doc();
        batch.set(docRef, bookData);
        batchCount++;
        // Commit batch if it reaches max size
        if (batchCount >= maxBatchSize) {
          await batch.commit();
          batch = _firestore.batch();
          batchCount = 0;
        }
      }

      // Commit remaining documents
      if (batchCount > 0) {
        await batch.commit();
      }

      print('Successfully added ${booksToAdd.length} books to Firebase');
      return true;
    } catch (e) {
      print('Error adding books to Firebase: $e');
      return false;
    }
  }

  static Category _getCategoryFromName(String categoryName) {
    switch (categoryName.toLowerCase()) {
      case 'business':
        return CategoryList.business;
      case 'novel':
        return CategoryList.novel;
      case 'biography':
        return CategoryList.biography;
      default:
        return CategoryList.business;
    }
  }
}
