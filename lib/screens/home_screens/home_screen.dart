import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sectionweek2/data/book_list.dart';
import 'package:sectionweek2/screens/home_screens/widgets/bookSlider.dart';
import 'package:sectionweek2/screens/home_screens/widgets/category.dart';
import 'package:sectionweek2/screens/home_screens/widgets/searchbar.dart';

class HomeScreen extends StatelessWidget {
  final books = [
    {'title': 'Atomic Habits', 'author': 'James Clear'},
    {'title': 'Deep Work', 'author': 'Cal Newport'},
    {'title': 'The Lean Startup', 'author': 'Eric Ries'},
  ];
  final Color _accentColor = Color(0xFF272727);
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              spacing: 16.0,
              children: [
                makeSearchBoxEl(),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    spacing: 12.0,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      makeCategoryEl('All'),
                      makeCategoryEl('Business'),
                      makeCategoryEl('Programming'),
                      makeCategoryEl('Science'),
                      makeCategoryEl('History'),
                      makeCategoryEl('Biography'),
                      makeCategoryEl('Travel'),
                      makeCategoryEl('Cooking'),
                      makeCategoryEl('Art'),
                    ],
                  ),
                ),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular Books",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.lightBlue,
                      ),
                    ),
                  ],
                ),
                makeBookSlider(BookList.newArrivalBooks, context),
                Container(
                  width: double.infinity,
                  height: 150.0,
                  decoration: BoxDecoration(
                    // shape: BoxShape.circle,
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    gradient: LinearGradient(
                      begin: FractionalOffset.topLeft,
                      end: FractionalOffset.bottomRight,
                      colors: const [Color(0xffe4a972), Color(0xff9941d8)],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Best sellers 2021',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recommended Books",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.lightBlue,
                      ),
                    ),
                  ],
                ),
                makeBookSlider(BookList.recommendBooks, context),

                // ListView.builder(
                //   itemCount: books.length,
                //   itemBuilder: (context, index) {
                //     final book = books[index];
                //     return ListTile(
                //       title: Text(book['title']!),
                //       subtitle: Text(book['author']!),
                //       onTap: () {
                //         // Navigator.push(
                //         //   context,
                //         //   MaterialPageRoute(
                //         //     builder: (context) => BookDetailsScreen(book: book),
                //         //   ),
                //         // );
                //       },
                //     );
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: _accentColor,
        unselectedItemColor: Colors.grey[400],
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Iconsax.book),
            activeIcon: Icon(Iconsax.book, color: _accentColor),
            label: 'Book',
            tooltip: "This is a Book Page",
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.shopping_cart),
            activeIcon: Icon(Iconsax.shopping_cart, color: _accentColor),
            label: 'Shop',
            tooltip: "This is a Business Page",
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.profile_circle),
            activeIcon: Icon(Iconsax.personalcard, color: _accentColor),
            label: 'My page',
            tooltip: "This is a School Page",
          ),
        ],
      ),
    );
  }
}
