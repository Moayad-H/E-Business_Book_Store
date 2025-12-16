import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sectionweek2/controllers/auth_service.dart';
import 'package:sectionweek2/controllers/bookProvider.dart';
import 'package:sectionweek2/data/category_list.dart';
import 'package:sectionweek2/models/book.dart';
import 'package:sectionweek2/screens/admin_page/admin_screen.dart';
import 'package:sectionweek2/screens/home_screens/home_screen.dart';

class AddBooks extends StatefulWidget {
  const AddBooks({super.key});

  @override
  State<AddBooks> createState() => _AddBooksState();
}

class _AddBooksState extends State<AddBooks> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _bookTitleController = TextEditingController();
  final TextEditingController _bookPriceController = TextEditingController();
  final TextEditingController _bookImageController = TextEditingController();
  final TextEditingController _bookAuthorController = TextEditingController();
  final TextEditingController _bookRatingController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  bool _isLogin = true;
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void dispose() {
    _bookTitleController.dispose();
    _bookPriceController.dispose();
    _bookImageController.dispose();
    _bookAuthorController.dispose();
    _bookRatingController.dispose();
    _passwordController.dispose();
    _categoryController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Books')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                spacing: 30,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (_errorMessage != null)
                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(bottom: 20),
                      color: Colors.red.shade100,
                      child: Text(
                        _errorMessage!,
                        style: TextStyle(color: Colors.red.shade800),
                        textAlign: TextAlign.center,
                      ),
                    ),

                  TextFormField(
                    controller: _bookTitleController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Title',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!value.contains('@')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _categoryController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'category',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!value.contains('@')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _bookPriceController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Price',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!value.contains('@')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _bookImageController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Image',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!value.contains('@')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _bookAuthorController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Author',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!value.contains('@')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _bookRatingController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Rating',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!value.contains('@')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 24),

                  ElevatedButton(
                    // onPressed: _isLoading ? null : _submit,
                    onPressed: () {
                      print('afasfdadasd');
                      Book newBook = Book(
                        title: _bookTitleController.text,
                        price: int.parse(_bookPriceController.text),
                        image: _bookImageController.text,
                        author: _bookAuthorController.text,
                        rating: double.parse(_bookRatingController.text),
                        category: _categoryController.text == 'business'
                            ? CategoryList.business
                            : _categoryController.text == 'novel'
                            ? CategoryList.novel
                            : CategoryList.biography,
                      );
                      Provider.of<BookProvider>(
                        context,
                        listen: false,
                      ).addBooks(newBook: newBook);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: _isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : Text(
                            'Add Book',
                            style: const TextStyle(fontSize: 16),
                          ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
