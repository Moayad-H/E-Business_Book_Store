import 'package:flutter/foundation.dart';
import 'package:sectionweek2/data/book_list.dart';
import 'package:sectionweek2/models/book.dart';
import 'package:sectionweek2/repositories/book_repo.dart';

class BookProvider extends ChangeNotifier {
  List<Book> books = [];
  bool booksLoading = false;
  Future<void> fetchBooks() async {
    booksLoading = true;
    notifyListeners();
    books = await BookRepo.fetchBooks();
    print('Books fetched: ${books.length}');
    print('Books: ${books.map((book) => book.title).join(', ')}');
    await Future.delayed(Duration(seconds: 2));
    booksLoading = false;
    notifyListeners();
  }

  Future<void> addBooks({Book? newBook}) async {
    if (newBook != null) {
      BookList.allBooks.add(newBook);
    }
    await BookRepo.addBooks(BookList.allBooks);
    print('Books added');
    notifyListeners();
  }

  void addBook(Book book) {
    books.add(book);
    notifyListeners();
  }
}
