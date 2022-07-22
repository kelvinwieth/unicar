import 'package:flutter/material.dart';
import 'package:unicar/pages/home_page.dart';

void main() {
  runApp(const Unicar());
}

class Unicar extends StatelessWidget {
  const Unicar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomePage(),
      },
    );
  }
}
