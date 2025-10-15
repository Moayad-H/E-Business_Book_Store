import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatelessWidget {
  final books = [
    {'title': 'Atomic Habits', 'author': 'James Clear'},
    {'title': 'Deep Work', 'author': 'Cal Newport'},
    {'title': 'The Lean Startup', 'author': 'Eric Ries'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: Icon(Iconsax.menu, color: Colors.black45),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 23.0),
            child: Row(
              children: [
                Icon(Iconsax.heart, color: Colors.black45),
                const SizedBox(width: 15.0),
                Icon(Iconsax.notification, color: Colors.black45),
              ],
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return ListTile(
            title: Text(book['title']!),
            subtitle: Text(book['author']!),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => BookDetailsScreen(book: book),
              //   ),
              // );
            },
          );
        },
      ),
    );
  }
}
