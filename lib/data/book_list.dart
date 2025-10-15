import 'package:sectionweek2/data/category_list.dart';
import 'package:sectionweek2/models/book.dart';

/// Book list
class BookList {
  static final List<Book> newArrivalBooks = [
    Book(
      title: "SHOE DOG",
      price: 20,
      image: "assets/images/book1.jpg",
      category: CategoryList.business,
      author: "John Doe",
      rating: 4.5,
      pages: 100,
      description:
          "Shoe Dog is Phil Knight’s memoir about founding his first company, Blue Ribbon; the creation of the Nike sportswear brand; and the lead-up to the initial public offering of Nike, Inc",
      publisher: "Publisher",
      publishedDate: "2021-01-01",
      isbn: "1234567890",
    ),
    Book(
      title: "No Rules Rules",
      price: 20,
      image: "assets/images/book10.jpg",
      category: CategoryList.business,
      author: "John Doe",
      rating: 4.2,
      pages: 100,
      description:
          "Shortlisted for the 2020 Financial Times & McKinsey Business Book of the Year ***It's time to do things differently. Trust your team. Be radically honest. And never, ever try to please your boss.These are some of the ground rules if you work at Netflix.",
      publisher: "Publisher",
      publishedDate: "2021-01-01",
      isbn: "1234567890",
    ),
    Book(
      title: "To Pixar And Beyond",
      price: 20,
      image: "assets/images/book11.jpg",
      category: CategoryList.business,
      author: "John Doe",
      rating: 4.5,
      pages: 100,
      description:
          "A Sunday Times Best Book of the Year 2017 One day in November 1994, Lawrence Levy received a phone call out of the blue from Steve Jobs, whom he’d never met, offering him a job running Pixar, a little-known company that had already lost Jobs \$50 million.",
      publisher: "Publisher",
      publishedDate: "2021-01-01",
      isbn: "1234567890",
    ),
    Book(
      title: "WONDER",
      price: 20,
      image: "assets/images/book6.jpg",
      category: CategoryList.novel,
    ),
    Book(
      title: "HOLES",
      price: 20,
      image: "assets/images/book7.jpg",
      category: CategoryList.novel,
    ),
  ];

  static final List<Book> recommendBooks = [
    Book(
      title: "Who Moved My Cheese?",
      price: 20,
      image: "assets/images/book8.jpg",
      category: CategoryList.business,
    ),

    Book(
      title: "The Giver",
      price: 20,
      image: "assets/images/book2.jpg",
      category: CategoryList.novel,
    ),
    Book(
      title: "Martin Luther King",
      price: 20,
      image: "assets/images/book4.jpg",
      category: CategoryList.biography,
    ),

    Book(
      title: "KIKI's DELIVERY SERVICE",
      price: 20,
      image: "assets/images/book3.jpg",
      category: CategoryList.novel,
    ),
  ];
}
