import 'package:flutter/material.dart';
import 'package:sectionweek2/models/book.dart';

class CartProvider extends ChangeNotifier {
  List<Book> cartItems = [];
  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);
  static CartProvider get instance => CartProvider();
  void addToCart(Book book) {
    if (cartItems.contains(book)) {
      increaseQuantity(book);
      print('INcreased quantity');
    } else {
      cartItems.add(book);
      print('added  book');
    }
    notifyListeners();
  }

  void removeFromCart(Book book) {
    cartItems.remove(book);
    notifyListeners();
  }

  void clearCart() {
    cartItems.clear();
    notifyListeners();
  }

  void increaseQuantity(Book book) {
    book.quantity++;
    print('increased quuantity');
    notifyListeners();
  }

  void decreaseQuantity(Book book) {
    book.quantity--;
    notifyListeners();
  }
}
