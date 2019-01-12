import 'package:flutter/material.dart';
import 'package:what_4_lunch/home_screen.dart';

class What4LunchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'What4Lunch',
      routes: {
        '/': (context) => HomeScreen(),
      },
      initialRoute: '/',
    );
  }
}