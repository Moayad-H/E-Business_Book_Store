import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:sectionweek2/controllers/bookProvider.dart';
import 'package:sectionweek2/screens/cart_screen/cart_screen.dart';
import 'package:sectionweek2/screens/home_screens/home_content.dart';
import 'package:sectionweek2/screens/profile/profile_screen.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Color _accentColor = Color(0xFF272727);
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BookProvider>().fetchBooks();
    });
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      homeContent(context),
      CartScreen(),
      ProfilePage(),
    ];
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
      body: RefreshIndicator(
        onRefresh: () async {
          await context.read<BookProvider>().fetchBooks();
        },
        child: Consumer<BookProvider>(
          builder: (context, bookProvider, child) => Skeletonizer(
            enabled: bookProvider.booksLoading,
            child: SafeArea(
              child: bookProvider.booksLoading == true
                  ? Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: _pages[_currentIndex],
                      ),
                    ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
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
            label: 'Cart',
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
