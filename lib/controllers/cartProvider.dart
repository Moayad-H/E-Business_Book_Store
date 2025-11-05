import 'package:flutter/material.dart';
import 'package:sectionweek2/models/book.dart';

class CartProvider extends ChangeNotifier {
  List<Book> cartItems = [];
  double totalPrice = 0;
  static CartProvider get instance => CartProvider();
  void addToCart(Book book) {
    if (cartItems.contains(book)) {
      increaseQuantity(book);
      print('INcreased quantity');
    } else {
      cartItems.add(book);
      print('added  book');
    }
    totalPrice = cartItems.fold(
      0,
      (sum, item) => sum + (item.price * item.quantity),
    );
    notifyListeners();
  }

  void removeFromCart(Book book) {
    cartItems.remove(book);
    totalPrice = cartItems.fold(
      0,
      (sum, item) => sum + (item.price * item.quantity),
    );
    notifyListeners();
  }

  void clearCart() {
    cartItems.clear();
    totalPrice = 0;
    notifyListeners();
  }

  void increaseQuantity(Book book) {
    book.quantity++;
    print('increased quuantity');
    totalPrice = cartItems.fold(
      0,
      (sum, item) => sum + (item.price * item.quantity),
    );
    notifyListeners();
  }

  void decreaseQuantity(Book book) {
    if (book.quantity > 1) {
      book.quantity--;
      totalPrice = cartItems.fold(
        0,
        (sum, item) => sum + (item.price * item.quantity),
      );
      notifyListeners();
    } else if (book.quantity == 1) {
      removeFromCart(book);
    } else {
      print('Quantity is already 0');
    }
  }
}
