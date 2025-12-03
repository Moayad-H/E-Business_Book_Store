import 'package:flutter/material.dart';
import 'package:sectionweek2/screens/sign_in/sign_in_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              style: TextStyle(fontSize: 28),
              'Welcome to the book store',
            ),
          ),
          Image.asset('assets/welcome_image.png'),

          SizedBox(
            width: size.width * 0.5,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text('Get Started', style: TextStyle(fontSize: 22)),
            ),
          ),
        ],
      ),
    );
  }
}
