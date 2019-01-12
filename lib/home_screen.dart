import 'package:flutter/material.dart';
import 'package:what_4_lunch/place_selector.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('What4Lunch'),
      ),
      body: PlaceSelector(),
    );
  }
}
