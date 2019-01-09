import 'package:flutter/material.dart';
import 'package:what_4_lunch/HomeScreen.dart';

class What4LunchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'What4Lunch',
      routes: {
        '/': (context) => HomeScreen(),
      },
      initialRoute: '/',
    );
  }
}